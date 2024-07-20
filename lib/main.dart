import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat_room/screens/login_screen/login.dart';
import 'package:voice_chat_room/services/firebase/firebaseservice.dart';
import 'package:permission_handler/permission_handler.dart';

final navigatorKey = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.setupFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: PermissionHandlerWidget());
        });
  }
}

class PermissionHandlerWidget extends StatefulWidget {
  @override
  _PermissionHandlerWidgetState createState() =>
      _PermissionHandlerWidgetState();
}

class _PermissionHandlerWidgetState extends State<PermissionHandlerWidget> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

void requestPermissions() async {
    // Request all necessary permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.nearbyWifiDevices,
      
     Permission.phone,
     Permission.microphone,
      Permission.camera,
      Permission.bluetooth,
      Permission.storage,
      Permission.mediaLibrary,
    ].request();

    // Handle the permissions status
    if (statuses[Permission.phone]!.isGranted &&
        statuses[Permission.microphone]!.isGranted &&
        
        statuses[Permission.camera]!.isGranted &&
        statuses[Permission.bluetooth]!.isGranted &&
        statuses[Permission.storage]!.isGranted &&
        statuses[Permission.mediaLibrary]!.isGranted) {
      // All permissions are granted, proceed with your app logic
    } else {
      // Permissions are not granted, show a message or handle accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    // You can build your UI here
    return LoginScreen();
  }
}
