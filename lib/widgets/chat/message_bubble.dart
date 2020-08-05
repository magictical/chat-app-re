import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;
  final Key key;

  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width - 50;
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color:
                    isMe ? Colors.yellow[700] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.title.color,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: isMe
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.title.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: -3,
          right: isMe ? 10 : null,
          left: isMe ? null : 10,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
            maxRadius: 17,
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
