import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Demo')),
      body: const Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text('BUY TICKETS'),
                    onPressed: null,
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    child: Text('LISTEN'),
                    onPressed: null,
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}