import 'package:flutter/material.dart';
import 'package:ficlat_frontend/features/home/home_page.dart';
import 'package:ficlat_frontend/features/auth/screens/login_screen.dart';
import 'package:ficlat_frontend/features/auth/screens/register_screen.dart';
import 'package:ficlat_frontend/features/jobseeker/screens/jobseeker_landing_page.dart';
import 'package:ficlat_frontend/features/employee/screens/employee_landing_page.dart';

class AppRoutes { 
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String jobSeekerLanding = '/jobseeker';
  static const String employeeLanding = '/employee';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    jobSeekerLanding: (context) => const JobSeekerLandingPage(),
    employeeLanding: (context) => const EmployeeLandingPage(),
  };
}