import 'package:flutter/material.dart';
import 'AppColors.dart';
import 'connect/ChatsTab.dart';
import 'connect/CallsTab.dart';
import 'connect/DashboardTab.dart';

class HomePage extends StatelessWidget {
  final bool isDark;
  final Function(bool) onThemeChange;

  const HomePage({
    super.key,
    required this.isDark,
    required this.onThemeChange,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors.getBackgroundColor(isDark);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: bgColor,

        /// ================= APP BAR =================
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(
            255,
            12,
            31,
            94,
          ), // Darker background for app bar
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 5,
          title: Image.asset('assets/logo.webp', height: 45),

          actions: [
            IconButton(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
              tooltip: 'Search',
            ),
            IconButton(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_sharp, color: Colors.white),
              tooltip: 'Filter',
            ),
            IconButton(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white),
              tooltip: 'Toggle menu',
            ),
            const SizedBox(width: 3),
          ],

          /// ================= TAB BAR =================
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            dividerColor: Colors.transparent,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),

            tabs: [
              Tab(icon: Icon(Icons.chat), text: "Chats"),
              Tab(icon: Icon(Icons.call), text: "Calls"),
              Tab(icon: Icon(Icons.dashboard), text: "Dashboard"),
            ],
          ),
        ),

        /// ================= BODY =================
        body: const TabBarView(
          children: [ChatsTab(), CallsTab(), DashboardTab()],
        ),
      ),
    );
  }
}
