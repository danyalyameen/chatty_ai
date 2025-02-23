import 'dart:io';

import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Services/Firebase%20Authentication/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageService {
  SupabaseStorageClient storage = Supabase.instance.client.storage;
  Future<File?> pickImage({required bool imageFromCamera}) async {
    // Pick Image
    XFile? file = await ImagePicker().pickImage(
        source: imageFromCamera ? ImageSource.camera : ImageSource.gallery);
    if (file != null) {
      // Convert XFile to File
      File imageFile = File(file.path);
      // Return Image File
      return imageFile;
    } else {
      // Show Toast
      Fluttertoast.showToast(
        msg: "No Image Selected",
        backgroundColor: AppColors.grey80,
        textColor: AppColors.black40,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
      // Return Null
      return null;
    }
  }

  Future<void> uploadImage({required File image}) async {
    // Create Path For Uploading Image
    // Create A Folder with Name of User Uid
    final userUid = AuthService().getUser()!.uid;
    // Create A Folder of User Image
    final folderName = "User Image";
    // Image Name
    final imageName = "user";
    // Specify Path
    final path = "$userUid/$folderName/$imageName";
    // Uploading Image
    await storage.from('Users').upload(path, image);
  }

  Future<void> updateImage({required File image}) async {
    // Create Path For Uploading Image
    // Create A Folder with Name of User Uid
    final userUid = AuthService().getUser()!.uid;
    // Create A Folder of User Image
    final folderName = "User Image";
    // Image Name
    final imageName = "user";
    // Specify Path
    final path = "$userUid/$folderName/$imageName";
    // Deleting Image
    await storage.from('Users').remove([path]);
    // Uploading Image
    await storage.from('Users').upload(path, image);
  }

  String getUserImage() {
    // User Folder Name
    final userUid = AuthService().getUser()!.uid;
    // Folder Name
    final folderName = "User Image";
    // Image Name
    final imageName = "user";
    // Specify Path
    final path = "$userUid/$folderName/$imageName";
    // Get Image
    String imageUrl = storage.from('Users').getPublicUrl(path);
    String strictUrl = "$imageUrl?t=${DateTime.now().millisecondsSinceEpoch}";
    return strictUrl;
  }
}
