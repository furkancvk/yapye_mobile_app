import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProfileBio extends StatelessWidget {
  ProfileBio({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: const [
                Icon(Icons.location_on_rounded),
                SizedBox(width: 15),
                Text(
                  "Kayseri",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.phone_rounded),
                SizedBox(width: 15),
                Text(
                  "+90 512 345 67 89",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.email_rounded),
                const SizedBox(width: 15),
                Text(
                  _auth.currentUser!.email.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "Lorem Uruspsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Uruspsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Uruspsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Uruspsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.dark.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
