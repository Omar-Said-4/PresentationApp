import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:presentationapp/cubit/AppCubit.dart';
import 'package:presentationapp/cubit/AppStates.dart';
import 'package:presentationapp/shared.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/password.dart';


class Rowt extends StatelessWidget {
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
              child: ListView(
                children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 25,),
                    Center(child: const Text("Let's play with flutter rows and columns",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),)),
                    SizedBox(height: 30,),
                  Text("Here is a row of two containers: ",
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: cubit.rowtt,
                              children: [
                                Container(
                                  color: Colors.black,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  color: Colors.black,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                        )
                      ),
                    ),
                    SizedBox(height: 25,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,

                       children: [
                         InkWell(
                           onTap: ()
                             {
                               cubit.rowtt=MainAxisAlignment.start;
                               cubit.emitState();
                             },
                             child:
                         Text('Align Start',style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),)
                         ),
                         InkWell(
                             onTap: ()
                             {
                               cubit.rowtt=MainAxisAlignment.center;
                               cubit.emitState();
                             },
                             child: Text('Align Center',style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),)),
                         InkWell(
                             onTap: ()
                             {
                               cubit.rowtt=MainAxisAlignment.end;
                               cubit.emitState();
                             },
                             child: Text('Align End',style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),)),

                       ],
                     ),
                    SizedBox(height: 50,),
                    InkWell(
                        onTap: () {
                          launch('https://api.flutter.dev/flutter/widgets/Row-class.html');                 },
                        child: Container(
                          color: Colors.white,
                          child:
                          Center(
                            child: Text("click here for more info", style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 23),),
                          ),
                        )),
                    SizedBox(height: 80,),
                    Text("Here is a column of two containers: ",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),),
                    SizedBox(height: 10,),

                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: cubit.colt,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            color: Colors.black,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 5,),

                        ],
                      ),
                    ),
                   SizedBox(height: 50,),
                   Container(
                     color: Colors.white,
                     height: 150,
                     width: double.infinity,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(
                           color: Colors.black,
                           width: double.infinity,
                           height: 10,
                         ),
                         InkWell(
                             onTap: ()
                             {
                               cubit.colt=MainAxisAlignment.start;
                               cubit.emitState();
                             },
                             child:
                             Text('Align Start',style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),)
                         ),
                         Container(
                           color: Colors.black,
                           width: double.infinity,
                           height: 10,
                         ),
                         InkWell(
                             onTap: ()
                             {
                               cubit.colt=MainAxisAlignment.center;
                               cubit.emitState();
                             },
                             child: Text('Align Center',style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),)),
                         Container(
                           color: Colors.black,
                           width: double.infinity,
                           height: 10,
                         ),
                         InkWell(
                             onTap: ()
                             {
                               cubit.colt=MainAxisAlignment.end;
                               cubit.emitState();
                             },
                             child: Text('Align End',style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),)),
                         Container(
                           color: Colors.black,
                           width: double.infinity,
                           height: 10,
                         ),
                       ],
                     ),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: InkWell(
                          onTap: () {
                            launch('https://api.flutter.dev/flutter/widgets/Column-class.html');                 },
                          child: Container(
                            color: Colors.white,
                            child:
                            Center(
                              child: Text("click here for more info", style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),),
                            ),
                          )),
                    ),
                  ],
                )],
              ),
            ),
          );
        }
    );
  }
}