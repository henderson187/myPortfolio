import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class AboutSection extends StatelessWidget {
  static const String mobileDevCVUrl = 'assets/documents/Faizan_Saddique_Mobile_Developer_CV.pdf';
  static const String devOpsCVUrl = 'assets/documents/Faizan_Saddique_DevOps_CV.pdf';
  static const String githubUrl = 'https://github.com/henderson187';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
          vertical: isMobile ? 40 : (isTablet ? 60 : 100),
        ),
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context));
        }



Widget _buildMobileLayout(BuildContext context) {
  return Column(
    children: [
      // Skills showcase first on mobile
      Container(
        height: 300,
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
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF8B5CF6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'CS Student',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 32),

      // Content section
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'I am Professional Mobile App & DevOps Engineer',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Android Developer with 2+ published apps on Google Play Store. Expertise in Java, Kotlin, XML, Flutter, and Firebase. I specialize in building robust mobile applications and cloud infrastructures.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            'I have strong DevOps background with Docker, AWS, and Jenkins for scalable deployment and CI/CD implementation. Currently pursuing Bachelor of Computer Science at UET Lahore.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

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
                    fontSize: 13,
                    color: Color(0xFF1F2937),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Buttons - Stack on mobile
          Column(
            children: [
              // My Projects Button
              GestureDetector(
                onTap: () async {
                  print("My Projects clicked! Navigating to GitHub...");
                  await _launchGitHub();
                },
                child: Container(
                  width: double.infinity,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(height: 12),
              // Download CV Button
              GestureDetector(
                onTap: () {
                  print("Download CV clicked! Showing CV options...");
                  _showCVDownloadOptions(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF8B5CF6), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
    ],
  );
}

Widget _buildDesktopLayout(BuildContext context) {
  final isTablet = MediaQuery.of(context).size.width < 1024;

  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          height: isTablet ? 350 : 400,
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
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
              ),
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
      SizedBox(width: isTablet ? 40 : 80),
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'I am Professional Mobile\nApp & DevOps Engineer',
              style: TextStyle(
                fontSize: isTablet ? 28 : 36,
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
                // My Projects Button
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      print("My Projects clicked! Navigating to GitHub...");
                      await _launchGitHub();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                SizedBox(width: 16),
                // Download CV Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Download CV clicked! Showing CV options...");
                      _showCVDownloadOptions(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8B5CF6), width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

// Launch GitHub profile
Future<void> _launchGitHub() async {
  try {
    final Uri url = Uri.parse(githubUrl);
    await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    );
  } catch (e) {
    print('Error launching GitHub: $e');
  }
}

// Show CV download options modal
void _showCVDownloadOptions(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 400,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
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
          child: SingleChildScrollView(
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
                    Expanded(
                      child: Text(
                        'Download CV',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
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
                Text(
                  'Choose the CV version that best fits your needs:',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 12),
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
                        fontSize: 14,
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.download,
            color: color,
            size: 18,
          ),
        ],
      ),
    ),
  );
}

void _downloadCV(String type, String cvUrl) {
  try {
    print("Downloading $type CV...");
    final String fileName = type == 'mobile'
        ? 'Faizan_Saddique_Mobile_Developer_CV.pdf'
        : 'Faizan_Saddique_DevOps_CV.pdf';

    html.AnchorElement(href: cvUrl)
      ..setAttribute('download', fileName)
      ..click();

    print("$type CV download initiated!");
  } catch (e) {
    print("Error downloading CV: $e");
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