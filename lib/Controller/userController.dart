import 'package:bnacash/models/account.dart';
import 'package:bnacash/models/firebaseModel.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/login/reason_for_use.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:bnacash/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'dart:io' as io;
import '../pages/login/find_friends.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:camera/camera.dart';
import 'package:file/file.dart';
import 'dart:math';
class UserController extends GetxController {

   
     @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   getAccountData();
  }


 String jnab(){
  var rndnumber="";
  var rnd= new Random();
  for (var i = 0; i < 22; i++) {
  rndnumber = rndnumber + rnd.nextInt(9).toString();
  }
  // print(rndnumber);
  return rndnumber;
}


  FirebaseFirestore firebaseRef =  FirebaseFirestore.instance;

  String? country = "Tunisia";
  String? address = "";
  String?  fullName ;
  String? occupation = "";
  String? dob = "";
  String? email = "";
   XFile? files;
  String? accountBalance = "";
  
  

var userId = FirebaseAuth.instance.currentUser;

    
// final User user = auth.currentUser;
// final uid = user.uid;

  
Welcome welcome =Welcome();
Account accountss = Account();


 List<UploadTask> _uploadTasks = [];
   

  /// The user selects a file, and the task is added to the list.

  Future<UploadTask?> uploadFiless(XFile? files,context) async {
 var uniqueKeys = firebaseRef.collection("users");
    var uniqueKey = firebaseRef.collection("users");
    if (files == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file was selected'),
        ),
      );

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('flutter-tests')
        .child('/some-image.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': files.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await files.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(files.path), metadata);

    await  uploadTask.whenComplete(() async {
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
           FirebaseFirestore.instance.collection("users").doc(userId!.uid).update({
                " idCard":uploadpaths
           });
        Get.to(HomePage());
      });


    }
    
    // await ref.getDownloadURL().then((value) => updataIdCard(value));

    return Future.value(uploadTask);
  }
// updataIdCard(value) {

// FirebaseFirestore.instance.collection("users").doc(userId!.uid).update(<String,dynamic>{
//     "idCard":value.toString()
//   }).whenComplete(() => print("completed"));


// }



// uploadPicture () async  {

 Future<UploadTask?> uploadPassport(XFile? files,context) async {
 var uniqueKeys = firebaseRef.collection("users");
    var uniqueKey = firebaseRef.collection("users");
    if (files == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file was selected'),
        ),
      );

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('flutter-passport')
        .child('/some-image.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': files.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await files.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(files.path), metadata);

    await  uploadTask.whenComplete(() async {
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
           FirebaseFirestore.instance.collection("users").doc("5R9dKyvnIAZBz66RL8DA").update({
                " idCard":uploadpaths
           });
      });

    }
    
    // await ref.getDownloadURL().then((value) => updataIdCard(value));

    return Future.value(uploadTask);
  }






// try {
//  final ref = firebase_storage
// } on Exception catch (_) {
//   print('never reached');
// }
// }




String acc(){
  var rndnumber="";
  var rnd= new Random();
  for (var i = 0; i < 13; i++) {
  rndnumber = rndnumber + rnd.nextInt(9).toString();
  }
  print(rndnumber);
  return rndnumber;
}


 Future uploadData()async  {

   welcome.firebaseId = userId!.uid.toString();
   welcome.fullName = fullName;
   welcome.address = address;
   welcome.country = country;
   welcome.occupation = occupation;
   welcome.dob = dob;
   welcome.email = email;
   welcome.idCard = "";
   welcome.AccountDetail = "";
   welcome.Passport = "";

   var jjson= FirebaseFirestore.instance.collection("users").doc(userId!.uid).set(welcome.toJson());
     jjson.then(( value)async {
        String rand = await jnab();
        String accountN = await acc();
      await accountAdd(rand,fullName,accountN);
    //  Get.to(ReasonForUse());
     });
  }




 Future accountAdd(String rand, fullName,String accountN)async  {

   welcome.firebaseId = userId!.uid.toString();
   accountss.BIC = "BNACASH22";
   accountss.accountB = "0";
   accountss.accountNumber = accountN;
   accountss.username = fullName;
   accountss.status = true;
   accountss.IBAN = "TN"+rand;
   accountss.dateTime = DateTime.now();
  

   var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).set(accountss.toJson());
     jjson.then(( value)async {

     Get.to(ReasonForUse());
     });
  }


  List accountsList = [];

    dynamic valuess;
  
Future<dynamic>  getAccountData() async {
    welcome = Welcome();
    accountss  = Account();


       

       await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {

                 valuess = value.data();
                 accountsList.add(Account.fromDocumentSnapshot(value));
                 print(valuess);

          // if(value.docs.length >0){
          //   accountsList.clear();
          //       value.docs.forEach((element) {
          //         print(element);
          //      accountsList.add(Account.fromDocumentSnapshot(element));
          //        print(accountsList.length);
          //       });
  
          // }
             update(); 
        });  

   
      
   
  }

}