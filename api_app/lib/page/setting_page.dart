import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void setNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('_turnOnNoti', _turnOnNoti);
  }

  bool _turnOnNoti = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Light'),
            secondary: Icon(Icons.notification_add),
            value: true, onChanged: (bool? value){
              setState(() {
                
              });
          })
        ],
      ),
      
    );
  }
}