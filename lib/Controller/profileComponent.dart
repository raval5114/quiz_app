import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/Model/Provider/sessionProvider.dart';

class ProfileComponent extends ConsumerStatefulWidget {
  const ProfileComponent({super.key});

  @override
  ConsumerState<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends ConsumerState<ProfileComponent> {
  @override
  Widget build(BuildContext context) {
    final firstName = ref.watch(sessionProvider).user?.firstName ?? 'N/A';
    final lastName = ref.watch(sessionProvider).user?.lastName ?? 'N/A';
    final email = ref.watch(sessionProvider).user?.email ?? 'N/A';
    final dob = ref.watch(sessionProvider).user?.dob ?? 'N/A';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Profile picture with avatar and name below it
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.purpleAccent,
            child: const Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // Center the name below the profile picture
          Center(
            child: Text(
              "$firstName $lastName",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Profile details in cards
          ProfileDetailCard(
            title: "Email",
            value: email,
            icon: Icons.email,
          ),
          const SizedBox(height: 16),
          ProfileDetailCard(
            title: "Date of Birth",
            value: dob,
            icon: Icons.cake,
          ),
          const SizedBox(height: 16),
          ProfileDetailCard(
            title: "First Name",
            value: firstName,
            icon: Icons.person,
          ),
          const SizedBox(height: 16),
          ProfileDetailCard(
            title: "Last Name",
            value: lastName,
            icon: Icons.person_outline,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ProfileDetailCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.purpleAccent,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
