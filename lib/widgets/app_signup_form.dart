import 'package:flutter/material.dart';
import 'package:yapye_mobile_app/constants.dart';
import 'package:yapye_mobile_app/screens/home.dart';
import 'package:yapye_mobile_app/widgets/app_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../app.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignupForm();
}

class _SignupForm extends State<SignupForm>{
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void signup() async {
    try {
      if (_formKey.currentState!.validate()){
        UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await userCredential.user?.updateDisplayName(_usernameController.text);
        Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool isChecked = false;
  void onChangedAppCheckbox(value){
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppForm.AppTextFormField(
            hintText: "Kullanıcı Adı",
            controller: _usernameController,
            onSaved: (newValue) => print(newValue),
          ),
          const SizedBox(height: 20),
          AppForm.AppTextFormField(
            hintText: "Email",
            controller: _emailController,
            onSaved: (newValue) => print(newValue),
            isEmail: true,
          ),
          const SizedBox(height: 20),
          AppForm.AppTextFormField(
            hintText: "Şifre",
            controller: _passwordController,
            onSaved: (newValue) => print(newValue),
            isPassword: true,
          ),
          //const SizedBox(height: 20),
          //AppForm.AppTextFormField(
            //hintText: "Telefon",
            //controller: _phoneController,
            //onSaved: (newValue) => print(newValue),
          //),
          const SizedBox(height: 10),
          AppForm.AppCheckbox(
            label: "Kullanıcı sözleşmesini ve gizlilik sözleşmesini \nokudum, onaylıyorum.",
            isChecked: isChecked,
            onChanged: onChangedAppCheckbox,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppForm.AppTextButtonIcon(
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
}