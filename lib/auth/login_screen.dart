import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lammaapp/auth/forget_password_screen.dart';
import 'package:lammaapp/auth/register_screen.dart';
import 'package:lammaapp/widgets/default_elevated_button.dart';
import 'package:lammaapp/widgets/default_text_form_field.dart';

class loginScreen extends StatefulWidget {
static const String routeName = '/Login';

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Image.asset(
                'assets/images/logo.png',
                height: MediaQuery.sizeOf(context).height * 0.2,
                fit: BoxFit.fill,
              ),
            SizedBox(height: 24),
            DefaultTextFormField(
              hintText: 'Email',
              controller: emailController,
              prefixIconImageName: 'email',
            ),
            SizedBox(height: 16),
            DefaultTextFormField(
              hintText: 'Password',
              controller: passwordController,
              prefixIconImageName: 'password',
              isPassword: true,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: ()=> Navigator.of(
                    context,
                  ).pushNamed(ForgetPasswordScreen.routeName),
                  child: Text('Forget Password?'),
                ),
              ],
            ),
            SizedBox(height: 24),
            DefaultElevatedButton(label: 'Login', onPressed: login),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' Don’t Have Account?',
                 style: Theme.of(context).textTheme.titleMedium,
                  ),
              TextButton(
                  onPressed: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(RegisterScreen.routeName),
                  child: Text('Create Account'),
                ),
              ],
            ),
          Row(
            children: [
              Expanded(
                child: Divider(thickness: 1, color: Colors.grey.shade400),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Divider(thickness: 1, color: Colors.grey.shade400),
              ),
            ],
          ),

          SizedBox(height: 20),
          // ---------------- GOOGLE BUTTON ----------------
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFF5669FF)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/google.svg', 
                    height: 24,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Login With Google",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF5669FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }
  void login(){}
}