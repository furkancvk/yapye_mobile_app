import 'package:flutter/material.dart';
import 'package:yapye_mobile_app/constants.dart';
import 'package:yapye_mobile_app/widgets/app_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../app.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupForm();
}

class _SignupForm extends State<SignupForm> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppForm.appTextFormField(
            hintText: "Kullanıcı Adı",
            controller: _usernameController,
            onSaved: (newValue) {},
          ),
          const SizedBox(height: 20),
          AppForm.appTextFormField(
            hintText: "Email",
            controller: _emailController,
            isEmail: true,
            onSaved: (newValue) {},
          ),
          const SizedBox(height: 20),
          AppForm.appTextFormField(
            hintText: "Şifre",
            controller: _passwordController,
            isPassword: true,
            onSaved: (newValue) {},
          ),
          const SizedBox(height: 10),
          AppForm.appCheckbox(
            label:
                "Kullanıcı sözleşmesini ve gizlilik sözleşmesini \nokudum, onaylıyorum.",
            isChecked: isChecked,
            onChanged: onChangedAppCheckbox,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppForm.appTextButtonIcon(
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.dark.withOpacity(.6),
                ),
                label: "Kaydol",
                onPressed: signup,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void onChangedAppCheckbox(value) {
    setState(() {
      isChecked = value;
    });
  }

  void signup() async {
    try {
      if (!isChecked) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.orange,
            content: Text(
              'Kaydolmak için kutucuğu işaretlemeniz gerekmektedir',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: Duration(milliseconds: 1500),
          ),
        );
      }
      if (_formKey.currentState!.validate() && isChecked) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await userCredential.user?.updateDisplayName(_usernameController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const App(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.orange,
            content: Text(
              'Bu email zaten kullanılmaktadır',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: Duration(milliseconds: 1500),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: const Duration(milliseconds: 1500),
        ),
      );
    }
  }
}
