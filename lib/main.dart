import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/sharedPreferences/preferences.dart';
import 'package:provider/provider.dart';
//El build debe ser sincrono pero podemos hacer el main asincrono,para asi poder mandar a llamar la inicializacion de nuestras preferencias que es una fn asincrona.
void main()async{

//Para que se asegure de inicializar y haga los enlaces con los widgets antes de continuar
  WidgetsFlutterBinding.ensureInitialized();
  
  await Preferences.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>ThemeProvider(isDarkmode: Preferences.isDarkmode))
  ],
  child:const MyApp(),
  ));
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName:(_)=>const HomeScreen(),
        SettingsScreen.routerName:(_)=>const SettingsScreen(),
      },
      theme:Provider.of<ThemeProvider>(context).currentTheme
    );
  }
}