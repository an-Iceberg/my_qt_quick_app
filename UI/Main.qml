import QtQuick 2
import QtQuick.Controls 2
import QtQuick.Layouts 2
import QtQuick.Window 2

// import backend 1.0
import bridge 1.0

ApplicationWindow
{
  id: app
  visible: true

  title: "My Qt Quick App"
  width: 400
  height: 400

  // menuBar: MenuBar
  // {
  //   Menu
  //   {
  //     title: "File"
  //     Action { text: "New" }
  //     Action { text: "Open" }
  //     Action { text: "Save" }
  //     Action { text: "Save as…" }
  //     MenuSeparator {}
  //     Action { text: "Quit" }
  //   }
  //   Menu
  //   {
  //     title: "Edit"
  //     Action { text: "Cut" }
  //     Action { text: "Copy" }
  //     Action { text: "Paste" }
  //   }
  //   Menu
  //   {
  //     title: "Help"
  //     Action { text: "About" }
  //   }
  // }

  property QtObject bridge
  property string current_time: "00:00:00"

  // Bridge { id: bridge }

  Connections
  {
    target: app.bridge

    function onTimeUpdated(time: string) { app.current_time = time }
  }

  ColumnLayout
  {
    // anchors.fill: parent
    Layout.alignment: Qt.AlignCenter

    Button
    {
      text: "Say hello from the backend!"
      Layout.alignment: Qt.AlignHCenter

      onClicked: { app.bridge.hello_backend(text_field.text) }
    }

    TextField
    {
      id: text_field

      maximumLength: 15
      Layout.alignment: Qt.AlignHCenter
      placeholderText: "Enter something here!"

      onTextEdited: { console.log(text_field.text) }
    }

    RowLayout
    {
      Layout.alignment: Qt.AlignHCenter

      Text
      {
        text: "Clock:"
        color: "white"
        font.underline: true
      }

      Rectangle
      {
        color: Qt.rgba(0.5, 0, 1, 1)
        implicitWidth: clock.contentWidth + 10
        implicitHeight: clock.contentHeight + 5
        border { color: "magenta"; width: 2 }
        radius: 4

        Text
        {
          id: clock

          anchors.fill: parent
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          color: "beige"
          text: app.current_time
          // text: `placeholder: ${text_input.placeholderText.split(" ")[0]}`
        }
      }
    }
  }

  // footer:  RowLayout
  // {
  //   anchors.fill: parent
  //   Label { text: "Read Only" }
  // }

  // statusBar: StatusBar
  // {
  //   RowLayout
  //   {
  //     anchors.fill: parent
  //     Label { text: "Read Only" }
  //   }
  // }
}
