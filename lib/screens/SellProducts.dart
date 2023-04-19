import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/productProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/HomeScreen.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleUserPastProducts.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({super.key});
  static String routeUrl = "./sell-products";

  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  String productname = '';
  String description = "";
  String quantity="";
  String price="";
  String image = '';
  File posterImageFile = File('');
  bool isloading = false;

  Future<void> pickImage() async {
    setState(() {
      isloading = true;
    });
    try {
      final poster = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (poster == null) return;
      print(poster.path);
      setState(() {
        posterImageFile = File(poster.path);
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

  Future<void> addProduct() async {
    setState(() {
      isloading = true;
    });
    try {
      String? id = await Provider.of<Auth>(context, listen: false).user_id;
      await Provider.of<Prod>(context, listen: false)
          .addProduct(productname, description, quantity, price, image, id);
      showCustomSnackbar(1, "Product added successfully!", context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: 'buy_products')));
    } catch (e) {
      showErrorDialogBox2(e.toString(), context);
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
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
      body: WillPopScope(
        onWillPop: backNavigation,
        child: isloading
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
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
                            'Add Your Product',
                            style: headingTextStyle,
                          ),
                        ),
                        // Expanded(
                        //     child: SingleChildScrollView(
                        //   child:
                        Container(
                          margin: EdgeInsets.symmetric(
                              // vertical: MediaQuery.of(context).size.height * 0.01,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height * 0.02,
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
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Enter your product details below",
                                      style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.height *
                                                  0.018),
                                    )),
                                // const Divider(height: 1, thickness: 2, color: Colors.grey),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: width10 * 2,
                                ),
                                TextFormField(
                                  initialValue: productname,
                                  onChanged: (name) {
                                    setState(() {
                                      productname = name;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'product name',
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.025,
                                ),
                                TextFormField(
                                  initialValue: description,
                                  onChanged: (name) {
                                    setState(() {
                                      description = name;
                                    });
                                  },
                                  minLines: 1,
                                  maxLines: 10,
                                  decoration: const InputDecoration(
                                      labelText: 'product description',
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.025,
                                ),
                                //password
                                TextFormField(
                                  initialValue: quantity.toString(),
                                  onChanged: (name) {
                                    setState(() {
                                      quantity = name;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'quantity',
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.025,
                                ),
                                //password
                                TextFormField(
                                  initialValue: price.toString(),
                                  onChanged: (name) {
                                    setState(() {
                                      price = name;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'price',
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
                                  height: width10 * 2,
                                ),
                                //button
                                Row(children: [
                                  ElevatedButton.icon(
                                      onPressed: pickImage,
                                      style: secondButtonStyle,
                                      icon: const Icon(Icons.add_a_photo_outlined),
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
                                  height: width10 * 2,
                                ),
                                posterImageFile.path!="" ? 
                                Center(
                                  child: Container(
                                    width: 250,
                                    // height: 250,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: headingColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        posterImageFile,
                                        alignment: Alignment.center,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ):const SizedBox(),
                                image!=""?SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.025,
                                ):const SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: addProduct,
                                      style: buttonStyle,
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.023),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const Divider(
                            height: 1, thickness: 3, color: Colors.grey),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.012,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SingleUserPastProducts()));
                            },
                            style: buttonStyle,
                            child: Text(
                              "View Your Products",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.021),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
