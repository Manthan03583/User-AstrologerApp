import 'dart:async';
import 'dart:io';
import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/palmistry/palmistry_report.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
//import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class PalmistryScreen extends StatefulWidget {
  const PalmistryScreen({super.key});

  @override
  State<PalmistryScreen> createState() => _PalmistryScreenState();
}

class _PalmistryScreenState extends State<PalmistryScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late String imagePath;
  bool isPhotoClicked = false;
  bool isCameraReady = false;
  bool isCapturingPhoto = false;

  @override
  void initState() {
    super.initState();

    startCamera();
  }

  @override
  void dispose(){
    cameraController.dispose();
    super.dispose();
  }

  Future<void> startCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    try {
      await cameraController.initialize();
      if (mounted) {
        setState(() {
          isCameraReady = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void takePicture() async {
    if (!isCapturingPhoto) {
      // Avoid capturing multiple photos simultaneously
      setState(() {
        isCapturingPhoto = true;
      });

      await cameraController.takePicture().then((XFile? file) {
        if (mounted) {
          if (file != null) {
            setState(() {
              isPhotoClicked = true;
              imagePath = file.path;

              sendImagetoServer();
            });
          } else {
            setState(() {
              isPhotoClicked = false;
            });
          }
        }
      }).catchError((e) {
        print(e);
      });
    }
  }

  void sendImagetoServer() async {
    final data = await Controller.readPalm(File(imagePath));
    if(data.isNotEmpty){
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(data['message'].toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HadLineP(
                text: 'Palmistry',
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const PalmistryP(
                        text:
                            'Place your right hand in the center of the \nscreen.'),
                    const SizedBox(height: 15),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: isCameraReady
                          ? isPhotoClicked
                              ? isCapturingPhoto
                                  ? Image.file(
                                      File(imagePath),
                                      fit: BoxFit.cover,
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator())
                              : CameraPreview(cameraController)
                          : const Center(child: CircularProgressIndicator()),
                    ),

                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.65,
                    //   width: MediaQuery.of(context).size.width * 0.95,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Stack(
                    //     children: [
                    //       // Camera Preview or Captured Image
                    //       isCameraReady
                    //           ? isPhotoClicked
                    //               ? Image.file(
                    //                   File(imagePath),
                    //                   fit: BoxFit.cover,
                    //                 )
                    //               : CameraPreview(cameraController)
                    //           : Center(
                    //               child: CircularProgressIndicator(),
                    //             ),
                    //       // Overlay when capturing photo
                    //       if (isCapturingPhoto)
                    //         Positioned.fill(
                    //           child: Container(
                    //             color: Colors.black54,
                    //             child: Center(
                    //               child: CircularProgressIndicator(
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //     ],
                    //   ),
                    // ),
                  
                  ],
                ),
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.90,
                child: ElevatedButton(
                  onPressed: () {
                    takePicture();
                    if (imagePath.isNotEmpty && imagePath != '') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PalmistryReport()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code_scanner_sharp),
                      SizedBox(width: 15),
                      Text(
                        'Scanning',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
