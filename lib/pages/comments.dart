import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';

class Comments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  const Comments({
    Key key,
    this.postId,
    this.postOwnerId,
    this.postMediaUrl,
  }) : super(key: key);

  @override
  CommentsState createState() => CommentsState(
      postId: this.postId,
      postOwnerId: this.postOwnerId,
      postMediaUrl: this.postMediaUrl);
}

class CommentsState extends State<Comments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  CommentsState({
    Key key,
    this.postId,
    this.postOwnerId,
    this.postMediaUrl,
  });

  buildComments() {
    return Text('ff');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Comments'),
      body: Column(
        children: <Widget>[
          Expanded(child: buildComments()),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                labelText: 'Write a comment...',
              ),
            ),
            trailing: OutlineButton(
              onPressed: () {},
              borderSide: BorderSide.none,
              child: Text('Post'),
            ),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Comment');
  }
}
