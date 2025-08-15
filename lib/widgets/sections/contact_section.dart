import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Do you have a Project Idea?\nLet\'s discuss your project!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
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
                        // Add URL launcher for LinkedIn
                        // UrlLauncher.launchLinkedIn('faizan-saddique');
                      },
                      child: _SocialIcon(Icons.person),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("GitHub clicked!");
                        // Add URL launcher for GitHub
                        // UrlLauncher.launchGitHub('faizan-saddique');
                      },
                      child: _SocialIcon(Icons.code),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Email clicked!");
                        // Add URL launcher for Email
                        // UrlLauncher.launchEmail(email: 'faizan.saddique83@gmail.com');
                      },
                      child: _SocialIcon(Icons.email),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("WhatsApp clicked!");
                        // Add URL launcher for WhatsApp
                        // UrlLauncher.launchWhatsApp(phoneNumber: '+92-309-6939565');
                      },
                      child: _SocialIcon(Icons.chat),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 80),
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
                      // Add form submission logic here
                      // _submitForm();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFF8B5CF6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
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
      ),
    );
  }

  Widget _ContactInfo(IconData icon, String label, String value) {
    return GestureDetector(
      onTap: () {
        print("Contact info clicked: $label - $value");
        // Add specific actions for each contact method
        if (label.contains('Email')) {
          // UrlLauncher.launchEmail(email: value);
        } else if (label.contains('Call')) {
          // UrlLauncher.launchPhone(value);
        } else if (label.contains('Address')) {
          // UrlLauncher.launchMap(latitude: 32.1877, longitude: 74.1945, label: value);
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
          Column(
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
        ],
      ),
    );
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