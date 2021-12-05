import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
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
          val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
        } else if (hexDigit >= 97 && hexDigit <= 102) {
          val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
        } else {
          throw new FormatException(
              "Wystąpił błąd podczas konwersji koloru."
          );
        }
      }
      return val;
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250.0,
                  color: Color(getColorHexFromStr(
                      '#fff5ea'
                  )),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          15.0,
                          35.0,
                          15.0,
                          10.0
                      ),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(
                            25.0
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search, color: Colors
                                    .purple),
                                contentPadding: EdgeInsets.only(
                                    left: 15.0,
                                    top: 15.0
                                ),
                                hintText: 'Szukaj przepisów i kanałów',
                                hintStyle: TextStyle(
                                    color: Colors.grey
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.0
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.greenAccent,
                                    style: BorderStyle.solid,
                                    width: 3.0
                                )
                            )
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'POPULARNE PRZEPISY',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Fraunces',
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'W TYM TYGODNIU',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Fraunces',
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: 15.0
                        )),
                    Container(
                      padding: EdgeInsets.only(
                          top: 15.0,
                          left: 15.0
                      ),
                      height: 125.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _foodCard(),
                          SizedBox(
                              width: 10.0
                          ),
                          _foodCard2(),
                          SizedBox(
                              width: 10.0
                          ),
                          _foodCard3(),
                          SizedBox(
                              width: 10.0
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
                height: 15.0
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: 15.0
              ),
              child: Text(
                '23 listopada',
                style: TextStyle(
                    fontFamily: 'Monda',
                    color: Colors.black,
                    fontSize: 14.0
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: 15.0
              ),
              child: Text(
                'DZISIAJ',
                style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),
              ),
            ),
            SizedBox(
                height: 10.0
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 12.0,
                      right: 12.0
                  ),
                  child: Container(
                    height: 385.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            15.0
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/applepie.jpeg'
                            ),
                            fit: BoxFit.fill)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(
                              0.35
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 150.0,
                      left: 60.0
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'NAJLEPSZY PRZEPIS',
                        style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'TEGO DNIA',
                        style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                          height: 10.0
                      ),
                      Container(
                        height: 3.0,
                        width: 50.0,
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget _foodCard() {
      return Container(
        height: 125.0,
        width: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                12.0
            ),
            color: Colors.deepOrangeAccent
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      12.0
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/chocolatecake.png'
                      )
                  )
              ),
              height: 125.0,
              width: 100.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Ciasto czekoladowe',
                  style: TextStyle(
                      fontFamily: 'Monda'
                  ),
                ),
                Text(
                  'z bananami',
                  style: TextStyle(
                      fontFamily: 'Monda'
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 2.0,
                  width: 75.0,
                  color: Colors.greenAccent,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              150.0
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/avatar.jpeg'
                              )
                          )
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Travis Brown',
                      style: TextStyle(
                          fontFamily: 'Monda'
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget _foodCard2() {
      return Container(
        height: 125.0,
        width: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                12.0
            ),
            color: Colors.deepOrangeAccent
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      12.0
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/lemoncake.png'
                      )
                  )
              ),
              height: 125.0,
              width: 100.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Ciasto cytrynowe',
                  style: TextStyle(
                      fontFamily: 'Monda'
                  ),
                ),
                Text(
                  'z limonką',
                  style: TextStyle(
                      fontFamily: 'Monda'
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 2.0,
                  width: 75.0,
                  color: Colors.greenAccent,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              150.0
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/avatar2.jpeg'
                              )
                          )
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Mona Suit',
                      style: TextStyle(
                          fontFamily: 'Monda'
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }
    Widget _foodCard3() {
      return Container(
        height: 125.0,
        width: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                12.0
            ),
            color: Colors.deepOrangeAccent
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      12.0
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/bananamuffin.png'
                      )
                  )
              ),
              height: 125.0,
              width: 100.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Mufinka',
                  style: TextStyle(
                      fontFamily: 'Monda'
                  ),
                ),
                Text(
                  'bananowa',
                  style: TextStyle(
                      fontFamily: 'Monda'
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 2.0,
                  width: 75.0,
                  color: Colors.greenAccent,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              150.0
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/avatar3.jpeg'
                              )
                          )
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Luie Wilhelm',
                      style: TextStyle(
                          fontFamily: 'Monda'
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }
  }
