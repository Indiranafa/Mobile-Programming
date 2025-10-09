import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;
  
  ItemPage({required this.item}); // Hapus const untuk menghindari error

  @override
  Widget build(BuildContext context) {
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
      'Salt': Colors.grey[200]!,
      'Rice': Colors.brown[100]!,
      'Cooking Oil': Colors.yellow[100]!,
      'Flour': Colors.orange[100]!,
      'Milk': Colors.blue[100]!,
    };
    
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Hero(
              tag: item.name,
              child: Container(
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: itemColors[item.name] ?? Colors.grey[100],
                      ),
                      child: Icon(
                        itemIcons[item.name] ?? Icons.shopping_bag,
                        size: 120,
                        color: Colors.grey[700],
                      ),
                    );
                  },
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  
                  Text(
                    'Rp ${item.price}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  Row(
                    children: [
                      _buildInfoCard(
                        icon: Icons.star,
                        iconColor: Colors.orange,
                        label: 'Rating',
                        value: '${item.rating}/5.0',
                      ),
                      SizedBox(width: 16),
                      _buildInfoCard(
                        icon: Icons.inventory,
                        iconColor: Colors.blue,
                        label: 'Stock',
                        value: '${item.stock} pcs',
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'High quality ${item.name.toLowerCase()} with the best price in the market. Fresh and ready to use for your daily needs.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 32),
                  
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added ${item.name} to cart!')),
                            );
                          },
                          icon: Icon(Icons.shopping_cart),
                          label: Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Buying ${item.name} now!')),
                            );
                          },
                          icon: Icon(Icons.flash_on),
                          label: Text('Buy Now'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Text(
          'Indira Nafa Aurah Huda - 2341720001 | GoRouter',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 24),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}