import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              child: Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Item Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(itemArgs.name),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Price: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Rp ${itemArgs.price}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}