import bb.cascades 1.0
import bb.system 1.0

Sheet {
    id: aboutSheet
    Page {
        titleBar: TitleBar {
            title: qsTr("About")
            acceptAction: ActionItem {
                title: qsTr("Ok")
                onTriggered: {
                    close()
                }
            }
        }
        ScrollView {
            Container {
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        id: appNameLabel
                        horizontalAlignment: HorizontalAlignment.Center
                        text: Application.applicationName + " " + Application.applicationVersion
                        textStyle.base: SystemDefaults.TextStyles.BigText
                    }
                    Label {
                        property string emailUri: "mailto:roger@rogerleblanc.net?subject=" + appNameLabel.text + " support"
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "<html><a href=\"" + emailUri + "\">" + qsTr("by CellNinja") + "</a></html>"
                        multiline: true
                        textStyle.base: SystemDefaults.TextStyles.SubtitleText
                    }
                    Container {
                        horizontalAlignment: HorizontalAlignment.Center
                        Button {
                            imageSource: "asset:///images/ic_share.png"
                            text: "More Apps From CellNinja"
                            onClicked: {
                                invoke.query.uri = "appworld://vendor/70290"
                                invoke.query.updateQuery()
                                invoke.trigger("bb.action.OPEN");
                            }
                            attachedObjects: [
                                Invocation {
                                    id: invoke
                                    query {
                                        invokeTargetId: "sys.appworld"
                                    }
                                    onArmed: {
                                        trigger("bb.action.OPEN")
                                    }
                                }
                            ]
                        }
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: qsTr("All songs by Salvuzzo, downloaded for free at https://www.jamendo.com/en/list/a134290/the-joy")
                        content.flags: TextContentFlag.ActiveText
                        multiline: true
                        textStyle.base: SystemDefaults.TextStyles.SmallText
                    }
                }
            }
        }
    }
}
