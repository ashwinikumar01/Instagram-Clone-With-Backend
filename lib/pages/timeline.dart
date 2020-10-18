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
  @override
  void initState() {
    getUsers();
    // getUserId();
    super.initState();
  }

  getUsers() async {
    final QuerySnapshot snapshot = await usersRef.limit(2).getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) {
      print('hello: ${doc.data}');
      print('hello: ${doc.documentID}');
      print('hello: ${doc.exists}');
    });
  }

  // getUserId() async {
  //   final String id = 'rGx6HAzCdpZXqXyLrFq0';
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //   print('hello: ${doc.data}');
  //   print('hello: ${doc.documentID}');
  //   print('hello: ${doc.exists}');
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: circularProgress(),
    );
  }
}
