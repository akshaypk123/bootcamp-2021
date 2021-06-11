import 'package:akshay/core/database/userDB.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routename = '/ProfileScreen';
  final _formkey = GlobalKey<FormState>();
  String _name = '' ;
  void onFormSubmit(){
    
    _formkey.currentState!.save();
    
    UserDB _userDB = UserDB();
    _userDB.savedData(name: _name);
    
  }
  @override
  Widget build(BuildContext context) {

    final _arg = ModalRoute.of(context)!.settings.arguments;
    print(_arg);
    return Scaffold(
      appBar: customAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                  onSaved: (_val) {
                    _name = _val! ;
                  },
                  
                ),
                TextButton(onPressed: onFormSubmit , child: Text('Done')),
              ],
            ),
            
          ),
        ),
      ),
    );
  }

  AppBar customAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: (){
        Navigator.of(context).pop("Hello world");
      }, icon: Icon(Icons.arrow_back_ios),),
    );
  }
}