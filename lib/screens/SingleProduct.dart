import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/BuyProducts.dart';
import 'package:wce_support/screens/EditProduct.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/ViewProfile.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/ConfirmationDialogBox.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/HeadingAndField.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

import '../Provider/Auth provider.dart';
import '../Provider/productProvider.dart';

// ignore: must_be_immutable
class SingleProductPage extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => throw UnimplementedError();
  SingleProductPage({Key? key, required this.product}) : super(key: key);

  dynamic product;
  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  bool sameuser = false;
  bool saved = false;
  var user;
  @override
  void initState() {
    user = Provider.of<Auth>(context, listen: false).user;
    String? id = Provider.of<Auth>(context, listen: false).user_id;
    if (id != null) {
      sameuser = widget.product['userID'] == user['_id'];
      for (int i = 0; i < user['bookmark'].length; i++) {
        if (user['bookmark'][i] == widget.product['_id']) {
          saved = true;
        }
      }
    }
  }

  Future<void> deleteProduct() async {
    try {
      var user = Provider.of<Auth>(context, listen: false).user;
      await Provider.of<Prod>(context, listen: false)
          .deleteProduct(user['_id'], widget.product['_id']);
      showCustomSnackbar(1, "Product deleted successfully!", context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: 'buy_products')));
    } catch (e) {
      showErrorDialogBox2(e.toString(), context);
    }
  }

  Future<void> likeProduct() async {
    setState(() {
      saved = !saved;
    });
    dynamic user = Provider.of<Auth>(context, listen: false).user;
    try {
      dynamic newuser = await Provider.of<Prod>(context, listen: false)
          .addBookmark(user['_id'], widget.product['_id']);
      await Provider.of<Auth>(context, listen: false).setUser(newuser);
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  Future<void> unlikeProduct() async {
    setState(() {
      saved = !saved;
    });
    dynamic user = Provider.of<Auth>(context, listen: false).user;
    try {
      dynamic newuser = await Provider.of<Prod>(context, listen: false)
          .removeBookmark(user['_id'], widget.product['_id']);
      await Provider.of<Auth>(context, listen: false).setUser(newuser);
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  void viewuserdetails() async {
    try {
      var productowner = await Provider.of<Auth>(context, listen: false)
          .getuser(widget.product['userID']);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewProfile(user: productowner)));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Appbar(),
        body: Stack(children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: backgroundColor),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.008,
                horizontal: MediaQuery.of(context).size.width * 0.02),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.012,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 7, 65, 79), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  sameuser
                      ? (Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditProductDetails(
                                          product: widget.product)));
                                },
                                icon: const Icon(Icons.edit),
                                color: const Color.fromARGB(255, 75, 75, 75),
                                // color: primaryColor,
                                iconSize: 28,
                              ),
                            ]))
                      : Row(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02,
                          top: MediaQuery.of(context).size.height * 0.005),
                      child: Text(
                        widget.product['name'],
                        style: TextStyle(
                          color: headingColor,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          shadows: const [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 8.0,
                              color: Color.fromRGBO(159, 157, 157, 1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 4,
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.55,
                        // width: MediaQuery.of(context).size.width * 0.85,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.035,
                          //  vertical: MediaQuery.of(context).size.height*0.01
                        ),
                        decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 242, 244, 245),
                          color: const Color.fromARGB(255, 228, 229, 230),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6.0,
                                offset: Offset(2.0, 4.0))
                          ],
                        ),
                        // margin: EdgeInsets.all(
                        //     MediaQuery.of(context).size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed:
                                      saved ? unlikeProduct : likeProduct,
                                  icon: saved
                                      ? const Icon(Icons.favorite)
                                      : const Icon(Icons.favorite_outline),
                                  color: saved
                                      ? primaryColor
                                      : const Color.fromARGB(255, 75, 75, 75),
                                  iconSize: 30,
                                ),
                              ],
                            ),
                            // Text(
                            //   widget.product['name'],
                            //   style: TextStyle(
                            //     color: headingColor,
                            //     fontSize:
                            //         MediaQuery.of(context).size.height * 0.022,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(
                            //     height:
                            //         MediaQuery.of(context).size.height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                // boxShadow: const [
                                //   BoxShadow(
                                //       color: Colors.grey,
                                //       blurRadius: 3.0,
                                //       spreadRadius: 1.0,
                                //       offset: Offset(2.0, 2.0))
                                // ],
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                child: Image.network(
                                  widget.product['image'],
                                  alignment: Alignment.center,
                                  // height:
                                  //     MediaQuery.of(context).size.height * 0.18,
                                  // width: MediaQuery.of(context).size.height * 0.20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            // Row(
                            //   children: [
                            //     Text(widget.product['description'], style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.02),),
                            //   ],
                            // ),
                            HeadingAndField(
                                heading: "Details:",
                                field: widget.product['description']),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Price: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.019),
                                ),
                                Text(
                                  "Rs. ",
                                  style: TextStyle(
                                    color: headingColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.product['price'].toString(),
                                  style: TextStyle(
                                    color: headingColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Available Quantity: ${widget.product['quantity']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.019),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.012),
                            !sameuser
                                ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: viewuserdetails,
                                      style: buttonStyle,
                                      child: const Text(
                                        "Contact Seller",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.012),
                          ],
                        ),
                      ),
                      sameuser
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04)
                          : SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.007),
                      sameuser
                          ? ElevatedButton.icon(
                              onPressed: (){showConfirmationDialogBox("Do you want to delete the product?", deleteProduct, context);},
                              icon: const Icon(Icons.delete),
                              label: const Text("Delete Product"),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                                elevation: 5,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ])
        //ProductDetails(p: productname, pr: price, q: quantity, i: imageaddress, ),
        );
  }
}

// class ProductDetails extends StatefulWidget{
//   const ProductDetails({Key? key,
//     required this.p,
//     required this.pr,
//     required this.q,
//     required this.i,
//   }) : super(key: key);
//
//   final String p;
//   final String pr;
//   final String q;
//   final String i;
//
//
//   @override
//   State<ProductDetails> createState() => _ProductPageState();
// }
//
// class _ProductPageState extends State<ProductDetails>{
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.topLeft,
//           child: Padding(
//             padding: EdgeInsets.only(left: 10, top: 10),
//             child: Text("Product Details",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25
//               ),
//             ),
//           ),
//         ),
//         const Divider(height: 1, thickness: 2, color: Colors.grey),
//         Container(
//           color: greyColor,
//           margin: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Text(p),
//             ],
//           ),
//         )
//       ],
//     )
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }
