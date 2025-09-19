import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class JobSeekerLandingPage extends StatelessWidget {
  const JobSeekerLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Ficlat - Job Seeker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.accentBlue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Welcome, Job Seeker 👋",
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
                        'Senior Product Manager',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: const Text(
                        'Innovate Corp • Remote • INR 4L-8L',
                        style: TextStyle(color: AppColors.textMuted),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentBlue,
                        ),
                        child: const Text('Apply'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: AppColors.card,
                    child: ListTile(
                      leading: const Icon(
                        Icons.group,
                        color: AppColors.accentPurple,
                      ),
                      title: const Text(
                        'AI/ML Enthusiasts',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: const Text(
                        'Active discussion room • 230 members',
                        style: TextStyle(color: AppColors.textMuted),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentBlue,
                        ),
                        child: const Text('Join'),
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
        selectedItemColor: AppColors.accentBlue,
        unselectedItemColor: AppColors.textMuted,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Jobs'),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Referrals',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Rooms'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
