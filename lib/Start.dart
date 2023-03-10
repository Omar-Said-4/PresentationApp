import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slider_button/slider_button.dart';

import 'package:vibration/vibration.dart';

import 'cubit/password.dart';


class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff191970),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/back.jpeg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 100,),
            Text('flutter is fun',style:
            GoogleFonts.aladin(fontSize: 35,color: Colors.black),),
            SizedBox(height: 50,),
            Text('Let\'s enjoy flutter',style:
            GoogleFonts.aladin(fontSize: 35,color: Colors.black, letterSpacing:5,fontStyle: FontStyle.italic,),),
            SizedBox(height: 50,),
            Expanded(
              child:
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SliderButton(action: ()
                        async {
                          if (await Vibration.hasVibrator()==true) { //check if device has vibration feature
                            Vibration.vibrate(); //500 millisecond vibration
                          }
                          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Pass_Screen(),));

                        },

                            label: Text(
                              "Slide to Start",
                              style: TextStyle(
                                  color: Color(0xff4a4a4a),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            icon: Center(
                                child: Icon(
                                  Icons.start,
                                  color: Colors.white,
                                  size: 40.0,
                                )),
                            boxShadow: BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                            ),
                            buttonColor: Colors.cyan,
                            backgroundColor: Color(0xff191970),
                            highlightedColor: Colors.black,
                            baseColor: Colors.white,
                            shimmer: true,
                            vibrationFlag: true
                        ),

                  ),
              ),
            ),
          ],

        ),// Foreground widget here
      ),

    );
  }
}