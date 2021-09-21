import 'package:flutter/material.dart';

import 'package:project_pilot/views/screens/home_screen.dart';

class SearchBar extends SearchDelegate<String> {
  final dataSearchs = ["haha", "hihi", "hehe"];
  @override
  String? get searchFieldLabel =>  "Search here";
  @override
  TextStyle? get searchFieldStyle => TextStyle(fontSize: 14, color: Colors.grey);


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
          }),
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return HomeScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =
        dataSearchs.where((p) => p.toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
          query = suggestionList[index];
        },
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

}
