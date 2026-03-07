import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

// import backend 1.0
import bridge 1.0

ApplicationWindow
{
  id: main

  title: "My Qt Quick App"
  width: 800
  height: 600
  visible: true

  Bridge { id: bridge }

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
      onClicked:
      {
        bridge.fun(text_input.text)
      }
    }

    TextField
    {
      id: text_input

      placeholderText: "Enter something here!"

      onTextChanged:
      {
        console.log(text_input.text)
      }
    }
  }
}
