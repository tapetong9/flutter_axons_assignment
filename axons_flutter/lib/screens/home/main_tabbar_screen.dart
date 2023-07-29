import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/my_app.dart';
import 'package:axons_flutter/screens/authenication/login_screen.dart';
import 'package:axons_flutter/screens/authenication/splash_screen.dart';
import 'package:axons_flutter/screens/home/home_screen.dart';
import 'package:axons_flutter/utils/navigation/navigate_util.dart';
import 'package:axons_flutter/widgets/button/primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/authenication/auth_bloc.dart';

class MainTabbarScreen extends StatefulWidget {
  const MainTabbarScreen({super.key});

  @override
  State<MainTabbarScreen> createState() => _MainTabbarScreenState();
}

class _MainTabbarScreenState extends State<MainTabbarScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();

    _widgetOptions = <Widget>[
      const HomeScreen(),
      Text(tr("tabbar.market"), style: optionStyle),
      Text(tr("tabbar.shrimp_farm"), style: optionStyle),
      PrimaryButton(title: "Logout", fitWidth: true, onPressed: _logout),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _logout() {
    context.read<AuthBloc>().add(LogoutRequested());
    NavigateUtil().push(context, to: const LoginScreen(), type: PushType.clearStack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: context.theme.primaryColor, fontSize: 12.0),
        selectedItemColor: context.theme.primaryColor,
        unselectedLabelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
        unselectedItemColor: Colors.grey.shade500,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: tr("tabbar.home"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.house_outlined),
            label: tr("tabbar.market"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.ac_unit_outlined),
            label: tr("tabbar.shrimp_farm"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            label: tr("tabbar.account"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
