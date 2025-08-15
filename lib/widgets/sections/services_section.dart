import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesSection extends StatelessWidget {
  // Your contact email
  static const String contactEmail = 'faizan.saddique83@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      color: Color(0xFFF9FAFB),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What I do?',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'I specialize in mobile app development, DevOps automation, and\ncloud infrastructure. My expertise includes building scalable applications\nand implementing CI/CD pipelines for efficient deployment workflows.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'From Android apps to AWS cloud solutions, I deliver end-to-end\ntechnical solutions that drive business growth and innovation.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 32),

                // Professional stats
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatItem('24h', 'Response Time'),
                      _StatItem('100%', 'Client Satisfaction'),
                      _StatItem('10+', 'Projects Delivered'),
                    ],
                  ),
                ),

                SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    print("Let's Work Together clicked!");
                    _showProjectInquiryDialog(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                          Icons.rocket_launch,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Let\'s Work Together!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 80),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                _ServiceCard(
                  'Mobile Development',
                  'Android (Java, Kotlin), Flutter development with Firebase integration and Google Play Store publishing. Expert in building scalable mobile applications.',
                  Icons.phone_android,
                  true,
                  'Starting at \$2,500',
                  ['Custom Android Apps', 'Flutter Cross-platform', 'Play Store Publishing', 'App Maintenance'],
                ),
                SizedBox(height: 20),
                _ServiceCard(
                  'DevOps & Cloud',
                  'AWS infrastructure, Docker containerization, Jenkins CI/CD pipelines, and automated deployment solutions. Specializing in scalable cloud architecture.',
                  Icons.cloud,
                  false,
                  'Starting at \$1,800',
                  ['AWS Setup', 'CI/CD Pipelines', 'Docker Deployment', 'Cloud Monitoring'],
                ),
                SizedBox(height: 20),
                _ServiceCard(
                  'Backend Development',
                  'REST APIs, database design, Firebase backend services, and scalable server architecture. Building robust backend systems for modern applications.',
                  Icons.storage,
                  false,
                  'Starting at \$2,000',
                  ['REST API Development', 'Database Design', 'Firebase Integration', 'Server Architecture'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Professional stat item
  Widget _StatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8B5CF6),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Show project inquiry dialog
  void _showProjectInquiryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 500,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF8B5CF6).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.rocket_launch,
                          color: Color(0xFF8B5CF6),
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Your Project',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            Text(
                              'Tell me about your project idea',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
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
                  SizedBox(height: 24),

                  // Quick contact options
                  Row(
                    children: [
                      Expanded(
                        child: _QuickContactOption(
                          icon: Icons.email,
                          title: 'Email Project Details',
                          subtitle: 'Detailed discussion via email',
                          color: Colors.blue,
                          onTap: () {
                            Navigator.pop(context);
                            _sendProjectEmail(context);
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _QuickContactOption(
                          icon: Icons.chat,
                          title: 'Quick Message',
                          subtitle: 'Fast inquiry via WhatsApp',
                          color: Colors.green,
                          onTap: () {
                            Navigator.pop(context);
                            _sendWhatsAppMessage();
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // OR divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[300])),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[300])),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Service selection
                  Text(
                    'Select a Service to Get Started:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  SizedBox(height: 16),

                  _ServiceSelectionOption(
                    icon: Icons.phone_android,
                    title: 'Mobile App Development',
                    price: 'Starting at \$2,500',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.pop(context);
                      _contactForService('Mobile App Development');
                    },
                  ),
                  SizedBox(height: 8),
                  _ServiceSelectionOption(
                    icon: Icons.cloud,
                    title: 'DevOps & Cloud Solutions',
                    price: 'Starting at \$1,800',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.pop(context);
                      _contactForService('DevOps & Cloud Solutions');
                    },
                  ),
                  SizedBox(height: 8),
                  _ServiceSelectionOption(
                    icon: Icons.storage,
                    title: 'Backend Development',
                    price: 'Starting at \$2,000',
                    color: Colors.purple,
                    onTap: () {
                      Navigator.pop(context);
                      _contactForService('Backend Development');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Quick contact option widget
  Widget _QuickContactOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Service selection option widget
  Widget _ServiceSelectionOption({
    required IconData icon,
    required String title,
    required String price,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
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
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  // Send project email
  Future<void> _sendProjectEmail(BuildContext context) async {
    final String subject = 'Project Inquiry - Mobile App Development';
    final String body = '''
Hello Faizan,

I'm interested in discussing a project with you. Here are the details:

Project Type: [Please specify - Mobile App, Web App, DevOps, etc.]
Budget Range: [Your budget range]
Timeline: [Expected timeline]
Description: [Please describe your project requirements]

Additional Requirements:
- 
- 
- 

Please let me know your availability for a detailed discussion.

Best regards,
[Your Name]
[Your Company (if applicable)]
[Your Phone Number]
    ''';

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: contactEmail,
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
        print("Project email opened successfully");
      } else {
        print('Could not launch email client');
        _showEmailFallback(context);
      }
    } catch (e) {
      print('Error launching email: $e');
      _showEmailFallback(context);
    }
  }

  // Send WhatsApp message
  Future<void> _sendWhatsAppMessage() async {
    const String phoneNumber = '+923096939565'; // Your WhatsApp number
    const String message = '''
Hi Faizan! 👋

I'm interested in your development services. Could we discuss a potential project?

Service needed: [Mobile App/DevOps/Backend]
Timeline: [When do you need it]
Budget: [Your budget range]

Looking forward to hearing from you!
    ''';

    final String whatsappUrl = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    try {
      final Uri uri = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        print("WhatsApp message opened successfully");
      } else {
        print('Could not launch WhatsApp');
      }
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }

  // Contact for specific service
  Future<void> _contactForService(String serviceName) async {
    final String subject = 'Service Inquiry - $serviceName';
    final String body = '''
Hello Faizan,

I'm interested in your $serviceName service. 

Project Details:
- Service: $serviceName
- Project Description: [Please describe your requirements]
- Timeline: [When do you need this completed]
- Budget: [Your budget range]

Specific Requirements:
- 
- 
- 

Please share your availability for a consultation.

Best regards,
[Your Name]
[Your Contact Information]
    ''';

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: contactEmail,
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
        print("Service inquiry email opened for $serviceName");
      } else {
        print('Could not launch email client');
      }
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  // Email fallback dialog
  void _showEmailFallback(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Email Client Not Available'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Please send your project details to:'),
            SizedBox(height: 8),
            SelectableText(
              contactEmail,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B5CF6),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _ServiceCard(String title, String description, IconData icon, bool isActive, String pricing, List<String> features) {
    return GestureDetector(
      onTap: () {
        print("$title service clicked!");
        _contactForService(title);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: isActive ? Border.all(color: Color(0xFF8B5CF6), width: 2) : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isActive ? 0.1 : 0.05),
                blurRadius: isActive ? 15 : 10,
                offset: Offset(0, isActive ? 8 : 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isActive ? Color(0xFF8B5CF6) : Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: isActive ? Colors.white : Color(0xFF6B7280),
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isActive ? Color(0xFF8B5CF6) : Color(0xFF1F2937),
                          ),
                        ),
                        Text(
                          pricing,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isActive)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF8B5CF6).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),

              // Features list
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: features.take(3).map((feature) => Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: Colors.green[600],
                      ),
                      SizedBox(width: 8),
                      Text(
                        feature,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ),

              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _contactForService(title),
                child: Row(
                  children: [
                    Text(
                      'Get Quote',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8B5CF6),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Color(0xFF8B5CF6),
                    ),
                  ],
                ),
              ),

              if (isActive) ...[
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5CF6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xFF8B5CF6).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFF8B5CF6),
                        size: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Most Popular Service',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}