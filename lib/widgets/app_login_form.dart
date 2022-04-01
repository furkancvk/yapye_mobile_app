import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yapye_mobile_app/constants.dart';
import '../app.dart';
import 'package:yapye_mobile_app/widgets/app_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm>{
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isChecked = false;
  void onChangedAppCheckbox(value){
    setState(() {
      isChecked = value;
    });
  }

  void login() async {
    try {
      if (_formKey.currentState!.validate()){
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppForm.AppTextFormField(
            hintText: "Email",
            controller: _emailController,
            isEmail: true,
            onSaved: (newValue) => print(newValue),
          ),
          const SizedBox(height: 20),
          AppForm.AppTextFormField(
            hintText: "Şifre",
            controller: _passwordController,
            onSaved: (newValue) => print(newValue),
            isPassword: true,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppForm.AppCheckbox(
                label: "Beni Hatırla",
                isChecked: isChecked,
                onChanged: onChangedAppCheckbox,
              ),
              Text(
                "Şifremi unuttum?",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark.withOpacity(.4),
                ),
              ),
            ],
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
                label: "Giriş Yap",
                onPressed: login,
              ),
            ],
          ),
        ],
      ),
    );
  }
}