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

        /// ================= APP BAR =================
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(
            255,
            12,
            31,
            94,
          ), // Darker background for app bar
          elevation: 0,
          centerTitle: true,

          actions: [
            IconButton(
              onPressed: () => onThemeChange(false),
              icon: const Icon(Icons.wb_sunny),
              color: Colors.yellow,
            ),
            IconButton(
              onPressed: () => onThemeChange(true),
              icon: const Icon(Icons.nightlight_round),
              color: Colors.white,
            ),
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

/// ================= CHATS TAB (WHITE CARD UI) =================
class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  final List<Map<String, String>> users = const [
    {
      "name": "John Doe",
      "msg": "Hey, how are you?",
      "time": "20/10/2023",
      "count": "2",
    },
    {
      "name": "Sarah Khan",
      "msg": "Let’s meet tomorrow",
      "time": "19/10/2023",
      "count": "5",
    },
    {
      "name": "Alex Smith",
      "msg": "Project update?",
      "time": "18/10/2023",
      "count": "0",
    },
    {
      "name": "Emma Watson",
      "msg": "Call me please",
      "time": "17/10/2023",
      "count": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.green.withOpacity(
            0.1,
          ), // Green background for list items
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor:
                  AppColors.accentColor, // Use accent color for avatar
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              users[index]["name"]!,
              style: const TextStyle(
                color: Colors.white, // White text for visibility
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              users[index]["msg"]!,
              style: const TextStyle(
                color: Colors.white70,
              ), // Lighter text for visibility
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  users[index]["time"]!,
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
                const SizedBox(height: 5),
                if (users[index]["count"] != "0")
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      users[index]["count"]!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
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
          color: Colors.green.withOpacity(
            0.1,
          ), // Green background for list items
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.call,
              color: Colors.greenAccent,
            ), // Green accent for call icon
            title: Text(
              calls[index]["name"]!,
              style: const TextStyle(
                color: Colors.white,
              ), // White text for visibility
            ),
            subtitle: Text(
              calls[index]["time"]!,
              style: const TextStyle(
                color: Colors.white70,
              ), // Lighter text for visibility
            ),
            trailing: const Icon(
              Icons.phone,
              color: Colors.white54,
            ), // Lighter icon for visibility
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
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          Text(
            "Manage your chats, calls, and analytics from here.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),

          SizedBox(height: 20),

          Text(
            "• Total Users: 120\n• Active Chats: 45\n• Calls Today: 18",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
