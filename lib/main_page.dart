import 'package:flutter/material.dart';
import 'package:old_goose/services/g2rail_api_client.dart';
import 'package:http/http.dart' as http;
import 'models/SolutionResponse.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator HomePage - FRAME
    return Container(
        width: 402,
        height: 870,
        decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(171, 182, 194, 1),
                      )
                  )
              ),Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 402,
                      height: 52,
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(171, 182, 194, 1),
                      )
                  )
              ),const Positioned(
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
                      decoration: const BoxDecoration(

                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 334,
                                    height: 90,
                                    decoration: const BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      color : Color.fromRGBO(5, 10, 48, 1),
                                    )
                                )
                            ),const Positioned(
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
                  child: GestureDetector(
                    child:Container(
                      width: 295,
                      height: 295,
                      decoration: const BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/images/castle.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  ),
                    onTap: () async{
                        await SearchSolution();
                    },
                  )
              ),
            ]
        )
    );
  }


  Future<void> SearchSolution() async {
    print("Im here ");

    GrailApiClient client = GrailApiClient(httpClient: http.Client(), baseUrl: "http://alpha.api.g2rail.com", apiKey: "fa656e6b99d64f309d72d6a8e7284953", secret: "9a52b1f7-7c96-4305-8569-1016a55048bc");
    var asyncKey = await client.getSolutions("Berlin", "Frankfurt", "2023-04-22", "08:00", 1, 0);

    print("Im here -- ");
    var asyncCode = SolutionResponse.fromJson(asyncKey);
    print("Im here 2" + asyncCode.async);

    Future.delayed(const Duration(seconds: 10), () async {
      var result = await client.getAsyncResult(asyncCode.async);
      print("result: " + result);
    });
  }
}
