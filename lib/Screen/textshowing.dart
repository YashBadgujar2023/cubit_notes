
import 'package:cubit_notes/cubit/notes_cubit.dart';
import 'package:cubit_notes/cubit/notes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class textwrite extends StatefulWidget {
  const textwrite({super.key, required this.dataindex});
  final int dataindex;
  @override
  State<textwrite> createState() => _textwriteState();
}

class _textwriteState extends State<textwrite> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  var ico = Icons.bookmark_add_outlined;
  late int index_for_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<notescubit,notesstate>(
        builder: (context,state){
          if(state is notesloading)
            {
              return Text("State at loading state");
            }
           else if(state is notesloaded)
            {
              index_for_id = state.arrnotes![widget.dataindex].id!;
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: GestureDetector(
                              onTap: () {
                                customalertbox();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white12,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 35,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Customtextfield(titlecontroller..text = state.arrnotes![widget.dataindex].title,"title", 45),
                            Customtextfield(desccontroller..text = state.arrnotes![widget.dataindex].description, "Description", 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
           else if(state is Error)
             {
               return Text(state.msg);
             }
           else{
             return Text("null");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<notescubit>().update(index_for_id, titlecontroller.text.toString(), desccontroller.text.toString());
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Customtextfield(
      TextEditingController controller, String hintext, double size) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      autocorrect: true,
      maxLines: null,
      style: TextStyle(color: Colors.grey, fontSize: size),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintext,
        alignLabelWithHint: true,
        hintStyle: TextStyle(color: Colors.grey, fontSize: size),
      ),
    );
  }
  customalertbox() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Save"),
              content: Text("You want to save the correction"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("cancal"),
                ),
                TextButton(
                  onPressed: () {
                    context.read<notescubit>().update(index_for_id, titlecontroller.text.toString(), desccontroller.text.toString());
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("ok"),
                ),
              ],
            ));
  }
}
