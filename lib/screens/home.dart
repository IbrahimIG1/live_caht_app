import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voice_chat_room/common/widgets/top_bar.dart';
import 'package:voice_chat_room/common/widgets/user_card.dart';
import 'package:voice_chat_room/models/user_model.dart';
import 'package:voice_chat_room/services/firebase/firebaseservice.dart';
// import 'package:zego_cloud/common/widgets/call_invitation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(
              upperTitle: 'Welcome back,',
              title: FirebaseService.currentUser.name,
            ),
            Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseService.buildViews,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<QueryDocumentSnapshot>? docs = snapshot.data?.docs;
                  if (docs == null || docs.isEmpty) {
                    return const Text('No data');
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final model = UserModel.fromJson(
                        docs[index].data() as Map<String, dynamic>,
                      );
                      if (model.userName !=
                          FirebaseService.currentUser.userName) {
                        return UserCard(userModel: model);
                      }
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
