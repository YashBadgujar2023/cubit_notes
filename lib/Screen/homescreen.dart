import 'package:cubit_notes/Screen/GridView.dart';
import 'package:cubit_notes/cubit/notes_cubit.dart';
import 'package:cubit_notes/cubit/notes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_transition/page_route_transition.dart';

import '../Uihelper/uihelper.dart';
import 'account.dart';
import 'addscreen.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<notescubit,notesstate>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            leading: Container(
              padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
              child: GestureDetector(
                onTap: (){
                  PageRouteTransition.effect = TransitionEffect.fade;
                  PageRouteTransition.push(context, const account());
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW4AdHQ5lVM_cFZYu4TogVtmEfYH4iHSGwYQ&usqp=CAU"),
                ),
              ),
            ),
            title: Uihelper.customtext(text: "Yash",color: Colors.white,fontWeight: FontWeight.bold,fontsize: 25),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.settings,size: 35,color: Colors.white,),
              ),
            ],
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: ListView(
              children: [
                Uihelper.customtext(text: "My Notes",fontsize: 55,fontWeight: FontWeight.w900,color: Colors.white),
                const SizedBox(
                  height: 10,
                ),
                const grid(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              PageRouteTransition.effect = TransitionEffect.fade;
              PageRouteTransition.push(context, const addscreen());
            },
            backgroundColor: Colors.black87,
            label: Text("Add",style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.add,color: Colors.white,),
          ),
        );
      }
    );
  }
}
