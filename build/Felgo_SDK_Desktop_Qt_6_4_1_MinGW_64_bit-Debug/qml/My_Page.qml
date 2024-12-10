import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2
Page{
    id:root
    property alias backgroundColor:back_fon.color
    property alias buttonTextForward:button_for.text
    property alias buttonTextBack:button_back.text
    signal buttonForwardClicked();
    signal buttonBackClicked();
    header:ToolBar{
        id:page_header
        height:40
        RowLayout{
            ToolButton{
                id:back_btn
                Text{
                    text: "<-"
                    font.pixelSize: 24
                    visible:stack_view.depth>1
                    anchors.verticalCenter: parent.verticalCenter}
                onClicked: {stack_view.pop(parent.parent.id)}
            }
            Text{
                id:header_page_text
                anchors.centerIn: page_header
        }
    }
    }
    background: Rectangle{
        id:back_fon
    }
    Button {
        id:button_for
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClicked: {
            root.buttonForwardClicked()()
        }
    }
    Button {
        id:button_back
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        onClicked: {
            root.buttonBackClicked()
        }
    }
}
