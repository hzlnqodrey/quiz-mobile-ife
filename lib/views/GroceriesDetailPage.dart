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
              child: Image.network(widget.groceries.productImageUrls[0]),
            ),
            Text(widget.groceries.name),
            Text(widget.groceries.description),
            Text(widget.groceries.price),
            Text(widget.groceries.stock),
            Text(widget.groceries.discount),
            Text(widget.groceries.storeName),
            Text(widget.groceries.reviewAverage),
            ElevatedButton(
              onPressed: () {
                _launchURL(widget.groceries.productUrl);
              },
              child: Text('Beli'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}