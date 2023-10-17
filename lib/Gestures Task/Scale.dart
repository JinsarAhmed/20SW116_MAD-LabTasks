import 'package:flutter/material.dart';

// tasks done by 20sw116

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ImageZoomDemo(),
  ));
}

class ImageZoomDemo extends StatefulWidget {
  const ImageZoomDemo({super.key});

  @override
  _ImageZoomDemoState createState() => _ImageZoomDemoState();
}

class _ImageZoomDemoState extends State<ImageZoomDemo> {
  double _scale = 1.0;
  double _baseScale = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _baseScale = _scale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Zoom Demo'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: GestureDetector(
          onScaleStart: _onScaleStart,
          onScaleUpdate: (details) {
            setState(() {
              _scale = _baseScale * details.scale;
            });
          },
          onDoubleTap: () {
            setState(() {
              _scale = _scale == 1.0 ? 2.0 : 1.0;
            });
          },
          child: Transform.scale(
            scale: _scale,
            child: Image.asset('assets/images/pic3.png'),
          ),
        ),
      ),
    );
  }
}
