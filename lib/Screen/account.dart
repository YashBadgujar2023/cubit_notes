import 'package:cubit_notes/cubit/notes_cubit.dart';
import 'package:cubit_notes/cubit/notes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_transition/page_route_transition.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<notescubit,notesstate>(
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  PageRouteTransition.effect = TransitionEffect.leftToRight;
                  PageRouteTransition.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white12,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    )),
              ),
              toolbarHeight: 40,
              backgroundColor: Colors.black,
            ),
            backgroundColor: Colors.black12,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW4AdHQ5lVM_cFZYu4TogVtmEfYH4iHSGwYQ&usqp=CAU"),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: 300,
                    child: Customtextfield("yash1234", "Username"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: Customtextfield("Yash Badgujar", "name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: Customtextfield("yash@gmail.com", "Email"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: Customtextfield("1234567890", "Phone"),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  static Customtextfield(String Showvalue, String typeofvaluecome) {
    return TextField(
      readOnly: true,
      controller: TextEditingController()..text = Showvalue,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(
          typeofvaluecome,
          style: TextStyle(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white30),
        ),
      ),
    );
  }
}
