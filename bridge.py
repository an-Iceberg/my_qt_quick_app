from time import localtime, strftime

from PySide6.QtCore import QObject, QTimer, Signal, Slot
from PySide6.QtQml import QmlElement

from backend import Backend

QML_IMPORT_NAME = "bridge"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class Bridge(QObject):
    timeUpdated = Signal(str, arguments=["time"])

    def __init__(self, backend: Backend) -> None:
        super().__init__()

        self.backend = backend

        self.timer = QTimer()
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.update_time)
        self.timer.start()

    def update_time(self):
        local_time = strftime("%H:%M:%S", localtime())
        self.timeUpdated.emit(local_time)

    @Slot(str)
    def fun(self, string: str):
        print(f'hello from the backend "{string}"')
