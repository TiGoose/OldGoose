import 'package:flutter/material.dart';


class TrafficWidget extends StatefulWidget {
  @override
  _TrafficWidgetState createState() => _TrafficWidgetState();
}

class _TrafficWidgetState extends State<TrafficWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator TrafficWidget - FRAME

    return Container(
        width: 402,
        height: 870,
        decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(171, 182, 194, 1),
                      )
                  )
              ),const Positioned(
                  top: 16,
                  left: 14,
                  child: Text('Traffic', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 24,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 72,
                  left: 25,
                  child: Text('From', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5
                  ),)
              ),Positioned(
                  top: 101,
                  left: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius : const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color : const Color.fromRGBO(255, 255, 255, 1),
                      border : Border.all(
                        color: const Color.fromRGBO(214, 214, 214, 1),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        const Text('Paris', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(44, 55, 110, 1),
                            fontFamily: 'Arial',
                            fontSize: 14,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),), const SizedBox(width : 1),
                        Container(
                            width: 1,
                            height: 14,
                            decoration: const BoxDecoration(
                              color : Color.fromRGBO(44, 55, 110, 1),
                            )
                        ),

                      ],
                    ),
                  )
              ),const Positioned(
                  top: 152,
                  left: 27,
                  child: Text('To', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5
                  ),)
              ),const Positioned(
                  top: 232,
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
                  top: 181,
                  left: 27,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius : const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color : const Color.fromRGBO(255, 255, 255, 1),
                      border : Border.all(
                        color: const Color.fromRGBO(214, 214, 214, 1),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        const Text('Nice', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(44, 55, 110, 1),
                            fontFamily: 'Arial',
                            fontSize: 14,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),), const SizedBox(width : 1),
                        Container(
                            width: 1,
                            height: 14,
                            decoration: const BoxDecoration(
                              color : Color.fromRGBO(44, 55, 110, 1),
                            )
                        ),

                      ],
                    ),
                  )
              ),const Positioned(
                  top: 394,
                  left: 28,
                  child: Text('Adult', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5
                  ),)
              ),Positioned(
                  top: 423,
                  left: 28,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius : const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color : const Color.fromRGBO(255, 255, 255, 1),
                      border : Border.all(
                        color: const Color.fromRGBO(214, 214, 214, 1),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        const Text('1', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(44, 55, 110, 1),
                            fontFamily: 'Arial',
                            fontSize: 14,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),), const SizedBox(width : 1),
                        Container(
                            width: 1,
                            height: 14,
                            decoration: const BoxDecoration(
                              color : Color.fromRGBO(44, 55, 110, 1),
                            )
                        ),

                      ],
                    ),
                  )
              ),const Positioned(
                  top: 474,
                  left: 28,
                  child: Text('Child', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5
                  ),)
              ),Positioned(
                  top: 503,
                  left: 28,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius : const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color : const Color.fromRGBO(255, 255, 255, 1),
                      border : Border.all(
                        color: const Color.fromRGBO(214, 214, 214, 1),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        const Text('0', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(44, 55, 110, 1),
                            fontFamily: 'Arial',
                            fontSize: 14,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),), const SizedBox(width : 1),
                        Container(
                            width: 1,
                            height: 14,
                            decoration: const BoxDecoration(
                              color : Color.fromRGBO(44, 55, 110, 1),
                            )
                        ),

                      ],
                    ),
                  )
              ),const Positioned(
                  top: 557,
                  left: 28,
                  child: Text('Email', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5
                  ),)
              ),Positioned(
                  top: 586,
                  left: 28,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius : const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color : const Color.fromRGBO(255, 255, 255, 1),
                      border : Border.all(
                        color: const Color.fromRGBO(214, 214, 214, 1),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        const Text('og@mail.com', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(44, 55, 110, 1),
                            fontFamily: 'Arial',
                            fontSize: 14,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),), const SizedBox(width : 1),
                        Container(
                            width: 1,
                            height: 14,
                            decoration: const BoxDecoration(
                              color : Color.fromRGBO(44, 55, 110, 1),
                            )
                        ),

                      ],
                    ),
                  )
              ),Positioned(
                  top: 653,
                  left: 29,
                  child: Container(
                      width: 334,
                      height: 57,
                      decoration: const BoxDecoration(

                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 334,
                                    height: 57,
                                    decoration: const BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color : Color.fromRGBO(5, 10, 48, 1),
                                    )
                                )
                            ),const Positioned(
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
              ),
            ]
        )
    );
  }
}
