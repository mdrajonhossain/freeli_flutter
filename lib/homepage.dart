import 'package:flutter/material.dart';
import 'AppColors.dart';

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

        /// ================= APP BAR + TOP NAV =================
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => onThemeChange(false),
              icon: const Icon(Icons.wb_sunny, size: 22),
              color: Colors.yellow,
            ),
            IconButton(
              onPressed: () => onThemeChange(true),
              icon: const Icon(Icons.nightlight_round, size: 22),
              color: Colors.white,
            ),
          ],

          bottom: const TabBar(
            indicatorColor: Colors.lightBlueAccent,
            labelColor: Colors.lightBlueAccent,
            unselectedLabelColor: Colors.white54,
            tabs: [
              Tab(icon: Icon(Icons.chat), text: "Chats"),
              Tab(icon: Icon(Icons.call), text: "Calls"),
              Tab(icon: Icon(Icons.dashboard), text: "Dashboard"),
            ],
          ),
        ),

        /// ================= TAB CONTENT =================
        body: const TabBarView(
          children: [ChatsTab(), CallsTab(), DashboardTab()],
        ),
      ),
    );
  }
}

/// ================= CHATS TAB =================
class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  final List<Map<String, String>> users = const [
    {"name": "John Doe", "msg": "Hey, how are you?"},
    {"name": "Sarah Khan", "msg": "Let’s meet tomorrow"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Emma Watson", "msg": "Call me please"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Alex Smith", "msg": "Project update?"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 50),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              users[index]["name"]!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              users[index]["msg"]!,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(
              Icons.chat_bubble_outline,
              color: Colors.white54,
            ),
          ),
        );
      },
    );
  }
}

/// ================= CALLS TAB =================
class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  final List<Map<String, String>> calls = const [
    {"name": "John Doe", "time": "10:30 AM"},
    {"name": "Sarah Khan", "time": "Yesterday"},
    {"name": "Alex Smith", "time": "2 days ago"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.call, color: Colors.greenAccent),
            title: Text(
              calls[index]["name"]!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              calls[index]["time"]!,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(Icons.phone, color: Colors.white54),
          ),
        );
      },
    );
  }
}

/// ================= DASHBOARD TAB =================
class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Dashboard",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          Text(
            "Welcome to your dashboard. Here you can manage chats, calls and view system analytics.",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),

          SizedBox(height: 20),

          Text(
            "• Total Users: 120\n• Active Chats: 45\n• Calls Today: 18",
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
