import 'package:flutter/material.dart';
import 'package:voice_chat_room/shared/shared.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallInvetationScreen extends StatelessWidget {
  const CallInvetationScreen(
      {super.key, required this.child, required this.userName});

  final Widget child;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID:Statics.appID ,
        callID: Statics.appSign,
        userID: userName,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall());
  }
}
