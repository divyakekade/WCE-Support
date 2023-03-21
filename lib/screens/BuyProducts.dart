//make classname same as that of the file name
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/ProductCard.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
class BuyProducts extends StatefulWidget {
  const BuyProducts({super.key});

  @override
  State<BuyProducts> createState() => _BuyproductState();

}

class _BuyproductState extends State<BuyProducts> {

  @override
  Widget build(BuildContext context) {
    double heightc = MediaQuery.of(context).size.width * 0.053;
    double width10 = MediaQuery.of(context).size.width * 0.025;
    return MaterialApp(
      home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: width10*3),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: grey_color,
                        ),
                        BoxShadow(
                          offset: Offset(5, 2),
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: Colors.black38,
                          inset: true,
                        ),
                      ],
                    ),
                    child: Text(
                      "Pick Up Your Choise",
                      style: TextStyle(
                        fontSize: heightc,
                        fontWeight: FontWeight.bold,
                        color: heading_color,
                      ),

                    ),
                  ),
                ),
                 Expanded(
                   child: ListView(
                     children: [
                        ProductCard(imagename: "mas", productname: "Product Name"),
                       ProductCard(imagename: "mas", productname: "Product Name"),
                       ProductCard(imagename: "mas", productname: "Product Name"),
                       ProductCard(imagename: "mas", productname: "Product Name"),
                       ProductCard(imagename: "mas", productname: "Product Name"),
                     ],
                   ),
                 )
                ],
            ),
          ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}