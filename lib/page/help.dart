import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'appSuggestion.dart';
import 'helpcenter.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
              margin:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
              child: Text(
                "Help",
                style: TextStyle(color: Colors.blue, fontSize: 35),
              )),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                  // child: Icon(Icons.person),
                ),
                Text(
                  'Report a Problem',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // SizedBox(
                //   width: 140,
                // ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppSuggestionFormPage()));
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                  // child: Icon(Icons.restore),
                ),
                Text(
                  'Help Centre',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // SizedBox(
                //   width: 190,
                // ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpCenter()));
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                  //child: Icon(Icons.policy),
                ),
                Text(
                  'App Suggestion ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // SizedBox(
                //   width: 240,
                // ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppSuggestionFormPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
