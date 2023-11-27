import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_support_app/quote_model.dart';
import 'package:mental_health_support_app/quote_widget.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key, required String title});
  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  var apiURL = "https://type.fit/api/quotes";
  PageController controller = PageController();

  Future<List<dynamic>> getPost() async {
    final response = await http.get(Uri.parse('$apiURL'));
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    final jsonData = json.decode(str);
    jsonData.shuffle();
    return jsonData;
  }

  RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
          future: getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return ErrorWidget(snapshot.error?.toString() as Object);
              }
              return Stack(
                children: [
                  PageView.builder(
                      controller: controller,
                      itemCount: snapshot.data?.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var model = snapshot.data?[index];
                        return QuoteWidget(
                          quote: model["text"].toString(),
                          writer: model["author"].toString(),
                          clickPr: () {},
                          clickNext: () {
                            controller.nextPage(
                                duration: Duration(milliseconds: 50),
                                curve: Curves.easeIn);
                          },
                          bgColor: _randomColor.randomColor(
                            colorHue: ColorHue.multiple(
                              colorHues: [ColorHue.red, ColorHue.blue],
                            ),
                          ),
                        );
                      }),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (kIsWeb)
                          InkWell(
                            onTap: () {
                              controller.previousPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.easeOut);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.navigate_before,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        InkWell(
                          // onTap: favourite,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: share,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (kIsWeb)
                          InkWell(
                            onTap: () {
                              controller.nextPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

      // body: PageView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     QuoteWidget(
      //       quote: "Be the change that you wish to see in the world", 
      //       writer: "Mahatma Gandhi",
      //       bgColor: Color.fromARGB(255, 139, 207, 200),
      //       clickLike: () {},
      //       clickShare: () {},
      //     ),
      //     QuoteWidget(
      //       quote: "Be the change that you wish to see in the world", 
      //       writer: "Mahatma Gandhi",
      //       bgColor: Color.fromARGB(255, 171, 142, 225),
      //       clickLike: () {},
      //       clickShare: () {},
      //     ),
      //   ],
      // ),
  


//This is just in case type of code

// body: Container( //This is for the whole quote page, as what is shown
//         color: Color.fromARGB(255, 139, 207, 200),
//         padding: EdgeInsets.only(left: 30, right: 30), //does the padding for the quotes to be centered
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start, //aligns from the left rather than center
//           children: [
//             Spacer(), //space for quote from the top
//             Image.asset( //the quote image
//               "quote.png",
//               height: 30,
//               width: 30,
//             ),
//             SizedBox(height: 30,), //spacing between image and text
//             Text( //quote
//               "Be the change that you wish to see in the world", 
//               style: GoogleFonts.playfairDisplaySc(
//                 textStyle: TextStyle(color : Colors.black, fontSize: 30)),
//             ),
//             SizedBox(height: 30,),
//             Text("Mahatma Gandhi", //the author of the quote
//               style: GoogleFonts.gelasio(
//                 textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//             ),
//             Spacer(), //space for quote from the bottom

//             Container( //Whole container for icons
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:[ 

//                   Container( //Container for love icons to use box shape
//                     margin: EdgeInsets.only(left: 10),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       border: Border.all(width: 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     padding: EdgeInsets.all(10),
//                     child: Icon(
//                       Icons.favorite, 
//                       color: Colors.black,
//                     ), 
//                   ),

//                   Padding(padding: EdgeInsets.only(right: 5, left: 5)), //Distance between icons

//                   Container( //Container for love icons to use box shape
//                     margin: EdgeInsets.only(left: 10),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       border: Border.all(width: 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     padding: EdgeInsets.all(10),
//                     child: Icon(
//                       Icons.share, 
//                       color: Colors.black,
//                     ), 
//                   ),
//                 ],
//               ),
//             ),

//             Spacer(),
//           ],
//         ),
//       ),