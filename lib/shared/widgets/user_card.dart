import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat_room/models/user_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class UserCard extends StatefulWidget {
  final UserModel userModel;

  const UserCard({
    required this.userModel,
    super.key,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 25,
              child: Center(
                child: Text(
                  widget.userModel.name.substring(0, 1).toUpperCase(),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              widget.userModel.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            // audio call button
            Expanded(child: actionButton(false)),
            // video call button
            Expanded(child: actionButton(true)),
          ],
        ),
      ),
    );
  }

  ZegoSendCallInvitationButton actionButton(bool isVideo) =>
      ZegoSendCallInvitationButton(
        isVideoCall: isVideo,
        resourceID: "zegouikit_call",
        invitees: [
          ZegoUIKitUser(
            id: widget.userModel.userName,
            name: widget.userModel.name,
          ),
        ],
      );
}
