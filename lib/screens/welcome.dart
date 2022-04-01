import 'package:flutter/material.dart';

import '../widgets/app_form.dart';
import '../widgets/app_login_form.dart';
import '../widgets/app_signup_form.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  List<Widget> forms = [const LoginForm(), const SignupForm()];
  List<bool> isSelected = [true, false];
  bool currentForm = true;

  void changeCurrentForm(index) {
    if (index == 0) {
      setState(() {
        currentForm = true;
      });
    } else {
      setState(() {
        currentForm = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 20),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              const SizedBox(height: 50),
              AppForm.AppToggleButtons(changeCurrentForm),
              const SizedBox(height: 30),
              currentForm ? forms[0] : forms[1]
            ],
          ),
        ),
      ),
    );
  }
}
