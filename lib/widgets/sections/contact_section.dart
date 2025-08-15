import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
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
          : _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Do you have a Project Idea?\nLet\'s discuss your project!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'I\'m always excited to work on new projects and collaborate with amazing people. Let\'s turn your ideas into reality!',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32),

        // Contact Info
        _ContactInfo(Icons.location_on, 'Address:', 'Gujranwala, Punjab, Pakistan'),
        SizedBox(height: 16),
        _ContactInfo(Icons.email, 'My Email:', 'faizan.saddique83@gmail.com'),
        SizedBox(height: 16),
        _ContactInfo(Icons.phone, 'Call Me Now:', '+92-309-6939565'),
        SizedBox(height: 24),

        // Social Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print("LinkedIn clicked!");
                _launchLinkedIn();
              },
              child: _SocialIcon(Icons.person),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                print("GitHub clicked!");
                _launchGitHub();
              },
              child: _SocialIcon(Icons.code),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                print("Email clicked!");
                _launchEmail();
              },
              child: _SocialIcon(Icons.email),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                print("WhatsApp clicked!");
                _launchWhatsApp();
              },
              child: _SocialIcon(Icons.chat),
            ),
          ],
        ),
        SizedBox(height: 32),

        // Contact Form
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              _FormField('Name*'),
              SizedBox(height: 16),
              _FormField('Email*'),
              SizedBox(height: 16),
              _FormField('Phone Number'),
              SizedBox(height: 16),
              _FormField('Budget*'),
              SizedBox(height: 16),
              _FormField('Project Type*'),
              SizedBox(height: 16),
              _FormField('Message*', isTextArea: true),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  print("Submit form clicked!");
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5CF6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Send Message',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.send, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Do you have a Project Idea?\nLet\'s discuss your project!',
                style: TextStyle(
                  fontSize: isTablet ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                  height: 1.2,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'I\'m always excited to work on new projects and collaborate with\namazing people. Let\'s turn your ideas into reality!',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                  height: 1.6,
                ),
              ),
              SizedBox(height: 40),
              _ContactInfo(Icons.location_on, 'Address:', 'Gujranwala, Punjab, Pakistan'),
              SizedBox(height: 20),
              _ContactInfo(Icons.email, 'My Email:', 'faizan.saddique83@gmail.com'),
              SizedBox(height: 20),
              _ContactInfo(Icons.phone, 'Call Me Now:', '+92-309-6939565'),
              SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("LinkedIn clicked!");
                      _launchLinkedIn();
                    },
                    child: _SocialIcon(Icons.person),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("GitHub clicked!");
                      _launchGitHub();
                    },
                    child: _SocialIcon(Icons.code),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Email clicked!");
                      _launchEmail();
                    },
                    child: _SocialIcon(Icons.email),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("WhatsApp clicked!");
                      _launchWhatsApp();
                    },
                    child: _SocialIcon(Icons.chat),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: isTablet ? 40 : 80),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                _FormField('Name*'),
                SizedBox(height: 20),
                _FormField('Email*'),
                SizedBox(height: 20),
                _FormField('Phone Number'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _FormField('Budget*')),
                    SizedBox(width: 20),
                    Expanded(child: _FormField('Project Type*')),
                  ],
                ),
                SizedBox(height: 20),
                _FormField('Message*', isTextArea: true),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    print("Submit form clicked!");
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF8B5CF6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Send Message',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.send, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Launch functions
  Future<void> _launchEmail() async {
    final String emailUrl = 'mailto:faizan.saddique83@gmail.com?subject=Project%20Inquiry&body=Hello%20Faizan,%0A%0AI%20would%20like%20to%20discuss%20a%20project%20with%20you.%0A%0ABest%20regards,';

    try {
      final Uri uri = Uri.parse(emailUrl);
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  Future<void> _launchWhatsApp() async {
    const String message = 'Hi Faizan! I\'m interested in discussing a project with you.';
    final String whatsappUrl = 'https://wa.me/923096939565?text=${Uri.encodeComponent(message)}';

    try {
      final Uri uri = Uri.parse(whatsappUrl);
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }

  Future<void> _launchLinkedIn() async {
    // Replace with actual LinkedIn profile
    const String linkedInUrl = 'https://linkedin.com/in/faizan-saddique';

    try {
      final Uri uri = Uri.parse(linkedInUrl);
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      print('Error launching LinkedIn: $e');
    }
  }

  Future<void> _launchGitHub() async {
    const String githubUrl = 'https://github.com/henderson187';

    try {
      final Uri uri = Uri.parse(githubUrl);
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      print('Error launching GitHub: $e');
    }
  }

  Widget _ContactInfo(IconData icon, String label, String value) {
    return GestureDetector(
      onTap: () {
        print("Contact info clicked: $label - $value");
        if (label.contains('Email')) {
          _launchEmail();
        } else if (label.contains('Call')) {
          _launchPhone(value);
        }
      },
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF8B5CF6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final String phoneUrl = 'tel:${phoneNumber.replaceAll('-', '')}';

    try {
      final Uri uri = Uri.parse(phoneUrl);
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      print('Error launching phone: $e');
    }
  }

  Widget _SocialIcon(IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF8B5CF6),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }

  Widget _FormField(String hint, {bool isTextArea = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: hint.contains('*') ? Color(0xFF8B5CF6) : Color(0xFFE5E7EB),
            width: 2,
          ),
        ),
      ),
      child: TextFormField(
        maxLines: isTextArea ? 4 : 1,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: hint.contains('*') ? Color(0xFF8B5CF6) : Color(0xFF9CA3AF),
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
        onChanged: (value) {
          print("Form field changed: $hint = $value");
        },
        validator: (value) {
          if (hint.contains('*') && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          if (hint.contains('Email') && value != null && value.isNotEmpty) {
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
          }
          return null;
        },
      ),
    );
  }
}