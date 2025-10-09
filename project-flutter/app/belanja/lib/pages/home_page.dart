import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Sugar', 
        price: 5000,
        imageUrl: 'assets/images/sugar.jpg',
        stock: 50,
        rating: 4.5,
      ),
      Item(
        name: 'Salt', 
        price: 2000,
        imageUrl: 'assets/images/salt.jpg',
        stock: 30,
        rating: 4.2,
      ),
      Item(
        name: 'Rice', 
        price: 15000,
        imageUrl: 'assets/images/rice.jpg',
        stock: 20,
        rating: 4.8,
      ),
      Item(
        name: 'Cooking Oil', 
        price: 12000,
        imageUrl: 'assets/images/oil.jpg',
        stock: 15,
        rating: 4.3,
      ),
      Item(
        name: 'Flour', 
        price: 8000,
        imageUrl: 'assets/images/flour.jpg',
        stock: 25,
        rating: 4.1,
      ),
      Item(
        name: 'Milk', 
        price: 6000,
        imageUrl: 'assets/images/milk.jpg',
        stock: 40,
        rating: 4.6,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List - GoRouter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildItemCard(context, item);
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Text(
          'Indira Nafa Aurah Huda - 2341720001 | GoRouter Version',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, Item item) {
    Map<String, IconData> itemIcons = {
      'Sugar': Icons.grain,
      'Salt': Icons.scatter_plot,
      'Rice': Icons.rice_bowl,
      'Cooking Oil': Icons.oil_barrel,
      'Flour': Icons.bakery_dining,
      'Milk': Icons.local_drink,
    };

    Map<String, Color> itemColors = {
      'Sugar': Colors.pink[100]!,
      'Salt': Colors.grey[100]!,
      'Rice': Colors.brown[100]!,
      'Cooking Oil': Colors.yellow[100]!,
      'Flour': Colors.orange[100]!,
      'Milk': Colors.blue[100]!,
    };

    return InkWell(
      onTap: () {
        // GoRouter navigation dengan extra parameter
        context.go('/item', extra: item);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Hero(
                tag: item.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: itemColors[item.name] ?? Colors.grey[100],
                          ),
                          child: Icon(
                            itemIcons[item.name] ?? Icons.shopping_bag,
                            size: 50,
                            color: Colors.grey[700],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Rp ${item.price}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 14),
                            SizedBox(width: 2),
                            Text(
                              '${item.rating}',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        Text(
                          'Stock: ${item.stock}',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey[600],
                          ),
                        ),
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