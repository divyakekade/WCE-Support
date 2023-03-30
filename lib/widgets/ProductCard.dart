import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';

class ProductCard extends StatelessWidget implements PreferredSizeWidget {
  const ProductCard({
    Key? key,
    required this.imagename,
    required this.productname,
  }) : super(key: key);

  final String imagename;
  final String productname;

  Widget build(BuildContext context) {
    double widthc = MediaQuery.of(context).size.width * 0.05;
    double imgh = MediaQuery.of(context).size.height * 0.16;
    double hc = MediaQuery.of(context).size.height * 0.20;
    return Container(
        height: hc,
        margin: EdgeInsets.all(widthc),
        padding: EdgeInsets.symmetric(horizontal: widthc),
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 7.0,
                spreadRadius: 3.0,
                offset: Offset(3.0, 3.0))
          ],
        ),
        child: Row(
          children: [
            //iamge
            Container(
              height: imgh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: const Image(
                image: AssetImage('assets/lem.jpg'),
              ),
            ),
            SizedBox(width: widthc),
            Expanded(
              child: Container(
                height: imgh,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        productname,
                        style: TextStyle(
                          fontSize: imgh / 7, /////////////////
                          color: headingColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: imgh / 2.5,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          print("name");
                        },
                        child: Text(
                          "View Details",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          textStyle:
                              TextStyle(fontSize: imgh / 7), /////////////
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          //  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
