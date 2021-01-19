import base64
import logging
from typing import List

from django.conf import settings
from django.core.files.base import ContentFile
from imapclient import IMAPClient, SEEN
from mailparser import mailparser

logger = logging.getLogger('django')


def get_content_file(attachment):
    try:
        content = base64.b64decode(attachment.get('payload'))
    except ValueError:
        content = attachment.get('payload')

    return ContentFile(
        name=attachment.get('filename'),
        content=content
    )


def get_files_with_imap(email_limit=None) -> List[ContentFile]:
    logger.info(f'Reading email from: {settings.FETCH_EMAIL_HOST}:{settings.FETCH_EMAIL_PORT} '
                f'user: {settings.FETCH_EMAIL_USER}...')
    content_files = []
    if not email_limit:
        email_limit = settings.FETCH_EMAIL_LIMIT

    with IMAPClient(settings.FETCH_EMAIL_HOST, port=settings.FETCH_EMAIL_PORT) as imap_obj:
        imap_obj.login(settings.FETCH_EMAIL_USER, settings.FETCH_EMAIL_PASSWORD)
        imap_obj.select_folder('INBOX')
        uid_list = imap_obj.search(['UNSEEN'])
        logger.info(f'Unread email count: {len(uid_list)}')
        if email_limit:
            uid_list = uid_list[:email_limit]
        logger.info(f'Read email limit: {len(uid_list)}')
        for uid, message_data in imap_obj.fetch(uid_list, 'RFC822').items():
            mail = mailparser.parse_from_bytes(message_data[b'RFC822'])
            content_files += list(map(
                get_content_file,
                mail.attachments
            ))
        imap_obj.add_flags(uid_list, [SEEN])
    logger.info(f'Total attachments from email: {len(content_files)}')
    return content_files


def delete_seen_emails_with_imap():
    logger.info(f'Deleting email from: {settings.FETCH_EMAIL_HOST}:{settings.FETCH_EMAIL_PORT} '
                f'user: {settings.FETCH_EMAIL_USER}...')

    with IMAPClient(settings.FETCH_EMAIL_HOST, port=settings.FETCH_EMAIL_PORT) as imap_obj:
        imap_obj.login(settings.FETCH_EMAIL_USER, settings.FETCH_EMAIL_PASSWORD)
        imap_obj.select_folder('INBOX')
        uid_list = imap_obj.search(['SEEN'])
        logger.info(f'Seen email count: {len(uid_list)}')
        imap_obj.delete_messages(uid_list)
        imap_obj.expunge()
        logger.info(f'Total emails deleted: {len(uid_list)}')
