import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/screens/HomeScreen.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleUserPastGrievnaces.dart';
import 'package:wce_support/widgets/ContainerWithBlueBorder.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';
import '../constants/ColorsAndStyles.dart';
import 'package:image_picker/image_picker.dart';

class PutGrievance extends StatefulWidget {
  const PutGrievance({super.key});
  static String routeUrl = "./put-grievance";

  @override
  State<PutGrievance> createState() => _PutGrievanceState();
}

class _PutGrievanceState extends State<PutGrievance> {
  String subject = "";
  String description = "";
  String selectedOption = "Grievance Committee";
  String image = '';
  bool isloading = false;
  // final network = NetworkHandler();
  List<String> sectionList = <String>["Hostel", "Exam Cell", "My Department"];
  List list = [];
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
      setState(() {
        image = poster.path;
      });
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
    setState(() {
      isloading = true;
    });
    try {
      await Provider.of<Griv>(context, listen: false)
          .putGrievance(subject, description, selectedOption, image, id);
      showCustomSnackbar(1, "Grievance added successfully!", context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: 'view_grievances')));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
    setState(() {
      isloading = false;
    });
  }

  Future<bool> backNavigation() async {
    Navigator.of(context).popAndPushNamed(HomeScreen.routeUrl);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: backNavigation,
        child: isloading
            ? const Center(child: CircularProgressIndicator())
            : Stack(children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: backgroundColor),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.02),
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.0052,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        decoration: headingBoxDecoration,
                        child: Text(
                          'Put Your Grievance',
                          style: headingTextStyle,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              // vertical: MediaQuery.of(context).size.height * 0.01,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 246, 246),
                            border: Border.all(
                                color: const Color.fromARGB(255, 7, 65, 79),
                                width: 1),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.009,
                                ),
                                TextFormField(
                                  initialValue: subject,
                                  onChanged: (sub) {
                                    setState(() {
                                      subject = sub;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'subject',
                                      contentPadding: EdgeInsets.all(12),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      ))),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                TextFormField(
                                  initialValue: description,
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
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      ))),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                Row(
                                  children: [
                                    Text('Add image as a proof if any',
                                        style: TextStyle(
                                            color: headingColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.036)),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012,
                                ),
                                Row(children: [
                                  ElevatedButton.icon(
                                      onPressed: pickImage,
                                      style: secondButtonStyle,
                                      icon: const Icon(
                                          Icons.add_a_photo_outlined),
                                      label: Text(
                                        "Add Image",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045),
                                      )),
                                ]),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                image != ""
                                    ? Center(
                                        child: Container(
                                          width: 250,
                                          // height: 250,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff5a2f2f),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              image,
                                              alignment: Alignment.center,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                image != ""
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                      )
                                    : const SizedBox(),
                                // Row(
                                //   children: [
                                //     Text('Choose department for your grievance',
                                //         style: TextStyle(
                                //             color: headingColor,
                                //             fontSize: MediaQuery.of(context)
                                //                     .size
                                //                     .width *
                                //                 0.036)),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.of(context).size.height * 0.025,
                                // ),
                                // DropdownButtonFormField(
                                //   isExpanded: true,
                                //   items: sectionList.map((value) {
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: Text(
                                //         value,
                                //         overflow: TextOverflow.ellipsis,
                                //       ),
                                //     );
                                //   }).toList(),
                                //   value: selectedOption,
                                //   onChanged: (String? value) {
                                //     setState(() {
                                //       selectedOption = value!;
                                //     });
                                //   },
                                //   decoration: const InputDecoration(
                                //       labelText: 'select department',
                                //       contentPadding: EdgeInsets.all(12),
                                //       border: OutlineInputBorder(
                                //           // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                //           borderSide: BorderSide(
                                //               color: Colors.black, width: 2.0)),
                                //       focusedBorder: OutlineInputBorder(
                                //           // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                //           borderSide: BorderSide(
                                //         color: Colors.black,
                                //       ))),
                                // ),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.of(context).size.height * 0.025,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: createGrevience,
                                      style: buttonStyle,
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.023),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                      ContainerWithBlueBorder(
                          content: "View Your Grievances",
                          btnText: "View",
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const SingleUserPastGrievances()));
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                    ],
                  ),
                ),
              ]),
      ),
    );
  }
}
