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

class _LoginForm extends State<LoginForm> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppForm.appTextFormField(
            hintText: "Email",
            controller: _emailController,
            isEmail: true,
            onSaved: (value) {},
          ),
          const SizedBox(height: 20),
          AppForm.appTextFormField(
            hintText: "Şifre",
            controller: _passwordController,
            isPassword: true,
            onSaved: (value) {},
          ),
          const SizedBox(height: 10),
          AppForm.appCheckbox(
            label: "Beni Hatırla",
            fontSize: 16,
            isChecked: isChecked,
            onChanged: onChangedAppCheckbox,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppForm.appTextButtonIcon(
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onChangedAppCheckbox(value) {
    setState(() {
      isChecked = value;
    });
  }

  void login() async {
    try {
      if (_formKey.currentState!.validate()) {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const App(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.orange,
            content: Text(
              'Kullanıcı bulunamadı',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: Duration(milliseconds: 1500),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.orange,
            content: Text(
              'Yanlış şifre',
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
