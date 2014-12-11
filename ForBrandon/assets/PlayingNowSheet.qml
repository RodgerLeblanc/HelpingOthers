import bb.cascades 1.2
import bb.multimedia 1.2

Sheet {
    property alias songUrl: mediaPlayer.sourceUrl
    property bool isPlaying: (mediaPlayer.mediaState == MediaState.Started)
    
    Page {
        titleBar: TitleBar {
            title: "Now Playing"
            dismissAction: ActionItem {
                title: qsTr("Go Back")
                onTriggered: {
                    close()
                }
            }
        }
        
        attachedObjects: [
            MediaPlayer {
                id: mediaPlayer
                onSourceUrlChanged: play()
            }
        ]
        
        Container {
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            Label {
                text: mediaPlayer.sourceUrl
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
            }
            Button {
                text: isPlaying ? "Stop" : "Play"
                enabled: songUrl != ""
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                onClicked: {
                    if (isPlaying)
                        mediaPlayer.stop()
                    else    
                        mediaPlayer.play()
                }
            }
        }
    }
}
