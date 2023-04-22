import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator HomePage - FRAME
    return Container(
        width: 402,
        height: 870,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 790,
                  left: 0,
                  child: Container(
                      width: 402,
                      height: 80,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(171, 182, 194, 1),
                      )
                  )
              ),Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 402,
                      height: 52,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(171, 182, 194, 1),
                      )
                  )
              ),Positioned(
                  top: 12,
                  left: 12,
                  child: Text('Schloss Neuschwanstein', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 24,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 523,
                  left: 34,
                  child: Container(
                      width: 334,
                      height: 90,
                      decoration: BoxDecoration(

                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 334,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      color : Color.fromRGBO(5, 10, 48, 1),
                                    )
                                )
                            ),Positioned(
                                top: 28,
                                left: 90,
                                child: Text('Book Now', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 30,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 140,
                  left: 53,
                  child: Container(
                      width: 295,
                      height: 295,
                      decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('images/Castle.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),
            ]
        )
    );
  }
}
