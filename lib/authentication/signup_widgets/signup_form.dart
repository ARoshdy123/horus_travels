import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../login_widgets/custom_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final Box userBox = Hive.box('userBox');
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void saveUserDetails() {
    userBox.put('firstName', firstNameController.text);
    userBox.put('lastName', lastNameController.text);
    userBox.put('email', emailController.text);
    userBox.put('password', passwordController.text);
    userBox.put('phone', phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CTextFormField(
                  labelText: 'First Name',
                  prefixIcon: const Icon(Iconsax.user),
                  controller: firstNameController,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: CTextFormField(
                  labelText: 'Last Name',
                  prefixIcon: const Icon(Iconsax.user),
                  controller: lastNameController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),

          /// E-mail
          CTextFormField(
            prefixIcon: const Icon(Iconsax.direct),
            labelText: 'Email',
            controller: emailController,
          ),
          const SizedBox(
            height: 16,
          ),

          /// PhoneNumber
          CTextFormField(
            prefixIcon: const Icon(Iconsax.call),
            labelText: 'Phone Number',
            keyboardType: TextInputType.phone,
            controller: phoneController,
          ),
          const SizedBox(
            height: 16,
          ),

          /// Password
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
          const SizedBox(
            height: 16,
          ),

          /// signup Button
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ElevatedButton(style: ElevatedButton.styleFrom(
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
                saveUserDetails();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Create Account'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
