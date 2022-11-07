import 'package:bnacash/constants/constants.dart';
import 'package:bnacash/widgets/box_model.dart';
import 'package:flutter/material.dart';

final List<MyToDoList> box = MyToDoList.todoBox;

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'To Do',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                box.length,
                (index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BoxModel(
                        color: box[index].color,
                        imagePath: box[index].imagePath,
                        description: box[index].description,
                        pressed: () {
                          setState(() {
                            box.removeAt(index);
                          });
                        },
                      ),
                    )),
          ),
        )
      ],
    );
  }
}
