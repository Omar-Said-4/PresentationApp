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


class Listt extends StatelessWidget {
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
                    children: [
                      SizedBox(height: 25,),
                      Center(child: const Text("Let's play with flutter lists",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),)),
                      SizedBox(height: 20,),
                      Text("Here is a horizontal scrollable list: ",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),),
                      SizedBox(height: 20,),

                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.white,
                        child: ListView.builder(
                                                       itemCount: cubit.listcount,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)
                          {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black,
                                width: 30,
                                child: Center(child: Text('$index',style: TextStyle(color: Colors.white,fontSize: 15),)),
                              ),
                            );
                          }
                        ),
                      ),
                       SizedBox(height: 30,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           InkWell(
                               onTap: () {
                                  cubit.listcount++;
                                  cubit.emitState();
                               },
                               child: Container(
                                 width: 50,
                                 height: 50,
                                 color: Colors.white,
                                 child:
                                 Center(
                                   child: Text("+", style: TextStyle(
                                       color: Colors.blue[900],
                                       fontWeight: FontWeight.bold,
                                       fontSize: 25),),
                                 ),
                               )),
                           SizedBox(width: 15,),
                           InkWell(
                               onTap: () {
                                  if(cubit.listcount>0)
                                    {
                                      cubit.listcount--;
                                      cubit.emitState();
                                    }
                               },
                               child: Container(
                                 width: 50,
                                 height: 50,
                                 color: Colors.black,
                                 child:
                                 Center(
                                   child: Text("-", style: TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 30),),
                                 ),
                               )),
                         ],
                       ),
                      SizedBox(height: 20,),
                      Text("Here is a vertical scrollable list: ",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),),
                      SizedBox(height: 20,),
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.white,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.listcount2,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index)
                            {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.black,
                                  height: 30,
                                  width: 20,
                                  child: Center(child: Text('$index',style: TextStyle(color: Colors.white,fontSize: 15),)),
                                ),
                              );
                            }
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                cubit.listcount2++;
                                cubit.emitState();
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors.white,
                                child:
                                Center(
                                  child: Text("+", style: TextStyle(
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),),
                                ),
                              )),
                          SizedBox(width: 15,),
                          InkWell(
                              onTap: () {
                                if(cubit.listcount2>0)
                                {
                                  cubit.listcount2--;
                                  cubit.emitState();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors.black,
                                child:
                                Center(
                                  child: Text("-", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                          onTap: () {
                            launch('https://api.flutter.dev/flutter/widgets/ListView-class.html');                 },
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
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}