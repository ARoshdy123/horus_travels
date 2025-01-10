import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Image(
            height: 130,
            image: AssetImage("images/logo.png"),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Welcome back,",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          "Discover Limitless Choices and Unmatched Convenience.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
