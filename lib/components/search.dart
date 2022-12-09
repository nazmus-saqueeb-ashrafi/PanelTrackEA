import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var orientation = MediaQuery.of(context).orientation;
    // print(orientation);

    final width =  MediaQuery.of(context).size.width * 0.1;

    final height = orientation == Orientation.portrait ?
    MediaQuery.of(context).size.height * 0.05 : // portrait
    MediaQuery.of(context).size.height * 0.13 ; // landscape


    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: SizedBox(
              width: width,
              height: height,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Color(0xfff4f5f5),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                    ),
                  ),
                  hintText: "Type your full tracking number",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 149, 149, 149),
                  ),
                ), // InputDecoration
              ),
            ), // TextField
            // Expanded
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: width, // 100
              height: height, // 50
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(0)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF0B4461)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10.0),
                      ),
                      side: BorderSide(
                        color: Color(0xFF0B4461),
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Search",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
