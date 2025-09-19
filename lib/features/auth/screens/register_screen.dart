import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_input.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/provider/auth_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      appBar: AppBar(
        title: Text(
          'Register as ${_role == 'employee' ? 'Employee' : 'Job Seeker'}',
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
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
                        label: 'Create account',
                        onTap: () async {
                          await auth.mockRegister(
                            email: _email.text.trim().isEmpty
                                ? 'new@ficlat.com'
                                : _email.text.trim(),
                            role: _role,
                          );
                          // After register, go to landing page for now
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
                      'Already have an account?',
                      style: TextStyle(color: AppColors.textMuted),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.login,
                          arguments: {'role': _role},
                        );
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: AppColors.accentBlue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
