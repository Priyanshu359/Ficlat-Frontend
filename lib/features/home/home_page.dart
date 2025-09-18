import 'package:flutter/material.dart';
import 'package:ficlat_frontend/routes/app_routes.dart';
import 'package:ficlat_frontend/core/widgets/custom_button.dart';

class HomePage extends StatelessWidget { 
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(24.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Ficlat",
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Your Next Opportunity is a Referral Away",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ), 
            const SizedBox(height: 40),

            // Job Seeker Card
            Card(
              
            )
          ]
        )
      )
    );

  }
}