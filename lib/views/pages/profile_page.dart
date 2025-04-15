import 'package:flutter/material.dart';
import 'package:practice_3/data/notifiers.dart';
import 'package:practice_3/views/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Dummy uploaded image list (local assets for demo purposes)
    final List<String> uploadedImages = [
      'assets/images/flower1.png',
      'assets/images/flower2.jpg',
    ];

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Name
              Text(
                "BUSTY FLOWER",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: theme.colorScheme.primary,
                ),
              ),

              const SizedBox(height: 20),

              // Avatar
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/stwie.jpg'),
              ),

              const SizedBox(height: 30),

              // Profile Info
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("flower@example.com"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Nature Enthusiast"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Uploaded Photos Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Uploaded Photos",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: uploadedImages.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 20),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        uploadedImages[index],
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // Logout Button
              FilledButton.icon(
                onPressed: () {
                  selectedPageNotifier.value = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomePage()),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
