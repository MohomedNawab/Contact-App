import 'package:contactapp/model/user.dart';
import 'package:contactapp/screens/AddUser.dart';
import 'package:contactapp/services/userservice.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late List<User> _userList;
  final _userService=UserService();

  getAllUserDetails() async{
    _userList=<User>[];
    var users=await _userService.readAllUsers();
     users.forEach((user){
      setState(() async {
        var userModel=User();
        userModel.id=user['id'];
        userModel.name=user['name'];
        userModel.number=user['number'];
        userModel.email=user['email'];
        _userList.add(userModel);
      });
    });
  }

  @override
   void initState(){
    getAllUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Content Buddy"),
      ),
      body: ListView.builder(
          itemCount: _userList.length,
          itemBuilder:(context,index){
        return Card(
          child: ListTile(
            title: Text(_userList[index].name ??''),
            subtitle: Text(_userList[index].number ??''),
            trailing: Text(_userList[index].email ??''),
          ),
        );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const AddUser())
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


