import 'package:flutter/material.dart';

class DialogueBox extends StatelessWidget {
  VoidCallback onDelete;
  VoidCallback onCancel;

  DialogueBox({super.key, required this.onDelete, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: Text(
          'Conformation',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        content: Container(
          height: 105,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Are you sure for Delete?',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: onCancel,
                      icon: Icon(
                        Icons.no_sim_outlined,
                        color: Colors.blue,
                        size: 27,
                      )),
                  SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.blue,
                        size: 27,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
