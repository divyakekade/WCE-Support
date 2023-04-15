import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/DetailPage.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({super.key});

  @override
  State<FavouriteProducts> createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 238, 245, 248),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints contraints) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.012),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.0052,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                decoration: headingBoxDecoration,
                child: Text(
                  'Your Favourite Products',
                  style: headingTextStyle,
                ),
              ),
              const Divider(height: 1, thickness: 2, color: Colors.grey),
              Expanded(
                  child: Container(
                      //  color: Color.fromARGB(255, 238, 245, 248),
                      color: backgroundColor,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.016,),
                            const GridB(),
                            SizedBox(height: MediaQuery.of(context).size.height*0.016,),
                          ],
                        ),
                      ))),
            ],
          );
        }),
      );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}
class _GridBState extends State<GridB> {
  final List<dynamic> gridMap = [
    {
      "title": "white T-shirt",
      "price": "500 Rs",
      "quantity": "2",
      "images":
          "https://tse3.mm.bing.net/th?id=OIP.fvoD8omL8_A_PuPqA8LFVAHaJQ&pid=Api&P=0"
    },
    {
      "title": "Black shoes",
      "price": "600 Rs",
      "quantity": "3",
      "images":
          "https://tse2.mm.bing.net/th?id=OIP.YWLqzwgxHxFZSlDSM1uMtAHaHn&pid=Api&P=0"
    },
    {
      "title": "black jeans",
      "price": "1000 Rs",
      "quantity": "1",
      "images":
          "https://tse3.mm.bing.net/th?id=OIP.HaH7d1nBe8h3edK3V-KzNgHaLH&pid=Api&P=0"
    },
    {
      "title": "walakar cooler",
      "price": "2000 Rs",
      "quantity": "4",
      "images":
          "https://tse3.mm.bing.net/th?id=OIP.rg5SaZIq0C5EKydX4O1g9wHaHC&pid=Api&P=0"
    },
    {
      "title": "Scale or ruler",
      "price": "100 rs",
      "quantity": "2",
      "images":
          "https://images-na.ssl-images-amazon.com/images/I/81akp8ODxVL._SL1500_.jpg"
    },
    {
      "title": "cooking pot",
      "price": "300 Rs",
      "quantity": "2",
      "images":
          "https://tse4.mm.bing.net/th?id=OIP.oEhZWwkb0aHEYVWH7UamgAHaHa&pid=Api&P=0"
    },
    {
      "title": "os book(galvin)",
      "price": "250 Rs",
      "quantity": "2",
      "images":
          "https://tse4.mm.bing.net/th?id=OIP.NRf637IxJAgcBP_u6h1zLgHaD4&pid=Api&P=0"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: MediaQuery.of(context).size.width * 0.02 ,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.30,
        ),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(product:gridMap[index])));
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.001),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.033,
                vertical: MediaQuery.of(context).size.height * 0.015,
              ),
              decoration: BoxDecoration(
                //  border: Border.all(width: 0, color: const Color(0x7960c5e1)),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 198, 198, 198),
                      blurRadius: 4,
                      offset: Offset(3.5, 4.5))
                ],
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                color: const Color(0x7960c5e1),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                      "${gridMap.elementAt(index)['images']}",
                      alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.20,
                        fit: BoxFit.fill,
                    ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "${gridMap.elementAt(index)['title']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height*0.001,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: headingColor),
                        borderRadius: BorderRadius.circular(4),
                        color: greyColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rs. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ),
                          Text(
                            "${gridMap.elementAt(index)['price']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
