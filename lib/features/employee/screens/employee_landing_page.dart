import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class EmployeeLandingPage extends StatelessWidget {
  const EmployeeLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Ficlat - Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.accentOrange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Welcome, Employee 👋",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    color: AppColors.card,
                    child: ListTile(
                      title: const Text(
                        'Post a Job',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: const Text(
                        'Create a referral job and set referral fee',
                        style: TextStyle(color: AppColors.textMuted),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentOrange,
                        ),
                        child: const Text('Post'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: AppColors.card,
                    child: ListTile(
                      leading: const Icon(
                        Icons.school,
                        color: AppColors.accentPurple,
                      ),
                      title: const Text(
                        'Upload Mentorship',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: const Text(
                        'Offer one-to-one mentorship sessions',
                        style: TextStyle(color: AppColors.textMuted),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentBlue,
                        ),
                        child: const Text('Upload'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.accentOrange,
        unselectedItemColor: AppColors.textMuted,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post Job',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Referrals'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
