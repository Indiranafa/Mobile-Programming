import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'displaypicture_screen.dart';
import 'filter_carousel.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720001')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error initializing camera: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final navigator = Navigator.of(context);
          final messenger = ScaffoldMessenger.of(context);

          try {
            await _initializeControllerFuture;
            final XFile image = await _controller.takePicture();

            if (!mounted) return;

            // Show the taken picture first
            await navigator.push(MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(imagePath: image.path),
            ));

            if (!mounted) return;

            // If this screen was pushed from another screen, return the image
            // path to the caller. If this screen is the app's root (home),
            // opening the previous route would close the app — instead,
            // directly open the PhotoFilterCarousel to apply filters.
            if (navigator.canPop()) {
              navigator.pop(image.path);
            } else {
              // Open filter carousel with the captured image
              await navigator.push(MaterialPageRoute(
                builder: (context) => PhotoFilterCarousel(imagePath: image.path),
              ));
            }
          } catch (e, st) {
            // ignore: avoid_print
            print('Error taking picture: $e\n$st');
            if (!mounted) return;
            messenger.showSnackBar(SnackBar(content: Text('Error taking picture: $e')));
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
