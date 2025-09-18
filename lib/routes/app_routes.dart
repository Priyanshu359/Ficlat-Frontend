import 'package:flutter/material.dart';
import 'package:ficlat_frontend/features/home/home_pager.dart';
import 'package:ficlat_frontend/features/jobseeker/screens/jobseeker_landing_page.dart';
import 'package:ficlat_frontend/features/employee/screens/employee_landing_page.dart';

class AppRoutes { 
  static const String home = '/';
  static const String jobSeekerLanding = '/jobseeker';
  static const String employeeLanding = '/employee';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    jobSeekerLanding: (context) => const JobSeekerLandingPage(),
    employeeLanding: (context) => const EmployeeLandingPage(),
  };
}