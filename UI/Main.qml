import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

// import backend 1.0
import bridge 1.0

ApplicationWindow
{
  id: main

  width: 800
  height: 600
  visible: true

  Bridge { id: bridge }

  GridLayout
  {
    columns: 2
    rows: 3

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
    }
  }
}
