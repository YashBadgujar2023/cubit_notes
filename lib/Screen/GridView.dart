
import 'package:cubit_notes/Screen/textshowing.dart';
import 'package:cubit_notes/cubit/notes_cubit.dart';
import 'package:cubit_notes/cubit/notes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_transition/page_route_transition.dart';

class grid extends StatefulWidget {
  const grid({super.key});
  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<notescubit>().fetch();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<notescubit,notesstate>(
        builder: (context,state){
      if(state is notesloading){
        return const Center(
          child: Center(child: Text("yash it in loading state")),
        );
      }
      else if (state is notesloaded)
        {
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 3/4,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(state.arrnotes!.length, (index){
              return GestureDetector(
                onTap: () {
                  PageRouteTransition.effect = TransitionEffect.rightToLeft;
                  PageRouteTransition.push(context, textwrite(dataindex: index,));
                },
                onLongPress: ()async{
                  showModalBottomSheet(context: context, builder: (context){
                    return ElevatedButton(
                        onPressed: ()async{
                          context.read<notescubit>().delete(state.arrnotes![index].id!);
                          Navigator.pop(context);
                        },
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete,size: 30,color: Colors.black,),
                            Text("Delete",style: TextStyle(fontSize: 25,color: Colors.black),),
                          ],
                        ));
                  },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    // margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xFFdbf9ef),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxHeight: 125),
                          child: Text(state.arrnotes![index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),overflow: TextOverflow.clip,),
                        ),
                        Divider(
                          thickness: 1,
                          indent: 3,
                          endIndent: 3,
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(maxHeight: 85),
                            child: Text(state.arrnotes![index].description,overflow: TextOverflow.clip,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            ),
          );
        }
      else if (state is Error)
        {
          return Center(child: Text("Error:"),);
        }
      else{
        return Container();
      }
    });
  }
}
