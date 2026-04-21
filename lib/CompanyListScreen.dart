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
    "Amazon",
    "Microsoft",
    "Amazon",
    "Apple",
    "Netflix",
    "Tesla",
    "Meta",
    "Uber",
    "Spotify",
    "Adobe",
    "IBM",
  ];

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors.getBackgroundColor(isDark);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            const Text(
              "Welcome back!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Please select a business account to continue",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),

            const SizedBox(height: 20),

            /// ================= LIST =================
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: companies.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.white.withOpacity(0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      title: Text(
                        companies[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white54,
                        size: 14,
                      ),

                      /// ✅ FIXED ON TAP
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Selected ${companies[index]}"),
                            duration: const Duration(milliseconds: 800),
                          ),
                        );

                        Future.delayed(const Duration(milliseconds: 300), () {
                          Navigator.pushNamed(context, "/otp");
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            /// ================= THEME SWITCH =================
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => onThemeChange(false),
                    icon: const Icon(Icons.wb_sunny, size: 28),
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () => onThemeChange(true),
                    icon: const Icon(Icons.nightlight_round, size: 28),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
