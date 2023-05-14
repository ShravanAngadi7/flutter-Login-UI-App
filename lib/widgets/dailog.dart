import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'button.dart';

class DailogBox extends StatefulWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  final String? imageUrl;
  final String? filePath;
  DailogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSaved,
    this.imageUrl,
    this.filePath,
  });

  @override
  State<DailogBox> createState() => _DailogBoxState();
}

class _DailogBoxState extends State<DailogBox> {
  //String? _image;
  //text controllers
  final _jobroleController = TextEditingController();
  final _emailController = TextEditingController();
  final _imageurlController = TextEditingController();

  @override
  void dispose() {
    _jobroleController.dispose();
    _emailController.dispose();
    _imageurlController.dispose();
    super.dispose();
  }

  //-----------------------for imahe picker
  File? imageIcon;
  List<File>? _files;
  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageIcon = File(pickedImage.path);
      });
    }
  }

  // Future<void> _pickFiles() async {
  //   final pickedFiles =
  //       await FilePicker.platform.pickFiles(allowMultiple: true);
  //   if (pickedFiles != null) {
  //     setState(() {
  //       _files = pickedFiles.paths.map((path) => File(path!)).toList();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 420,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Add a valid Email Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _jobroleController,
                  decoration: InputDecoration(
                    hintText: 'Add a Job Role',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),

                FloatingActionButton(
                  onPressed: _pickImage,
                  tooltip: 'Pick Image',
                  child: Icon(Icons.image),
                ),
                // SizedBox(height: 15),
                // FloatingActionButton(
                //   onPressed: _pickFiles,
                //   tooltip: 'Pick Files',
                //   child: Icon(Icons.attach_file),
                // ),

                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => ImageUpload(),
                //     ));
                //   },
                //   child: Text('Add a Image'),
                // ),
                //  Stack(
                //     children: [
                //       _image != null
                //           ? ClipRRect(
                //               borderRadius: BorderRadius.circular(100),
                //               child: Image.file(
                //                 File(_image!),
                //                 fit: BoxFit.cover,
                //                 width: 170,
                //                 height: 170,
                //               ),
                //             )
                //           : ClipRRect(
                //               borderRadius: BorderRadius.circular(100),
                //               child: CachedNetworkImage(
                //                 fit: BoxFit.cover,
                //                 width: 170,
                //                 height: 170,
                //                 imageUrl: widget.imageUrl.,
                //                 //placeholder: (context, url) => CircularProgressIndicator(),
                //                 errorWidget: (context, url, error) =>
                //                     const CircleAvatar(
                //                   child: Icon(CupertinoIcons.person,
                //                       color: Colors.black),
                //                 ),
                //               ),
                //             ),
                //       Positioned(
                //         bottom: 0,
                //         right: 0,
                //         child: MaterialButton(
                //           elevation: 1,
                //           onPressed: () {
                //             _showBottomSheet();
                //           },
                //           color: Colors.white,
                //           shape: CircleBorder(),
                //           child: Icon(
                //             Icons.edit_outlined,
                //             color: Colors.blue,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   const SizedBox(
                //     height: 20),
                // Container(
                //   width: 100,
                //   height: 100,
                //   margin: EdgeInsets.only(top: 8, right: 10),
                //   decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.black87),
                //   ),
                //   child: _imageurlController.text.isEmpty
                //       ? Text(
                //           'Enter a Url',
                //           textAlign: TextAlign.center,
                //         )
                //       : FittedBox(
                //           child: Image.network(_imageurlController.text),
                //           fit: BoxFit.fill,
                //         ),
                // ),
              ],
            ),

            //butons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button----
                MyButton(
                  text: 'Save',
                  onPressed: widget.onSaved,
                ),
                const SizedBox(width: 4),
                // cancel button-----
                MyButton(
                  text: 'Cancel',
                  onPressed: widget.onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
