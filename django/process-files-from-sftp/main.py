from typing import List
import fnmatch
import pysftp


class SFTPHandler:
    _path_handlers = {}

    def add_handler(
        self, sftp_path: str, handler_function: callable, filename_pattern: str
    ) -> None:
        if not sftp_path in self._path_handlers:
            self._path_handlers[sftp_path] = []
        self._path_handlers[sftp_path].append((handler_function, filename_pattern))

    def process(self, client: pysftp.Connection) -> None:
        for (
            path,
            handlers,
        ) in self._path_handlers.items():
            with client.cd(path):
                filenames = client.listdir()
                for handler, pattern in handlers:
                    matchs = fnmatch.filter(filenames, pattern)
                    handler(client, path, matchs)


def process_all_files(client: pysftp.Connection, path: str, files: List[str]):
    for file in files:
        print(f"Processing {file}")


def process_pdf_files(client: pysftp.Connection, path: str, files: List[str]):
    for file in files:
        print(f"Processing {file}")


SFTP_HOST = "localhost"
SFTP_USER = "username"
SFTP_PASSWORD = "password"
SFTP_PORT = 2222
sftp_handler = SFTPHandler()

# this will process all files inside /test
sftp_handler.add_handler("/test", process_all_files, "*")

# this will process only pdf files
sftp_handler.add_handler("/test", process_pdf_files, "*.pdf")


def main():
    # https://stackoverflow.com/questions/38939454/verify-host-key-with-pysftp
    cnopts = pysftp.CnOpts()
    cnopts.hostkeys = (
        None  # Don't do this in production unless you didn't care about security
    )
    with pysftp.Connection(
        SFTP_HOST,
        username=SFTP_USER,
        password=SFTP_PASSWORD,
        port=SFTP_PORT,
        cnopts=cnopts,
    ) as sftp:
        sftp_handler.process(sftp)


if __name__ == "__main__":
    main()