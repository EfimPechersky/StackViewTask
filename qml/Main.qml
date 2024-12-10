import Felgo
import QtQuick
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2
App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"
    Window {
     width: 360
     height: 640
     visible: true
     title: qsTr("StackView_test")

     property int defMargin:10

     StackView{
     id:stack_view
     anchors.fill: parent
     initialItem: mainpage
     }
     My_Page{
        id:mainpage
        backgroundColor: "white"
        buttonTextBack: "To_Green"
        buttonTextForward: "To_Red"
        onButtonForwardClicked: {
            stack_view.push(myredpage)
        }
        onButtonBackClicked: {
            stack_view.push(mygreenpage)
        }
        Text{
            text:"Светофор"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
     }

     My_Page { id:myredpage
     backgroundColor: "red"
     buttonTextBack: "To_Green"
     buttonTextForward: "To_Yellow"
     onButtonForwardClicked: {
        stack_view.push(myyellowpage)
     }
     onButtonBackClicked: {
        stack_view.push(mygreenpage)
     }
     }
     My_Page { id:myyellowpage
     visible: false
     backgroundColor: "yellow"
     buttonTextBack: "To_Red"
     buttonTextForward: "To_Green"
     onButtonForwardClicked: {
        stack_view.push(mygreenpage)
     }
     onButtonBackClicked: {
        stack_view.push(myredpage)
     }
     }
     My_Page { id:mygreenpage
     visible: false
     backgroundColor: "green"
     buttonTextBack: "To_Yellow"
     buttonTextForward: "To_Red"
     onButtonForwardClicked: {
        stack_view.push(myredpage)
     }
     onButtonBackClicked: {
        stack_view.push(myyellowpage)
     }
     }
    }
}
