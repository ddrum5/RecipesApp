import 'package:flutter/material.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke"),
        actions: [
          Icon(Icons.share),
          Padding(padding: EdgeInsets.only(right: 20)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
        child: Center(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 217,
                child: Card(
                  elevation: 5,
                  child: Stack(
                    alignment: Alignment(0.8, 0.9),
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 50),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                          "sed do eiusmod tempor incididunt ut labore et dolore magna ",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Text(
                        "01/01/2021",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ))),
      ),
    );
    ;
  }
}
