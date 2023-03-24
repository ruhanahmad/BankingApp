import 'dart:convert';
import 'package:bnacash/Controller/transaction_controller.dart';
import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/models/graph.dart';
import 'package:bnacash/pages/Settings.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
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
import '../models/graphtry.dart';
import '../pages/hi.dart';
import '../pages/landing_page.dart';
import '../pages/login/find_friends.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:camera/camera.dart';

import 'dart:math';

import '../pages/Login/models/code_field.dart';
import '../pages/login/models/phone_field.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class UserController extends GetxController {
//-------------------------------graph

  List<ChartData> chartData = [];

  graphTry() async {
    chartData.clear();
    await getIDo();
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("notifications")
        .get();
        print(querySnapshot);
    final List<DocumentSnapshot> documentSnapshot = querySnapshot.docs;
    final List<Map<String, dynamic>> data =
        documentSnapshot.map((e) => e.data() as Map<String, dynamic>).toList();

    // print(chartData);

    for (var i = 0; i < data.length; i++) {
      chartData.add(ChartData(
          DateFormat('dd-MM-yyyy').format(data[i]['dateTime'].toDate()),
          double.parse(data[i]['balance'])));
    }
  }

//-----------------------------------------------get transaction by year------------------//

// Import the necessary packages
// import 'package:cloud_firestore/cloud_firestore.dart';
  DateTime selectedDateYear = DateTime.now();
  yearlyHanodi() async {
// // Get a reference to the Firestore collection containing transactions

// // Define the desired year
    int desiredYear = selectedDateYear.year;
    CollectionReference transactionsRefs = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("notifications");

// // Define the start and end timestamps for the desired year
    DateTime startDate = DateTime(desiredYear, 1, 1);
    DateTime endDate =
        DateTime(desiredYear + 1, 1, 1).subtract(Duration(days: 1));

// // Query the Firestore collection to get transactions for the desired year
    QuerySnapshot querySnapshot = await transactionsRefs
        .where('dateTime',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('dateTime', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
        .get();
    var pdfFile = await aikOr.saveQuerySnapshotToPdf(querySnapshot);
    print('PDF file saved at ${pdfFile.path}');

    pdftoOpen = pdfFile.path;
    update();

    final data = querySnapshot.docs.map((document) => document.data()).toList();
// print(data);

// Loop through the documents in the query result and extract the transaction data
    List<Transaction> transactions = [];
// querySnapshot.docs.forEach((doc) {

//   transactions.add(transaction);
// });

// Print the list of transactions for the desired year
    print('Transactions for $desiredYear:');
  }

  AikOr aikOr = Get.put(AikOr());

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
  User? userId;
  PhoneAuth phoneAuth = Get.put(PhoneAuth());
  bool? signUps;

//---------------------------Send mailss Sign up ---------------------------

  final emailTo = "ranaruhan123@gmail.com";
  final accessTokenss = "";

  Future<void> SendMailssSignUp() async {
    String username = 'admin@thetrueprofit.com';
    String password = 'z_-2v^h/#10J8';

    final smtpServer = SmtpServer(
      'thetrueprofit.com',
      port: 587,
      username: username,
      password: password,
      ignoreBadCertificate: true,
    );

    final message = Message()
      ..from = Address(username)
      ..recipients.add('bna.pfe@gmail.com')
      ..subject = 'Test Email for Plans'
      ..text = 'This is a test email sent from a Flutter app.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email sent: ${sendReport.toString()}');
      Get.snackbar("Email Sent", "SucessFully Email Sent");
    } catch (e) {
      print('Email not sent: ${e.toString()}');
      Get.snackbar("Email No Sent", "Email not send");
    }
  }
//------------------------------SendMailOkay---------------------------------//

// String? img64;
// Future? converting(){
// final bytes = io.File(files!.path).readAsBytesSync();

// img64 = base64Encode(bytes);
// }

  final emailu = "ranaruhan123@gmail.com";
  final accessToken = "";

  Future<void> SendMailss() async {
    String username = 'admin@thetrueprofit.com';
    String password = 'z_-2v^h/#10J8';
    // var _file = io.File(files!.path);
    var _filePassport = io.File(filesPassport!.path);

    final smtpServer = SmtpServer(
      'thetrueprofit.com',
      port: 587,
      username: username,
      password: password,
      ignoreBadCertificate: true,
    );

    final message = Message()
      ..from = Address(username)
      ..recipients.add('bna.pfe@gmail.com')
      ..subject = 'Test Email from Flutter App'
      ..text =
          'Hi kindly check the user id ${userId!.uid} for verification of passport and photos'
      ..attachments.add(FileAttachment(_filePassport));
    //// you want passport to be uploaded only ? i want the identity card
    /// i dont know which one is the second one i guess its passport
    try {
      final sendReport = await send(message, smtpServer);
      print('Email sent: ${sendReport.toString()}');
      Get.snackbar("Email Sent", "SucessFully Email Sent");
    } catch (e) {
      print('Email not sent: ${e.toString()}');
      Get.snackbar("Email No Sent", "Email not send");
    }
  }
/* this is ur old fnction
  Future SendMailss() async {
    var _file = io.File(files!.path); //
    var _filePassport = io.File(filesPassport!.path);

    final emauser = await GoogleAuthApi.signIn();
    if (emauser == null) return;
    final emailu = emauser.email;
    final auth = await emauser.authentication;
    final accessToken = auth.accessToken;
    final smptServer = gmailSaslXoauth2(emailu, accessToken!);
    var attachment;
    final message = await Message()
      ..from = Address(emailu, "Admin")
      ..recipients = ["ranaruhan123@gmail.com"]
      ..subject = "This email is for verification"
      ..attachments = [FileAttachment(_file), FileAttachment(_filePassport)]
      ..text =
          "Hi kindly check the user id ${userId!.uid} for verification of passport and photos";

    try {
      await send(message, smptServer);
      Get.snackbar("Email Sent", "SucessFully Email Sent");
    } on MailerException catch (erorr) {
      Get.snackbar("Email No Sent", "Email not send");
      print(erorr);
    }
  }
*/

//--------------------------------------------Detail Get For------------------------//
  String? nameFor;
  String? emailFor;
  String? lastNameFor;
  String? phoneFor;
  Future getDataForProfile() async {
    await getIDo();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
      valuess = value.data();
      //  print(valuess);
      nameFor = valuess['name'];
      lastNameFor = valuess["lastName"];
      emailFor = valuess["email"];
      phoneFor = valuess["phone"];

      update();

      print(valuess);
      //  update();
    });
    await getDataForProfileAccount();
  }

  //-----------------------------for account -------------------------------//

  String? bicFor;
  String? IbanFor;
  String? limitFor;
  String? usernameFor;
  Future getDataForProfileAccount() async {
    await getIDo();

    await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
      valuess = value.data();
      //  print(valuess);
      bicFor = valuess['BIC'];
      IbanFor = valuess["IBAN"];
      limitFor = valuess["limit"];
      usernameFor = valuess["username"];

      update();
      //  Get.to(Settingss());
      // Nav.toScreen(context, Settingss());

      print(valuess);
      //  update();
    });
  }

//--------------------------------------------verificationCheck-------------------------//

  List<DocumentSnapshot> verificationss = [];
  bool? checkssss;
  Future verificationChec() async {
    await getIDo();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
      valuess = value.data();
      //  print(valuess);
      checkssss = valuess['verified'];
      update();
      if (checkssss == true) {
        return true;
      } else {
        return false;
      }

      print(valuess);
      //  update();
    });
  }

//---------------------------------------------checksif for signup------------------------//

  List<DocumentSnapshot> checksIFSign = [];

  Future checksIFSignUp() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where('phone', isEqualTo: phoneAuth.phoneNumbers.toString())
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        Get.snackbar(
            "User Already Signed up", "Moving to login page and Try loggin in",
            duration: Duration(seconds: 5));
        Get.to(loginFeild());
      } else {
        phoneAuth.verifyPhone();
        // Data does not exist
      }
    });
  }
  // if (FirebaseAuth.instance.currentUser != null) {
  //   print("user sugned up");
  // Get.to( loginFeild());
  //                     var kilo =    await FirebaseFirestore.instance
  //     .collection("account").doc(userId!.uid).get().then((DocumentSnapshot value) {
  //  var checksIFSign  = value.data();
  //  var id = whistle.first.id;
  // if(checksIFSign == null) {
  //  phoneAuth.verifyPhone();
  //         // Get.to(CodeField());

  // }

  // else{
  //   Get.snackbar("User Already Signed up", "Moving to login page and Try loggin in",duration: Duration(seconds: 5));
  //    Get.to( loginFeild());
  // }

  // });
  // }

// else{
// phoneAuth.verifyPhone();
// }

  // else {
  //     phoneAuth.verifyPhone();
  // }

//----------------------------Logout-----------------------//

  logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.to(PhoneField());
  }

//-----------------------------------------checks if logIn-----------------//

  List<DocumentSnapshot> checksIFLogins = [];

  Future checksIFLogin() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where('phone', isEqualTo: "+" + phoneAuth.phoneNumbers.toString())
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        phoneAuth.verifyPhone();
      } else {
        Get.snackbar("User Bot Signed Up Yet", "Moving to Sign Up Page ",
            duration: Duration(seconds: 5));
        Get.to(PhoneField());
      }
    });

    //           if(userId != null){
    //                     var kilo =    await FirebaseFirestore.instance
    //     .collection("account").doc(userId!.uid).get().then((DocumentSnapshot value) {
    //  var checksIFSign  = value.data();
    //   //  var id = whistle.first.id;
    //     if(checksIFLogins != null) {
    //      phoneAuth.verifyPhone();
    //             // Get.to(CodeField());
    //     }
    //     else{
    //       Get.snackbar("User need to sign up", "Moving to Sign up and Try loggin in",duration: Duration(seconds: 5));
    //        Get.to( PhoneField());
    //     }

    //     });
    //           }

    //           else {
    //               phoneAuth.verifyPhone();
    //           }
  }

  //----------------------------------------------checks if --------------------------------//

  List<DocumentSnapshot> whistle = [];

  Future checksIF() async {
    var kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
      var whistle = value.data();
      //  var id = whistle.first.id;
      if (whistle == null) {
        Get.to(CountryField());
      } else {
        Get.to(HomePage());
      }
    });
  }

//--------------------------------------------Terminate CArd ----------------------//

  List<DocumentSnapshot> vis = [];

  Future terminatedCard() async {
    var kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("virtualCard")
        .get()
        .then((QuerySnapshot value) {
      vis = value.docs;
      var id = vis.first.id;
      if (vis.length > 0) {
        var jjson = FirebaseFirestore.instance
            .collection("account")
            .doc(userId!.uid)
            .collection("virtualCard")
            .doc(id)
            .delete();
        jjson.then((value) async {
          Get.snackbar("Deleted Successfully", "Message Deleted");
        });
      } else {
        Get.snackbar("Not Found", "Deleted Record not Found");
      }
    });
  }

//----------------------------------Terminate physical Card --

  List<DocumentSnapshot> terminate = [];

  Future terminatedCardPhysical() async {
    var kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("physicalCard")
        .get()
        .then((QuerySnapshot value) {
      terminate = value.docs;
      var id = terminate.first.id;
      if (terminate.length > 0) {
        var jjson = FirebaseFirestore.instance
            .collection("account")
            .doc(userId!.uid)
            .collection("physicalCard")
            .doc(id)
            .delete();
        jjson.then((value) async {
          Get.snackbar("Deleted Successfully", "Message Deleted");
        });
      } else {
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
  String dropDownValue = 'Standard';
  String? beneIban = "";
  String? beneBalance;
  String? beneEmail = "";
  String? beneName = "";
  String? sendMoneyContact = "";
  ExCard exCard = ExCard();
  String? codeEntered = "";
  String? prepaidBalance = "";

  String? creditCardBalance = "";
  String? creditCard = "";
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

  String jnab() {
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 22; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    print(rndnumber);
    return rndnumber;
  }

  String tenNumberGenerated() {
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 10; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    print(rndnumber);
    return rndnumber;
  }

  String fourNumberGenerated() {
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 4; i++) {
      rndnumber = rndnumber + rnd.nextInt(3).toString();
    }
    print(rndnumber);
    return rndnumber;
  }

  String CVVGenerated() {
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 3; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    // print(rndnumber);
    return rndnumber;
  }

  FirebaseFirestore firebaseRef = FirebaseFirestore.instance;

  String? country = "Tunisia";
  String? address = "";
  String? fullName;
  String? occupation = "";
  String? dob = "";
  String? email = "";

  String? accountBalance = "";
  String? lastNamess = "";

// final User user = auth.currentUser;
// final uid = user.uid;

  Welcome welcome = Welcome();
  Account accountss = Account();
//---------------------------------upload passport----------------------------------//

  Future<UploadTask?> uploadFilesPassport(XFile? files, context) async {
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

      await uploadTask.whenComplete(() async {
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
        FirebaseFirestore.instance
            .collection("users")
            .doc(userId!.uid)
            .update({" passport": uploadpaths});
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

  Future<UploadTask?> uploadFiless(XFile? files, context) async {
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

      await uploadTask.whenComplete(() async {
        await getIDo();
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
        FirebaseFirestore.instance
            .collection("users")
            .doc(userId!.uid)
            .update({" idCard": uploadpaths});

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

  Future<UploadTask?> uploadPassport(XFile? files, context) async {
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

      await uploadTask.whenComplete(() async {
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
        FirebaseFirestore.instance
            .collection("users")
            .doc(userId!.uid)
            .update({"Passport": uploadpaths});
      });
    }

    // await ref.getDownloadURL().then((value) => updataIdCard(value));

    return Future.value(uploadTask);
  }

  String acc() {
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 13; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    print(rndnumber);
    return rndnumber;
  }

  getIDo() async {
    userId = await FirebaseAuth.instance.currentUser;
    update();
    print(userId);
  }

//------------------------------------saveEditedForm------------------------//
  TextEditingController textEditingForChange = TextEditingController();
  TextEditingController textEditingForChangeTwo = TextEditingController();

  saveEditedThing() async {
    await getIDo();
    await FirebaseFirestore.instance
        .collection('account')
        .doc(userId!.uid)
        .update({
      'username': textEditingForChange.text,
    });
  }

  saveEditedThingEmail() async {
    await getIDo();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId!.uid)
        .update({
      'email': textEditingForChangeTwo.text,
    });
  }

//------------------------------------------uploadData----------------------//

  Future uploadData() async {
    await getIDo();
    //  print(userId!.uid);
    try {
      welcome.firebaseId = userId!.uid.toString();
      //  userId!.uid == null ? "null":

      //  userId!.uid.toString();
      // welcome.AccountDetail
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
      welcome.passcode = "";
      welcome.verified = false;
      welcome.phone = phoneAuth.phoneNumbers;
      try {
        var jjson = FirebaseFirestore.instance
            .collection("users")
            .doc(userId!.uid)
            .set(welcome.toJson());
        jjson.then((value) async {
          String rand = await jnab();
          String accountN = await acc();
          await accountAdd(rand, fullName, accountN);
          //  Get.to(ReasonForUse());
        });
      } catch (e) {
        Get.snackbar("Error", "Error encolopedia");
      }
    } catch (e) {
      Get.snackbar("Error", " Get Snack Barmessage");
    }
  }

  String? accB = "";

  Future accountAdd(String rand, fullName, String accountN) async {
    welcome.firebaseId = userId!.uid.toString();
    accountss.BIC = "BNACASH22";
    accountss.accountB = "0";
    accountss.accountNumber = accountN;
    accountss.username = fullName;
    accountss.status = true;
    accountss.IBAN = "TN" + rand;
    accountss.limit = "500";
    accountss.plan = "Standard";
    //  accountss.dateTime = DateTime.now();

    var jjson = FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .set(accountss.toJson());
    jjson.then((value) async {
      accB = accountss.accountB;
      update();
      //  Get.to(ReasonForUse());
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("LoginInfo", true);

    try {
      await FirebaseFirestore.instance
          .collection("account")
          .doc(userId!.uid)
          .collection("notifications")
          .add({
        "dateTime": DateTime.now(),
        "balance": 0.toString(),
        "username": fullName,
        "type": "New Account Created",
        "read": false
      }
              //   {
              //   "username":username,
              //   "balance":beneBalance,
              //   "DateTime":DateTime.now(),

              // }
              ).then((value) async {
        Get.snackbar("title", "Value added successfully");

        update();
        //  Get.to(ReasonForUse());
      });
    } catch (e) {
      Get.snackbar("Prepaid", "${e.toString()}");
    }
  }

  List<DocumentSnapshot> documents = [];
  List news = [];
  String balance = "";
  bool? errorMsg = false;
  bool? errorMsgTwo = false;
  String? finalB;

  Future<dynamic> prepaid() async {
    balance = "";
    documents.clear();
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('prepaidcode')
        .where('code', isEqualTo: codeEntered)
        .get();
    documents = result.docs;
    update();
    print(documents.length);
    if (documents.length > 0) {
      news.add(result.docs);
      print(news);
      print(documents.first["status"]);

      if (documents.first["status"] == "unused") {
        // accountsList[0].accountB = "";
        var ids = documents.first.id;
        balance = documents.first["balance"];
        await getAccountData();
        var newValeTwo;
        if (int.parse(balance) > 0) {
          newValeTwo =
              await subTwoStringsAsInt(first: balance, second: balance);
          // }
//         else{
//  Get.snackbar("Error", "Value must b greater than in account");
//         }
          var newVale =
              await addTwoStringsAsInt(first: balances, second: balance);
          print(newVale);

          await FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .update({"accountB": newVale.toString()}).then(
                  (value) => print(" updated"));

          await FirebaseFirestore.instance
              .collection("prepaidcode")
              .doc(ids)
              .update({"balance": newValeTwo.toString()}).then(
                  (value) => print(" updated two"));

          await FirebaseFirestore.instance
              .collection("prepaidcode")
              .doc(ids)
              .update({"status": "used"}).then(
                  (value) => print(" updated two"));

          Get.snackbar("Success", "Money added");
          try {
            await FirebaseFirestore.instance
                .collection("account")
                .doc(userId!.uid)
                .collection("notifications")
                .add({
              "dateTime": DateTime.now(),
              "balance": balance,
              "username": "prepaidCode",
              "type": "prepaidCode",
              "read": false
            }
                    //   {
                    //   "username":username,
                    //   "balance":beneBalance,
                    //   "DateTime":DateTime.now(),

                    // }
                    ).then((value) async {
              Get.snackbar("title", "Value added successfully");

              update();
              Get.to(HomePage());
            });
          } catch (e) {
            Get.snackbar("Prepaid", "${e.toString()}");
          }

          print("asas" + accountsList[0].accountB);
          // getAccountData();
          errorMsg = false;
          update();
        } else {
          Get.snackbar("title", "Number must be greater");
        }
      } else if (documents.first["status"] == "used") {
        errorMsg = true;
        Get.snackbar(
          "Zero Balanace",
          "Card already used and have zero balance",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
        update();
      }
      // documents[0].status == "unused";
    } else {
      Get.snackbar(
        "Wrong Input",
        "Code is wrong",
      );
      update();
      //karo ki sochi jarai ho ya dykho n
      //not exists
    }
  }

  List accountsList = [];

  dynamic valuess;
  String? accBalance = "";
  int addTwoStringsAsInt({required var first, required var second}) {
    try {
      return (int.parse(first) + int.parse(second));
    } catch (e) {
      print(e);
      return 0;
    }
  }

  int subTwoStringsAsInt({required var first, required var second}) {
    try {
      return (int.parse(first) - int.parse(second));
    } catch (e) {
      print(e);
      return 0;
    }
  }

//--------------------------------------------------

  updateNotify(var unreadCount) async {
    if (unreadCount > 0) {
      try {
        await getIDo();

        QuerySnapshot<Map<String, dynamic>> snapshots = await FirebaseFirestore
            .instance
            .collection('account')
            .doc(userId!.uid)
            .collection("notifications")
            .where('read', isEqualTo: false)
            .get();
        WriteBatch batch = await FirebaseFirestore.instance.batch();

        snapshots.docs.forEach((doc) async {
          DocumentReference ref = await FirebaseFirestore.instance
              .collection('account')
              .doc(userId!.uid)
              .collection("notifications")
              .doc(doc.id);
          print(ref);

          batch.update(await ref, {'read': true});
          try {
            batch.commit().then((value) {
              print('Batch update successful');
            }).catchError((error) {
              print('Error updating batch: $error');
            });
          } catch (e) {
            // Get.snackbar("","${e.toString()}");
            print("Notifications are true");
          }
        });
      } catch (e) {
        // Get.snackbar("","${e.toString()}");
        print("Notifications are true");
      }
    } else {
      print("haha");
    }

    // print(snapshots);
//  await
//      FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection("notifications").doc(unreadCounts).update({
//                 "read":true
//            }).then((value) => print(" updated"));
  }

//------------------------------------

  var balances;
  Future getAccountData() async {
    await getIDo();
    EasyLoading.show();
    // welcome = Welcome();
    // accountss  = Account();
    await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
      valuess = value.data();
      print(valuess);
      balances = valuess['accountB'];
      accountsList.add(Account.fromJson(value));
      print(valuess);
      update();
    });
    EasyLoading.dismiss();
  }

  //============================================================================//
//======================================================Currency Changer------------------//
  final _apiKey = "4036185fd69443228f0d20a667884d1f";
  var base;
  var amountss;
  var convert;
  Future<dynamic> convertCurrencies({
    required baseCurrency,
    required toCurrency,
    required double amount,
  }) async {
    try {
      final Uri url = Uri.parse(
          'https://exchange-rates.abstractapi.com/v1/convert?api_key=$_apiKey&base=${toCurrency}&target=${baseCurrency}&base_amount=$amount');
      final response = await http.Client().get(url);
      // return CurrencyPair.fromJson(jsonDecode(response.body));
      // print(response);
      var result = jsonDecode(response.body);
      base = result["base"];
      amountss = amount * result["converted_amount"];
      convert = result["converted_amount"];

      print(amountss);
      print(convert);
      update();

      // print(amountss);
    } catch (e) {
      rethrow;
    }
  }

//============================================================================External Card=========================//

  String? cardsNum;
  String? Cvv;
  String? Date;
  String? exB;

  Future addCardExternal() async {
    welcome.firebaseId = userId!.uid.toString();

    //  exCard = ExCard
    //  accountss.BIC = "BNACASH22";
    //  accountss.accountB = "0";
    //  accountss.accountNumber = accountN;
    //  accountss.username = fullName;
    //  accountss.status = true;
    //  accountss.IBAN = "TN"+rand;
    //  accountss.dateTime = DateTime.now();

    var jjson = FirebaseFirestore.instance.collection("exCard").add({
      "balance": exB,
      "firebaseId": userId!.uid,
      "CardNum": cardsNum,
      "CVV": Cvv,
      "Date": Date
    });
    jjson.then((value) async {
      if (value != null) {
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

//-------------------------------------update Pincode physical-----
  String? newPinCode;
  Future changePinCodePhysical() async {
    await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("physicalCard")
        .doc(physicalId)
        .update({"pinCode": newPinCode}).then(
            (value) => Get.snackbar("Changed", "PinCode Changed Successfully"));
  }

  //-------------------------------Order physical Card ----------------------------------------------//
  String? zipcodePhysicalCard;
  String? cityPhysicalCard;
  String? addressPhysicalCard;
  Future orderPhysicalCard() async {
    await getIDo();

    var accNo = await "abc123" + tenNumberGenerated();
    var pinNo = await fourNumberGenerated();
    var cvv = await CVVGenerated();
    // welcome = Welcome();
    // accountss  = Account();
    await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("physicalCard")
        .get()
        .then((QuerySnapshot value) async {
      if (value.docs.length > 0) {
        Get.snackbar("Already ordered", "Card Already ordered");
      } else {
        Get.snackbar("Creating a Card", "No order for physical card before");

        var _selectedDate = DateTime.now();
        _selectedDate = DateTime(_selectedDate.year + 5, _selectedDate.month);
        var jjson = await FirebaseFirestore.instance
            .collection("account")
            .doc(userId!.uid)
            .collection("physicalCard")
            .add({
          "address": addressPhysicalCard,
          "city": cityPhysicalCard,
          "zipCode": zipcodePhysicalCard,
          "firebaseId": userId!.uid,
          "CardNum": accNo,
          "CVV": cvv,
          "pinCode": pinNo,
          "Date": _selectedDate,
          "freeze": false,
        });

        Get.snackbar(
          "Card Added",
          "Successfully",
          //  icon: Icon(Icons.person, color: Colors.white),
          //  snackPosition: SnackPosition.BOTTOM,
          //  backgroundColor: Colors.blue,
        );
      }
    });
  }

  List<DocumentSnapshot> documentsEx = [];
  List cardEx = [];
  String balanceEx = "";
  bool? errorMsgEx = false;
  bool? errorMsgTwoEx = false;
  String? finalBEx;
  String? exCardB;

  Future<dynamic> getExCard() async {
    balance = "";
    documents.clear();
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('exCard')
        .where('CardNum', isEqualTo: cardsNum)
        .where('CVV', isEqualTo: Cvv)
        .where('Date', isEqualTo: Date)
        .get();
    documents = result.docs;
    update();
    print(documents.length);
    if (documents.length > 0) {
      cardEx.add(result.docs);
      print(news);
      // print(documents.first["status"]);
      // if(documents.first["status"] == "unused"){

      exCardB = documents.first["balance"];
      var id = documents.first.id;
      await getAccountData();
      var newValeTwo;
      if (int.parse(exCardB.toString()) >
          int.parse(prepaidBalance.toString())) {
        var newValeTwo =
            await subTwoStringsAsInt(first: exCardB, second: prepaidBalance);

        //  else{
        //   Get.snackbar("Error", "Must be less value than in account");
        //  }
        var newVale =
            await addTwoStringsAsInt(first: balances, second: prepaidBalance);
        print(newVale);

        await FirebaseFirestore.instance
            .collection("account")
            .doc(userId!.uid)
            .update({"accountB": newVale.toString()}).then(
                (value) => print(" updated"));

        await FirebaseFirestore.instance
            .collection("exCard")
            .doc(id)
            .update({"balance": newValeTwo.toString()}).then(
                (value) => print(" updated two"));
        Get.snackbar(
          "Success",
          "Money Added Successfully ${prepaidBalance}",
        );
        try {
          await FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .collection("notifications")
              .add({
            "dateTime": DateTime.now(),
            "balance": prepaidBalance,
            "username": cardsNum,
            "type": "CreditCard",
            "read": false
          }
                  //   {
                  //   "username":username,
                  //   "balance":beneBalance,
                  //   "DateTime":DateTime.now(),
                  // }
                  ).then((value) async {
            Get.snackbar("Success", "Notification added");
            Get.to(HomePage());

            update();
            //  Get.to(ReasonForUse());
          });
        } catch (e) {
          Get.snackbar("Prepaid", "${e.toString()}");
        }
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
      } else {
        Get.snackbar("Number must be Greater than zero", "message");
      }
      // }
      // else if(documents.first["status"] == "used"){
      //   errorMsgEx = true;
      //   Get.snackbar("title","CArd is already in used");
      //   update();
      // }
      // documents[0].status == "unused";
    } else {
      Get.snackbar("Information Missing Or invalid",
          "Please write correct information ");
      //  errorMsgTwoEx = true;
      update();
      //not exists
    }
  }

//------------------------------------------------CheckPassCode------------------------------------------->
  var passs;
  bool? checked;
  Future checkPass(String passcode) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
      valuess = value.data();
      print(valuess);
      passs = valuess[' passcode'];
      update();
      if (passs == passcode) {
        checked = true;
        update();
      } else {
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

  Future<dynamic> accSendMoneyCheck(String iban) async {
    var bal = "";
    var username = "";
    balance = "";
    documents.clear();
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('account')
        .where('IBAN', isEqualTo: iban)
        .get();
    documents = result.docs;
    update();
    print(documents.length);
    print(userId!.uid);
    if (documents.length > 0) {
      var ids = documents.first.id;
      var balanc = documents.first["accountB"];
      // await  getAccountData();
      await FirebaseFirestore.instance
          .collection("account")
          .doc(userId!.uid)
          .get()
          .then((DocumentSnapshot value) {
        valuess = value.data();
        print(valuess);
        bal = valuess['accountB'];
        //actual amount sending acount
        username = valuess["username"];
        //  accountsList.add(Account.fromJson(value));

        update();
        //      print(valuess);
        //  update();
      });
      if (int.parse(bal.toString()) > int.parse(beneBalance.toString())) {
        var newValeTwo =
            await subTwoStringsAsInt(first: bal, second: beneBalance);

        await FirebaseFirestore.instance
            .collection("account")
            .doc(userId!.uid)
            .update({"accountB": newValeTwo.toString()}).then(
                (value) => print(" updated"));

        var newVale = await addTwoStringsAsInt(
            first: balanc, second: beneBalance.toString());

        print(newVale);

        await FirebaseFirestore.instance
            .collection("account")
            .doc(ids)
            .update({"accountB": newVale.toString()}).then(
                (value) => print(" updated"));

        Get.snackbar("Success", "Money added Successfully");
        Get.to(HomePage());
        try {
          await FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .collection("notifications")
              .add({
            "dateTime": DateTime.now(),
            "balance": balanc,
            "username": sendMoneyContactName,
            "type": "sending",
            "read": false,
          }

                  //   {
                  //   "username":username,
                  //   "balance":beneBalance,
                  //   "DateTime":DateTime.now(),
                  // }
                  ).then((value) async {
            Get.snackbar("title", "Value added successfully");

            update();
            //  Get.to(ReasonForUse());
          });
        } catch (e) {
          Get.snackbar("Prepaid", "${e.toString()}");
        }

        Get.to(WhomToPay());

        notifications.dateTime = DateTime.now();
        notifications.balance = beneBalance;
        notifications.username = username;
        notifications.type = "receiving";
        notifications.read = false;

        update();

        var jjson = FirebaseFirestore.instance
            .collection("account")
            .doc(ids)
            .collection("notifications")
            .add(notifications.toJson()
                //   {
                //   "username":username,
                //   "balance":beneBalance,
                //   "DateTime":DateTime.now(),

                // }
                )
            .then((value) async {
          Get.snackbar("title", "Value added successfully");

          update();
          //  Get.to(ReasonForUse());
        });
        //  jjson.then(( value)async {
        //           Get.snackbar("title","Value added successfully");

        //        update()  ;
        // //  Get.to(ReasonForUse());
        //  });
      } else {
        Get.snackbar("Error", "Balance must be greater");
      }

      var firebaseId = userId!.uid.toString();
    } else {
      Get.snackbar("Error", "no document found");
    }
  }

//-------------------------------
  Future<dynamic> ibans(BuildContext context) async {
    //   var bal ="";
    // balance = "";
    // documents.clear();
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('account')
        .where('IBAN', isEqualTo: beneIban)
        .get();
    documents = result.docs;
    update();
    print(documents.length);
    print(userId!.uid);
    if (documents.length > 0) {
      Nav.toScreen(
          context,
          ExampleHomePage(
            iban: "iban",
            check: true,
          ));
    } else {
      Get.snackbar("Error", "Iban not matched");
    }
  }
//-------------------------

  var contactFetch;

//asd//
  List<DocumentSnapshot> contactsGet = [];

  Future<dynamic> accIbanCheck() async {
    var bal = "";
    balance = "";
    documents.clear();
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('account')
        .where('IBAN', isEqualTo: beneIban)
        .get();
    documents = result.docs;
    update();
    print(documents.length);
    print(userId!.uid);
    if (documents.length > 0) {
      var ids = documents.first.id;
      var balanc = documents.first["accountB"];
      // await  getAccountData();
      await FirebaseFirestore.instance
          .collection("account")
          .doc(userId!.uid)
          .get()
          .then((DocumentSnapshot value) {
        valuess = value.data();
        print(valuess);
        bal = valuess['accountB'];
        //  accountsList.add(Account.fromJson(value));

        update();
        //      print(valuess);

        //  update();
      });
      if (int.parse(bal.toString()) > int.parse(sendMoneyBalance.toString())) {
        var newValeTwo =
            await subTwoStringsAsInt(first: bal, second: sendMoneyBalance);
        //  await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
        //       "accountB":newValeTwo.toString()
        //  })
        //  .then((value) => print(" updated"));
        await FirebaseFirestore.instance
            .collection("account")
            .doc(userId!.uid)
            .update({"accountB": newValeTwo.toString()}).then(
                (value) => print(" updated"));

        var newVale =
            await addTwoStringsAsInt(first: balanc, second: sendMoneyBalance);
        print(newVale);

        await FirebaseFirestore.instance
            .collection("account")
            .doc(ids)
            .update({"accountB": newVale.toString()}).then(
                (value) => print(" updated"));
        try {
          await FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .collection("notifications")
              .add({
            "dateTime": DateTime.now(),
            "balance": sendMoneyBalance,
            "username": beneName,
            "type": "sending",
            "read": false,
          }

                  //   {
                  //   "username":username,
                  //   "balance":beneBalance,
                  //   "DateTime":DateTime.now(),

                  // }
                  ).then((value) async {
            Get.snackbar("Successfull", "Money added successfully");
            //  Get.back();
            //  Get.back();
            Get.to(HomePage());

            update();
            //  Get.to(ReasonForUse());
          });
        } catch (e) {
          Get.snackbar("Prepaid", "${e.toString()}");
        }

//mio//
        try {
//   final QuerySnapshot result =
//     await FirebaseFirestore.instance.collection('account').where('IBAN', isEqualTo:
//     iban).get();
//  documents = result.docs;
//  update();
// print(documents.length);
// print(userId!.uid);
          await FirebaseFirestore.instance
              .collection("account")
              .doc(ids)
              .collection("notifications")
              .add({
            "dateTime": DateTime.now(),
            "balance": sendMoneyBalance,
            "username": beneName,
            "type": "receiving",
            "read": false
          }

                  //   {
                  //   "username":username,
                  //   "balance":beneBalance,
                  //   "DateTime":DateTime.now(),

                  // }
                  ).then((value) async {
            Get.snackbar("Notification Added", "Value added successfully");

            update();

            //  Get.to(ReasonForUse()); send money again
          });
        } catch (e) {
          Get.snackbar("Prepaid", "${e.toString()}");
        }
      } else {
        Get.snackbar("Error", "Value must be greater");
      }
      var firebaseId = userId!.uid.toString();

      contacts.email = beneEmail;
      contacts.iban = beneIban;
      contacts.id = firebaseId;
      contacts.name = beneName;
      //  update();
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection("account")
            .doc(userId!.uid)
            .collection("contacts")
            .get();

        if (snapshot.size == 0) {
          Get.snackbar("Contacts ", "contacts not exsist ! Adding new one");
          var jjson = FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .collection("contacts")
              .add(contacts.toJson());
          jjson.then((value) async {
            print("complted");
            //  Get.to(ReasonForUse());
            Get.snackbar("Contact", "Contact added successfully");
          });
        } else {
          await FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .collection("contacts")
              .where("iban", isEqualTo: beneIban)
              .get()
              .then((value) {
            if (value.size == 1) {
              Get.snackbar("Contacts already", "contacts already in list");
            } else {
              var jjson = FirebaseFirestore.instance
                  .collection("account")
                  .doc(userId!.uid)
                  .collection("contacts")
                  .add(contacts.toJson());
              jjson.then((value) async {
                print("complted");
                //  Get.to(ReasonForUse());
                Get.snackbar("Contact", "Contact added successfully");
              });
            }
            contactFetch = contactsGet.first['accountB'];
            //  accountsList.add(Account.fromJson(value));
            print(contactsGet);
            update();
          });
        }

        //       await  FirebaseFirestore.instance
        //     .collection("account").doc(userId!.uid).collection("contacts").where("iban",isEqualTo:beneIban)
        //     .get().then((value) {
        //          if(value == false){
        //                     Get.snackbar("Contacts already", "contacts already in list");
        //              }
        //             else{
        //                  var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection(
        //   "contacts"
        //   ).add(
        // contacts.toJson()
        // );
        //  jjson.then(( value)async {
        //       print("complted");
        // //  Get.to(ReasonForUse());
        // Get.snackbar("Contact", "Contact added successfully");
        //  });
        //              }
        //               contactFetch  =  contactsGet.first['accountB'];
        //             //  accountsList.add(Account.fromJson(value));
        //              print(contactsGet);
        //          update();
        //     });

        // -----------------------------------------------------------------------------------------//

        //       .then((QuerySnapshot value) {
        //                contactsGet = value.docs;

        //                print(valuess);
        //                if(value == false){
        //                       Get.snackbar("Contacts alreat", "contacts already in list");
        //                }
        //                else{
        //                    var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).collection(
        //   "contacts"
        //  ).add(
        //   contacts.toJson()
        //   );
        //    jjson.then(( value)async {
        //         print("complted");
        //   //  Get.to(ReasonForUse());
        //   Get.snackbar("title", "Completed yes it is");
        //    });
        //                }
        //                 contactFetch  =  contactsGet.first['accountB'];
        //               //  accountsList.add(Account.fromJson(value));
        //                print(contactsGet);
        //            update();
        //       });
      } catch (e) {
        // Get.snackbar("error", "${e}");
        print("Errorr");
      }
    } else {
      Get.snackbar("Error", "Iban not matchaed");
    }
  }

  getContacts() async {
    var jjson = FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("contacts")
        .get();
    jjson.then((value) async {
      print(value);
      //  Get.to(ReasonForUse());
      // Get.snackbar("title", "Completed yes it is");
    });
  }

  List<DocumentSnapshot>? contactListThings = [];

  VirtualCard virtualCard = VirtualCard();
  Future contactListed() async {
    // welcome = Welcome();
    // accountss  = Account();
    var kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("contacts")
        .get()
        .then((QuerySnapshot value) {
      contactListThings = value.docs;

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

  List<DocumentSnapshot>? checkVirtual = [];
  Future checkVirtualCard() async {
    // welcome = Welcome();
    // accountss  = Account();
    var kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("virtualCard")
        .get()
        .then((QuerySnapshot value) {
      checkVirtual = value.docs;
    });
    if (checkVirtual!.length > 3) {
      Get.snackbar("Already Exsist",
          "Card  limit Exsist / Order for Virtual card already done/ Limit is only 3");
    } else {
      await orderVirtualCard();
    }
  }

  List<DocumentSnapshot>? doublecheckVirtual = [];
  bool? isChecked;
  Future doublecheckVirtualCard() async {
    // welcome = Welcome();
    // accountss  = Account();
    var kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("virtualCard")
        .get()
        .then((QuerySnapshot value) {
      doublecheckVirtual = value.docs;
      print(doublecheckVirtual!.length);
    });
    if (checkVirtual!.length > 0) {
      isChecked = true;
      update();
      print("true");
      return true;
    } else {
      isChecked = false;
      update();
      print("false");
      return false;
    }
  }

  Future orderVirtualCard() async {
    var _selectedDate = DateTime.now();
    _selectedDate = DateTime(_selectedDate.year + 5, _selectedDate.month);
    var tenNumber = "abc123" + await tenNumberGenerated();
    virtualCard.accountNumber = tenNumber;
    virtualCard.cvv = await CVVGenerated();
    virtualCard.color = "red";
    virtualCard.freeze = false;
    virtualCard.expiryDate = _selectedDate;

    var jjson = FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("virtualCard")
        .add(virtualCard.toJson());
    jjson.then((value) async {
      print("complted");
      //  Get.to(ReasonForUse());
      Get.snackbar("Card Added", "Your card added succesfully");
    });
  }

//-----------------------------------------------transactions-------------------------------//

  DateTime selectedDate = DateTime.now();

  var pdftoOpen;

// Import the necessary packages
  Future hanodi() async {
    int? millis;
    int? yearts;
    DateTime? dates;
    int? monthts;

    int month = selectedDate.month;
    int yeari = selectedDate.year;
    CollectionReference transactionsRef = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("notifications");

// Define the desired month and year
    int desiredMonth = month;
    int desiredYear = yeari;

// Define the start and end timestamps for the desired month and year
    DateTime startDate = DateTime(desiredYear, desiredMonth, 1);
    DateTime endDate =
        DateTime(desiredYear, desiredMonth + 1, 1).subtract(Duration(days: 1));

// Query the Firestore collection to get transactions for the desired month and year
    QuerySnapshot querySnapshot = await transactionsRef
        .where('dateTime',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('dateTime', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
        .get();

    querySnapshot.docs.map((document) {
      millis = document["dateTime "].toDate().millisecondsSinceEpoch;
      dates = DateTime.fromMillisecondsSinceEpoch(millis!);
      yearts = date!.year;
      monthts = date!.month;
    }
// document.data()).toList()
        );
// print(data);

//  Map<String,dynamic>? jhj;
//    //querysnapshot to pdf
//    print(querySnapshot);
// for (final document in querySnapshot.docs) {
//   print(document.data());
//   jhj = document.data() as Map<String,dynamic>;
//   update();

// }
    print("---------------------------------------------------------");

// print( jhj!);

    var pdfFile = await aikOr.saveQuerySnapshotToPdf(querySnapshot);
    print('PDF file saved at ${pdfFile.path}');

    pdftoOpen = pdfFile.path;
    update();
    // Create a PDF document

// Loop through the documents in the query result and extract the transaction data
    List transactions = [];
    querySnapshot.docs.forEach((doc) {
      print(doc["balance"]);
      // Transaction transaction = Transaction.fromFirestore(doc);
      transactions.add(doc["balance"]);
      // transactions.add(transaction);
    });

// Print the list of transactions for the desired month and year
// print('Transactions for $desiredMonth/$desiredYear:');
// transactions.forEach((transaction) {
//   print('Amount: ${transaction.amount}, Category: ${transaction.category}');
// });
  }

// Get a reference to the Firestore collection containing transactions

//----------------------------------------------//

  List prepaidCode = [];

  Future prepaidCodes() async {
    await getIDo();
    QuerySnapshot kilo =
        await FirebaseFirestore.instance.collection("prepaidcode").get();
    notificationList.clear();
    bala.clear();
    kilo.docs.forEach((element) {
      // print(element.docs[0]["username"]) ;
      print(element["code"]);

      prepaidCode.add(element["code"]);
    });
  }

// ---------------------------------------------Get notification-------------------------------//
  formatTransactionDate(DateTime date) async {
    final now = await DateTime.now();
    // update();
    // userController.update();
    if (now.day == date.day &&
        now.month == date.month &&
        now.year == date.year) {
      // transaction done during the current day
      return DateFormat.jm().format(date); // format as "2:15 PM"
    } else if (now.difference(date).inDays < 7) {
      // transaction done during the current week
      return DateFormat.E().format(date); // format as "Tuesday"
    } else if (now.year == date.year) {
      // transaction date is more than a week ago, but less than a year ago
      return DateFormat('d MMM').format(date); // format as "15 Feb"
    } else {
      // transaction date is more than a year ago
      return DateFormat.y().format(date); // format as "2022"
    }
  }

//----------------------------------------------//
  List notificationList = [];
  List bala = [];
  List dateTimess = [];
  List type = [];
  Future<List<Notifications>?> getNotification() async {
    await getIDo();
    QuerySnapshot kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("notifications")
        .orderBy('dateTime', descending: true)
        .get();
    notificationList.clear();
    bala.clear();
    kilo.docs.forEach((element) {
      // print(element.docs[0]["username"]) ;
      print(element["username"]);
      print(element["dateTime"]);
      print(element["username"]);
      print(element["type"]);

      notificationList.add(element["username"]);
      bala.add(element["balance"]);
      dateTimess.add(element["dateTime"]);
      type.add(element["type"]);

      print(element);
      print(element);
    });
  }
//------------------------get limit-----------------------//

  List getLimit = [];
  dynamic cc;
  var numz;
  Future getLimits() async {
    var dociq = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
      cc = value.data();
    });

    numz = double.parse(cc["limit"]);
    update();

    getLimit.clear();
  }

//------------------------------setLimit-------------------------------
  List spendings = [];
  int? sumss;
  double jj = 0;
  Future<List?> addAllNumbers() async {
    jj = 0;
    sumss = 0;
    spendings.clear();
    QuerySnapshot kiloss = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("notifications")
        .where('type', isEqualTo: "sending")
        .get();
    spendings.clear();

    kiloss.docs.forEach((element) {
      // print(element.docs[0]["username"]) ;
      print(element["username"]);
      print(element["dateTime"]);
      print(element["username"]);
      print(element["type"]);

      spendings.add(element["balance"]);
      // bala.add(element["balance"]);
      // dateTimess.add(element["dateTime"]);
      // type.add(element["type"]);

      print(element);
      print(element);
    });

    print(spendings);
    List<int?> intList =
        spendings.map((e) => int.tryParse(e)).where((e) => e != null).toList();
    print("popiuy");
    print(intList); // Output: [1, 2, 3, 5]
// var total;
// for (var i = 0; i < intList.length; i++) {
//   total +=  intList[i];

// }
    sumss = intList.isEmpty ? 0 : intList.reduce((a, b) => a! + b!);

    jj = sumss!.toDouble();
    print("part two");
    print(sumss);
// List<int> hiloJulo = [];
//    hiloJulo = spendings;
// print(hiloJulo);
  }

//===================================Update passcode=======================================

  String? updatedPasscode;
  String? reset;

  Future updatePasscode(String pass) async {
    try {
      var passcodes = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId!.uid)
          .update({
        " passcode": pass,
      }).then((value) {
        Get.snackbar("Updated", "Passcode updated successfully");
        Get.to(ProofPage());
      });
    } catch (e) {
      Get.snackbar("Error", "There is an error !");
    }
    // await uploadData();
  }

  Future resetPasscode(String pass) async {
    try {
      if (pass.length == 6) {
        var passcodes = await FirebaseFirestore.instance
            .collection("users")
            .doc(userId!.uid)
            .update({
          " passcode": pass,
        }).then((value) {
          Get.snackbar("Updated", "Passcode updated successfully");
        });
      } else {
        Get.snackbar("Error", "Number must b 6,No lesser,Np Greater");
      }
    } catch (e) {
      Get.snackbar("Error", "There is an error !");
    }
    // await uploadData();
    // Get.to(HomePage());
  }

  //--------------------------------------------------update PAckage=-------------------
  List<DocumentSnapshot> documentsPackage = [];
  List data = [];
// List  aah = [];
  Future updatePackage() async {
    documentsPackage.clear();
    QuerySnapshot<Map<String, dynamic>> snapshots = await FirebaseFirestore
        .instance
        .collection('account')
        .where('plan', isEqualTo: "Premium")
        .get();
    documentsPackage = snapshots.docs;
    //  data = snapshots.docs.forEach((document) => document.data()).toList();
    snapshots.docs.forEach((element) {
      print("haha");
      print(element.id);
    });
    print("updatePackhae");
    print(data);
    // if (documentsPackage.length > 0) {
    //   snapshots.docs.map((e) => {
    //       print(e["accountB"])
    //   });

    // }

// await   FirebaseFirestore.instance
//   .collection("account").doc(userId!.uid).where('phone', isEqualTo:phoneAuth.phoneNumbers.toString())
//   .get()
//   .then((QuerySnapshot querySnapshot) {
//     if (querySnapshot.size > 0) {
//     Get.snackbar("User Already Signed up", "Moving to login page and Try loggin in",duration: Duration(seconds: 5));
//            Get.to( loginFeild());
//     } else {
//      phoneAuth.verifyPhone();
//       // Data does not exist
//     }
//   });

    // var bal ="";
    dynamic valuex = "";
    var balance;
    await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .update({
      "plan": dropDownValue,
      "limit": dropDownValue == "Premium" ? "3000" : "6000",
    });
    List<DocumentSnapshot> documents = [];

    // documents.clear();
    var result = await FirebaseFirestore.instance
        .collection('account')
        .doc(userId!.uid)
        .get()
        .then((DocumentSnapshot value) {
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

      var newValeTwo;
      if (int.parse(balance) > 0) {
        if (dropDownValue == "Premium" && int.parse(balance) > 7) {
          newValeTwo =
              await subTwoStringsAsInt(first: balance, second: 7.toString());

          await FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .update({"accountB": newValeTwo.toString()}).then(
                  (value) => print(" updated"));

          Get.snackbar("Success", "Changed plan to ${dropDownValue}");
        } else {
          Get.snackbar("Error", "Balance must be greater than 7");
        }

        if (dropDownValue == "Topaz" && int.parse(balance) > 12) {
          newValeTwo =
              await subTwoStringsAsInt(first: balance, second: 12.toString());

          await FirebaseFirestore.instance
              .collection("account")
              .doc(userId!.uid)
              .update({"accountB": newValeTwo.toString()}).then(
                  (value) => print(" updated"));

          Get.snackbar("Success", "Changed plan to ${dropDownValue}");
        } else {
          Get.snackbar("Error", "Balance must be greater than 12");
        }
      } else {
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

//--------------------------------------------GetPhysicalCard---------------------------

  List<DocumentSnapshot> visPhysical = [];
  List physicalCardAcc = [];
  List physicalCardCvv = [];
  List physicalCardAddress = [];
  List physicalCardCity = [];
  List physicalCardZipCode = [];
  List physicalCardPinCode = [];
  int? yeartPhysical;
  DateTime? datePhysical;
  int? monthtPhysical;
  var physicalId;
  Future<List?> getPhysicalCard() async {
    QuerySnapshot kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("physicalCard")
        .get();
    visPhysical = kilo.docs;

    if (visPhysical.length > 0) {
      physicalCardAcc.clear();
      physicalCardCvv.clear();
      physicalCardCity.clear();
      physicalCardZipCode.clear();
      physicalCardAddress.clear();
      physicalCardAddress.clear();
      physicalCardPinCode.clear();
      // millisecondsSinceEpoch = null;
      // date = null;
      // yeart = null;
      print(kilo.docs);

      //  virtualCardGet  = kilo.docs;
      physicalId = kilo.docs.first.id == null ? "12" : kilo.docs.first.id;
      update();

      kilo.docs.forEach((element) {
        // print(element.docs[0]["username"]) ;
        // print(element["accountNumber"]) ;
        physicalCardAcc.add(element["CardNum"]);
        physicalCardAddress.add(element["address"]);
        physicalCardCity.add(element["city"]);
        physicalCardZipCode.add(element["zipCode"]);
        physicalCardCvv.add(element["CVV"]);
        physicalCardPinCode.add(element["pinCode"]);

        millisecondsSinceEpoch =
            element["Date"].toDate().millisecondsSinceEpoch;
        datePhysical =
            DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch!);
        yeartPhysical = datePhysical!.year;
        monthtPhysical = datePhysical!.month;
        // bala.add(element["balance"]);

        print(element);
        print(element);
      });
    }
  }

  //----------------------------------------------GetVirtualCard -------------------------------

  VirtualCard virtualCardss = VirtualCard();

  List virtualCardAcc = [];
  List virtualCardCvv = [];
  List virtualCardStatus = [];
  List virtualCardDateTime = [];
  int? millisecondsSinceEpoch;
  int? yeart;
  DateTime? date;
  int? montht;
  Future<List<VirtualCard>?> getVirtualCard() async {
    QuerySnapshot kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("virtualCard")
        .get();

    virtualCardAcc.clear();
    virtualCardCvv.clear();
    virtualCardStatus.clear();
    virtualCardDateTime.clear();
    // millisecondsSinceEpoch = null;
    // date = null;
    // yeart = null;
    print(kilo.docs);
    //  virtualCardGet  = kilo.docs;

    kilo.docs.forEach((element) {
      // print(element.docs[0]["username"]) ;
      print(element["accountNumber"]);
      virtualCardAcc.add(element["accountNumber"]);
      virtualCardCvv.add(element["cvv"]);
      virtualCardStatus.add(element["freeze"]);
      virtualCardDateTime.add(element["expiryDate"]);
      millisecondsSinceEpoch =
          element["expiryDate"].toDate().millisecondsSinceEpoch;
      date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch!);
      yeart = date!.year;
      montht = date!.month;

      // bala.add(element["balance"]);

      print(element);
      print(element);
    });
  }

  // ---------------------------------freezeCArd------------------------------//
  List freezeUpdated = [];
  List<DocumentSnapshot> docu = [];
  String? freezeText = "Unfreezed";
  var freezeCheck;
  Future<List<VirtualCard>?> FreezeCardUpdated() async {
    QuerySnapshot kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("virtualCard")
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
    if (docu.first["freeze"] == false) {
      freezeText = "Unfreezed";
      update();
      await FirebaseFirestore.instance
          .collection("account")
          .doc(userId!.uid)
          .collection("virtualCard")
          .doc(ids)
          .update({"freeze": true}).then((value) => freezeCheck = true
              //  freezeText = "freeze"

              );
// freezeUpdated[0] = "true";
      update();
      Get.snackbar("Message Success", "UnFreezed");
    } else if (docu.first["freeze"] == true) {
      freezeText = "Freezed";
      update();

      await FirebaseFirestore.instance
          .collection("account")
          .doc(userId!.uid)
          .collection("virtualCard")
          .doc(ids)
          .update({"freeze": false}).then((value) => freezeCheck = false);
      update();
      Get.snackbar("Message Success", "Freezed");
    }
  }

//----------------------------------------freeze physical----/
  List freezeUpdatedPhysical = [];

  List<DocumentSnapshot> docii = [];
  String? freezeTextPhysical = "Unfreezed";
  var freezeCheckPhysical;
  Future<List<VirtualCard>?> FreezeCardUpdatedPhysical() async {
    QuerySnapshot kilo = await FirebaseFirestore.instance
        .collection("account")
        .doc(userId!.uid)
        .collection("physicalCard")
        .get();

    freezeUpdatedPhysical.clear();

    print(kilo.docs);
    //  virtualCardGet  = kilo.docs;
    docii = kilo.docs;
    var ids = docii.first.id;
    kilo.docs.forEach((element) {
      freezeUpdatedPhysical.add(element["CVV"]);

      print(element);
      print(element);
    });
    if (docii.first["freeze"] == false) {
      freezeTextPhysical = "Unfreezed";
      update();
      await FirebaseFirestore.instance
          .collection("account")
          .doc(userId!.uid)
          .collection("physicalCard")
          .doc(ids)
          .update({"freeze": true}).then((value) => freezeCheckPhysical = true
              //  freezeText = "freeze"

              );
// freezeUpdated[0] = "true";
      update();
      Get.snackbar("Message Success", "UnFreezed");
    } else if (docii.first["freeze"] == true) {
      freezeTextPhysical = "Freezed";
      update();

      await FirebaseFirestore.instance
          .collection("account")
          .doc(userId!.uid)
          .collection("physicalCard")
          .doc(ids)
          .update({"freeze": false}).then(
              (value) => freezeCheckPhysical = false);
      update();
      Get.snackbar("Message Success", "Freezed");
    }
  }
}
