import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore: must_be_immutable
class QuoteWidget extends StatelessWidget {
  
  var quote = "";
  var writer = "";
  var clickShare;
  var clickLike;
  var bgColor;
  var clickNext;
  var clickPr;

  QuoteWidget({super.key, 
    required this.quote,
    required this.writer,
    this.clickShare,
    this.clickLike,
    this.bgColor,
    this.clickNext,
    this.clickPr,
  });

  @override
  Widget build(BuildContext context) {
    return Container( //This is for the whole quote page, as what is shown
        color: bgColor,
        padding: EdgeInsets.only(left: 30, right: 30), //does the padding for the quotes to be centered
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //aligns from the left rather than center
          children: [
            Spacer(), //space for quote from the top
            Image.asset( //the quote image
              "assets/quote.png",
              height: 30,
              width: 30,
            ),
            SizedBox(height: 30,), //spacing between image and text
            Text( 
              quote, //quote 
              style: GoogleFonts.playfairDisplaySc(
                textStyle: TextStyle(color : Colors.white, fontSize: 30)),
            ),
            SizedBox(height: 30,),
            Text(
              writer, //the author of the quote
              style: GoogleFonts.gelasio(
                textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Spacer(), //space for quote from the bottom

            // Container( //Whole container for icons
            //   alignment: Alignment.center,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children:[ 

            //       InkWell( //Wraps in widget called inkwell, that responds to touch
            //         onTap: clickLike,
            //         child: Container( //Container for love icons to use box shape
            //           margin: EdgeInsets.only(left: 10),
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.rectangle,
                      //   border: Border.all(width: 1),
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
            //           padding: EdgeInsets.all(10),
            //           child: Icon(
            //             Icons.favorite, 
            //             color: Colors.black,
            //           ), 
            //         ),
            //       ),

            //       Padding(padding: EdgeInsets.only(right: 5, left: 5)), //Distance between icons

            //       InkWell( //Same InkWell
            //         onTap: clickShare,
            //         child: Container( //Container for love icons to use box shape
            //           margin: EdgeInsets.only(left: 10),
            //           decoration: BoxDecoration(
            //             shape: BoxShape.rectangle,
            //             border: Border.all(width: 1),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           padding: EdgeInsets.all(10),
            //           child: Icon(
            //             Icons.share, 
            //             color: Colors.black,
            //           ), 
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Spacer(),
          ],
        ),
      );
  }
}