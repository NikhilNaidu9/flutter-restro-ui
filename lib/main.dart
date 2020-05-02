import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 250.0,
              color: Color(getColorHexFromStr('#fff5ea')),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 10.0),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          hintText: 'Search for recipes and channel',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: Colors.orange,
                                style: BorderStyle.solid,
                                width: 3.0))),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'POPULAR RECIPES',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'THIS WEEK',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0),
                    height: 125.0,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _buildFoodCard(),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buildFoodCard(),
                        SizedBox(
                          width: 20.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        _buildFoodCard(),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'September 7',
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'TODAY',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
              child: Container(
                height: 390,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage('assets/food2.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                          spreadRadius: 1.0)
                    ]),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 150.0, left: 60.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'BEST OF',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                  Text(
                    'THE DAY',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                  Container(
                    height: 2.0,
                    width: 50.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget _buildFoodCard() {
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: Colors.white),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                image: DecorationImage(
                  image: AssetImage('assets/food3.jpg'),
                )),
            height: 80.0,
            width: 80.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Grilled Chicken',
              ),
              Text(
                'with Fruit Salad',
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 2.0,
                width: 75.0,
                color: Colors.orange,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQPqVvvxpCEiuIcD1ZhWi2x-qqnffujrPKvdjrYXbxrk3hBgDTt&usqp=CAU'))),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'James Oliver',
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
