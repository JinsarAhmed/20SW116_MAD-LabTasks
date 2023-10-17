import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SwipeImages()));
}

class SwipeImages extends StatelessWidget {
  final List<String> images = [
    "assets/images/pic1.png",
    "assets/images/pic2.png",
    "assets/images/pic3.png",
    "assets/images/pic4.png",
  ];

  SwipeImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: InteractiveViewer(
        child: Center(
            child: SizedBox.fromSize(
          size: const Size.fromHeight(700.0),
          child: PageView.builder(
            controller: PageController(viewportFraction: 1.0),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 5.0,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      images[index],
                    ),
                  ],
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}
