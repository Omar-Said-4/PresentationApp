import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/cubit/AppCubit.dart';
import 'package:flutterbook/cubit/AppStates.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'container.dart';



class Scaffoldt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    // TODO: implement build
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
            launch('https://api.flutter.dev/flutter/material/Scaffold-class.html');
            },
              backgroundColor: Colors.blue[900],
              child: const Icon(Icons.navigation),
            ),
            backgroundColor: cubit.pickerColorS,
            appBar: cubit.appBarS?AppBar(
              title: const Text('I am an Appbar'),
              backgroundColor: Colors.blue[900],
            ):null,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: cubit.background? DecorationImage(
                    image: AssetImage("assets/back.jpeg"),
                    fit: BoxFit.cover):null,
              ),
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    SizedBox(height: 25,),
                    Center(child:  Text("Let's play with flutter Scaffold",
                      style: TextStyle(color: cubit.background?Colors.black:Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),)),
                    SizedBox(height: 50,),
                    InkWell(
                        onTap: () {
                          cubit.appBarS=!cubit.appBarS;
                          cubit.emitState();
                        },
                        child:
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Show/Hide Appbar", style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),),
                          ),
                        )),
                    SizedBox(height: 50,),
                    InkWell(
                        onTap: () {
                          cubit.background=!cubit.background;
                          cubit.emitState();
                        },
                        child:
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Add/Remove Background", style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),),
                          ),
                        )),
                    SizedBox(height: 50,),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: cubit.pickerColorS,
                                    onColorChanged: cubit.changeColorS,
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
                          cubit.emitState();
                        },
                        child:
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Change Background Color", style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),),
                          ),
                        )),
                    SizedBox(height: 90,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("For more info click the floating action button", style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),),
                        ),
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
                                type: PageTransitionType.rightToLeft,
                                child:    Containert(),
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