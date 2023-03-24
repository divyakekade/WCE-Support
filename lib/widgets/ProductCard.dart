import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
class ProductCard extends StatelessWidget implements PreferredSizeWidget {

  const ProductCard({Key? key,
    required this.imagename,
    required this.productname,
  })
      : super(key: key);

  final String imagename;
  final String productname;

  Widget build(BuildContext context) {
    double heightc = MediaQuery.of(context).size.width * 0.05;
    double imgh = MediaQuery.of(context).size.width * 0.35;
    double hc = MediaQuery.of(context).size.height * 0.20;
      return Container(
        height: hc,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: grey_color,

          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 7.0,
                spreadRadius: 3.0,
                offset: Offset(3.0, 3.0)

            )
          ],
        ),
        child: Row(
          children: [
            //iamge
            Container(
              width: imgh,
              height: imgh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),

              ),
              margin: const EdgeInsets.all(2),
              child: const Image(
                image: AssetImage('assets/lem.jpg'),
              ),

            ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    SizedBox(height: heightc/2),
                     Container(
                       margin: EdgeInsets.all(heightc/3),
                       padding: EdgeInsets.all(heightc/3),
                       child: Text(productname,
                           style: TextStyle(
                             fontSize: heightc,
                             color: heading_color,
                             fontWeight: FontWeight.bold,
                           ),
                        ),
                     ),
                    SizedBox(height: heightc/2),
                Container(
                  margin: EdgeInsets.only(top: heightc, bottom: heightc/3),
                  child: ElevatedButton(
                      onPressed: () {
                        print("name");
                      },
                      child: Text(
                        "View Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        textStyle: TextStyle(fontSize: heightc),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                      ),
                    ),
                ),

                  ],
                ),
              ),
            ),
          ],
        )
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

}