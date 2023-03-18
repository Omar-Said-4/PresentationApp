



import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:presentationapp/cubit/AppCubit.dart';
import 'dart:io';
import 'package:page_transition/page_transition.dart';
import 'package:presentationapp/pages/home/home_screen.dart';
import 'package:presentationapp/rowt.dart';
import 'package:presentationapp/scaffold.dart';
import 'package:presentationapp/widget/navi.dart';
import 'package:slider_button/slider_button.dart';

import '../container.dart';
import '../listt.dart';
import 'counter.dart';


class Pass_Screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var cubit=AppCubit.get(context);
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
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(height: 150,),

          Align(
            alignment: Alignment.topCenter,
            child: Text('Please, enter the password to enjoy the app',style:
            GoogleFonts.aladin(fontSize: 25,color: Colors.black),),
          ),
          SizedBox(height: 100,),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: VerificationCode(
                fillColor: Colors.blue[900],
                textStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                keyboardType: TextInputType.number,
                underlineColor: Colors.white, // If this is null it will use primaryColor: Colors.red from Theme
                length: 4,
                cursorColor: Colors.blue[900], // If this is null it will default to the ambient
                // clearAll is NOT required, you can delete it
                // takes any widget, so you can implement your design
                clearAll: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'clear all',
                    style: TextStyle(fontSize: 25, decoration: TextDecoration.underline, color: Colors.black,fontWeight: FontWeight.w900),
                  ),
                ),
                onCompleted: (String value) async {
                  if(value.toString()=="8976")
                  {
                    Navigator.pushReplacement(context, PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child:LiquidSwipe(
                      pages: [
                        Scaffoldt(),
                        Containert(),
                        Rowt(),
                        Listt(),
                        countert(),
                        WeatherApp(),
                      ],

                    ),));

                  }
                  else
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.transparent,
                      behavior: SnackBarBehavior.floating,
                      elevation: 0,
                      content: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 48,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Oops Error!',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        'Wrong Password',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 25,
                              left: 20,
                              child: ClipRRect(
                                child: Stack(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.red.shade200,
                                      size: 17,
                                    )
                                  ],
                                ),
                              )),
                          Positioned(
                              top: -18,
                              left: 5,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                  const Positioned(
                                      top: 5,
                                      child: Icon(
                                        Icons.clear_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ));

                },
                onEditing: (bool value) {

                },
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }



}