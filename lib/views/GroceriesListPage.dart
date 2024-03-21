import 'package:flutter/material.dart';
import '../modul/groceries.dart';
import 'package:quiz_123190080_praktpm/views/GroceriesDetailPage.dart';

class GroceriesListPage extends StatelessWidget {
  GroceriesListPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Groceries Quiz TPM IF-E'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      child: Image.network(groceries.productImageUrls[0],
                          fit: BoxFit.cover),
                    ),
                    Text(groceries.name),
                  ],
                ),
              ));
        },
        itemCount: groceryList.length,
      ),
    );
  }
}
