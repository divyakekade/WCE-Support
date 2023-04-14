import 'dart:ffi';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/screens/LoginPage.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleUserPastGrievnaces.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../constants/ColorsAndStyles.dart';
import 'package:image_picker/image_picker.dart';

class PutGrievance extends StatefulWidget {
  const PutGrievance({super.key});

  @override
  State<PutGrievance> createState() => _PutGrievanceState();
}

class _PutGrievanceState extends State<PutGrievance> {
  String subject = "";
  String description = "";
  String selectedOption = "Hostel Supervisor";
  String image = '';
  bool isloading = false;
  // final network = NetworkHandler();
  List<String> sectionList = <String>[
    "Hostel Supervisor",
    "Hostel Chief Rector",
    "Exam Cell",
    "My Department"
  ];
  List list = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten'
  ];

  @override
  void initState() {
    super.initState();
    final authtoken = Provider.of<Auth>(context, listen: false).token;
    print(authtoken);
    if (authtoken == null) {
      // Navigator.of(context).popAndPushNamed(SideMenuNavigation.routeurl);
    }
  }

  Future<void> pickImage() async {
    setState(() {
      isloading = true; 
    });
    try {
      final poster = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (poster == null) return;
      print(poster.path);
      // image = poster.path;
      final refernceRoot = FirebaseStorage.instance.ref();
      final referenceDirImages = refernceRoot.child('products');
      final referenceImageToUpload = referenceDirImages.child(poster.path);
      await referenceImageToUpload.putFile(File(poster.path));
      final String res = await referenceImageToUpload.getDownloadURL();
      image = res;
      print(res);
      // File fileimage = File(poster.path);
      // print(fileimage.path);
    } catch (e) {
      print(e);
    }
  setState(() {
    isloading = false; 
  });

  }

  Future<void> createGrevience() async {
    // print({subject, description, selectedOption});
    String? id = Provider.of<Auth>(context, listen: false).user_id;
    // // String id = "xyz";
    // QuickAlert.show(context: context,
    // type: QuickAlertType.success,
    // );
    try {
      await Provider.of<Griv>(context, listen: false)
          .putGrievance(subject, description, selectedOption, image, id);
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body:isloading?Text("Loading"): Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.0052,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                decoration: headingBoxDecoration,
                child: Text(
                  'Put Your Grievance',
                  style: headingTextStyle,
                ),
              ),
              // Expanded(
              //     child: SingleChildScrollView(
              //   child: 
                Container(
                    margin: EdgeInsets.symmetric(
                        // vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 246, 246),
                      border: Border.all(
                          color: const Color.fromARGB(255, 7, 65, 79), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Enter details below",
                                style: TextStyle(
                                    color: headingColor,
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.018),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.009,
                          ),
                          TextFormField(
                            onChanged: (sub) {
                              setState(() {
                                subject = sub;
                              });
                            },
                            decoration: const InputDecoration(
                                labelText: 'subject',
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                ))),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          TextFormField(
                            minLines: 1,
                            maxLines: 20,
                            onChanged: (dec) {
                              setState(() {
                                description = dec;
                              });
                            },
                            decoration: const InputDecoration(
                                labelText: 'write your grievance here',
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                ))),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            children: [
                              Text('Add image as a proof if any',
                                  style: TextStyle(
                                      color: headingColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.036)),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          Row(children: [
                            ElevatedButton(
                                onPressed: pickImage,
                                style: secondButtonStyle,
                                child: Text(
                                  "Add Image",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045),
                                )),
                          ]),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            children: [
                              Text('Choose department for your grievance',
                                  style: TextStyle(
                                      color: headingColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.036)),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          DropdownButtonFormField(
                            isExpanded: true,
                            items: sectionList.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            value: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                            decoration: const InputDecoration(
                                labelText: 'select department',
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                ))),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: createGrevience,
                                style: buttonStyle,
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.023),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              // )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
              ),
              const Divider(height: 1, thickness: 3, color: Colors.grey),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SingleUserPastGrievances()));
                  },
                  style: buttonStyle,
                  child: Text(
                    "View Your Past Grievances",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.021),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
