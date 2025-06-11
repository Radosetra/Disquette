import 'package:flutter/material.dart';
import 'package:togo/presentation/disquette/screens/posts_screen.dart';

class LandingScreen extends StatelessWidget{
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 200,),

            const Text("Welcome"),

            const SizedBox(height: 30),

            // Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostsScreen()),
                );
                          },
              child: const Text('Start !'),
            ),

          ],
        ),
      ),
    );
  }

}