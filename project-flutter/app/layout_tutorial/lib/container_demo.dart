import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Demo')),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black26,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            child: const Text('Container with decoration'),
          ),
        ),
      ),
    );
  }
}