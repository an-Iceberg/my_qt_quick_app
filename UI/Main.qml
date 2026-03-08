import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

// import backend 1.0
import bridge 1.0

ApplicationWindow
{
  id: app
  visible: true

  title: "My Qt Quick App"
  width: 800
  height: 600

  property QtObject bridge
  property string current_time: "00:00:00"

  // Bridge { id: bridge }

  Connections
  {
    target: app.bridge

    function onTimeUpdated(time)
    {
      // console.log(`time: ${time}`)
      app.current_time = time
    }
  }

  ColumnLayout
  {
    anchors
    {
      horizontalCenter: parent.horizontalCenter
      verticalCenter: parent.verticalCenter
    }

    Button
    {
      text: "Click me!"

      onClicked: { bridge.fun(text_input.text) }
    }

    TextField
    {
      id: text_input

      placeholderText: "Enter something here!"

      onTextChanged: { console.log(text_input.text) }
    }

    Rectangle
    {
      color: Qt.rgba(1, 1, 0, 1)
      implicitWidth: clock.contentWidth
      implicitHeight: clock.contentHeight
      border { color: "red"; width: 2 }

      Text
      {
        id: clock

        text: app.current_time
        // text: `placeholder: ${text_input.placeholderText.split(" ")[0]}`
      }
    }
  }
}
