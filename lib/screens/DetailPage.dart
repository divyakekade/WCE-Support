import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
//import 'package:wce_support/widgets/Appbar.dart';

class DetailPage extends StatelessWidget implements PreferredSizeWidget {
  DetailPage(
      {Key? key,
        required this.productname,
        required this.price,
        required this.quantity,
        required this.imageaddress,
      })
      : super(key: key);

     final String productname;
    final String price;
    final String quantity;
    final String imageaddress;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.height * 0.02),
                child: Text("Product Details",
                  style: TextStyle(
                      color: headingColor,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.025
                  ),
                ),
              ),
            ),
            Divider(height: MediaQuery.of(context).size.height * 0.01, thickness: 1, color: Colors.grey),
            Column(

              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.025,),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.027),
              decoration: BoxDecoration(
                color: cardColor,
               // borderRadius: BorderRadius.circular(10),///////////
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(2.0, 5.0))
                ],
              ),
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //  SizedBox(height: 10),////////////
                  Text(productname,
                    style: TextStyle(
                      color: headingColor,
                      fontSize: MediaQuery.of(context).size.height*0.023,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(12.0),),
                      // boxShadow: const [
                      //   BoxShadow(
                      //       color: Colors.grey,
                      //       blurRadius: 3.0,
                      //       spreadRadius: 1.0,
                      //       offset: Offset(2.0, 2.0))
                      // ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0),),
                      child: Image.network(
                        imageaddress ,
                        height:  MediaQuery.of(context).size.height*0.32,
                        width:  MediaQuery.of(context).size.width*0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Quantity ",
                          style: TextStyle(
                            color: headingColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height*0.015,/////////
                          ),
                        ),
                        Text(
                          quantity,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height*0.015,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.005),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Price ",
                          style: TextStyle(
                            color: headingColor,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height*0.015,
                          ),
                        ),
                        Text(
                           price,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height*0.015/////////
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.005),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: null,
                      style: buttonStyle,
                      child: const Text(
                        "Contact Seller",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),],
      ),
      )
      //ProductDetails(p: productname, pr: price, q: quantity, i: imageaddress, ),
    );
    // TODO: implement build
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

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