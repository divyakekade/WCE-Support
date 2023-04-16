import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/BuyProducts.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleUserPastGrievnaces.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Provider/Auth provider.dart';
import '../Provider/productProvider.dart';
import '../widgets/errorDialogBox.dart';

class EditProductDetails extends StatefulWidget {
  const EditProductDetails({super.key, required this.product});
  final product;
  @override
  State<EditProductDetails> createState() => _EditProductDetailsState();
}

class _EditProductDetailsState extends State<EditProductDetails> {
  String productName = "";
  String productDescription="";
  String productQuantity = "";
  String productPrice = "";
  String productImage = "";
  bool isloading = false;
  File posterImageFile = File('');

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
      productImage = res;
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

  saveDetails() async {
    try {
      dynamic user = Provider.of<Auth>(context, listen: false).user;
      await Provider.of<Prod>(context, listen: false).updateProduct(
          productName,
          productDescription,
          productQuantity,
          productPrice,
          user['_id'],
          productImage,
          widget.product['_id']);
      showCustomSnackbar(1, "Details updated successfully!", context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SideMenuNavigation(loadedPage: 'buy_products')));
    } catch (e) {
      showErrorDialogBox2(e.toString(), context);
    }
  }

  @override
  void initState() {
    super.initState();
    productName = widget.product['name'];
    productDescription=widget.product['description'];
    productPrice = widget.product['price'].toString();
    productQuantity = widget.product['quantity'].toString();
    productImage = widget.product['image'];
  }

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
      appBar: const Appbar(),
      backgroundColor: backgroundColor,
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: width10 * 1),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.0052,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                decoration: headingBoxDecoration,
                child: Text(
                  'Your Product',
                  style: headingTextStyle,
                ),
              ),
            ),
            ////
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: heightc / 2, horizontal: width10 * 2),
                  // margin: EdgeInsets.symmetric(horizontal: width10/4),
                  //   width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 246, 246),
                    border: Border.all(
                        color: const Color.fromARGB(255, 7, 65, 79), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: width10 * 2,
                        // ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Edit your product details below",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
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
                          initialValue: productName,
                          onChanged: (name) {
                            setState(() {
                              productName = name;
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
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        TextFormField(
                                initialValue: productDescription,
                                onChanged: (name) {
                                  setState(() {
                                    productDescription = name;
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
                        TextFormField(
                          initialValue: productQuantity,
                          onChanged: (q) {
                            setState(() {
                              productQuantity = q;
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
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        //password
                        TextFormField(
                          initialValue: productPrice,
                          onChanged: (pr) {
                            setState(() {
                              productPrice = pr;
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Row(children: [
                                ElevatedButton(
                                    onPressed: pickImage,
                                    style: secondButtonStyle,
                                    child: Text(
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
                                    child: posterImageFile.path==""?Image.network(
                                      productImage,
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill,
                                    ):Image.file(
                                      posterImageFile,
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: width10 * 2,
                        ),
                        Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: saveDetails,
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
                        SizedBox(
                          height: width10 * 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
