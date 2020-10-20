import "package:flutter/material.dart";

class EditProfile extends StatefulWidget {
  final String currentUserId;

  const EditProfile({Key key, this.currentUserId}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Edit Profile');
  }
}
