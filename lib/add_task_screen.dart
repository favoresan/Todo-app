import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoey_remake/main.dart';
import 'package:todoey_remake/task_screen.dart';

class AddTaskScreen extends ConsumerWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);
  late String newTask;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskScreenList = ref.watch(listProvider);
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, top: 30.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                onChanged: (value) {
                  newTask = value;
                },
                textAlign: TextAlign.center,
              ),
              MaterialButton(
                onPressed: () {
                  taskScreenList.add(newTask);
                  ref.read(listProvider.notifier).state =
                      List.from(taskScreenList);
                  Navigator.pop(context);
                },
                child: Text('Add Task'),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
