//make classname same as that of the file name
import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/ProductCard.dart';
class SellProduct extends StatefulWidget {
  const SellProduct({super.key});

  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
   late String productname;
   late int quantity;
   late double price;

   final _ProductnameController = TextEditingController();
   final _quantityController = TextEditingController();
   final _priceController = TextEditingController();

   @override
   void dispose() {
    _ProductnameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
     super.dispose();
   }


   @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width10*2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.0052,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    decoration: headingBoxDecoration,

                    child: Center(
                      child: Text(
                        'Add Your Product',
                        style: headingTextStyle,
                      ),
                    ),
                  ),
                ),
                  ////
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: heightc / 2, horizontal: width10 * 2),
                    margin: EdgeInsets.symmetric(horizontal: width10),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(2.0, 5.0))
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: width10 * 2,
                          ),
                          TextField(
                            controller: _ProductnameController,
                            decoration: const InputDecoration(
                              hintText: 'product name',
                              border: UnderlineInputBorder(),
                            ),
                          ),

                          SizedBox(
                            height: width10 * 2,
                          ),
                          //password
                          TextField(
                            controller: _quantityController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'quantity',
                            ),
                          ),
                          SizedBox(
                            height: width10 * 2,
                          ),
                          //password
                          TextField(
                            controller: _priceController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'price',
                            ),
                          ),

                          SizedBox(
                            height: width10 * 2,
                          ),
                          //button
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.039,
                                vertical: MediaQuery.of(context).size.height * 0.014),
                           child: ElevatedButton(
                                    onPressed: null,
                                    style: secondButtonStyle,
                                    child: Text(
                                      "Add Image",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05),
                                    )),
                          ),
                          SizedBox(
                            height: width10 * 4,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                              onPressed: null,
                              style: buttonStyle,
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width10 * 2,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Your recent products",
                    style: TextStyle(
                        fontSize: width10*2,
                    )),
                  ),
                  const Divider(height: 1, thickness: 2, color: Colors.grey),

                  
               ],
              ),
            ),
          ),
        ),
    );
  }
}