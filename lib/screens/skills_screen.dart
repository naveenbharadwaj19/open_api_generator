import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skills_openapi_generator/screens/pet_screen.dart';

class SkillsScreen extends StatefulWidget {
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeInAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: const Text(
          "Skills",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey.shade700,
        actions: [
          Tooltip(
            message: "Pets",
            child: IconButton(
              icon: const Icon(Icons.pets_rounded, color: Colors.white),
              onPressed: () {
                Get.to(() => PetScreen());
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _fadeInAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Naveen Bharadwaj',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeInAnimation,
              child: Text(
                'Skills Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAnimatedSkillCard('assets/icons/flutter.svg', 'Flutter'),
                _buildAnimatedSkillCard(
                    'assets/icons/firebase.svg', 'Firebase'),
                _buildAnimatedSkillCard('assets/icons/android.svg', 'Android'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAnimatedSkillCard('assets/icons/python.svg', 'Python'),
                _buildAnimatedSkillCard('assets/icons/node.svg', 'Node.js'),
                _buildAnimatedSkillCard('assets/icons/gcp.svg', 'GCP'),
              ],
            ),
            const SizedBox(height: 30),
            SlideTransition(
              position: _slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achievements',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      achievementBullet(
                          'Enhanced an app that was crashing frequently: Diagnosed and resolved critical issues, leading to improved app stability and user experience.'),
                      achievementBullet(
                          'Improved performance of the app by managing states efficiently: Optimized state management, resulting in faster load times and smoother user interactions.'),
                      achievementBullet(
                          'Segregated production and sandbox environments for a live app: Established clear environment distinctions, reducing deployment errors and streamlining testing processes.'),
                      achievementBullet(
                          'Handled Socket.IO clients efficiently: Enhanced real-time communication capabilities, ensuring reliable and low-latency data transmission.'),
                      achievementBullet(
                          'Developed a hassle-free large file upload system from Flutter web to the server: Implemented a robust file upload mechanism, enhancing user satisfaction and reducing upload failures.'),
                      achievementBullet(
                          'Established a CI/CD pipeline using GitHub Actions to deploy to Netlify and EC2 based on the target environment: Automated deployment workflows, improving release speed and consistency across environments.'),
                      achievementBullet(
                          'Produced Standard Operating Procedure (SOP) documentation: Created detailed documentation to streamline onboarding and ensure consistent processes.'),
                      achievementBullet(
                          'Managed the project by maintaining sprints and handling tasks effectively: Coordinated project activities, ensuring timely delivery and efficient task management.'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSkillCard(String iconPath, String skillName) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: skillCard(iconPath, skillName),
    );
  }

  Widget skillCard(String iconPath, String skillName) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          skillName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.blueGrey.shade800,
          ),
        ),
      ],
    );
  }

  Widget achievementBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey.shade700,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
