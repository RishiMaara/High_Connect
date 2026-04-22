import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedSplashWidget extends StatelessWidget {
  const AnimatedSplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3A3A3A),
      body: Stack(
        children: [
          // Background Image covering full screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/high_connect_logo.jpg',
              fit: BoxFit.contain,
            ),
          ),
          
          // Optional: Subtle overlay to ensure loading indicator is visible if needed
          // Positioned.fill(child: Container(color: Colors.black26)),

          // Loading indicator at bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: SizedBox(
                width: 36.0,
                height: 36.0,
                child: CircularProgressIndicator(
                  color: Colors.white, // White looks better against a full-screen image
                  strokeWidth: 3.0,
                ),
              ),
            ).animate().fade(delay: 1000.ms, duration: 600.ms),
          ),
        ],
      ),
    );
  }
}
