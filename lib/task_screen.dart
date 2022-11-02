import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoey_remake/add_task_screen.dart';
import 'package:todoey_remake/main.dart';
import 'package:todoey_remake/row_cont.dart';

final borderProvider = StateProvider((ref) => Colors.black);
final checkProvider = StateProvider((ref) => Colors.transparent);
final boxProvider = StateProvider((ref) => Colors.transparent);

class TaskScreen extends ConsumerWidget {
  TaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(listProvider);
    final blue = ref.watch(boxProvider);
    final white = ref.watch(checkProvider);
    final black = ref.watch(borderProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          size: 40.0,
        ),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 90.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          child: Icon(
                            Icons.menu,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Todoey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '3 tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              height: 100.0,
              width: 100.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: note.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => RowCont(() {
                          if (black == Colors.black) {
                            ref.read(borderProvider.notifier).state =
                                Colors.transparent;
                            ref.read(boxProvider.notifier).state = Colors.blue;
                            ref.read(checkProvider.notifier).state =
                                Colors.white;
                          } else {
                            ref.read(borderProvider.notifier).state =
                                Colors.black;
                            ref.read(boxProvider.notifier).state =
                                Colors.transparent;
                            ref.read(checkProvider.notifier).state =
                                Colors.transparent;
                          }
                        }, blue, black, white, text: note[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
