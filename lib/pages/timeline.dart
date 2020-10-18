import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];

  @override
  void initState() {
    //createUser();
    updateUser();
    deleteUser();
    super.initState();
  }

  createUser() async {
    await usersRef.document('gfghgg').setData({
      'username': 'Jeff',
      'postsCount': '2',
      'isAdmin': false,
    });
  }

  updateUser() async {
    final doc = await usersRef.document('rGx6HAzCdpZXqXyLrFq0').get();
    if (doc.exists) {
      doc.reference.updateData({
        'username': 'Raina',
        'postsCount': '2',
        'isAdmin': false,
      });
    }
    // .updateData({
    //   'username': 'John',
    //   'postsCount': '2',
    //   'isAdmin': false,
    // });
  }

  deleteUser() async {
    final DocumentSnapshot doc =
        await usersRef.document('rGx6HAzCdpZXqXyLrFq0').get();
    if (doc.exists) {
      doc.reference.delete();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          final List<Text> children = snapshot.data.documents
              .map((doc) => Text(doc['username']))
              .toList();
          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      ),
    );
  }
}
