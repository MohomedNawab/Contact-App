import 'package:contactapp/model/user.dart';
import 'package:contactapp/services/userservice.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _userNameController=TextEditingController();
  var _userNumberController=TextEditingController();
  var _userEmailController=TextEditingController();
  bool _validateName = false;
  bool _validateNumber = false;
  bool _validateEmail = false;
  var _userservice=UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Content Buddy"),),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add New Contact',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userNameController,
                  decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Name',
                      labelText: 'Name',
                  errorText: _validateName ? 'Name Value Cant Be Empty': null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userNumberController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Phone Number',
                      labelText: 'Phone Number',
                    errorText: _validateNumber ? 'Number Value Cant Be Empty': null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userEmailController,
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Email Address',
                    labelText: 'Email Address',
                    errorText: _validateName ? 'Email Address Value Cant Be Empty': null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                  style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  textStyle: const TextStyle(fontSize: 15)
              ),
                      onPressed: () async {
                    setState(() {
                      _userNameController.text.isEmpty? _validateName=true:_validateName=false;
                      _userNumberController.text.isEmpty? _validateNumber=true:_validateNumber=false;
                      _userEmailController.text.isEmpty? _validateEmail=true:_validateEmail=false;
                    });
                    if(_validateName==false&&
                        _validateNumber==false&&
                        _validateEmail==false)
                    {
                      //print('Good Data can save');
                      var _user = User();
                      _user.name = _userNameController.text;
                      _user.number = _userNumberController.text;
                      _user.email = _userEmailController.text;
                      var result=await _userservice.SaveUser(_user);
                      print(result);

                    }
                      }, child: const Text('Save')),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)
                      ),
                      onPressed: (){
                        _userNameController.text='';
                        _userNumberController.text='';
                        _userEmailController.text='';
                      }, child: const Text('Delete')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
