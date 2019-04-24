import 'package:vendi/components/card_store.dart';
import 'package:vendi/components/loader.dart';
import 'package:vendi/components/nav_bar.dart';
import 'package:vendi/models/store.dart';
import 'package:vendi/services/store.service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vendi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Vendi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Store> _stores = <Store>[];
  var isLoading = true;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
  ];

  @override
  void initState() {
    super.initState();
    listenStores();
  }

  void listenStores() async {
    List<Store> stores = await StoreService().fetchStores();
    setState(() {
      isLoading = false;
      _stores = stores;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _cardStores = [];
    _stores.forEach((store) => {_cardStores.add(CardStore(store))});

    var ListStores = !isLoading
        ? CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    _cardStores,
                  ),
                ),
              ),
            ],
          )
        : ColorLoader(colors: colors, duration: Duration(milliseconds: 1200));

    // return Scaffold(
    //   appBar: NavBar.getAppBar(),
    //   body: ListStores,
    // );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar:  AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.store),),
                Tab(icon: Icon(Icons.directions_subway),),
                Tab(icon: Icon(Icons.directions_bike),),
                Tab(icon: Icon(Icons.adjust))
              ],
              labelColor: Colors.white,
            ),
            title: Text('Vendi'),
          ),
          body: TabBarView(
            children: <Widget>[
              ListStores,
              Icon(Icons.directions_subway),
              Icon(Icons.directions_bike),
              Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage('https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
                  ),
                  Text('Hello world'),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
