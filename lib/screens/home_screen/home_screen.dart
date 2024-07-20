import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voice_chat_room/models/user_model.dart';
import 'package:voice_chat_room/services/firebase/firebaseservice.dart';
import 'package:voice_chat_room/shared/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirebaseService.currentUser.userName),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              // stream to get any user login new
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
