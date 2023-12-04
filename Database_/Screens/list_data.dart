import 'package:flutter/material.dart';
import 'package:myproject/Database_/Service.dart';
import 'package:myproject/Database_/model/usermodel.dart';

class listdata extends StatefulWidget {
  const listdata({super.key});

  @override
  State<listdata> createState() => _listdataState();
}

class _listdataState extends State<listdata> {
  late List<UserModel> _userList = <UserModel>[];
  var _userServices = Userservice();
  @override
  void initState() {
    super.initState();
    getDatafromDB();
  }

  getDatafromDB() async {
    var userData = await _userServices.readuser();
    _userList = <UserModel>[]; //initilizaation

    userData.forEach((rowData) {
      setState(() {
        var _userModel = UserModel();
        _userModel.id = rowData['id'];
        _userModel.name = rowData['name'];
        _userModel.subject = rowData['subject'];
        _userModel.contact = rowData['contact'];

        _userList.add(_userModel);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Data'),
      ),
      body: ListView.builder(
          itemCount: _userList.length,
          itemBuilder: (context, index) {
        return Card(
          elevation: 20,
          child: ListTile(
            title: Text('${_userList[index].name}'),
            subtitle: Text('${_userList[index].contact}'),
            leading: Text('${_userList[index].id}'),
            trailing: Text('${_userList[index].subject}'),
          )
        );
        
      }),
    );
  }
}
