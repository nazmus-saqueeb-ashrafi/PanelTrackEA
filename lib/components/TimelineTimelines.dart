import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import '../utils/GlobalFunctions.dart';

class TimelineTimelines extends StatelessWidget {
  TimelineTimelines({Key? key, required this.padding}) : super(key: key);

  final double padding;

  final List<Map?>? apiData =
  [
    {
      "text1": "15 Aug 2022",
      "text2": "12:24 am",
      "text3": "Delivery Pending",
      "messages": null,
      "nodeColor": null,
    },
    {
      "text1": "15 Aug 2022",
      "text2": "12:24 am",
      "text3":
      "Parcel transfer to nearest hub in (Khilgaon Office). Go to head office. ",
      "messages": [
        "Delivery Run Attempt 1,Rider Momen miah 199287837723",
        "Delivery Run Attempt 1,Rider Sujon miah 199287837723",
        "Delivery successfully by Sujon Miah"
      ],
      "nodeColor": null,
    },
    {
      "text1": "15 Aug 2022",
      "text2": "12:24 am",
      "text3": "Delivery Complete",
      "messages": null,
      "nodeColor": Color(0xFF0B4461),
    }
  ];



  @override
  Widget build(BuildContext context) {

    final apiLength = apiData?.length ?? 0;

    List<Widget> iterateItems() {
      List<Widget> items = [];
      for (var i = 0; i < apiLength; i++) {
        var item = SingleRow(
          text1: apiData![i]!["text1"].toString(),
          text2: apiData![i]!["text2"].toString(),
          text3: apiData![i]!["text3"].toString(),
          start: i == 0 ? true : false,
          end: i == apiLength - 1 ? true : false,
          messages: apiData![i]!["messages"],
          nodeColor: apiData![i]!["nodeColor"] ,
          internalPadding: padding, // getting this using a constructor
        );
        items.add(item);
      }

      return items;
    }


    return Column(
      children: iterateItems(),
      // const [
      //   SingleRow(
      //     text1: "15 Aug 2022",
      //     text2: "12:24 am",
      //     text3:
      //         "Parcel transfer to nearest hub in (Khilgaon Office). Go to head office. ",
      //     start: false,
      //     end: false,
      //     messages: [
      //       "Delivery Run Attempt 1,Rider Momen miah 199287837723",
      //       "Delivery Run Attempt 1,Rider Sujon miah 199287837723",
      //       "Delivery successfil by Sujon Miah"
      //     ],
      //     nodeColor: null,
      //     internalPadding: 10,
      //   ),
      // ],
    );
  }
}

class SingleRow extends StatelessWidget {
  const SingleRow({
    Key? key,
    required this.text1, // Date
    required this.text2, // Time
    required this.text3, // Delivery status
    required this.start,
    required this.end,
    required this.messages, // inner messages
    required this.nodeColor,
    required this.internalPadding,

  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final List<String?>? messages;
  final bool start;
  final bool end;
  final Color? nodeColor;
  // nodeIcon
  final double internalPadding;


  @override
  Widget build(BuildContext context) {
    final padding =
        globalSize(internalPadding, MediaQuery.of(context).size.width);


    final mLength = messages?.length ?? 0;

    List<Widget> iterateInnerItems() {
      List<Widget> items = [];
      for (var i = 0; i < mLength; i++) {
        var item = SingleInnerRow(
          text3: messages![i].toString(),
          start: i == 0 ? true : false,
          end: i == mLength - 1 ? true : false,
          internalPadding: 10,
        );

        items.add(item);
      }

      return items;
    }

    return TimelineTile(
      nodePosition: 0.3,
      oppositeContents: Padding(
        padding: EdgeInsets.all(padding*1.1),
        child: Text(
          '$text1\n$text2',
          style: TextStyle(
            fontSize: (padding * 1.2),
          ),
        ),
      ),
      contents: Column(
        children: mLength > 0
            ? iterateInnerItems()
            : [
                Padding(
                  padding: EdgeInsets.all(padding*1.1),
                  child: Text('$text3',style: TextStyle(
                    fontSize: (padding * 1.2),
                  ),),
                )
              ],
      ),
      node: TimelineNode(
        indicator: OutlinedDotIndicator(
          borderWidth: padding*0.2,
          size: padding*3 ,
          color: nodeColor != null ? Color(0xFF0B4461) : Colors.black26,
          backgroundColor: nodeColor != null ? Color(0xFF0B4461) : Colors.white,
          child: Icon(
            Icons.delivery_dining,
            size: padding*2,
            color: nodeColor != null ? Colors.white : Color(0xFF0B4461),
          ),
        ),
        startConnector: start
            ? null
            : SolidLineConnector(
                thickness: padding*0.2,
                color: Colors.black26,
                space: padding*2,
              ),
        endConnector: end
            ? null
            : SolidLineConnector(
                thickness: padding*0.2,
                color: Colors.black26,
                space: padding*2,
              ),
      ),
    );
  }
}

class SingleInnerRow extends StatelessWidget {
  const SingleInnerRow({
    Key? key,
    required this.text3,
    required this.start,
    required this.end,
    required this.internalPadding,

  }) : super(key: key);

  final String text3;
  final bool start;
  final bool end;
  final double internalPadding;



  @override
  Widget build(BuildContext context) {

    final padding =
    globalSize(internalPadding, MediaQuery.of(context).size.width);

    return TimelineTile(
      nodePosition: 0.1,
      oppositeContents: null,
      contents: Container(
        padding: EdgeInsets.all(padding*1.5), // 15
        child: Padding(
          padding: EdgeInsets.only(right: padding*1.5), // 20
          child: Text('$text3',style: TextStyle(
            fontSize: (padding * 1.2),
          ),),
        ),
      ),
      node: TimelineNode(
        indicator: DotIndicator(
          color: Color(0xFF0B4461),
          size: padding*1.2,
        ),
        startConnector: start
            ? null
            : SolidLineConnector(
                thickness: padding*0.3,
                color: Colors.black26,
              ),
        endConnector: end
            ? null
            : SolidLineConnector(
                thickness: padding*0.3,
                color: Colors.black26,
              ),
      ),
    );
  }
}
