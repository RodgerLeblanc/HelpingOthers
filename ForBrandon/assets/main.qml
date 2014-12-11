/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2

TabbedPane {
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                title: qsTr("About")
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/ic_info.png"
                onTriggered: {
                    aboutSheet.open()
                }
            }
        ]      
    } // end of MenuDefinition

    attachedObjects: [
        PlayingNowSheet { id: playingNowSheet },
        AboutSheet { id: aboutSheet }
    ]
    
    function playThisSong(songName) {
        playingNowSheet.songUrl = "asset:///music/" + songName + ".mp3"
        playingNowSheet.open()
    }
    
    Tab { //First tab
        title: qsTr("Feed") + Retranslate.onLocaleOrLanguageChanged
        Page {
            titleBar: TitleBar {
                title: "Feed"
                acceptAction: ActionItem {
                    title: "Playing Now"
                    onTriggered: playingNowSheet.open()
                }
            }
            Container {
                Button {
                    text: "Salvuzzo_-_JOY_AND_CONFUSION"
                    onClicked: playThisSong(text)
                }
                Button {
                    text: "Salvuzzo_-_Mr._Spontaneous"
                    onClicked: playThisSong(text)
                }
                Button {
                    text: "Salvuzzo_-_My_Mamma"
                    onClicked: playThisSong(text)
                }
                Button {
                    text: "Salvuzzo_-_This_song_cheers_me_up"
                    onClicked: playThisSong(text)
                }
            }
        }
    } //End of first tab
    Tab { //Second tab
        title: qsTr("Favorites") + Retranslate.onLocaleOrLanguageChanged
        Page {
            titleBar: TitleBar {
                title: "Favorites"
                acceptAction: ActionItem {
                    title: "Playing Now"
                    onTriggered: playingNowSheet.open()
                }
            }
            Container {
                Button {
                    text: "Salvuzzo_-_JOY_AND_CONFUSION"
                    onClicked: playThisSong(text)
                }
                Button {
                    text: "Salvuzzo_-_My_Mamma"
                    onClicked: playThisSong(text)
                }
            }
        }
    } //End of second tab
}
