import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 700; // breakpoint for responsive design

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: AppColors.accentBlue,
            spawnMinRadius: 2.0,
            spawnMaxRadius: 6.0,
            spawnMaxSpeed: 80.0,
            spawnMinSpeed: 10.0,
            particleCount: 45,
          ),
        ),
        vsync: this,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  children: [
                    Text(
                      'Ficlat',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 30,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.login,
                          arguments: {'role': 'jobseeker'},
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: AppColors.accentBlue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                /// Main Content
                if (isWide)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildLeftSection(context)),
                      const SizedBox(width: 24),
                      Expanded(child: _buildRightCard(context)),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLeftSection(context),
                      const SizedBox(height: 24),
                      _buildRightCard(context),
                    ],
                  ),

                const SizedBox(height: 20),
                
                const Center(
                  child: Text(
                    'Built with ❤️ for hiring and growth',
                    style: TextStyle(color: AppColors.textMuted),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// LEFT SECTION: Title + Cards
  Widget _buildLeftSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Next Opportunity is a Referral Away",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Join Ficlat as a Job Seeker or Employee. Post jobs, share referrals, learn from mentors, and connect.",
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textMuted, fontSize: 16),
        ),
        const SizedBox(height: 28),

        /// Job Seeker Card
        Card(
          color: AppColors.card,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.work_outline,
                      color: AppColors.accentBlue,
                      size: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "I'm a Job Seeker",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Find jobs, get paid referrals, and connect directly with insiders at top companies.",
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentBlue,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.login,
                      arguments: {'role': 'jobseeker'},
                    );
                  },
                  child: const Text("Find Opportunities", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        /// Employee Card
        Card(
          color: AppColors.card,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.people_outline,
                      color: AppColors.accentOrange,
                      size: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "I'm an Employee",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Refer talented candidates, offer mentorship, and build your professional network.",
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentOrange,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.login,
                      arguments: {'role': 'employee'},
                    );
                  },
                  child: const Text("Hire Talent", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// RIGHT SECTION: Info Card
  Widget _buildRightCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.03)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.work_outline, size: 56, color: AppColors.accentPurple),
          SizedBox(height: 12),
          Text(
            "Trusted referrals from employees",
            style: TextStyle(color: AppColors.textPrimary),
          ),
          SizedBox(height: 18),
          Divider(color: Colors.white10),
          SizedBox(height: 12),
          ListTile(
            leading: Icon(Icons.check, color: AppColors.accentBlue),
            title: Text("Verified companies"),
            subtitle: Text(
              "Join secure conversations",
              style: TextStyle(color: AppColors.textMuted),
            ),
          ),
          ListTile(
            leading: Icon(Icons.check, color: AppColors.accentPurple),
            title: Text("Paid referrals"),
            subtitle: Text(
              "Earn when your candidate gets hired",
              style: TextStyle(color: AppColors.textMuted),
            ),
          ),
        ],
      ),
    );
  }
}
