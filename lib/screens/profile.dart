import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yapye_mobile_app/constants.dart';
import 'package:yapye_mobile_app/screens/welcome.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final _auth = FirebaseAuth.instance;

  void logout() async {
    await _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "username: ${_auth.currentUser!.displayName}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "email: ${_auth.currentUser!.email}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.logout,
            color: AppColors.light,
          ),
          onPressed: logout,
        ),
      ),
    );
  }
}
