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

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.0052,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              decoration: headingBoxDecoration,
              child: Text(
                'Pick Up Your Choice',
                style: headingTextStyle,
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
      debugShowCheckedModeBanner: false,
    );
  }
}
