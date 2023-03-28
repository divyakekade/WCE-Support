//make classname same as that of the file name
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/ProductCard.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/widgets/Heading.dart';
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
          body:  Column(

              children: [
                 Heading(HeadingText: "Pick Up Your Choice"),
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
      debugShowCheckedModeBanner: false,
    );
  }
}