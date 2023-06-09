/*
 *  SPDX-FileCopyrightText: 2021 Felipe Kinoshita <kinofhek@gmail.com>
 *  SPDX-FileCopyrightText: 2022 Nate Graham <nate@kde.org>
 *
 *  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.15 as Kirigami
import org.kde.tcet.welcome 1.0

GenericPage {
    heading: i18nc("@title", "Welcome to TCET Linux!")
    description: xi18nc("@info:usagetip", "TCET Linux is GNU/Linux distribution, based on Arch Linux built for enhancing college infrastructure and promoting Linux in software engineering education.")

    topContent: [
        Kirigami.UrlButton {
            id: link
            Layout.topMargin: Kirigami.Units.largeSpacing
            text: i18nc("@action:button", "Learn more about the TCET Linux Community")
            url: "https://opensource.tcetmumbai.in/docs/projects/tcet-linux/about-tcet-linux"
        }
    ]

    Image {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -Kirigami.Units.gridUnit * 4
        width: Kirigami.Units.gridUnit * 16
        height: Kirigami.Units.gridUnit * 16
        source: "konqi-kde-hi.png"
        fillMode: Image.PreserveAspectFit

        QQC2.Label {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            width: Math.round(parent.width * 0.75)
            text: i18nc("@info", "The TCET Linux welcomes you to the TCET Open Source community!")
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
        }

        HoverHandler {
            id: hoverhandler
            cursorShape: Qt.PointingHandCursor
        }
        TapHandler {
            onTapped: Qt.openUrlExternally(link.url)
        }
        QQC2.ToolTip {
            visible: hoverhandler.hovered
            text: i18nc("@action:button clicking on this takes the user to a web page", "Visit %1", link.url)
        }
    }
}
