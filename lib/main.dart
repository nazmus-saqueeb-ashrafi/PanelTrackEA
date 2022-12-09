import 'package:final_parcel_track/components/package_delivery_tracking.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'components/TimelineCustom.dart';
import 'components/TimelineTimelines.dart';
import 'components/Tracking.dart';
import 'components/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // builder: (context, widget) => ResponsiveWrapper.builder(
      //   widget,
      //   maxWidth: 1200,
      //   minWidth: 480,
      //   defaultScale: true,
      //   breakpoints: [
      //     ResponsiveBreakpoint.resize(480, name: MOBILE),
      //     ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //     ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //     ResponsiveBreakpoint.autoScale(1500, name: 'XL'),
      //   ],
      // ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_outlined),
          title: const Text("Parcel Track"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            // Search(),
            // Tracking(
            //     boxWidth: 400,
            //     boxHeight: 120,
            //     internalPadding: 15,
            //     borderRadius: 17,
            //     textLower: "Order tracking information",
            //     textUpper: "Tracking ID : 21192787773",
            // ),
            SizedBox(
              height: 20,
            ),
            // Timeline(), // with package : timeline tile
            // TimelineCustom(), // with no package
            TimelineTimelines(padding: 10,), // with package : timelines
            // PackageDeliveryTrackingPage(),
            SizedBox(
              height: 20,
            ),
            // Title(titleText: "Client Information"),
            // SizedBox(
            //   height: 0,
            // ),
            // ClientInfoTab(),
            // SizedBox(
            //   height: 20,
            // ),
            // Title(titleText: "Merchant Information"),
            // MerchantInfoTab(),
            // SizedBox(
            //   height: 20,
            // ),
            // Title(titleText: "Assigned to"),
            // AssignedToTab(),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff4f5f5),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tracking updates",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF0B4461),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TimeLineTileWidget(
              textLeft: "15 Aug 2022",
              textLeftBottom: "12:45am",
              textRight: "Delivery Complete",
              isFirst: true,
              isLast: false,
              // iconImage: "assets/images/delivery.png",
            ),
            TimeLineTileWidget(
              textLeft: "15 Aug 2022",
              textLeftBottom: "12:45am",
              textRight:
                  "Delivery Run Attempt 1, Rider: Md. Momin Mia (01273777873)",
              isFirst: false,
              isLast: false,
              // iconImage: "assets/images/delivery.png",
            ),
            TimeLineTileWidget(
              textLeft: "15 Aug 2022",
              textLeftBottom: "12:45am",
              textRight: "Parcel transfer to your nearest hub (Khilgaon Hub)",
              isFirst: false,
              isLast: false,
              // iconImage: "assets/images/delivery.png",
            ),
            TimeLineTileWidget(
              textLeft: "15 Aug 2022",
              textLeftBottom: "12:45am",
              textRight: "Parcel transfer to head office",
              isFirst: false,
              isLast: false,
              // iconImage: "assets/images/delivery.png",
            ),
            TimeLineTileWidget(
              textLeft: "15 Aug 2022",
              textLeftBottom: "12:45am",
              textRight: "Mirpur Hub Received the parcel",
              isFirst: false,
              isLast: false,
              // iconImage: "assets/images/delivery.png",
            ),
            TimeLineTileWidget(
              textLeft: "15 Aug 2022",
              textLeftBottom: "12:45am",
              textRight: "Pickup complete",
              isFirst: false,
              isLast: true,
              // iconImage: "assets/images/delivery.png",
            ),
          ],
        ),
      ),
    );
  }
}

class TimeLineTileWidget extends StatelessWidget {
  const TimeLineTileWidget({
    Key? key,
    required this.textLeft,
    required this.textLeftBottom,
    required this.textRight,
    required this.isFirst,
    required this.isLast,
    // required this.iconImage,
  }) : super(key: key);

  final String textLeft;
  final String textLeftBottom;
  final String textRight;
  final bool isFirst;
  final bool isLast;
  // final String iconImage;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
          // color: Colors.black26,
          height: 30,
          width: 30,
          indicatorXY: 0.01,
          indicator: CircleAvatar(
            backgroundColor: Color(0xFF0B4461),
            // child: Image.asset(iconImage),
          )),
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.manual,
      lineXY: 0.4,
      startChild: Container(
        height: 100,
        width: 150,
        child: Column(
          children: [
            Text(
              textLeft,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              textLeftBottom,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
        child: Container(
          height: 100,
          width: 150,
          child: Column(
            children: [
              Text(
                textRight,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF0B4461),
        ),
        color: const Color(0xFF0B4461),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titleText,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 240, 240, 240),
              backgroundColor: Color(0xFF0B4461),
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

class AssignedToTab extends StatelessWidget {
  const AssignedToTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff4f5f5),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(Icons.airport_shuttle),
                            ),
                          ),
                          TextSpan(text: 'By Michael'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Md. Momin Miah",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Phone No  :",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0B4461),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "0112343847",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Zone  :",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0B4461),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Not Assigned",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MerchantInfoTab extends StatelessWidget {
  const MerchantInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff4f5f5),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Merchant Name  :",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0B4461),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Md. "
                    "Habib",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Merchant Phone No  :",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0B4461),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "01888727622",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Merchant Office Name  :",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0B4461),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Habib Enterprise",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClientInfoTab extends StatelessWidget {
  const ClientInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff4f5f5),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Panel Create  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "November 24, 2022 1:12:18 am",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Payment Type  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: RichText(
                  maxLines: 1,
                  text: TextSpan(
                    text: 'COD: ৳ 2080 ',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Pending',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber)),
                    ],
                  ),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Divider(
                color: Colors.black,
                thickness: 1.1,
              ),
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "ID  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "1701727663",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Invoice  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "N/A",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Tracking Code  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "1023898381D3G",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Divider(
                color: Colors.black,
                thickness: 1.1,
              ),
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Client Name  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "Fahim the Hasib",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Address  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "tejgaon 405 industrial area near 24 channel",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Phone Number  :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B4461),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "2888372178",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
