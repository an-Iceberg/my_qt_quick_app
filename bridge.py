from time import localtime, strftime

from PySide6.QtCore import QObject, QTimer, Signal, Slot
from PySide6.QtQml import QmlElement

from backend import Backend

QML_IMPORT_NAME = "bridge"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class Bridge(QObject):
    timeUpdated = Signal(str, arguments=["time"])
    backend: Backend
    timer: QTimer

    def __init__(self, backend: Backend) -> None:
        super().__init__()

        self.backend = backend

        self.timer = QTimer()
        self.timer.setInterval(200)
        self.timer.timeout.connect(self.update_time)
        self.timer.start()

    def update_time(self) -> None:
        self.timeUpdated.emit(strftime("%H:%M:%S", localtime()))

    @Slot(str)
    def hello_backend(self, string: str) -> None:
        self.backend.hello(string)
