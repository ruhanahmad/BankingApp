import 'dart:io';

import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/pages/login/proof_of_residency.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
// main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     const ExampleCameraOverlay(),
//   );
// }

class ExampleCameraOverlay extends StatefulWidget {
  const ExampleCameraOverlay({Key? key}) : super(key: key);

  @override
  _ExampleCameraOverlayState createState() => _ExampleCameraOverlayState();
}

class _ExampleCameraOverlayState extends State<ExampleCameraOverlay> {
  OverlayFormat format = OverlayFormat.cardID1;
  UserController userController = Get.put(UserController());
  int tab = 0;
  XFile? file ;
  XFile? files;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: tab,
      //   onTap: (value) {
      //     setState(() {
      //       tab = value;
      //     });
      //     switch (value) {
      //       case (0):
      //         setState(() {
      //           format = OverlayFormat.cardID1;
      //         });
      //         break;
      //       case (1):
      //         setState(() {
      //           format = OverlayFormat.cardID3;
      //         });
      //         break;
      //       case (2):
      //         setState(() {
      //           format = OverlayFormat.simID000;
      //         });
      //         break;
      //     }
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.credit_card),
      //       label: 'Bankcard',
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.contact_mail), label: 'US ID'),
      //     BottomNavigationBarItem(icon: Icon(Icons.sim_card), label: 'Sim'),
      //   ],
      // ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<CameraDescription>?>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No camera found',
                    style: TextStyle(color: Colors.black),
                  ));
            }
            return CameraOverlay(
                snapshot.data!.first,
                CardOverlay.byFormat(format),
                ( file) => showDialog(
                      context: context,
                      barrierColor: Colors.black,
                      builder: (context) {
                       
                            userController.files   =   file;
                            userController.update();
                       
                
                        CardOverlay overlay = CardOverlay.byFormat(format);
                        return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            backgroundColor: Colors.black,
                            title: const Text('Capture',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center),
                            actions: [
                              Row(
                                children: [
                                       OutlinedButton(
                                      onPressed: ()
                                      async
                                       {
                                        
                                         await userController.uploadFiless(userController.files,context);
                                         
                                         },
                                      child: const Icon(Icons.abc)),
                                  
                                  OutlinedButton(
                                      onPressed: () => Get.off(ProofPage()),
                                      child: const Icon(Icons.abc)),
                                ],
                              )
                            ],
                            content: SizedBox(
                                width: double.infinity,
                                child: AspectRatio(
                                  aspectRatio: overlay.ratio!,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      alignment: FractionalOffset.center,
                                      image: FileImage(
                                        File(file.path),
                                      ),
                                    )),
                                  ),
                                )));
                      },
                    ),
                info:
                    'Position your ID card within the rectangle and ensure the image is perfectly readable.',
                label: 'Scanning ID Card');
          } else {
            return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Fetching cameras',
                  style: TextStyle(color: Colors.black),
                ));
          }
        },
      ),
    ));
  }
}