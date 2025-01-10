import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';

import 'custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Box userBox = Hive.box('userBox');
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool validateUser(String email, String password) {
    final storedEmail = userBox.get('email');
    final storedPassword = userBox.get('password');
    return email == storedEmail && password == storedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            //Email
            CTextFormField(
              controller: emailController,
              labelText: 'Email',
              prefixIcon: const Icon(
                Iconsax.direct_right,
              ),
            ),
            const SizedBox(height: 16),

            //Password
            CTextFormField(
              obscureText: _obscureText,
              controller: passwordController,
              labelText: 'Password',
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Iconsax.eye_slash : Iconsax.eye,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            const SizedBox(height: 32),

            ///Sign in button
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: const Color(0xFFF6F6F6),
                  backgroundColor: const Color(0xFF4b68ff),
                  disabledForegroundColor: const Color(0xFF939393),
                  disabledBackgroundColor: const Color(0xFFC4C4C4),
                  side: const BorderSide(color: Color(0xFF4b68ff)),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (validateUser(
                      emailController.text, passwordController.text)) {
                    Navigator.pushReplacementNamed(context, '/main');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid credentials!')),
                    );
                  }
                }, //Login route
                child: const Text("Sign in"),
              ),
            ),
            const SizedBox(height: 16),

            ///Create account button
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: const Color(0xFF272727),
                  side: const BorderSide(color: Color(0xFFD9D9D9)),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF232323),
                      fontWeight: FontWeight.w600),
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
