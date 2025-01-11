import 'package:flutter/material.dart';
import 'widgets/login_widgets/login_form.dart';
import 'widgets/login_widgets/login_header.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo, Title &subtitle
              LoginHeader(),
            /// Email& Password
              LoginForm(),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
