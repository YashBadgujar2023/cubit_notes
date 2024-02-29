import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)),
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

                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                            color: Colors.white12,
                          ),
                          child: Icon(
                           Icons.add,
                            size: 35,
                            color: Colors.white38,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Customtextfield(titlecontroller,"title", 45),
                    Customtextfield(desccontroller, "Description", 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("ok"),
                ),
              ],
            ));
  }
}
