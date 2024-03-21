import 'package:flutter/material.dart';
import 'package:quiz_123190080_praktpm/modul/groceries.dart';
import 'package:url_launcher/url_launcher.dart';

class GroceriesDetailPage extends StatefulWidget {
  final Groceries groceries;

  const GroceriesDetailPage({super.key, required this.groceries});

  @override
  State<GroceriesDetailPage> createState() => _GroceriesDetailPageState();
}

class _GroceriesDetailPageState extends State<GroceriesDetailPage> {
  bool isLove = true;

  void _LovePressed() {
    if (isLove == true) {
      isLove = false;
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to Favorite'),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.pink,
          ),
        );
      });
    } else {
      isLove = true;
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed from Favorite'),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.grey,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groceries.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: Row(
                children: widget.groceries.productImageUrls.map((imageUrl) {
                  return Expanded(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                widget.groceries.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment
                  .centerLeft, // Add this line to align the text to the left
              child: Text(
                "Rp. " + widget.groceries.price,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment
                  .centerLeft, // Add this line to align the text to the left
              child: Text(
                "Stok: " + widget.groceries.stock,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment
                  .centerLeft, // Add this line to align the text to the left
              child: Text(
                "Diskon: " + widget.groceries.discount,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment
                  .centerLeft, // Add this line to align the text to the left
              child: Text(
                "Toko: " + widget.groceries.storeName,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                widget.groceries.description,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchURL(widget.groceries.productUrl);
                  },
                  child: Text('Beli'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(height: 20.0),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _LovePressed,
        tooltip: 'Favorite',
        child: const Icon(Icons.favorite),
        backgroundColor: isLove ? Colors.grey : Colors.pink,
      ),
    );
  }

  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
