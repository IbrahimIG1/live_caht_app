import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat_room/screens/home_screen/home_screen.dart';
import 'package:voice_chat_room/screens/login_screen/widgets/text_form_feild.dart';
import 'package:voice_chat_room/screens/signup_screen/sign_up_screen.dart';
import 'package:voice_chat_room/services/firebase/firebaseservice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

final formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // TEXT Log Into Your Account
                        Text(
                          'Log Into Your Account',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // email feild

                        AppTextFormFeild(
                            hintText: 'email',
                            controller: email,
                            suffixIcon: Icon(Icons.email),
                            labelText: "Email"),
                        SizedBox(
                          height: 20.h,
                        ),
                        // Password feild
                        AppTextFormFeild(
                            hintText: 'password',
                            controller: password,
                            suffixIcon: Icon(Icons.password),
                            labelText: "Password"),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final isValid = formKey.currentState?.validate();
                            if (isValid != true ||
                                email.text.isEmpty ||
                                password.text.isEmpty) {
                              return;
                            }
                            final bool result = await FirebaseService.userLogin(
                              email: email.text,
                              password: password.text,
                            );
                            if (result) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            } else {
                              const SnackBar(
                                content: Text("Something went wrong!"),
                              );
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
