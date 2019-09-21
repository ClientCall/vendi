import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
   final store;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.store}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.store.name,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.store.name),
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
                child: Center(
                  child: Hero(
                    tag: 'img-store-${widget.store.id}',
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        image: new DecorationImage(
                            image: new NetworkImage(widget.store.urlImage),
                            fit: BoxFit.cover,
                        )
                      )
                    ) 
                  ),
                ),
                onTap: () {
                  print('hola ${widget.store.description}');
                  Navigator.pop(context);
                },
              ),

          ],
        ) 
      ),
    );
  }
}
