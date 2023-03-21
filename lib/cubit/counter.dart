import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/listt.dart';
import 'package:flutterbook/widget/navi.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutterbook/cubit/AppCubit.dart';
import 'package:flutterbook/cubit/AppStates.dart';
import 'package:flutterbook/shared.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/home_screen.dart';



class countert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    // TODO: implement build
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Stateful Counter",style: TextStyle(fontSize: 35,color: Colors.blue[900],fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if(cubit.counter>0) {
                              cubit.counter--;
                              cubit.emitState();
                            }
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:Colors.white,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child:Center(child: Text("-",style: TextStyle(fontSize: 35,color: Colors.blue[900],fontWeight: FontWeight.bold),)),),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                              border: Border.all(
                                  color:Colors.white,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        child:Center(child: Text("${cubit.counter.toString()}",style: TextStyle(fontSize: 35,color: Colors.blue[900],fontWeight: FontWeight.bold),)),),
                        SizedBox(width: 15,),
                        InkWell(
                          onTap: () {
                            if(cubit.counter<100) {
                              cubit.counter++;
                              cubit.emitState();
                            }
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:Colors.white,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child:Center(child: Text("+",style: TextStyle(fontSize: 35,color: Colors.blue[900],fontWeight: FontWeight.bold),)),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: ()
                          {
                            Navigator.pushReplacement(context, PageTransition(
                              type: PageTransitionType.leftToRight,
                              child:   Listt(),
                            ),
                            );
                          },
                          child: Container(
                            child: Center(
                              child: Text('Prev',style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 10,
                          color: Colors.blue[900],
                        ),
                        InkWell(
                          onTap: ()
                          {
                            Navigator.pushReplacement(context, PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child:  WeatherApp(),
                            ),
                            );
                          },
                          child: Container(
                            child: Center(
                              child: Text('Next',style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}