import QtQuick 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0

ToolButton {
	id: control
	property string iconName: ""
	iconSource: {
		if (pressed) {
			return "qrc:icons/Tethys/" + iconName + "-pressed.png"
		} else if (hovered) {
			return "qrc:icons/Tethys/" + iconName + "-hovered.png"
		} else {
			return "qrc:icons/Tethys/" + iconName + ".png"
		}
	}
	implicitHeight: 36
	implicitWidth: 36

	opacity: hovered ? 1 : 0.75
	style: ButtonStyle {
		background: Item {}

		// https://github.com/qt/qtquickcontrols/blob/dev/src/controls/Styles/Base/ButtonStyle.qml#L129
		label: Item {
			implicitWidth: row.implicitWidth
			implicitHeight: row.implicitHeight
			baselineOffset: row.y + text.y + text.baselineOffset
			Row {
				id: row
				anchors.centerIn: parent
				spacing: 2
				Image {
					source: control.iconSource
					anchors.verticalCenter: parent.verticalCenter
				}
				Text {
					id: text
					renderType: Settings.isMobile ? Text.QtRendering : Text.NativeRendering
					anchors.verticalCenter: parent.verticalCenter
					text: StyleHelpers.stylizeMnemonics(control.text)
					color: "#FFFFFF"
					style: Text.Raised
					styleColor: "#111111"
				}
			}
		}
	}
}
