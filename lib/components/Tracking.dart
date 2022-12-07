import 'package:flutter/material.dart';

class Tracking extends StatelessWidget {
  const Tracking({
    Key? key,
    required this.boxWidth,
    required this.boxHeight,
    required this.internalPadding,
    required this.borderRadius,
  }) : super(key: key);

  final double boxWidth;
  final double boxHeight;
  final double internalPadding;
  final double borderRadius;


  // Calculating aspect ratio based on width of our Figma design
  static double globalSize(double size, double width){
    // size is the size of the Widget in Figma file
    // width is the screen width of the device
    const int figBaseWidth = 360;

    double ratio = size/figBaseWidth;
    return ratio * width;
  }


  @override
  Widget build(BuildContext context) {

    final width = globalSize(boxWidth, MediaQuery.of(context).size.width);
    final height = globalSize(boxHeight, MediaQuery.of(context).size.width);
    final padding = globalSize(internalPadding, MediaQuery.of(context).size.width);


    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
        color: const Color(0xfff4f5f5),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Text(
              "Order tracking information  /",
              style: TextStyle(fontSize: (25 *padding/25)  ),
            ),
            SizedBox(height: padding * 2),
            Text(
              "Tracking ID : 21188289288",
              style: TextStyle(
                fontSize: (25 *padding/25),
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

