import 'package:flutter/material.dart';
import 'package:myproject/Database_/Screens/list_data.dart';
import 'package:myproject/Database_/Service.dart';
import 'package:myproject/Database_/model/usermodel.dart';

class dbfirst extends StatefulWidget {
  const dbfirst({super.key});

  @override
  State<dbfirst> createState() => _dbfirstState();
}

TextEditingController name = TextEditingController();
TextEditingController subject = TextEditingController();
TextEditingController contact = TextEditingController();

class _dbfirstState extends State<dbfirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Additing"),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          // color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    hintText: 'Enter your name',
                    label: Text('Name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              TextField(
                controller: subject,
                decoration: InputDecoration(
                    hintText: 'Enter your subject',
                    label: Text('Subject'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              TextField(
                controller: contact,
                decoration: InputDecoration(
                    hintText: 'Enter your contact',
                    label: Text('Contact'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() async {
                          if (name.text != null &&
                              subject.text != null &&
                              contact.text != null) {
                            var _userModel = UserModel();
                            var _userServices = Userservice();

                            _userModel.name = name.text;
                            _userModel.subject = subject.text;
                            _userModel.contact = contact.text;

                            var result =
                                await _userServices.saveuser(_userModel);
                            print("result = $result");
                            print("Successfully completed");
                          }
                        });
                      },
                      child: Text('Submit')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => listdata())));
                      },
                      child: Text('view data'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

