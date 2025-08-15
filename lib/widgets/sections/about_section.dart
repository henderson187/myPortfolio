import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html; // For web downloads

class AboutSection extends StatelessWidget {
  // CV download URLs - Add your actual CV files here
  static const String mobileDevCVUrl = 'assets/documents/Faizan_Saddique_Mobile_Developer_CV.pdf';
  static const String devOpsCVUrl = 'assets/documents/Faizan_Saddique_DevOps_CV.pdf';

  // GitHub profile URL
  static const String githubUrl = 'https://github.com/henderson187'; // Replace with actual GitHub username

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Skills showcase
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _SkillIcon(Icons.phone_android, 'Android'),
                                  _SkillIcon(Icons.flutter_dash, 'Flutter'),
                                  _SkillIcon(Icons.cloud, 'AWS'),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _SkillIcon(Icons.code, 'Java'),
                                  _SkillIcon(Icons.terminal, 'DevOps'),
                                  _SkillIcon(Icons.api, 'Firebase'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Education badge
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xFF8B5CF6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'CS Student',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 80),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I am Professional Mobile\nApp & DevOps Engineer',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Android Developer with 2+ published apps on Google Play Store.\nExpertise in Java, Kotlin, XML, Flutter, and Firebase. I specialize in\nbuilding robust mobile applications and cloud infrastructures.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'I have strong DevOps background with Docker, AWS, and Jenkins\nfor scalable deployment and CI/CD implementation. Currently pursuing\nBachelor of Computer Science at UET Lahore.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 24),
                // Key achievements
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5CF6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xFF8B5CF6).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Key Achievements:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• 2+ Published Android Apps on Google Play Store\n• Expert in AI-assisted development (Claude, ChatGPT)\n• AWS Cloud Infrastructure & CI/CD Implementation',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1F2937),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    // My Projects Button - Navigate to GitHub
                    GestureDetector(
                      onTap: () async {
                        print("My Projects clicked! Navigating to GitHub...");
                        await _launchGitHub();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFF8B5CF6),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF8B5CF6).withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.code,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'My Projects',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.open_in_new,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Download CV Button - Show CV options
                    GestureDetector(
                      onTap: () {
                        print("Download CV clicked! Showing CV options...");
                        _showCVDownloadOptions(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF8B5CF6), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.download, color: Color(0xFF8B5CF6), size: 18),
                            SizedBox(width: 8),
                            Text(
                              'Download CV',
                              style: TextStyle(
                                color: Color(0xFF8B5CF6),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Launch GitHub profile
  Future<void> _launchGitHub() async {
    try {
      final Uri url = Uri.parse(githubUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        print('Could not launch GitHub URL: $githubUrl');
      }
    } catch (e) {
      print('Error launching GitHub: $e');
    }
  }

  // Show CV download options modal - CENTERED DIALOG
  void _showCVDownloadOptions(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400, // Fixed width to prevent overflow
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9, // Responsive width
              maxHeight: MediaQuery.of(context).size.height * 0.8, // Responsive height
            ),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView( // Prevent overflow with scrolling
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF8B5CF6).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.download,
                          color: Color(0xFF8B5CF6),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded( // Prevent text overflow
                        child: Text(
                          'Download CV',
                          style: TextStyle(
                            fontSize: 20, // Reduced from 24
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ),
                      // Close button
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.grey[600],
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Description
                  Text(
                    'Choose the CV version that best fits your needs:',
                    style: TextStyle(
                      fontSize: 14, // Reduced from 16
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Mobile Developer CV Option
                  _CVDownloadOption(
                    icon: Icons.phone_android,
                    title: 'Mobile Developer CV',
                    subtitle: 'Android, Flutter & Mobile Development',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.pop(context);
                      _downloadCV('mobile', mobileDevCVUrl);
                    },
                  ),

                  SizedBox(height: 12), // Reduced spacing

                  // DevOps Engineer CV Option
                  _CVDownloadOption(
                    icon: Icons.cloud,
                    title: 'DevOps Engineer CV',
                    subtitle: 'AWS, Docker, Jenkins & Cloud Infrastructure',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.pop(context);
                      _downloadCV('devops', devOpsCVUrl);
                    },
                  ),

                  SizedBox(height: 20),

                  // Cancel Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14, // Reduced from 16
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // CV Download Option Widget - FIXED OVERFLOW
  Widget _CVDownloadOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 40, // Reduced from 50
              height: 40, // Reduced from 50
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10), // Reduced from 12
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20, // Reduced from 24
              ),
            ),
            SizedBox(width: 12), // Reduced from 16
            Expanded( // Prevent text overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14, // Reduced from 16
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                    maxLines: 1,
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12, // Reduced from 14
                      color: Color(0xFF6B7280),
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.download,
              color: color,
              size: 18, // Reduced from 20
            ),
          ],
        ),
      ),
    );
  }

  // Download CV function
  void _downloadCV(String type, String cvUrl) {
    try {
      print("Downloading $type CV...");

      // For web platform - trigger download
      final String fileName = type == 'mobile'
          ? 'Faizan_Saddique_Mobile_Developer_CV.pdf'
          : 'Faizan_Saddique_DevOps_CV.pdf';

      // Create download link and trigger download
      html.AnchorElement(href: cvUrl)
        ..setAttribute('download', fileName)
        ..click();

      print("$type CV download initiated!");

    } catch (e) {
      print("Error downloading CV: $e");
      // Fallback: You could show a snackbar or error message here
    }
  }

  Widget _SkillIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFF8B5CF6).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Color(0xFF8B5CF6),
            size: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}