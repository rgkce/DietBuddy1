import 'package:dietbuddy/constants/colors.dart';
import 'package:dietbuddy/constants/styles.dart';
import 'package:dietbuddy/helperScreens/welcome_screen.dart';
import 'package:flutter/material.dart';

class PasswordChanged extends StatefulWidget {
  const PasswordChanged({super.key});

  @override
  State<PasswordChanged> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/db_logo.png'),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Password Changed',
                style: AppStyles.pageTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'Congratulations! You have successfully \n            changed your password.',
                style: AppStyles.text,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Icon(Icons.check_circle, color: AppColors.textfield, size: 150),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Container(
                  height: 54,
                  width: 327,
                  decoration: BoxDecoration(
                    color: AppColors.button,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text('Back to App', style: AppStyles.titleStyle),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
