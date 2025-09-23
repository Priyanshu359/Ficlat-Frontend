import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_background/animated_background.dart';

import '../../../core/widgets/custom_input.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/provider/auth_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _role = 'jobseeker';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args['role'] != null) {
      _role = args['role'] == 'employee' ? 'employee' : 'jobseeker';
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: _role == 'employee'
                ? AppColors.accentOrange
                : AppColors.accentBlue,
            spawnMinRadius: 2.0,
            spawnMaxRadius: 6.0,
            spawnMaxSpeed: 80.0,
            spawnMinSpeed: 10.0,
            particleCount: 70,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              children: [
                /// Custom "AppBar" (part of animated background)
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Login as ${_role == 'employee' ? 'Employee' : 'Job Seeker'}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48), // balance space for back button
                  ],
                ),
                const SizedBox(height: 40),

                /// Login form container
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomInput(hint: 'Email', controller: _email),
                        const SizedBox(height: 12),
                        CustomInput(
                          hint: 'Password',
                          controller: _password,
                          obscure: true,
                        ),
                        const SizedBox(height: 16),
                        auth.isLoading
                            ? const CircularProgressIndicator()
                            : GlowingButton(
                                label: 'Login',
                                onTap: () async {
                                  await auth.mockLogin(
                                    email: _email.text.trim().isEmpty
                                        ? 'demo@ficlat.com'
                                        : _email.text.trim(),
                                    role: _role,
                                  );
                                  if (_role == 'employee') {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.employeeLanding,
                                    );
                                  } else {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.jobSeekerLanding,
                                    );
                                  }
                                },
                                color: _role == 'employee'
                                    ? AppColors.accentOrange
                                    : AppColors.accentBlue,
                              ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'New here?',
                              style: TextStyle(color: AppColors.textMuted),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.register,
                                  arguments: {'role': _role},
                                );
                              },
                              child: const Text(
                                'Create account',
                                style: TextStyle(color: AppColors.accentBlue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
