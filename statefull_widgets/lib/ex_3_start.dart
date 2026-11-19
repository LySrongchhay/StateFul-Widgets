import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() {
  return runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: ImagePage()),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () => {previousImage()},
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () => {nextImage()},
            ),
          ),
        ],
      ),
      body: Image.asset(images[imageIndex]),
    );
  }

  void nextImage() {
    imageIndex++;
    setState(() {
      imageIndex = imageIndex % images.length;
    });
  }

  void previousImage() {
    imageIndex--;
    setState(() {
      imageIndex = ( imageIndex == -1)? images.length - 1 : imageIndex;
    });
  }
}
