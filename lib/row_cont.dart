import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final borderProvider = StateProvider((ref) => Colors.black);
// final checkProvider = StateProvider((ref) => Colors.transparent);
// final boxProvider = StateProvider((ref) => Colors.transparent);

class RowCont extends ConsumerWidget {
  RowCont(
    this.pressed,
    this.colorBlue,
    this.colorBlack,
    this.colorWhite, {
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  final Function pressed;
  final Color colorBlue;
  final Color colorBlack;
  final Color colorWhite;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final blue = ref.watch(boxProvider);
    // final white = ref.watch(checkProvider);
    // final black = ref.watch(borderProvider);

    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            // style: TextStyle(
            //   decoration: selected == true
            //       ? TextDecoration.lineThrough
            //       : TextDecoration.none,
            // ),
          ),
          GestureDetector(
            onTap: () => pressed()
            // if (black == Colors.black) {
            //   ref.read(borderProvider.notifier).state = Colors.transparent;
            //   ref.read(boxProvider.notifier).state = Colors.blue;
            //   ref.read(checkProvider.notifier).state = Colors.white;
            // } else {
            //   ref.read(borderProvider.notifier).state = Colors.black;
            //   ref.read(boxProvider.notifier).state = Colors.transparent;
            //   ref.read(checkProvider.notifier).state = Colors.transparent;
            // }
            ,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  border: Border.all(color: colorBlack, width: 1.5),
                  color: colorBlue),
              child: Icon(
                Icons.check,
                color: colorWhite,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
