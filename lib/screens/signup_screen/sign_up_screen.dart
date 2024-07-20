import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat_room/screens/home_screen/home_screen.dart';
import 'package:voice_chat_room/screens/login_screen/login.dart';
import 'package:voice_chat_room/screens/login_screen/widgets/text_form_feild.dart';
import 'package:voice_chat_room/services/firebase/firebaseservice.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController userName = TextEditingController();

final formKey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(0),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // TEXT Log Into Your Account
                        Text(
                          'Sign UP Account',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // name feild
                        AppTextFormFeild(
                            hintText: 'name',
                            controller: name,
                            suffixIcon: const Icon(Icons.person),
                            labelText: "name"),
                        SizedBox(
                          height: 20.h,
                        ),
                        // userName feild
                        AppTextFormFeild(
                            hintText: 'user name',
                            controller: userName,
                            suffixIcon: const Icon(Icons.person),
                            labelText: "user name"),
                        SizedBox(
                          height: 20.h,
                        ),
                        // email feild

                        AppTextFormFeild(
                            hintText: 'email',
                            controller: email,
                            suffixIcon: const Icon(Icons.email),
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
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            "have an account?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final isValid = formKey.currentState?.validate();
                            if (isValid != true) {
                              return;
                            }
                            final bool result =
                                await FirebaseService.userSignUp(
                                    email: email.text,
                                    password: password.text,
                                    name: name.text,
                                    userName: userName.text);
                            if (result) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Something went wrong!"),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Sign Up",
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
