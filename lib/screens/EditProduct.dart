import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/BuyProducts.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleUserPastGrievnaces.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';

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
   String productName="";
   int productQuantity=0;
   String productPrice="";
   String productImage=""; 

   saveDetails()async{
    print(productName);
    print(productPrice);
    print(productQuantity);
    try {
      dynamic user =  Provider.of<Auth>(context, listen: false).user;
      await Provider.of<Prod>(context, listen: false)
          .updateProduct(productName, "Good product", productQuantity.toString(), productPrice, user['_id'] ,widget.product[4]);
      showCustomSnackbar(1, "Details updated successfully!", context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SideMenuNavigation(loadedPage: 'create_user')));
    } catch (e) {
      showErrorDialogBox2(e.toString(), context);
    }
   }

   @override
   void initState() {
    super.initState();
    productName=widget.product[0].toString();
    productPrice=widget.product[1].toString();
    productQuantity=int.parse(widget.product[2].toString());
    productImage=widget.product[3].toString();
  }
  
   @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
        appBar: const Appbar(),
        backgroundColor: backgroundColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width10*1),
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
                          color: Color.fromARGB(255, 247, 246, 246),
                          border: Border.all(
                              color: Color.fromARGB(255, 7, 65, 79), width: 1),
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: const [
                          //   BoxShadow(
                          //       color: Colors.grey,
                          //       blurRadius: 10.0,
                          //       spreadRadius: 2.0,
                          //       offset: Offset(2.0, 5.0))
                          // ],
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
                                child: Text("Edit your product details below",
                                style: TextStyle(
                                    fontSize:  MediaQuery.of(context).size.height * 0.018),
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
                              //password
                              TextFormField(
                                initialValue: productQuantity.toString(),
                                onChanged: (q){
                                  setState(() {
                                    productQuantity=int.parse(q);
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
                                initialValue: productPrice.toString(),
                                onChanged: (pr){
                                  setState(() {
                                    productPrice=pr;
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
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
                              productImage,
                              height: MediaQuery.of(context).size.height * 0.32,
                              width: MediaQuery.of(context).size.width * 0.6,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),

                              //button
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width * 0.039,
                                    vertical: MediaQuery.of(context).size.height * 0.014),
                               child: ElevatedButton(
                                        onPressed: (){},
                                        style: secondButtonStyle,
                                        child: Text(
                                          "Add Image",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width * 0.04),
                                        )),
                              ),
                              SizedBox(
                                height: width10 * 2,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: saveDetails,
                                  style: buttonStyle,
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context).size.height * 0.025
                                    ),
                                  ),
                                ),
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