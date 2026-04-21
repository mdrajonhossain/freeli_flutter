import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Map<String, String>> users = const [
    {"name": "John Doe", "msg": "Hey, how are you?"},
    {"name": "Sarah Khan", "msg": "Let’s meet tomorrow"},
    {"name": "Alex Smith", "msg": "Project update?"},
    {"name": "Emma Watson", "msg": "Call me please"},
  ];

  final List<Map<String, String>> calls = const [
    {"name": "John Doe", "time": "10:30 AM"},
    {"name": "Sarah Khan", "time": "Yesterday"},
    {"name": "Alex Smith", "time": "2 days ago"},
  ];

  Widget chatsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
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
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget callsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.08),
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
            trailing: const Icon(Icons.phone_callback, color: Colors.white54),
          ),
        );
      },
    );
  }

  Widget dashboardTab() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
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

  List<Widget> get pages => [chatsTab(), callsTab(), dashboardTab()];

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF030915);

    return Scaffold(
      backgroundColor: bg,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Home"),
        centerTitle: true,
      ),

      body: pages[currentIndex],

      /// ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF0A0F1F),
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
        ],
      ),
    );
  }
}
