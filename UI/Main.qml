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

  header: RowLayout
  {
    spacing: 5

    Text
    {
      text: "Header"
      style: Text.Outline
      styleColor: "white"
      Layout.preferredWidth: 47
    }
    ComboBox
    {
      Layout.preferredWidth: 80
      model: ["First", "Second", "Third"]
    }
    Text
    {
      text: "Header"
      color: "white"
      Layout.fillWidth: true
    }
    Text
    {
      text: "Header"
      color: "white"
      Layout.fillWidth: true
      horizontalAlignment: Text.AlignHCenter
    }
    Text
    {
      text: "Header"
      color: "white"
      Layout.fillWidth: true
      horizontalAlignment: Text.AlignRight
    }
  }

  footer: RowLayout
  {
    spacing: 5

    Text { text: "Footer"; color: "white" }
    Rectangle { Layout.fillWidth: true }
    RowLayout
    {
      Text
      {
        text: "Clock:"
        color: "white"
        font.underline: true
      }
      Text
      {
        text: app.current_time
        color: "white"
      }
    }
  }

  Page
  {
    anchors
    {
      fill: parent
      margins: 10
    }

    ColumnLayout
    {
      spacing: 10

      Button
      {
        text: "Say hello from the backend!"
        Layout.alignment: Qt.AlignHCenter

        onClicked: { app.bridge.hello_backend(text_field.text) }
      }

      RowLayout
      {
        Layout.alignment: Qt.AlignHCenter

        Text { text: "Name:"; color: "white" }
        TextField
        {
          id: text_field

          maximumLength: 15
          placeholderText: "Name"

          onTextEdited: { console.log(text_field.text) }
        }
      }

      RowLayout
      {
        Layout.alignment: Qt.AlignHCenter
        // anchors.horizontalCenter: parent.horizontalCenter

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
  }
}
