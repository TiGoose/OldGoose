import 'package:flutter/material.dart';


class TicketWidget extends StatefulWidget {
  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator TicketWidget - FRAME

    return Container(
      width: 402,
      height: 870,
      decoration: BoxDecoration(
        color : Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
          children: <Widget>[
          Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 402,
              height: 60,
              decoration: BoxDecoration(
                color : Color.fromRGBO(171, 182, 194, 1),
              )
          )
      ),Positioned(
        top: 16,
        left: 14,
        child: Text('Ticket', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 24,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),)
    ),Positioned(
        top: 234,
        left: 28,
        child: Text('Date', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 14,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.5
        ),)
    ),Positioned(
        top: 325,
        left: 28,
        child: Text('Session', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 14,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.5
        ),)
    ),Positioned(
        top: 264,
        left: 27,
        child: Container(
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color : Color.fromRGBO(255, 255, 255, 1),
            border : Border.all(
              color: Color.fromRGBO(214, 214, 214, 1),
              width: 1,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color : Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 1.6666665077209473,
                            left: 2.499999761581421,
                            child: SvgPicture.asset(
                                'assets/images/vector.svg',
                                semanticsLabel: 'vector'
                            );
                        ),
                      ]
                  )
              ), SizedBox(width : 10),
              Text('placeholder', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(0, 46, 108, 1),
                  fontFamily: 'Arial',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),

            ],
          ),
        )
    ),Positioned(
        top: 151,
        left: 27,
        child: Text('Count', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 14,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.5
        ),)
    ),Positioned(
        top: 180,
        left: 27,
        child: Container(
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color : Color.fromRGBO(255, 255, 255, 1),
            border : Border.all(
              color: Color.fromRGBO(214, 214, 214, 1),
              width: 1,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Text('1', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(44, 55, 110, 1),
                  fontFamily: 'Arial',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),), SizedBox(width : 1),
              Container(
                  width: 1,
                  height: 14,
                  decoration: BoxDecoration(
                    color : Color.fromRGBO(44, 55, 110, 1),
                  )
              ),

            ],
          ),
        )
    ),Positioned(
        top: 68,
        left: 27,
        child: Text('Email', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 14,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.5
        ),)
    ),Positioned(
        top: 97,
        left: 27,
        child: Container(
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color : Color.fromRGBO(255, 255, 255, 1),
            border : Border.all(
              color: Color.fromRGBO(214, 214, 214, 1),
              width: 1,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Text('og@mail.com', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(44, 55, 110, 1),
                  fontFamily: 'Arial',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),), SizedBox(width : 1),
              Container(
                  width: 1,
                  height: 14,
                  decoration: BoxDecoration(
                    color : Color.fromRGBO(44, 55, 110, 1),
                  )
              ),

            ],
          ),
        )
    ),Positioned(
        top: 357,
        left: 28,
        child: Container(
          decoration: BoxDecoration(
            color : Color.fromRGBO(255, 255, 255, 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Container(
                  width: 25,
                  height: 25,

                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 6,
                            left: 6,
                            child: SvgPicture.asset(
                                'assets/images/ellipse1985.svg',
                                semanticsLabel: 'ellipse1985'
                            );
                        ),Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  border : Border.all(
                                    color: Color.fromRGBO(5, 10, 48, 1),
                                    width: 1,
                                  ),
                                  borderRadius : BorderRadius.all(Radius.elliptical(25, 25)),
                                )
                            )
                        ),
                      ]
                  )
              ), SizedBox(width : 6),
              Container(
                  width: 80,
                  height: 15,

                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Text('09:00 ~ 10:00', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(0, 46, 108, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                        ),
                      ]
                  )
              ),

            ],
          ),
        )
    ),Positioned(
        top: 357,
        left: 189,
        child: Container(
          decoration: BoxDecoration(
            color : Color.fromRGBO(255, 255, 255, 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Container(
                  width: 25,
                  height: 25,

                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 6,
                            left: 6,
                            child: SvgPicture.asset(
                                'assets/images/ellipse1985.svg',
                                semanticsLabel: 'ellipse1985'
                            );
                        ),Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  border : Border.all(
                                    color: Color.fromRGBO(5, 10, 48, 1),
                                    width: 1,
                                  ),
                                  borderRadius : BorderRadius.all(Radius.elliptical(25, 25)),
                                )
                            )
                        ),
                      ]
                  )
              ), SizedBox(width : 6),
              Container(
                  width: 78,
                  height: 15,

                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Text('13:00 ~ 14:00', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(0, 46, 108, 1),
                                fontFamily: 'Inter',
                                fontSize: 12,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                        ),
                      ]
                  )
              ),

            ],
          ),
        )
    ),Positioned(
        top: 508,
        left: 34,
        child: Container(
            width: 334,
            height: 57,
            decoration: BoxDecoration(

            ),
            child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 334,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color : Color.fromRGBO(5, 10, 48, 1),
                          )
                      )
                  ),Positioned(
                      top: 15,
                      left: 26,
                      child: Text('Continue', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Inter',
                          fontSize: 24,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),
                ]
            )
        )
    ),Positioned(
      top: 417,
      left: 24,
      child: Container(
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          color : Color.fromRGBO(242, 248, 255, 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
            null, SizedBox(width : 10),
            Text('Please note that the session you choose </br> will only allow you to stay in the park for 3 hours.', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(0, 46, 108, 1),
            fontFamily: 'Arial',
            fontSize: 14,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),),

      ],
    ),
    )
    ),
    ]
    )
    );
  }
}
