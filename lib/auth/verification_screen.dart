import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lammaapp/app_theme.dart';
import 'package:lammaapp/auth/create_new_password_screen.dart';
import 'package:lammaapp/widgets/default_elevated_button.dart';

class VerificationScreen extends StatefulWidget {
  static const String routeName = '/verify';

  final String email;
  VerificationScreen({required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List<TextEditingController> codeControllers =
      List.generate(4, (index) => TextEditingController());

  int seconds = 120;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      }
    });
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  Widget buildOtpBox(int index) {
    return Container(
      width: 55,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: codeControllers[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Verification Code",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              // IMAGE
              Image.asset(
                "assets/images/verifycode.png",
                height: MediaQuery.sizeOf(context).height * 0.4,
              ),

              SizedBox(height: 20),

              // MAIN TITLE
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Verification Code",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              SizedBox(height: 6),

              // SUB TEXT
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please confirm the security code received on your registered email.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // ---------------- OTP BOXES ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => buildOtpBox(index)),
              ),

              SizedBox(height: 30),

              // ---------------- VERIFY BUTTON ----------------
               DefaultElevatedButton(
                label: "Verification Code",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CreateNewPasswordScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: 16),
              // TIMER
              Text(
                "00:${seconds.toString().padLeft(2, '0')}",
                style: TextStyle(
                  color: Color(0xFF5669FF),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Did not receive the code?",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Send Again",
                style: TextStyle(
                  color: Color(0xFF5669FF),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
