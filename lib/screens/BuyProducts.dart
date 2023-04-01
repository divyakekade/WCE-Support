//make classname same as that of the file name
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/DetailPage.dart';
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
       // backgroundColor: Color.fromARGB(255, 238, 245, 248),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints contraints){
            return Column(
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
            // Expanded(
            //   child: ListView(
            //     children: [
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //     ],
            //   ),
            // )
            const Divider(height: 1, thickness: 2, color: Colors.grey),
            Expanded(
                child: Container(
                   color: Color.fromARGB(255, 238, 245, 248),
                    child: GridB())),
            ],
            );
            
          }
          
          ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "white T-shirt rty vbnmd,fc  djkzl; oihgm",
      "price": "500 Rs",
      "quantity" : "2",
      "images": "https://tse3.mm.bing.net/th?id=OIP.fvoD8omL8_A_PuPqA8LFVAHaJQ&pid=Api&P=0"
      },
    {
      "title": "Black shoes",
      "price": "600 Rs",
      "quantity" : "3",
      "images": "https://tse2.mm.bing.net/th?id=OIP.YWLqzwgxHxFZSlDSM1uMtAHaHn&pid=Api&P=0"
       },
    {
      "title": "black jeans",
      "price": "1000 Rs",
      "quantity" : "1",
      "images": "https://tse3.mm.bing.net/th?id=OIP.HaH7d1nBe8h3edK3V-KzNgHaLH&pid=Api&P=0"},
    {
      "title": "walakar cooler",
      "price": "2000 Rs",
      "quantity" : "4",
      "images": "https://tse3.mm.bing.net/th?id=OIP.rg5SaZIq0C5EKydX4O1g9wHaHC&pid=Api&P=0" },
    {
      "title": "Scale or ruler",
      "price": "100 rs",
      "quantity" : "2",
      "images": "https://images-na.ssl-images-amazon.com/images/I/81akp8ODxVL._SL1500_.jpg" },
    {
      "title": "cooking pot",
      "price": "300 Rs",
      "quantity" : "2",
      "images": "https://tse4.mm.bing.net/th?id=OIP.oEhZWwkb0aHEYVWH7UamgAHaHa&pid=Api&P=0" },
    {
      "title": "os book(galvin)",
      "price": "250 Rs",
      "quantity" : "2",
      "images": "https://tse4.mm.bing.net/th?id=OIP.NRf637IxJAgcBP_u6h1zLgHaD4&pid=Api&P=0" }
  ];
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
         // crossAxisSpacing: MediaQuery.of(context).size.width * 0.02 ,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.30,
        ),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  DetailPage(
                      productname:  "${gridMap.elementAt(index)['title']}",
                      price:  "${gridMap.elementAt(index)['price']}",
                      quantity: "${gridMap.elementAt(index)['quantity']}",
                      imageaddress:  "${gridMap.elementAt(index)['images']}",
                  )
              ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.001),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: imagebutton,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      offset: Offset(2.0, 5.0))
                ],
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                color: greyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: Image.network(
                      "${gridMap.elementAt(index)['images']}",
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${gridMap.elementAt(index)['title']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height:  MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "${gridMap.elementAt(index)['price']}",
                            style: TextStyle(
                            fontWeight: FontWeight.bold
                            ),
                                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
