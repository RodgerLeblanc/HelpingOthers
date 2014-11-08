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
import bb.platform 1.2
import bb.system 1.2
import CustomTimer 1.0

Page {
    attachedObjects: [
        Timer {
            id: timer
            interval: 1000
            onTimeout: {
                var time = new Date()
                timeLabel.text = time.getHours() + " : " + (time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes()) + " : " + (time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds())
                if (toggleButton.checked)
                    if ((time.getHours() == dateTimePicker.value.getHours()) && (time.getMinutes() == dateTimePicker.value.getMinutes()))
                        notificationDialog.show()
            }
        },
        NotificationDialog {
            id: notificationDialog
            title: "Alarm"
            body: "Ring Ring"
            
            buttons: [
                SystemUiButton {
                    label: "Stop"
                },
                SystemUiButton {
                    label: "Snooze"
                }
            ]
            onFinished: {
                console.log("result : " + buttonSelection().label)
                if (buttonSelection().label == "Stop") {
                    toggleButton.checked = false
                }
                else {
                    if (buttonSelection().label == "Snooze") {
                        // Get time now
                        var snoozeTime = new Date()
                        // Add 5 minutes
                        snoozeTime.setTime(snoozeTime.getTime() + (5 * 60 * 1000))
                        // Set the dateTimePicker to new value
                        dateTimePicker.setValue(snoozeTime)
                    }
                }
            }
        }
    ]

    onCreationCompleted: { timer.start() }
    
    Container {
        layout: DockLayout {}
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            Label {
                id: timeLabel
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.base: SystemDefaults.TextStyles.BigText
            }
            DateTimePicker {
                id: dateTimePicker
                title: "Time of alarm"
                minuteInterval: 1
                mode: DateTimePickerMode.Time
            }
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: toggleButton.checked ? "Alarm ON" : "Alarm OFF"
                }
                ToggleButton {
                    id: toggleButton
                    checked: true
                }
            }
        }
    }
}
