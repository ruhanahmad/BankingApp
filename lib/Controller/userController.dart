import 'package:bnacash/models/account.dart';
import 'package:bnacash/models/external_card.dart';
import 'package:bnacash/models/firebaseModel.dart';
import 'package:bnacash/models/virtual_card.dart';
import 'package:bnacash/pages/home_page.dart';
import 'package:bnacash/pages/login/reason_for_use.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:bnacash/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bnacash/models/contacts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io' as io;
import '../pages/login/find_friends.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:camera/camera.dart';
import 'package:file/file.dart';
import 'dart:math';
class UserController extends GetxController {
  String? sendMoneyContactName;
 
 String? beneIban = "";
 String? beneEmail= "";
String? beneName  = "";
 String? sendMoneyContact = "";
 ExCard exCard = ExCard();
String? codeEntered = "";
String? prepaidBalance = "";
String sendMoneyBalance = "";
Contacts contacts = Contacts();
   
     @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  //  getAccountData();
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
   XFile? files;
  String? accountBalance = "";
  
  

User? userId = FirebaseAuth.instance.currentUser;

    
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


String? accB ="";

 Future accountAdd(String rand, fullName,String accountN)async  {

   welcome.firebaseId = userId!.uid.toString();
   accountss.BIC = "BNACASH22";
   accountss.accountB = "0";
   accountss.accountNumber = accountN;
   accountss.username = fullName;
   accountss.status = true;
   accountss.IBAN = "TN"+rand;
  //  accountss.dateTime = DateTime.now();
  

   var jjson= FirebaseFirestore.instance.collection("account").doc(userId!.uid).set(accountss.toJson());
     jjson.then(( value)async {
           accB = accountss.accountB;   
           update()  ;  
     Get.to(ReasonForUse());
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
        var newValeTwo = await subTwoStringsAsInt(first: balance, second: prepaidBalance)  ;
   var newVale =  await addTwoStringsAsInt(first: balances, second:newValeTwo.toString())  ;
     print(newVale);
      
     await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "accountB":newVale.toString()
           }).then((value) => print(" updated"));

                await FirebaseFirestore.instance.collection("prepaidcode").doc(ids).update({
                "balance":newValeTwo.toString()
           }).then((value) => print(" updated two"));
           

    //  accountsList[0].accountB = int.tryParse(accountsList[0].accountB)+  int.tryParse(finalB!) ;
  //  var abcd = int.tryParse(accountsList[0].accountB);
  // var anbv = int.tryParse(finalB!);
  
  // are wah samsung traqiiii oh nh samsun ya emulator h kry ka???
  //test kry na ya dyky mai code lgau gi
  //jb es confirm ko click krtty h tb ya vala function chla h
  // int? fi   =abcd + anbv;
  //  print("akjsdhkajs" + "${anbv}");
      print("asas"+accountsList[0].accountB);
      // getAccountData();
      errorMsg = false;
      update();
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
      else if(documents.first["status"] == "used"){
        errorMsgEx = true;
        update();
      }
  // documents[0].status == "unused";

} else {  
     errorMsgTwoEx = true;
     update();
  //not exists

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

        var newValeTwo = await subTwoStringsAsInt(first: bal, second: sendMoneyBalance)  ;
          
            await FirebaseFirestore.instance.collection("account").doc(userId!.uid).update({
                "accountB":newValeTwo.toString()
           }).then((value) => print(" updated"));

   var newVale =  await addTwoStringsAsInt(first: balanc, second:sendMoneyBalance)  ;
     print(newVale);
      




            await FirebaseFirestore.instance.collection("account").doc(ids).update({
                "accountB":newVale.toString()
           }).then((value) => print(" updated"));

       var firebaseId = userId!.uid.toString();
       
     contacts.email = "ranaruhan123@gmail.com";
     contacts.iban = "TN8451100465623861366251";
     contacts.id = firebaseId;
     contacts.name = "vilvo";

         await FirebaseFirestore.instance
        .collection("account").doc(userId!.uid).collection("contacts").where("iban", isEqualTo: beneIban)
        .get()
        .then((QuerySnapshot value) {
                 contactsGet = value.docs;
                 print(valuess);
                 if(contactsGet.length > 0){
                        return null;
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

        });
        if(contactListThings!.length > 0 ){
       
        }
      print(contactListThings!.length);
      print(contactListThings!.first["iban"]);
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
      // print(contactListThings!.length);
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



  Future   orderVirtualCard() async {
                    var tenNumber    = "abc123" +  await tenNumberGenerated();
                    virtualCard.accountNumber = tenNumber;
                    virtualCard.cvv = await  CVVGenerated();
                    virtualCard.color = "red";
                    virtualCard.freeze = false;

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



}