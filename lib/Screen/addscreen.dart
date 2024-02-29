import 'dart:developer';

import 'package:cubit_notes/cubit/notes_cubit.dart';
import 'package:cubit_notes/cubit/notes_state.dart';
import 'package:cubit_notes/model/notemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_transition/page_route_transition.dart';

class addscreen extends StatefulWidget {
  const addscreen({super.key});

  @override
  State<addscreen> createState() => _addscreenState();
}

class _addscreenState extends State<addscreen> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<notescubit>().fetch();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<notescubit, notesstate>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: GestureDetector(
                            onTap: () {
                              PageRouteTransition.effect=TransitionEffect.leftToRight;
                              PageRouteTransition.pop(context);
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white12,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 35,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              log("change the color");
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white12,
                                ),
                                child: Icon(
                                  Icons.bookmark_add_outlined,
                                  size: 35,
                                  color: Colors.white38,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: ListView(
                        children: [
                          Customtextfield(title,"Title",45),
                          Customtextfield(desc,"Description",30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (title.text.toString() == "" && desc.text.toString() == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please enter the content to save")
                    ),
                  );
                }
                else {
                  int i;
                  if ( 0 == 1) {
                    i = 1;
                  }
                  else {
                    i = 0;
                  }
                  log(i.toString());
                  context.read<notescubit>().addnotes(Notesmodel(title: title.text.toString(), description: desc.text.toString(),bookmark: i));
                  Navigator.pop(context);
                }
              },
              child: Icon(Icons.save),
            ),
          );
        }
    );
  }
  Customtextfield(
      TextEditingController controller, String hintext, double size) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      maxLines: null,
      style: TextStyle(color: Colors.grey, fontSize: size),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintext,
        hintStyle: TextStyle(color: Colors.grey, fontSize: size),
      ),
    );
  }
}
