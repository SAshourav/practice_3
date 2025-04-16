import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice_3/views/pages/register_page.dart';
import 'package:practice_3/views/widget_tree.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // Static login credentials
    const String validEmail = 'flower';
    const String validPassword = '123';

    final Color matteGreen = const Color(0xFF1B4332); // Dark green background
    final Color tealAccent = const Color(0xFF2D6A4F); // Teal highlight

    return Scaffold(
      backgroundColor: matteGreen,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LayoutBuilder(builder: (context, constraints){
              return FractionallySizedBox(
                widthFactor: widthScreen > 500 ? 0.6 : 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      child: const Text(
                        "🌿 Nature App",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Lottie.asset('assets/lotties/login.json', height: 250),
                    const SizedBox(height: 20),

                    // Email field
                    TextField(
                      controller: usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.person_outline, color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.08),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.08),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            final email = usernameController.text.trim();
                            final password = passwordController.text.trim();

                            if (email == validEmail && password == validPassword) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const WidgetTree()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid email or password."),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.login),
                          label: const Text("Login"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tealAccent.withOpacity(0.8),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Register()),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text("Get Started!"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white70),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            })
          ),
        ),
      ),
    );
  }
}
