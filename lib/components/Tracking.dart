import 'package:final_parcel_track/utils/GlobalFunctions.dart';
import 'package:flutter/material.dart';

class Tracking extends StatelessWidget {
  const Tracking({
    Key? key,
    required this.boxWidth,
    required this.boxHeight,
    required this.internalPadding,
    required this.borderRadius,
    required this.textUpper,
    required this.textLower,
  }) : super(key: key);

  final double boxWidth;
  final double boxHeight;
  final double internalPadding;
  final double borderRadius;
  final String textUpper;
  final String textLower;

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
            SizedBox(height: padding),
            Text(
              textUpper,
              style: TextStyle(fontSize: (25 *padding/25)  ),
            ),
            SizedBox(height: padding * 2),
            Text(
              textLower,
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

