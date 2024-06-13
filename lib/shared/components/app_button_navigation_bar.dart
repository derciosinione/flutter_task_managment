import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../routes/app_routes.dart';
import 'app_menu_icon.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int itemIndex;
  const AppBottomNavigationBar({super.key, required this.itemIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int currentPage = 0;

  updateCurrentPage() {
    setState(() {
      currentPage = widget.itemIndex;
    });
    // return widget.itemIndex == index ? true : false;
  }

  _getIndex(int index) {
    updateCurrentPage();
    return currentPage == index ? true : false;
  }

  void _navigator(int index, String route) {
    if (currentPage != index) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuIcon(
            onTap: () => _navigator(0, AppRoutes.home),
            displayText: "Home",
            icon: IconlyBold.home,
            isActive: _getIndex(0),
          ),
          MenuIcon(
            onTap: () => _navigator(1, AppRoutes.dashboard),
            displayText: "Dasboard",
            icon: IconlyBold.chart,
            isActive: _getIndex(1),
          ),
          MenuIcon(
            onTap: () => _navigator(3, AppRoutes.projects),
            displayText: "Projetos",
            icon: IconlyBold.ticket_star,
            isActive: _getIndex(3),
          ),
          MenuIcon(
            onTap: () => _navigator(2, AppRoutes.members),
            displayText: "Team",
            icon: IconlyBold.user_2,
            isActive: _getIndex(2),
          ),
        ],
      ),
    );
  }
}
