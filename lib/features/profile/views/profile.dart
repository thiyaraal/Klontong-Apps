import 'package:flutter/material.dart';
import 'package:kelontong_app/features/profile/view_models/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Profile', style: TextStyle(color: Colors.black)),
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 1,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    profileProvider.profileImageUrl,
                  ),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 20),

                Text(
                  profileProvider.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  profileProvider.email,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
