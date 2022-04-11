import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<HomeScreen> {
  Widget appBarTextView = const Text(
    "SearchView",
    style: TextStyle(color: Colors.black),
  );
  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.black,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController searchView = TextEditingController();
  List<String> searchlist = <String>[];
  bool isSearching = false;
  String? searchString = "";

  SearchState() {
    searchView.addListener(() {
      if (searchView.text.isEmpty) {
        setState(() {
          isSearching = false;
          searchString = "";
        });
      } else {
        setState(() {
          isSearching = true;
          searchString = searchView.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isSearching = false;
    init();
  }

  void init() {
    searchlist.add("Andaman and Nicobar Islands");
    searchlist.add("Andhra Pradesh");
    searchlist.add("Arunachal Pradesh");
    searchlist.add("UP");
    searchlist.add("Punjab");
    searchlist.add("Bihar");
    searchlist.add("Chandigarh");
    searchlist.add("Delhi");
    searchlist.add("Haryana");
    searchlist.add("Himachal Pradesh");
    searchlist.add("Kerala");
    searchlist.add("Mizoram");
    searchlist.add("Nagaland");
    searchlist.add("Rajasthan");
    searchlist.add("Sikkim");
    searchlist.add("Tamil Nadu");
    searchlist.add("Uttaranchal");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: isSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<Item> _buildList() {
    return searchlist.map((contact) => Item(contact)).toList();
  }

  List<Item> _buildSearchList() {
    if (searchString!.isEmpty) {
      return searchlist.map((contact) => Item(contact)).toList();
    } else {
      List<String> searchList = <String>[];
      for (int i = 0; i < searchlist.length; i++) {
        String name = searchlist.elementAt(i);
        if (name.toLowerCase().contains(searchString!.toLowerCase())) {
          searchList.add(name);
        }
      }
      return searchList.map((contact) => Item(contact)).toList();
    }
  }

  AppBar buildBar(BuildContext context) {
    return AppBar(centerTitle: true, title: appBarTextView, actions: <Widget>[
      IconButton(
        icon: actionIcon,
        onPressed: () {
          setState(() {
            if (actionIcon.icon == Icons.search) {
              actionIcon = const Icon(
                Icons.close,
                color: Colors.black,
              );
              appBarTextView = TextField(
                controller: searchView,
                autofocus: true,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.black)),
              );
              searchStart();
            } else {
              searchEnd();
            }
          });
        },
      ),
    ]);
  }

  void searchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void searchEnd() {
    setState(() {
      actionIcon = const Icon(
        Icons.search,
        color: Colors.black,
      );
      appBarTextView = const Text(
        "SearchView",
        style: TextStyle(color: Colors.black),
      );
      isSearching = false;
      searchView.clear();
    });
  }
}

class Item extends StatelessWidget {
  final String name;

  const Item(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name));
  }
}
