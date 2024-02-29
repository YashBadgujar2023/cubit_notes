import 'package:cubit_notes/Screen/textshowing.dart';
import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:provider/provider.dart';

class bookmark extends StatefulWidget {
  const bookmark({super.key});

  @override
  State<bookmark> createState() => _bookmarkState();
}

class _bookmarkState extends State<bookmark> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 3/4,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(5, (index){
        return GestureDetector(
          onTap: () {
            PageRouteTransition.effect = TransitionEffect.rightToLeft;
            PageRouteTransition.push(context, textwrite(dataindex: index));
          },
          onLongPress: ()async{
            showModalBottomSheet(context: context, builder: (context){
              return ElevatedButton(
                  onPressed: ()async{
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
                    child: Text("Yash Badgujar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),overflow: TextOverflow.clip,),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 3,
                    endIndent: 3,
                  ),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 85),
                      child: Text("I am Study in the lachoo college",overflow: TextOverflow.clip,),
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
}
