import 'package:assignment_02/util/contactTile.dart';
import 'package:assignment_02/util/dialogueBox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //controller name and number field
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  String? _nameFormError;
  String? _numberFormError;

  //List of contact
  final List _contactList = [];

  //contact add function
  void _addContact() {
    setState(() {
      _contactList.add(
          {'name': _nameController.text, 'number': _numberController.text});
    });
    _nameController.clear();
    _numberController.clear();
  }

  //delete contact
  void _deleteContact(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            onCancel: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            onDelete: () {
              setState(() {
                _contactList.removeAt(index);
              });
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      if (_nameFormError != null) {
        _formValid();
      }
    });

    _numberController.addListener(() {
      if (_numberFormError != null) {
        _formValid();
      }
    });
  }

  //form validation for input
  void _formValid() {
    setState(() {
      _nameFormError =
          _nameController.text.isEmpty ? "Please fill up with a name!" : null;
      _numberFormError = _numberController.text.isEmpty
          ? "Please fill up with a number! ":_numberController.text.length <11?"Number must be allow to 11 character"
          : null;


    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  errorText: _nameFormError,
                  errorStyle: TextStyle(fontSize: 16)),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  hintText: 'Number',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  errorText: _numberFormError,
                  errorStyle: TextStyle(fontSize: 16)),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty ||
                      _numberController.text.isNotEmpty) {
                    return _addContact();
                  } else {
                    _formValid();
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _contactList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onLongPress: () => _deleteContact(index),
                          child: ContactTile(
                              name: '${_contactList[index]['name']}',
                              number: '${_contactList[index]['number']}'));
                    })),
          ],
        ),
      ),
    );
  }
}
