import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:preferences_app/widgets/widgets.dart';

import '../sharedPreferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    getGender(){
if (Preferences.gender==1){
   return 'He/Him';
}else if(Preferences.gender==2){
  return 'She/Her';
}else{
  return 'They/Them';
}
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: CustomDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Darkmode: ${Preferences.isDarkmode} '),
            Divider(),
            Text('Username: ${Preferences.name}'),
            Divider(),
            Text('Gender: ${getGender()}'),
            Divider(),
          ],
        ));
  }
}
