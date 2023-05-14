// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../screens/homepage.dart';
import 'PDFfile.dart';

class ResumeTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? Onchanged;
  Function(BuildContext)? deleteFunction;

  ResumeTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.Onchanged,
    required this.deleteFunction,
  });

  @override
  State<ResumeTile> createState() => _ResumeTileState();
}

class _ResumeTileState extends State<ResumeTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: widget.deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          ),
        ]),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                //check box
                Checkbox(
                  value: widget.taskCompleted,
                  onChanged: widget.Onchanged,
                  activeColor: Colors.black,
                ),
                //task name
                Text(
                  widget.taskName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: widget.taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                // Container(
                //   height: 1.5,
                //   width: 1.5,
                //   child: imageIcon != null ? Image.file(imageIcon) : null,
                // ),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () async {
                      await PDFGenerator.generateAndSharePDF([]);
                    },
                    child: Icon(Icons.download)),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
