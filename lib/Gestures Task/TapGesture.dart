import 'package:flutter/material.dart';

// tasks done by 20sw116
void main() {
  runApp(MaterialApp(
    home: TapGes(),
  ));
}

String img = "assets/images/pic1.png";
String img1 = "assets/images/pic2.png";
String imgTap = "assets/images/pic3.png";
String imgDoubleTap = "assets/images/pic4.png";
String txt = "";

class TapGes extends StatefulWidget {
  const TapGes({super.key});
  @override
  State<TapGes> createState() => _TapGesState();
}

class _TapGesState extends State<TapGes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tap Gestures Task",
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: GestureDetector(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  txt,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  img1,
                ),
              ],
            )),
        onTapDown: (tap) {
          setState(() {
            img = img1;
            txt = "On Tap Down";
          });
        },
        onTap: () {
          setState(() {
            img = imgTap;
            txt = "On Tap";
          });
        },
        onDoubleTap: () {
          setState(() {
            img = imgDoubleTap;
            txt = "On Double Tap";
          });
        },
      ),
    );
  }
}
