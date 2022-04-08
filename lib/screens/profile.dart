import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yapye_mobile_app/constants.dart';
import 'package:yapye_mobile_app/screens/welcome.dart';
import 'package:yapye_mobile_app/widgets/profile_bio.dart';

import '../widgets/profile_likes.dart';
import '../widgets/profile_menu.dart';
import '../widgets/profile_recipe.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  List<Widget> contents = [
    ProfileRecipe(),
    ProfileLikes(),
    const ProfileMenu(),
    ProfileBio()
  ];
  List<bool> isSelected = [false, false, false];
  final _auth = FirebaseAuth.instance;
  int currentContentIndex = 3;

  void logout() async {
    await _auth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Welcome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              minRadius: 60,
              backgroundColor: AppColors.dark,
              child: Icon(
                Icons.person_rounded,
                size: 60,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  _auth.currentUser!.displayName.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "59 level gurme",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ToggleButtons(
                    selectedColor: AppColors.light,
                    color: AppColors.light,
                    fillColor: AppColors.orangeAccent,
                    borderRadius: BorderRadius.circular(8),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Tariflerim",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Beğendiklerim",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Menüm",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                    onPressed: (index) => {
                      setState(() {
                        currentContentIndex = index;
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                      }),
                    },
                    isSelected: isSelected,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            contents[currentContentIndex],
          ],
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
