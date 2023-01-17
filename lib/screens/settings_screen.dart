import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../sharedPreferences/preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'John';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: CustomDrawer(),
        //Cuando tengo cajas de texto es preferible trabajar con el singleChildScrollView para que mi teclado no tape la pantalla.
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  value: Preferences.isDarkmode,
                  
                  onChanged: (value) {
                    
                    Preferences.isDarkmode = value;
                    final themeProvider=Provider.of<ThemeProvider>(context,listen:false);
                   value ?themeProvider.setDarkMode() :themeProvider.setLigthMode();
                    setState(() {});
                  },
                  title:const Text('Darkmode'),
                ),
               const Divider(),
                //Le tenemos que especificar con que tipo de datos trabajara
                RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  },
                  title:const Text('He/Him'),
                ),
                RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;

                    setState(() {});
                  },
                  title:const Text('She/Her'),
                ),
                RadioListTile<int>(
                  value: 3,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 3;
                    setState(() {});
                  },
                  title: const Text('They/Them'),
                ),
                const Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged: (value){
                      Preferences.name=value;
                      setState(() {
                        
                      });
                    },
                    initialValue: Preferences.name,
                    decoration: InputDecoration(
                        labelText: 'Name', helperText: 'Username'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
