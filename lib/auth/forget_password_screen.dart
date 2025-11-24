import 'package:flutter/material.dart';
import 'package:lammaapp/app_theme.dart';
import 'package:lammaapp/widgets/default_elevated_button.dart';
import 'package:lammaapp/widgets/default_text_form_field.dart';
import 'package:lammaapp/auth/verification_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forget-password';

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Forget Password",
          style: TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ---------------- IMAGE ----------------
              Center(
                child: Image.asset(
                  'assets/images/forgetpassword.png',
                  height: MediaQuery.sizeOf(context).height * 0.4,
                ),
              ),
              SizedBox(height: 20),
              /// ---------------- TITLE ----------------
              Text(
                "Forgot password",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 6),
              /// ---------------- SUB TEXT ----------------
              Text(
                "Please enter your email to reset the password",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              /// ---------------- EMAIL INPUT ----------------
              DefaultTextFormField(
                hintText: "Enter Your Email",
                controller: emailController,
                prefixIconImageName: "email",
              ),
              SizedBox(height: 30),
              /// ---------------- BUTTON ----------------
              DefaultElevatedButton(
                label: "Reset Password",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          VerificationScreen(email: emailController.text),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
