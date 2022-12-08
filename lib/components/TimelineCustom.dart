import 'package:flutter/material.dart';

import '../utils/GlobalFunctions.dart';

class TimelineCustom extends StatelessWidget {
  const TimelineCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTimeline(
          internalPadding: 9,
          start: true,
          boxWidth: 100,
          boxHeight: 25,
          end: false,
        ),
        RowTimeline(
          internalPadding: 9,
          start: false,
          boxWidth: 100,
          boxHeight: 25,
          end: false,
        ),
        RowTimeline(
          internalPadding: 9,
          start: false,
          boxWidth: 100,
          boxHeight: 25,
          end: false,
        ),
        RowTimeline(
          internalPadding: 9,
          start: false,
          boxWidth: 100,
          boxHeight: 25,
          end: true,
        ),
      ],
    );
  }
}

class RowTimeline extends StatelessWidget {
  const RowTimeline({
    Key? key,
    required this.internalPadding,
    required this.start,
    required this.boxWidth,
    required this.boxHeight,
    required this.end,
  }) : super(key: key);

  final bool start;
  final bool end;
  final double internalPadding;
  final double boxWidth;
  final double boxHeight;

  @override
  Widget build(BuildContext context) {
    final padding =
        globalSize(internalPadding, MediaQuery.of(context).size.width);
    final width = globalSize(boxWidth, MediaQuery.of(context).size.width);
    final height = globalSize(boxHeight, MediaQuery.of(context).size.width);

    return Container(
      child: Row(
        children: [
          // Column with 2 columns of first text
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                Container(

                  width: width/1.5, // 140
                  height: height * 2.5, //80
                  child: Expanded(
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: start? 0:20,
                        // ),
                        SizedBox(
                          height: end? 40:0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "15 Aug 2022",
                            style: TextStyle(
                              fontSize: (padding *1.2),
                            ),
                          ),
                        ),
                        SizedBox(height: padding/2,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "12:45am",
                            style: TextStyle(
                              fontSize: (padding*1.2),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Column with the line and ball
          Column(

            children: [
              Container(
                width: 3,
                height: start ? 0 : height*2, // start = 0
                color: Colors.black26,
              ),
              Container(
                margin: EdgeInsets.only(),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black26,
                      width: 3,
                    )),
                child: Icon(
                  Icons.delivery_dining,
                  color: Color(0xFF0B4461),
                ),
              ),
              Container(
                width: 3,
                height: end?0:height * 2.5, //60
                color: Colors.black26,
              ),
            ],
          ),

          // Column with 1 columns of second text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: width, // 140
                  height: height * 2.5, //80
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: end? 20:0,
                        ),
                        Container(
                          child: Text(
                            "Parcel transfer to Khilgaon (Nearest Hub)",
                            style: TextStyle(
                              fontSize: (padding *1.2),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
