import QtQuick
import QtQuick.Effects

MultiEffect {
    anchors.fill: source
    colorization: 1
    brightness: 1
    required property color color
    colorizationColor: color
}
