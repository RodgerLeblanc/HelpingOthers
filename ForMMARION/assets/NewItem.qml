import bb.cascades 1.2

Container {
    property string itemName
    property string itemValue
    
    topPadding: 30
    leftPadding: topPadding
    rightPadding: topPadding
    
    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }

    Container {
        layoutProperties: StackLayoutProperties { spaceQuota: 1 }
        rightPadding: 30
        
        Label {
            id: itemNameLabel
            text: itemName
            visible: !itemNameTextArea.visible
            onTouch: {
                if (event.isUp())
                    itemNameTextArea.visible = true
            }
        }
        TextArea {
            id: itemNameTextArea
            visible: false
            onTextChanged: {
                itemNameLabel.text = text
                visible = false
            }
        }
    }
    Container {
        layoutProperties: StackLayoutProperties { spaceQuota: 1 }
        Label {
            id: itemValueLabel
            text: itemValue
            visible: !itemValueTextArea.visible
            onTouch: {
                if (event.isUp())
                    itemValueTextArea.visible = true
            }
        }
        TextArea {
            id: itemValueTextArea
            visible: false
            onTextChanged: {
                itemValueLabel.text = text
                visible = false
            }
        }
    }
}
