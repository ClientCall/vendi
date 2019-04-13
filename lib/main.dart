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
      title: 'Butiko',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Butiko'),
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
    _stores.forEach((store) => {
      _cardStores.add(CardStore(store))
    });

    return Scaffold(
      appBar: NavBar.getAppBar(),      
      body: !isLoading ? CustomScrollView(
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
      ) : 
      ColorLoader(colors: colors, duration: Duration(milliseconds: 1200)), 
    );
  }
}
