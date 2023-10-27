import 'dart:io';

import 'package:combine_proj/service/firebase_storage/firebase_storage_const.dart';
import 'package:combine_proj/service/shared_pref/shared_pref.dart';
import 'package:combine_proj/service/shared_pref/shared_pref_constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static Reference reference = FirebaseStorage.instance.ref();

  // upload item image to firebase

  Future<void> uploadItemImage(String itemId) async {
    await reference
        .child(FirebaseStorageConstants.itemImagesRef)
        .child(itemId)
        .putFile(File(SharedPrefService.instance
            .getString(SharedPrefConstants.savePickedImageState)!));
  }
  // get image imageURL

  Future<String> getItemImageUrl(String name) async {
    return await reference
        .child(FirebaseStorageConstants.itemImagesRef)
        .child(name)
        .getDownloadURL();
  }
}
