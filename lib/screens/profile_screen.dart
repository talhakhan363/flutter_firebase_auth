// --> Fetches and displays Firestore data

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the currently logged-in user
    User? currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.blue.shade600,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService().logOut();
              if (context.mounted) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              }
            },
          ),
        ],
      ),
      // --> Fetching the user's specific document from Firestore
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(currentUser?.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading profile"));
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            // --> Extracting the data map from the Firestore document
            var userData = snapshot.data!.data() as Map<String, dynamic>;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                  Container(height: 21),
                  Text("Name: ${userData['name']}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("Email: ${userData['email']}", style: const TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            );
          }
          return const Center(child: Text("No user data found."));
        },
      ),
    );
  }
}
