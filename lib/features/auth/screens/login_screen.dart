import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_input.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/provider/auth_provider.dart';
import '../../jobseeker/screens/jobseeker_landing_page.dart';
import '../../employee/screens/employee_landing_page.dart';
import '../../../routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          'Login as ${_role == 'employee' ? 'Employee' : 'Job Seeker'}',
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
                        label: 'Login',
                        onTap: () async {
                          // mock login
                          await auth.mockLogin(
                            email: _email.text.trim().isEmpty
                                ? 'demo@ficlat.com'
                                : _email.text.trim(),
                            role: _role,
                          );
                          // navigate based on role
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
      ),
    );
  }
}
