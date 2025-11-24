import 'package:flutter/material.dart';
import 'package:lammaapp/app_theme.dart';
import 'package:lammaapp/auth/login_screen.dart';
import 'package:lammaapp/widgets/default_text_form_field.dart';
import 'package:lammaapp/widgets/default_elevated_button.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  static const String routeName = '/new-password';

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text(
          "Create New Password",
          style: TextStyle(
            color:AppTheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      // ---------------- BODY ----------------
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // IMAGE
              Center(
                child: Image.asset(
                  "assets/images/resetpasswordcuate1.png",
                  height: MediaQuery.sizeOf(context).height * 0.4,
                ),
              ),
              SizedBox(height: 20),

              // TITLE DESCRIPTION
              Text(
                "New password must be different from last one",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // NEW PASSWORD
              DefaultTextFormField(
                hintText: "Password",
                controller: newPass,
                //prefixIconImageName: 'password',
                isPassword: true,
              ),
              SizedBox(height: 16),

              // CONFIRM
              DefaultTextFormField(
                hintText: "Confirm Password",
                controller: confirmPass,
               // prefixIconImageName: 'password',
                isPassword: true,
              ),
              SizedBox(height: 30),

              // SAVE BUTTON
              DefaultElevatedButton(
                label: "Save Password",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, loginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
