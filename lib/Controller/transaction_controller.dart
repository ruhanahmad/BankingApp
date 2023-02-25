
import 'dart:io';
import 'package:bnacash/pages/login/models/pdf_openfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:bnacash/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

// import 'package:generate_pdf_invoice_example/api/pdf_api.dart';
// import 'package:generate_pdf_invoice_example/api/pdf_invoice_api.dart';
 
class AikOr extends GetxController {

  
 var kkaa   ;

Future<File> saveQuerySnapshotToPdf(QuerySnapshot snapshot) async {
  // Get the application documents directory
  final directory = await getApplicationDocumentsDirectory();
  File file =  File('${directory.path}/querySnapshot.pdf');

  // Create a PDF document
  final pdf = pw.Document();

  //   pdf.addPage(
  //   pw.MultiPage(
  //     pageFormat: PdfPageFormat.a4,
  //     build: (pw.Context context) {
  //       return [
  //         pw.Table.fromTextArray(
  //           data: <List<String>>[
  //             <String>['Name', 'Age', 'Gender'],
  //             ...snapshot.docs.map((doc) =>
                    
              
  //              [
  //               doc['balance'], doc['age'], doc['gender'],
                
                
  //               ]
                
  //               ),
  //           ],
  //         ),
  //       ];
  //     },
  //   ),
  // );
  // final output = await getTemporaryDirectory();
  // final  file = File('${output.path}/example.pdf');



  // Add a title to the PDF document
  pdf.addPage(pw.Page(
    build: (context) => pw.Center(
      child: pw.Text('QuerySnapshot Data'),
    ),
  ));

  // Add a table to the PDF document
  pdf.addPage(pw.Page(
    build: (context) => pw.Center(
      child: pw.Table.fromTextArray(
        headers: ['Name', 'Age'],
        data: 
        snapshot.docs.map((doc) => [
          doc["balance"]  , doc['type'].toString()]).toList(),
//         querySnapshot.docs.forEach((doc) {
//         print(doc["balance"]);
//   // Transaction transaction = Transaction.fromFirestore(doc);
//   transactions.add(doc["balance"]);
//   // transactions.add(transaction);
// })
      ),
    ),
  ));


  await file.writeAsBytes(await pdf.save());
    var kkaa      =   file.path;
    update();
  OpenFile.open(file.path);
   Get.to(PDFScreen());
        

   
  // // Return the file
  return file;
}

}