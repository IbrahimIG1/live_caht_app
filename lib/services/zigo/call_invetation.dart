import 'package:flutter/material.dart';
import 'package:voice_chat_room/shared/shared.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallInvetationScreen extends StatelessWidget {
  const CallInvetationScreen(
      {super.key, required this.child, required this.userName});

  final Widget child;
  final String? userName;
  @override
  Widget build(BuildContext context) {
    
    return ZegoUIKitPrebuiltCallWithInvitation(
      child: child,
        appID:Statics.appID ,
        appSign: Statics.appSign,
        userID: userName!,
        userName: userName!,
        plugins: [ZegoUIKitSignalingPlugin()]);
  }
}
