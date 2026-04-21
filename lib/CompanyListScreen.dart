import 'package:flutter/material.dart';
import 'AppColors.dart';

class CompanyListScreen extends StatelessWidget {
  final bool isDark;
  final Function(bool) onThemeChange;

  const CompanyListScreen({
    super.key,
    required this.isDark,
    required this.onThemeChange,
  });

  final List<String> companies = const [
    "Google",
    "Microsoft",
    "Apple",
    "Amazon",
    "Tesla",
  ];

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors.getBackgroundColor(isDark);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Company List"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: companies.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.business,
                      color: Colors.lightBlueAccent,
                    ),
                    title: Text(
                      companies[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white54,
                      size: 16,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Selected ${companies[index]}")),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => onThemeChange(false),
                  icon: const Icon(Icons.wb_sunny, color: Colors.yellow),
                ),
                IconButton(
                  onPressed: () => onThemeChange(true),
                  icon: const Icon(Icons.nightlight_round, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
