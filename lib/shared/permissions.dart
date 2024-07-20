import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voice_chat_room/screens/home_screen/home_screen.dart';
import 'package:voice_chat_room/screens/login_screen/login.dart';

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

