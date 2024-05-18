// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? image;
  final logger = Logger();

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      logger.e('Failed to pick image', error: e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    height: 440,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: image != null
                              ? FileImage(image!)
                              : const AssetImage('assets/images/img-avatar.png')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: null,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 96, 175, 137)),
                          onPressed: () => pickImage(ImageSource.gallery),
                          icon: const Icon(
                            Icons.file_upload_outlined,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Upload Image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 96, 175, 137)),
                          onPressed: () => pickImage(ImageSource.camera),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Take Picture',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 96, 175, 137)),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.online_prediction_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Get Results',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
