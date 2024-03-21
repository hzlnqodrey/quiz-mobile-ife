import 'package:flutter/material.dart';
import '../modul/groceries.dart';
import 'package:quiz_123190080_praktpm/views/GroceriesDetailPage.dart';

class GroceriesListPage extends StatelessWidget {
  GroceriesListPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceries Quiz TPM IF-E'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 5,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          final Groceries groceries = groceryList[index];
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GroceriesDetailPage(groceries: groceries);
                }));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 160,
                        child: Image.network(groceries.productImageUrls[0],
                            fit: BoxFit.cover),
                      ),
                      Expanded(
                        child: Text(
                          groceries.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Rp. " + groceries.price,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            " Diskon " + groceries.discount + " ",
                            style: TextStyle(
                                backgroundColor: Colors.red,
                                color: Colors.white,
                                wordSpacing: BorderSide.strokeAlignCenter),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: List.generate(
                            5,
                            (index) {
                              if (index.toDouble() <
                                  double.parse(groceries.reviewAverage)) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                );
                              } else {
                                return Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
        itemCount: groceryList.length,
      ),
    );
  }
}
