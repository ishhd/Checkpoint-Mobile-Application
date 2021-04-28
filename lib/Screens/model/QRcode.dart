import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class UserManagement {
  GlobalKey globalKey = new GlobalKey();

  storeNewUser(FirebaseUser user, context, name) async {
    File qr;
    var uri = (Uri.parse("https://pierre2106j-qrcode.p.rapidapi.com/api"));
    var response1;
    response1 = await http.get(
        uri.replace(
          queryParameters: <String, String>{
            "backcolor": "ffffff",
            "pixel": "9",
            "ecl": "L %7C M%7C Q %7C H",
            "forecolor": "000000",
            "type": "text %7C url %7C tel %7C sms %7C email",
            "text": user.uid,
          },
        ),
        headers: {
          "x-rapidapi-host": "pierre2106j-qrcode.p.rapidapi.com",
          "x-rapidapi-key": "f9f7a1b65fmsh8040df99eaf90e5p164474jsn2ed53a118bcd"
        });

    print("response.body mother: ${response1.body}");

    File file = await DefaultCacheManager().getSingleFile(response1.body);
    var time = DateTime.now();
    StorageUploadTask task;
    print("File: ${file}");

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('userQrCodes/${user.uid}.png');
    task = firebaseStorageRef.putFile(file);

    StorageTaskSnapshot snapshot = await task.onComplete;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    print("DownloadUrl: ${downloadUrl}");

    Firestore.instance.collection('student').add({
      'uid': user.uid,
      'qrCodeUrl': downloadUrl,
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
      final channel = const MethodChannel('channel:me.camellabs.share/share');
      channel.invokeMethod('shareFile', 'image.png');
    } catch (e) {
      print(e.toString());
    }
  }
}
