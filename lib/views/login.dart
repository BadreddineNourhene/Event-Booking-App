import 'package:events4/providers/auth_provider.dart';
import 'package:events4/views/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart'; // Your home screen import

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                // Use AuthProvider to check login credentials
                bool isLoggedIn = Provider.of<AuthProvider>(context, listen: false).login(email, password);

                if (isLoggedIn) {
                  // Navigate to HomeScreen after successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  // Show an error if login fails
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid credentials')));
                }
              },
              child: Text("Login"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Guest login logic
                Provider.of<AuthProvider>(context, listen: false).login("Guest", "Guest");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Continue as Guest"),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Navigate to sign-up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()), // Navigate to SignUpPage
                  );
                },
                child: Text("You don't have an account? Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
