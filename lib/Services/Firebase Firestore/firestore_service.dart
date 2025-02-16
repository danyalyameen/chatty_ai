import 'package:chatty_ai/Models/user_model.dart';
import 'package:chatty_ai/Services/Firebase%20Authentication/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Add User Details
  Future<void> createUser(
      {required String name,
      required String gender,
      required Timestamp dob,
      required bool profileCompleted}) async {
    // Get User Path
    DocumentReference user = FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService().getUser()!.uid);
    // Add User Details
    await user.set(
      UserModel(
        name: name,
        gender: gender,
        dob: dob,
        profileCompleted: profileCompleted,
      ).receive(),
    );
  }

  // Add Chat to Firestore
  Future<void> addChat({required List<Chat> chats}) async {
    // User Path
    DocumentReference user = FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService().getUser()!.uid);
    // Get User Data
    var data = await user.get();
    // Store it to Model
    UserModel userModel = UserModel.store(data.data() as Map<String, dynamic>);
    // Initializa Chat if null
    userModel.chats ??= [];
    // Add Chat
    userModel.chats!.add(Chats(title: chats[0].prompt, chat: chats));
    // Update on the Database
    await user.update(
      UserModel(
        chats: userModel.chats,
      ).receive(),
    );
  }

  Future<UserModel> getUserInfo() async {
    // User Path
    DocumentReference user = FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService().getUser()!.uid);
    // Fetch Data
    var data = await user.get();
    // User information
    var userInfo = UserModel.store(data.data() as Map<String, dynamic>);
    return userInfo;
  }

  Future<List<Chats>> getChat() async {
    // User Path
    DocumentReference user = FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService().getUser()!.uid);
    // Fetch Data
    var data = await user.get();
    // Store into Model
    var userModel = UserModel.store(data.data() as Map<String, dynamic>);
    return userModel.chats ?? [];
  }
}
