import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:LivePage(roomID: "1234")
    );
  }
}

class LivePage extends StatelessWidget {
  final String roomID;
  final bool isHost;

  const LivePage({Key? key, required this.roomID, this.isHost = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: 1090152900, // AppID In Project information in zego console.
        appSign: 'b92ecdb900310704a93445c26448d66e4c2509bc83253d4e0b3cd9006bbc510c', // appSign In Project information in zego console.
        userID: 'user_id',
        userName: 'user_name',
        roomID: roomID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
      ),
    );
  }
}
