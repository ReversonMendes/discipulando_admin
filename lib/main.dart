import 'package:discipulando_admin/controllers/AgendaController.dart';
import 'package:discipulando_admin/controllers/AvisoController.dart';
import 'package:discipulando_admin/controllers/MenuAppController.dart';
import 'package:discipulando_admin/firebase_options.dart';
import 'package:discipulando_admin/main/main_screen.dart';
import 'package:discipulando_admin/styles/color_schemes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          canvasColor: lightColorScheme.secondary),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      // themeMode: isDarkmode ? ThemeMode.dark : ThemeMode.light,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(
            create: (context) => DataProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AgendaProvider(),
          ),

          
        ],
        child: const MainScreen(),
      ),
    );
  }
}
