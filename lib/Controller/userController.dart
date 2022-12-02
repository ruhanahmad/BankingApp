import 'dart:convert';


import 'package:bnacash/Controller/controller.dart';
import 'package:bnacash/Controller/google_auth.dart';
import 'package:bnacash/models/account.dart';
import 'package:bnacash/models/external_card.dart';
import 'package:bnacash/models/firebaseModel.dart';
import 'package:bnacash/models/notifiction.dart';
import 'package:bnacash/models/virtual_card.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/login/models/country.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:bnacash/pages/login/models/login.dart';
import 'package:bnacash/pages/login/proof_of_residency.dart';
import 'package:bnacash/pages/login/reason_for_use.dart';
import 'package:bnacash/pages/verificationFailed.dart';
import 'package:bnacash/pages/whom_to_pay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:bnacash/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bnacash/models/contacts.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'dart:io' as io; 
import '../pages/login/find_friends.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:camera/camera.dart';
import 'package:file/file.dart';
import 'dart:math';

import '../pages/Login/models/code_field.dart';
import '../pages/login/models/phone_field.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class UserController extends GetxController {
   XFile? filesPassport;
   XFile? files;
//  static final _googleSignIn =
//   GoogleSignIn(scopes: ['https://mail.google.com/']);
//  static Future<GoogleSignInAccount?> signIn() async {
//   if (await _googleSignIn.isSignedIn()) {
//   return _googleSignIn.currentUser;
//    } else {
//    return await _googleSignIn.signIn();
//  }
// } 

  User? userpi;
  User? userId ;
PhoneAuth phoneAuth = Get.put(PhoneAuth());
  bool? signUps =false;

//------------------------------SendMailOkay---------------------------------//

// String? img64;
// Future? converting(){
// final bytes = io.File(files!.path).readAsBytesSync();

// img64 = base64Encode(bytes);
// }

final emailu = "ranaruhan123@gmail.com";
final accessToken = "";

Future SendMailss()async{
  
  var _file=io.File(files!.path);// 
  var _filePassport=io.File(filesPassport!.path);

  final emauser = await GoogleAuthApi.signIn();
  if (emauser ==  null) return ;
  final emailu = emauser.email;
  final auth = await emauser.authentication;
  final accessToken = auth.accessToken;
  final smptServer = gmailSaslXoauth2(emailu, accessToken!);
  var attachment ;
  final message =  await Message()
  ..from = Address(emailu,"Admin")
  ..recipients = ["ranaruhan123@gmail.com"]
  ..subject="This email is for verification"
   ..attachments = [FileAttachment(_file),FileAttachment(_filePassport)]//acha mjy logic b btao na kia kis ki logic

  ..text = "Hi kindly check the user id ${userId!.uid} for verification of passport and photos";
 

   try {
     await send(message, smptServer);
    //  showSnackBar('sent successfully');
    Get.snackbar("Email Sent", "SucessFully Email Sent");
   } on MailerException catch (erorr) {
     Get.snackbar("Email No Sent", "Email not send");
     print(erorr);
   }

}

//-------------------------------------------------------------//

// Future sendEmail() async {
//    final user = await _googleSignIn.signIn();
//    if (user == null) return;
//    final email = 'ranaruhan123@gmail.com';
//    final auth = await user.authentication;
//    final accessToken = '';
//    final smptServer = gmailSaslXoauth2(email, accessToken);
//    final message = Message()
//      ..from = Address(emailu 'Khaled')
//      ..recipients = ['ranaruhan123@gmail.com']
//      ..subject = 'Hello'
//      ..text = 'this is atext email';
//    try {
//      await send(message, smptServer);
//     //  showSnackBar('sent successfully');
//     Get.snackbar("Email Sent", "SucessFully Email Sent");
//    } on MailerException catch (erorr) {
//      print(erorr);
//    }
//  }









//--------------------------------------------verificationCheck-------------------------//
  
       List <DocumentSnapshot> verificationss = [];
   var checkss;
Future  verificationChec() async {
    // welcome = Welcome();
    // accountss  = Account();
       await FirebaseFirestore.instance
        .collection("user").doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
                 valuess = value.data();
                 print(valuess);
                  checkss  =  valuess['verified'];
                //  accountsList.add(Account.fromJson(value));
                      if(checkss == false){
                          Get.to(VerificationFailed());
                      }
                      else{
                       Get.to(HomePage());
                      }
                 print(valuess);
            //  update(); 
        });  
  }









//---------------------------------------------checksif for signup------------------------//

           List <DocumentSnapshot> checksIFSign = [];

  Future  checksIFSignUp( )async{
              if(userId != null){
                        var kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).get().then((DocumentSnapshot value) {
     var checksIFSign  = value.data();
      //  var id = whistle.first.id;
        if(checksIFSign == null) {
           phoneAuth.verifyPhone();
                // Get.to(CodeField());
    
        }

        else{
          Get.snackbar("User Already Signed up", "Moving to login page and Try loggin in",duration: Duration(seconds: 5));
           Get.to( loginFeild());
        }
    
        });
              }



              else {
                  phoneAuth.verifyPhone();
              }

   


}


  //----------------------------------------------checks if --------------------------------//
         

         List <DocumentSnapshot> whistle = [];

  Future  checksIF() async{
        var kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).get().then((DocumentSnapshot value) {
     var whistle  = value.data();
      //  var id = whistle.first.id;
        if(whistle == null) {
                Get.to( CountryField());
    
        }

        else{
           Get.to( HomePage());
        }
    
        });
   


}













//--------------------------------------------Terminate CArd ----------------------//


         List <DocumentSnapshot> vis = [];

  Future  terminatedCard() async{
        var kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("virtualCard")
        .get().then((QuerySnapshot value) {
      vis  =   value.docs;
       var id = vis.first.id;
        if(vis.length > 0) {
           var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection("virtualCard").doc(id).delete();
     jjson.then(( value)async {
      
     Get.snackbar("Deleted Successfully", "Message Deleted");
     });
        }

        else{
           Get.snackbar("Not Found", "Deleted Record not Found");
        }
    
        });
   


}
    //               Future  chatbotss()async {
    //         try {
    //  dynamic conversationObject = {
    //      'appId': '14d6d7c9b42546cee0cfa5159ae789db3' // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
    //  };
    //   dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
    //   print("Conversation builder success : " + result.toString());
    // } on Exception catch (e) {
    //   print("Conversation builder error occurred : " + e.toString());
    // }
    //         }

  String? sendMoneyContactName;
  String? dropDownValue;
 String? beneIban = "";
 String? beneBalance;
 String? beneEmail= "";
String? beneName  = "";
 String? sendMoneyContact = "";
 ExCard exCard = ExCard();
String? codeEntered = "";
String? prepaidBalance = "";
String sendMoneyBalance = "";
Contacts contacts = Contacts();
String? region = "";
String? city = "";
String? street = "";
String? zipcode = "";

Notifications notifications = Notifications();
   
     @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //  userController.getVirtualCard();
  //  getAccountData(jis );

// contactListed();// aysy 
// update();
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


 String tenNumberGenerated(){
  var rndnumber="";
  var rnd= new Random();
  for (var i = 0; i < 10; i++) {
  rndnumber = rndnumber + rnd.nextInt(9).toString();
  }
  // print(rndnumber);
  return rndnumber;
}


 String CVVGenerated(){
  var rndnumber="";
  var rnd= new Random();
  for (var i = 0; i < 3; i++) {
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
   
  String? accountBalance = "";
  String? lastNamess = "";
  



    
// final User user = auth.currentUser;
// final uid = user.uid;

  
Welcome welcome =Welcome();
Account accountss = Account();
//---------------------------------upload passport----------------------------------//

  Future<UploadTask?> uploadFilesPassport(XFile? files,context) async {
    await getIDo();
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
        .child('passport') 
        .child('/some-image.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': files.path},
    );
    EasyLoading.show();

    if (kIsWeb) {
      uploadTask = ref.putData(await files.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(files.path), metadata);

    await  uploadTask.whenComplete(() async {
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
           FirebaseFirestore.instance.collection("users").doc(userId!.uid).update({
                " passport":uploadpaths
           });
               await SendMailss();
           Get.snackbar("Uploaded", "Upload successfully");
           Get.to(HomePage());
          // await   sendEmail();
          EasyLoading.dismiss();
        // Get.to(HomePage());
        
      });


    }
    
    // await ref.getDownloadURL().then((value) => updataIdCard(value));

    return Future.value(uploadTask);
  }

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
 EasyLoading.show();
    if (kIsWeb) {
      uploadTask = ref.putData(await files.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(files.path), metadata);

    await  uploadTask.whenComplete(() async {
      await getIDo();
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
           FirebaseFirestore.instance.collection("users").doc(userId!.uid).update({
                " idCard":uploadpaths
           });

           Get.snackbar("Uploaded", "Upload successfully");

        Get.to(ProofPage());
        EasyLoading.dismiss();
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
           FirebaseFirestore.instance.collection("users").doc(userId!.uid).update({
                "Passport":uploadpaths
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

getIDo()async{
  userId = await FirebaseAuth.instance.currentUser;
  update();
 print(userId);
}

 Future uploadData()async  {
  await getIDo();
  //  print(userId!.uid);
   welcome.firebaseId = userId!.uid.toString();
  //  userId!.uid == null ? "null":
   
  //  userId!.uid.toString();
   welcome.lastName = lastNamess;
   welcome.fullName = fullName;
   welcome.street = address;
   welcome.city = city;
   welcome.region = region;
   welcome.zipcode = zipcode;
   welcome.country = country;
   welcome.occupation = occupation;
   welcome.dob = dob;
   welcome.email = email;
   welcome.idCard = "";
   welcome.AccountDetail = "";
   welcome.Passport = "";
   welcome.passcode ="" ;
   welcome.verified = false;
   var jjson= FirebaseFirestore.instance.collection("users").doc(userId!.uid).set(welcome.toJson());
     jjson.then(( value)async {
        String rand = await jnab();
        String accountN = await acc();
      await accountAdd(rand,fullName,accountN);
    //  Get.to(ReasonForUse());
     });
  }


String? accB ="";

 Future accountAdd(String rand, fullName,String accountN)async  {

   welcome.firebaseId = userId!.uid.toString();
   accountss.BIC = "BNACASH22";
   accountss.accountB = "0";
   accountss.accountNumber = accountN;
   accountss.username = fullName;
   accountss.status = true;
   accountss.IBAN = "TN"+rand;
   accountss.limit = "500";
   accountss.plan = "Standard";
  //  accountss.dateTime = DateTime.now();
  

   var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).set(accountss.toJson());
     jjson.then(( value)async {
           accB = accountss.accountB;   
           update()  ;  
    //  Get.to(ReasonForUse());
     });
  }

List <DocumentSnapshot> documents = [];
List  news = [];
String  balance  = "";
bool? errorMsg  = false;
bool? errorMsgTwo  = false;
String? finalB;


 Future<dynamic> prepaid() async{
  balance = "";
  documents.clear();
final QuerySnapshot result =
    await FirebaseFirestore.instance.collection('prepaidcode').where('code', isEqualTo: 
    codeEntered).get();
 documents = result.docs;
 update();
print(documents.length);
if (documents.length > 0) { 
       news.add(result.docs);
       print(news);
      print(documents.first["status"]);
      
      if(documents.first["status"] == "unused"){
        // accountsList[0].accountB = "";
        var ids = documents.first.id;
      balance  = documents.first["balance"];
        await  getAccountData();
        var newValeTwo;
        if(int.parse(balance) > 0){
       newValeTwo = await subTwoStringsAsInt(first: balance, second: balance)  ;
        // }
//         else{
//  Get.snackbar("Error", "Value must b greater than in account");
//         }
   var newVale =  await addTwoStringsAsInt(first: balances, second:balance)  ;
     print(newVale);
      
     await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "accountB":newVale.toString()
           }).then((value) => print(" updated"));

                await FirebaseFirestore.instance.collection("prepaidcode").doc(ids).update({
                "balance":newValeTwo.toString()
           }).then((value) => print(" updated two"));


                         await FirebaseFirestore.instance.collection("prepaidcode").doc(ids).update({
                "status":"used"
           }).then((value) => print(" updated two"));



           

Get.snackbar("Success","Money added");
  
 
      print("asas"+accountsList[0].accountB);
      // getAccountData();
      errorMsg = false;
      update();
      }
      else{
        Get.snackbar("title", "Number must be greater");
      }
      }
      else if(documents.first["status"] == "used"){
        errorMsg = true;
        update();
      }
  // documents[0].status == "unused";

} else {  
     errorMsgTwo = true;
     update();
     //karo ki sochi jarai ho ya dykho n
  //not exists

}
 }

  List accountsList = [];

    dynamic valuess;
    String? accBalance="";
int addTwoStringsAsInt({required var first,required var second})
  {
    try{
     
    return (int.parse(first)+int.parse(second));

    }
    catch(e)
    {
      print(e);
      return 0;
    }
  }
int subTwoStringsAsInt({required var first,required var second})
  {
    

    try{
      
    return (int.parse(first)-int.parse(second));

    }
    catch(e)
    {
      print(e);
      return 0;
    }
  }
  var balances;
Future  getAccountData() async {
   await getIDo();
  EasyLoading.show();
    // welcome = Welcome();
    // accountss  = Account();
       await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
                 valuess = value.data();
                 print(valuess);
                  balances  =  valuess['accountB'];
                 accountsList.add(Account.fromJson(value));
                 print(valuess);
             update(); 
        });  
        EasyLoading.dismiss();
  }

  //============================================================================//

//External Card



  String? cardsNum;
  String? Cvv;
  String? Date;
  String? exB;


 Future addCardExternal()async  {

   

   welcome.firebaseId = userId!.uid.toString();

  //  exCard = ExCard
  //  accountss.BIC = "BNACASH22";
  //  accountss.accountB = "0";
  //  accountss.accountNumber = accountN;
  //  accountss.username = fullName;
  //  accountss.status = true;
  //  accountss.IBAN = "TN"+rand;
  //  accountss.dateTime = DateTime.now();
  

   var jjson= FirebaseFirestore.instance.collection("exCard").add({"balance":exB,"firebaseId":userId!.uid,
   "CardNum":cardsNum,"CVV":Cvv,"Date":Date});
     jjson.then(( value)async {
         
       if(value != null){
Get.snackbar(
              "Card Added",
               "Successfully",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.blue,
               );
              //  Get.to();
       }
      
    //        accB = accountss.accountB;   
    //        update()  ;  
    //  Get.to(ReasonForUse());
     });
  }




 //-------------------------------Order physical Card ----------------------------------------------//
   String? physicalAddress;
    Future orderPhysicalCard() async{
         var accNo = await tenNumberGenerated();
       var cvv = await CVVGenerated();
    // welcome = Welcome();
    // accountss  = Account();
       await FirebaseFirestore.instance
        .collection("physicalCard").doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) async {
          if(value.exists ){
             Get.snackbar("Error", "Card Error");
            // valuess = value.data();
            //      print(valuess);
            //       balances  =  valuess['accountB'];
            //     //  accountsList.add(Account.fromJson(value));
            //      print(valuess);
            //  update(); 

          }
          else  {
            Get.snackbar("Creating a Card", "No order for physical card before");
         
             
   var jjson=  await FirebaseFirestore.instance.collection("physicalCard").doc(userId!.uid).set({"address":physicalAddress,"firebaseId":userId!.uid,
   "CardNum":accNo,"CVV":cvv,"Date":DateTime.now()});
 
         
      
Get.snackbar(
              "Card Added",
               "Successfully",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.blue,
               );

    

          }
                 
        });  
 

      
    }








List <DocumentSnapshot> documentsEx = [];
List  cardEx = [];
String  balanceEx  = "";
bool? errorMsgEx  = false;
bool? errorMsgTwoEx  = false;
String? finalBEx;
String? exCardB;



 Future<dynamic> getExCard() async{
  balance = "";
  documents.clear();
final QuerySnapshot result =
    await FirebaseFirestore.instance.collection('exCard').where('CardNum', isEqualTo: 
    cardsNum).where('CVV', isEqualTo: 
    Cvv).where('Date', isEqualTo: 
    "12").get();
 documents = result.docs;
 update();
print(documents.length);
if (documents.length > 0) { 
       cardEx.add(result.docs);
       print(news);
      print(documents.first["status"]);
      if(documents.first["status"] == "unused"){

       exCardB =  documents.first["balance"];
        var id = documents.first.id;
        await  getAccountData();
     var   newValeTwo;
       if(int.parse(exCardB.toString()) > int.parse(prepaidBalance.toString())){
  var newValeTwo = await subTwoStringsAsInt(first: exCardB, second: prepaidBalance)  ;
       
      //  else{
      //   Get.snackbar("Error", "Must be less value than in account");
      //  }
   var newVale =  await addTwoStringsAsInt(first: balances, second:prepaidBalance)  ;
     print(newVale);
      
     await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "accountB":newVale.toString()
           }).then((value) => print(" updated"));

                await FirebaseFirestore.instance.collection("exCard").doc(id).update({
                "balance":newValeTwo.toString()
           }).then((value) => print(" updated two"));
           


  
 

       Get.snackbar(
              "Success",
              "Money Added Successfully ${exCardB}",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.blue,
               );
               // 03422831265
              //  documents.first[""]
    //     accountsList[0].accountB = "";
    //   balanceEx  = documents.first["balance"];
    //  finalBEx = accB! + balanceEx ;
     print(finalBEx);
    //  accountsList[0].accountB = int.tryParse(accountsList[0].accountB)+  int.tryParse(finalB!) ;
  //  var abcd = int.tryParse(accountsList[0].accountB);
  // var anbv = int.tryParse(finalB!);
  // int? fi   =abcd + anbv;
  //  print("akjsdhkajs" + "${anbv}");
  //     print("asas"+accountsList[0].accountB);
      // getAccountData();
      // errorMsgEx = false;
      update();
        }
        else{
          Get.snackbar("Number must be Greater than zero", "message");
        }
      }
      else if(documents.first["status"] == "used"){
        errorMsgEx = true;
        Get.snackbar("title","CArd is already in used");
        update();
      }
  // documents[0].status == "unused";

} else {  
     errorMsgTwoEx = true;
     update();
  //not exists

}
 }

//------------------------------------------------CheckPassCode------------------------------------------->
   var  passs ;
   bool? checked;
 Future checkPass( String passcode)async{

               await FirebaseFirestore.instance
        .collection("users").doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {

                 valuess = value.data();
                 print(valuess);
                passs  =  valuess[' passcode'];
                update();
                  if(passs == passcode){
                    checked = true;
                    update();
                    
                  }
                  else {
                    checked = false;
                      update();
                  }
                //actual amount sending acount
                // username = valuess["username"];
                //  accountsList.add(Account.fromJson(value));
                      
                update();
            //      print(valuess);
            //  update(); 
        }); 
   
 }


//-------------------------------------------------Send Money Contact=------------------------------------>


  Future<dynamic> accSendMoneyCheck(String iban) async{


    var bal ="";
    var username= "";
  balance = "";
  documents.clear();
final QuerySnapshot result =
    await FirebaseFirestore.instance.collection('account').where('IBAN', isEqualTo: 
    iban).get();
 documents = result.docs;
 update();
print(documents.length);
print(userId!.uid);
if (documents.length > 0) { 

       var ids = documents.first.id;
    var  balanc  = documents.first["accountB"];
        // await  getAccountData();
             await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {

                 valuess = value.data();
                 print(valuess);
                bal  =  valuess['accountB'];
                //actual amount sending acount
                username = valuess["username"];
                //  accountsList.add(Account.fromJson(value));
                      
                update();
            //      print(valuess);
            //  update(); 
        });  
         if(int.parse(bal.toString()) > int.parse(beneBalance.toString())){
                    var newValeTwo = await subTwoStringsAsInt(first: bal, second: beneBalance)  ;
          
            await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "accountB":newValeTwo.toString()
           }).then((value) => print(" updated"));

   var newVale =  await addTwoStringsAsInt(first: balanc, second:beneBalance.toString())  ;

     print(newVale);
      
            await FirebaseFirestore.instance.collection("account").doc(ids).update({
                "accountB":newVale.toString()
           }).then((value) => print(" updated"));

   Get.snackbar("Success", "Money added Successfully");
   Get.to(WhomToPay());


   notifications.dateTime =  DateTime.now();
   notifications.balance = beneBalance;
   notifications.username = username;

      var jjson= FirebaseFirestore.instance.collection("account").doc(ids).collection("notifications").add(
        notifications.toJson()
      //   {
      //   "username":username,
      //   "balance":beneBalance,
      //   "DateTime":DateTime.now(),

      // }
      );
     jjson.then(( value)async {
              Get.snackbar("title","Value added successfully");

           update()  ;  
    //  Get.to(ReasonForUse());
     });

         }
         else {
           Get.snackbar("Error", "Balance must be greater");
         }
  

       var firebaseId = userId!.uid.toString();
    

        
 }
 else{
  Get.snackbar("Error", "no document found");
 }
}
























var contactFetch;


List <DocumentSnapshot> contactsGet = [];



  Future<dynamic> accIbanCheck() async{
    var bal ="";
  balance = "";
  documents.clear();
final QuerySnapshot result =
    await FirebaseFirestore.instance.collection('account').where('IBAN', isEqualTo: 
    beneIban).get();
 documents = result.docs;
 update();
print(documents.length);
print(userId!.uid);
if (documents.length > 0) { 

       var ids = documents.first.id;
    var  balanc  = documents.first["accountB"];
        // await  getAccountData();
             await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {

                 valuess = value.data();
                 print(valuess);
                bal  =  valuess['accountB'];
                //  accountsList.add(Account.fromJson(value));
                      
                update();
            //      print(valuess);

  
            //  update(); 
            
        });  
          
        var newValeTwo = await subTwoStringsAsInt(first: bal, second:sendMoneyBalance)  ;
          
            await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "accountB":newValeTwo.toString()
           }).then((value) => print(" updated"));

   var newVale =  await addTwoStringsAsInt(first: balanc, second:sendMoneyBalance)  ;
     print(newVale);
      




            await FirebaseFirestore.instance.collection("account").doc(ids).update({
                "accountB":newVale.toString()
           }).then((value) => print(" updated"));

       var firebaseId = userId!.uid.toString();
       
     contacts.email = beneEmail;
     contacts.iban = beneIban;
     contacts.id = firebaseId;
     contacts.name = beneName;

         await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("contacts").where("iban", isEqualTo: beneIban)
        .get()

        .then((QuerySnapshot value) {
                 contactsGet = value.docs;
                 print(valuess);
                 if(contactsGet.length > 0){
                        Get.snackbar("Contacts alreat", "contacts already in list");
                 }
                 else{
                     var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection(
    "contacts"
   ).add(
    contacts.toJson()
    );
     jjson.then(( value)async {
          print("complted");
    //  Get.to(ReasonForUse());
    Get.snackbar("title", "Completed yes it is");
     });
                 }
                  contactFetch  =  contactsGet.first['accountB'];
                //  accountsList.add(Account.fromJson(value));
                 print(contactsGet);
             update(); 
        });  
 }
}
    
     getContacts() async{
      
 var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection(
    "contacts"
   ).get();
     jjson.then(( value)async {
          print(value);
    //  Get.to(ReasonForUse());
    // Get.snackbar("title", "Completed yes it is");
     });

    }
  


List <DocumentSnapshot>? contactListThings = [];

VirtualCard virtualCard = VirtualCard();
Future  contactListed() async {
    // welcome = Welcome();
    // accountss  = Account();
    var kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("contacts")
        .get().then((QuerySnapshot value) {
          contactListThings  =   value.docs;
           
                
              update();
       
    

        });
    
      print(contactListThings!.length);
      // print(contactListThings!.first["iban"]);
        // .then((DocumentSnapshot value) {
        //          valuess = value.data();
        //          print(valuess);
        //           balances  =  valuess['accountB'];
        //          accountsList.add(Account.fromJson(value));
        //          print(valuess);
        //      update(); 
        // });  
  }
    


List <DocumentSnapshot>? checkVirtual = [];
Future  checkVirtualCard() async {
    // welcome = Welcome();
    // accountss  = Account();
    var kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("virtualCard")
        .get().then((QuerySnapshot value) {
      checkVirtual  =   value.docs;

        });
        if(checkVirtual!.length > 0 ){
        
      Get.snackbar("Already Exsist", "Card Already Exsist / Order for Virtual card already done");

        }
   else {
  await   orderVirtualCard();
   }
     
  }
List <DocumentSnapshot>? doublecheckVirtual = [];
bool? isChecked ;
  Future  doublecheckVirtualCard() async {
    // welcome = Welcome();
    // accountss  = Account();
    var kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("virtualCard")
        .get().then((QuerySnapshot value) {
      doublecheckVirtual  =   value.docs;
      print(doublecheckVirtual!.length);

        });
        if(checkVirtual!.length > 0 ){
      isChecked  = true;
      update();
         print("true");
      return true;

        }
else{
        isChecked  = false;
      update();
  print("false");
  return false;
}
     
  }



  Future   orderVirtualCard() async {

      var _selectedDate = DateTime.now();
      _selectedDate = DateTime(_selectedDate.year +5,
                        _selectedDate.month );
                    var tenNumber    = "abc123" +  await tenNumberGenerated();
                    virtualCard.accountNumber = tenNumber;
                    virtualCard.cvv = await  CVVGenerated();
                    virtualCard.color = "red";
                    virtualCard.freeze = false;
                    virtualCard.expiryDate = _selectedDate;

             var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection(
    "virtualCard"
   ).add(
    virtualCard.toJson()
    );
     jjson.then(( value)async {
          print("complted");
    //  Get.to(ReasonForUse());
    Get.snackbar("title", "Completed yes it is");
     });
     }




// ---------------------------------------------Get notification-------------------------------

 List notificationList = [];

List bala = [];
   Future<List<Notifications>?> getNotification() async{

    QuerySnapshot  kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("notifications")
        .get();

      notificationList.clear();


   bala.clear();


   kilo.docs.forEach((element) {
    // print(element.docs[0]["username"]) ;
    print(element["username"]) ;
    notificationList.add(element["username"]);
    bala.add(element["balance"]);



      print(element);
print(element);

   });
  
  
   }

//===================================Update passcode=======================================

String? updatedPasscode;
String? reset;

 Future updatePasscode(String pass) async{
    try{
   var passcodes =      await   FirebaseFirestore.instance.collection("users").doc(userId!.uid).update({
                " passcode":pass,
           }).then((value) {
            Get.snackbar("Updated", "Passcode updated successfully");
            Get.to(ProofPage());
           });
    }
    catch(e){
       Get.snackbar("Error", "There is an error !");
    }   
      // await uploadData();  
        
      


 }
  Future resetPasscode(String pass) async{
    try{
      if( pass.length == 6) {
   var passcodes =      await   FirebaseFirestore.instance.collection("users").doc(userId!.uid).update({
                " passcode":pass,
           }).then((value) {
            Get.snackbar("Updated", "Passcode updated successfully");
           });
    }
    else{
      Get.snackbar("Error", "Number must b 6,No lesser,Np Greater");
    }
    }
    catch(e){
       Get.snackbar("Error", "There is an error !");
    }   
      // await uploadData();  
        // Get.to(HomePage());
      


 }




 //--------------------------------------------------update PAckage=-------------------

    Future  updatePackage() async{

          // var bal ="";
    dynamic valuex= "";
 var balance ;
 await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "plan":dropDownValue,
                "limit":dropDownValue == "Premium" ? "3000" : "6000",


           });
List <DocumentSnapshot> documents = [];

  // documents.clear();
var  result =
    await FirebaseFirestore.instance.collection('account').doc(userId!.uid).get().then((DocumentSnapshot value) {
      valuex = value.data();
      

      });
    //  balance   = result.accountB;
 update();
print(valuex.length);
print(userId!.uid);


           if (valuex.length > 0) { 
       balance = valuex["accountB"];
       print(news);
      print(balance.runtimeType);
         
         
        // accountsList[0].accountB = "";
        // var ids = documents.first.id;
   
        var newValeTwo;
        if(int.parse(balance) > 0){
       newValeTwo = await subTwoStringsAsInt(first: balance, second:dropDownValue == "Premium" ? 7.toString():12.toString())  ;
        // }
//         else{
//  Get.snackbar("Error", "Value must b greater than in account");
//         }
  //  var newVale =  await addTwoStringsAsInt(first: balances, second:balance)  ;
  //    print(newVale);
      
     await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "accountB":newValeTwo.toString()
           }).then((value) => print(" updated"));

          //       await FirebaseFirestore.instance.collection("prepaidcode").doc(ids).update({
          //       "balance":newValeTwo.toString()
          //  }).then((value) => print(" updated two"));


          //                await FirebaseFirestore.instance.collection("prepaidcode").doc(ids).update({
          //       "status":"used"
          //  }).then((value) => print(" updated two"));



           

Get.snackbar("Success","Changed plan to Premium");
  
 
      // print("asas"+accountsList[0].accountB);
      // // getAccountData();
      // errorMsg = false;
      // update();
      }
      else{
        Get.snackbar("Account", "account balance should be greatar than zero");
      }
   
  // documents[0].status == "unused";

} else {  
     errorMsgTwo = true;
     update();
     //karo ki sochi jarai ho ya dykho n
  //not exists

}



      }




      //----------------------------------------------GetVirtualCard -------------------------------
     
     VirtualCard virtualCardss = VirtualCard();

   List virtualCardAcc = [];
   List virtualCardCvv = []; 
   List virtualCardStatus = [];
   Future<List<VirtualCard>?> getVirtualCard() async{

    QuerySnapshot  kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("virtualCard")
        .get();

      virtualCardAcc.clear();
      virtualCardCvv.clear();
      virtualCardStatus.clear();

   print(kilo.docs);
          //  virtualCardGet  = kilo.docs;

   
   kilo.docs.forEach((element) {
    // print(element.docs[0]["username"]) ;
    print(element["accountNumber"]) ;
    virtualCardAcc.add(element["accountNumber"]);
    virtualCardCvv.add(element["cvv"]);
    virtualCardStatus.add(element["freeze"]);
    
    

    // bala.add(element["balance"]);



      print(element);
print(element);

   });
  
  
   }
   

   // ---------------------------------freezeCArd------------------------------//
   List freezeUpdated = [];
   List <DocumentSnapshot> docu = [];
   String? freezeText = "Unfreezed";
   var freezeCheck;
  Future<List<VirtualCard>?>  FreezeCardUpdated() async{
      
     QuerySnapshot  kilo =    await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("virtualCard")
        .get();

    freezeUpdated.clear();
                   
   print(kilo.docs);
          //  virtualCardGet  = kilo.docs;
docu = kilo.docs;
   var ids = docu.first.id;
   kilo.docs.forEach((element) {

    freezeUpdated.add(element["cvv"]);

      print(element);
print(element);

   });
if(docu.first["freeze"] == false)
{
 freezeText = "Unfreezed";
 update();
   await FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection("virtualCard").doc(ids).update({
                "freeze":true
           }).then((value) => 
           
           freezeCheck  = true
          //  freezeText = "freeze"
           
           
           );
// freezeUpdated[0] = "true";
update();
Get.snackbar("Message Success", "UnFreezed");

}
else if(docu.first["freeze"] == true){

   freezeText = "Freezed";
 update();
   
   await FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection("virtualCard").doc(ids).update({
                "freeze":false
           }).then((value) => 
           
             freezeCheck  = false
                      
         
           
           );
update();
Get.snackbar("Message Success", "Freezed");

}
  }
}