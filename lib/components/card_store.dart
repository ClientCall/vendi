import 'package:vendi/Store/ui/screens/detail_screen.dart';
import 'package:vendi/models/store.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardStore extends StatelessWidget {
  Store _cardData;

  CardStore(Store cardData) {
    this._cardData = cardData;
    if (_cardData.description == null) {
      _cardData.description = '';
    }
    if (_cardData.urlImage == null) {
      _cardData.urlImage = 'https://picsum.photos/250?image=9';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 10.0,
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: GestureDetector(
                child: Hero(
                  tag: 'img-store-${_cardData.id}',
                  child: Image.network(_cardData.urlImage),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(store: _cardData);
                  }));
                  print('Click ${this._cardData.description}');
                },
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // image: new DecorationImage(
                  //     image: new NetworkImage(_cardData.urlImage),
                  //     fit: BoxFit.cover,
                  // )
              )
          ),
          Positioned(
            top: 150.0,
            left: 15.0,
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 90.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1.0,
                        color: Colors.black12,
                        spreadRadius: 2.0)
                  ]),
              child: Container(
                padding: EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          this._cardData.name,
                          style: TextStyle(
                              fontFamily: 'Monserrat', fontSize: 20.0),
                        ),
                        SizedBox(width: 4.0),
                        Image.asset(
                          'assets/ok.png',
                          height: 20.0,
                          width: 20.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '5.8Km',
                          style: TextStyle(
                              fontFamily: 'Monserrat',
                              fontSize: 10.0,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(this._cardData.description,
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
