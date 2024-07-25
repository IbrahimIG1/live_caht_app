import 'package:flutter/material.dart';
import 'package:voice_chat_room/common/static.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallInvitationPage extends StatelessWidget {
  const CallInvitationPage({
    super.key,
    required this.child,
    required this.username,
  });

  final Widget child;
  final String username;

  @override
  Widget build(BuildContext context) {
    return onUserLogin(username);
  }

  onUserLogin(String userName) {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Statics.appID /*input your AppID*/,
      appSign: Statics.appSign /*input your AppSign*/,
      userID: userName,
      userName: userName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }
}
