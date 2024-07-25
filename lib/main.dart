import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat_room/screens/login.dart';
import 'package:voice_chat_room/services/firebase/firebaseservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.setupFirebase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: ThemeData(
              primaryColor: primaryColor,
              shadowColor: secondaryColor,
            ),
            home: const Login(),
          );
        });
  }
}
