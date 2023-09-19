import 'package:discipulando_admin/controllers/MenuAppController.dart';
import 'package:discipulando_admin/main/components/header.dart';
import 'package:discipulando_admin/responsive.dart';
import 'package:discipulando_admin/screens/avisos_agendas/agendas_screen.dart';
import 'package:discipulando_admin/screens/dashboard/dashboard_screen.dart';
import 'package:discipulando_admin/services/agenda_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/avisos_agendas/avisos_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Widget screen = const DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(changeScreen: changeScreen),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                  changeScreen: changeScreen,
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: screen,
            ),
          ],
        ),
      ),
    );
  }

  changeScreen(int change) {
    switch (change) {
      case 1:
        setState(() {
          screen = const DashboardScreen();
        });

        break;
      case 2:
        setState(() {
          screen = const AvisosScreen();
        });
        break;
      case 3:
        setState(() {
          screen = const AgendasScreen();
        });
        break;
      default:
    }
  }
}
