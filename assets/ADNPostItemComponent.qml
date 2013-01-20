import bb.cascades 1.0
import "../tart.js" as Tart

ListItemComponent {
    Container {
        property int padding: 25

        topPadding: padding
        bottomPadding: padding
        leftPadding: padding
        rightPadding: padding

        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            background: Color.create("#e2e2e2");
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            minHeight: 150

            Container {
                layout: DockLayout {}
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 2.0
                }

                ImageView {
                    imageSource: ListItemData.user.avatar_url
                    preferredWidth: 100
                    preferredHeight: 100
                }
            }

            Container {
                layout: StackLayout {}
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 8.0
                }

                Label {
                    text: ListItemData.user.username
                    horizontalAlignment: HorizontalAlignment.Left

                    textStyle {
                        fontWeight: FontWeight.Bold
                    }
                }

                Label {
                    text: "<html>" + ListItemData.html + "</html>"
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Left
                }

                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Right

                    Label {
                        text: ListItemData.created_at
                        horizontalAlignment: HorizontalAlignment.Right
                        verticalAlignment: VerticalAlignment.Bottom
                        textStyle {
                            textAlign: TextAlign.Right
                        }
                    }
                }
            }
        }
    }
}
