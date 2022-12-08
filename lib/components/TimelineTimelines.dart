import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimelineTimelines extends StatelessWidget {
  const TimelineTimelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SingleRow(text1: "15 Aug 2022",
          text2:"12:24 am",
          text3: "Delivery Complete",
          start: true,
          end: false,
        ),
        ComplexSingleRow(
            text1: "9 Aug 2022",
            text2: "9:00am",
            text3: "should be an object of 2 texts",
            start: false,
            end: false),
        SingleRow(text1: "15 Aug 2022",
          text2:"12:24 am",
          text3: "Parcel transfer to nearest hub in (Khilgaon Office). Go to head office. ",
          start: false,
          end: false,
        ),
        SingleRow(text1: "15 Aug 2022",
          text2:"12:24 am",
          text3: "Parcel transfer to nearest hub in (Khilgaon Office). Go to head office. ",
          start: false,
          end: false,
        ),
        SingleRow(text1: "15 Aug 2022",
          text2:"12:24 am",
          text3: "Delivery Complete",
          start: false,
          end: true,
        ),
      ],
    );
  }
}

class SingleInnerRow extends StatelessWidget {
  const SingleInnerRow({
    Key? key,

    required this.text3,
    required this.start,
    required this.end,
  }) : super(key: key);


  final String text3;
  final bool start;
  final bool end;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      nodePosition: 0.1,
      oppositeContents: null,
      contents:
      Container(

        padding: EdgeInsets.all(18.0),
        child: Padding(
          padding: const EdgeInsets.only(right:30),
          child: Text('$text3'),
        ),
      ),

      node: TimelineNode(
        indicator: DotIndicator(

          color: Colors.black26,

        ),
        startConnector: start? null:SolidLineConnector(
          thickness: 3,
          color: Colors.black26 ,
        ),
        endConnector: end? null:SolidLineConnector(
          thickness: 3,
          color: Colors.black26,
        ),
      ),
    );
  }
}




class ComplexSingleRow extends StatelessWidget {
  const ComplexSingleRow({Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.start,
    required this.end
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final bool start;
  final bool end;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      nodePosition: 0.3,
      oppositeContents: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text('$text1\n$text2'),
      ),
      contents: Container(
          padding: EdgeInsets.all(8.0),
          child:  Column(
            children: [
              SizedBox(height: 50,),
              SingleInnerRow(text3: "Delivery attempt by monju, Delivery attempt by monju",start: true,end: false,),
              SingleInnerRow(text3: "Delivery attempt by monju",start: false,end: true,),
            ],
          )
        ),

      node: TimelineNode(
        indicator: OutlinedDotIndicator(
          borderWidth: 3,
          color: Colors.black26,
          child: Icon(
            Icons.delivery_dining,
            color: Color(0xFF0B4461),
          ),
        ),
        startConnector: start? null:SolidLineConnector(
          thickness: 3,
          color: Colors.black26 ,
        ),
        endConnector: end? null:SolidLineConnector(
          thickness: 3,
          color: Colors.black26,
        ),
      ),
    );
  }
}


class SingleRow extends StatelessWidget {
  const SingleRow({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.start,
    required this.end,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final bool start;
  final bool end;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      nodePosition: 0.3,
      oppositeContents: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text('$text1\n$text2'),
      ),
      contents:
      Container(

          padding: EdgeInsets.all(18.0),
          child: Padding(
            padding: const EdgeInsets.only(right:30),
            child: Text('$text3'),
          ),
        ),

      node: TimelineNode(
        indicator: OutlinedDotIndicator(
          borderWidth: 3,
          color: Colors.black26,
          child: Icon(
            Icons.delivery_dining,
            color: Color(0xFF0B4461),
          ),
        ),
        startConnector: start? null:SolidLineConnector(
          thickness: 3,
          color: Colors.black26 ,
        ),
        endConnector: end? null:SolidLineConnector(
          thickness: 3,
          color: Colors.black26,
        ),
      ),
    );
  }
}

