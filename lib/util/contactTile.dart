import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String number;

  ContactTile({super.key, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
              color: Colors.brown,
            ),
            title: Text(
              name,
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              number,
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(
              Icons.phone,
              color: Colors.blue,
              size: 28,
            ),
          ),
        ),
        Divider(
          thickness: 3,
        )
      ],
    );
  }
}
