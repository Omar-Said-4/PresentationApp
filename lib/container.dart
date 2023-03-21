import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/rowt.dart';
import 'package:flutterbook/scaffold.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutterbook/cubit/AppCubit.dart';
import 'package:flutterbook/cubit/AppStates.dart';
import 'package:flutterbook/shared.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/password.dart';


class Containert extends StatelessWidget {
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25,),
                    Center(child: const Text("Let's play with flutter containers",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),)),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: cubit.contsize,
                          height: cubit.contsize,
                          color: cubit.pickerColor,
                         child: Text(cubit.text.text,style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: cubit.pickerColor,
                                    onColorChanged: cubit.changeColor,
                                  ),

                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Got it'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Change Color", style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 23),)),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap: () {
                          cubit.contsize=240;
                          cubit.emitState();
                        },
                        child: Text("Increase Size", style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 23),)),
                    SizedBox(height: 20,),

                    InkWell(
                        onTap: () {
                          cubit.contsize=60;
                          cubit.emitState();
                        },
                        child: Text("Decrease Size", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),)),
                    SizedBox(height: 20,),
                    TextForm(
                      controller: cubit.text,
                      prefix: Icons.text_fields,
                      type: TextInputType.text,
                      label: "Text",
                      onChange: (s) {},
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap: () {
                          cubit.emitState();
                        },
                        child: Text("Change Text", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),)),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap: () {
                          launch('https://api.flutter.dev/flutter/widgets/Container-class.html');                 },
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
                              child:   Scaffoldt(),
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
                                child:    Rowt(),
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
            ),
          );
        }
    );
  }
}