import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/navigation/navigation_bar.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/footer_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/portfolio_section.dart';
// import '../widgets/sections/services_section.dart'; // REMOVED
import '../widgets/sections/work_process_section.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for navigation
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  // final GlobalKey _servicesKey = GlobalKey(); // REMOVED
  final GlobalKey _contactKey = GlobalKey();

  // Smooth scroll to section
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  // Show contact modal/bottom sheet - FIXED OVERFLOW & CENTERED
  void _showContactOptions() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400, // Fixed width
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9, // Responsive width
              maxHeight: MediaQuery.of(context).size.height * 0.7, // Responsive height
            ),
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
            child: SingleChildScrollView( // Prevent overflow
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header with close button
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
                          Icons.mail_outline,
                          color: Color(0xFF8B5CF6),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded( // Prevent text overflow
                        child: Text(
                          'Get in Touch',
                          style: TextStyle(
                            fontSize: 20, // Reduced from 24
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
                    'Choose how you\'d like to reach out:',
                    style: TextStyle(
                      fontSize: 14, // Reduced size
                      color: Color(0xFF6B7280),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  _ContactOption(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: 'faizan.saddique83@gmail.com',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.pop(context);
                      print("Email contact clicked");
                      _launchEmail();
                    },
                  ),
                  _ContactOption(
                    icon: Icons.phone,
                    title: 'Phone',
                    subtitle: '+92-309-6939565',
                    color: Colors.green,
                    onTap: () {
                      Navigator.pop(context);
                      print("Phone contact clicked");
                      _launchPhone();
                    },
                  ),
                  _ContactOption(
                    icon: Icons.chat,
                    title: 'WhatsApp',
                    subtitle: 'Quick message via WhatsApp',
                    color: Colors.green[600]!,
                    onTap: () {
                      Navigator.pop(context);
                      print("WhatsApp contact clicked");
                      _launchWhatsApp();
                    },
                  ),
                  _ContactOption(
                    icon: Icons.message,
                    title: 'Contact Form',
                    subtitle: 'Send me a detailed message',
                    color: Color(0xFF8B5CF6),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(_contactKey);
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

  // Web-optimized email launch function
  Future<void> _launchEmail() async {
    final String emailUrl = 'mailto:faizan.saddique83@gmail.com?subject=Project%20Inquiry&body=Hello%20Faizan,%0A%0AI%20would%20like%20to%20discuss%20a%20project%20with%20you.%0A%0ABest%20regards,';

    try {
      final Uri uri = Uri.parse(emailUrl);
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );
      print('Email launched successfully');
    } catch (e) {
      print('Error launching email: $e');
      _showEmailFallback();
    }
  }

  // Web-optimized phone launch function
  Future<void> _launchPhone() async {
    final String phoneUrl = 'tel:+923096939565';

    try {
      final Uri uri = Uri.parse(phoneUrl);
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );
      print('Phone launched successfully');
    } catch (e) {
      print('Error launching phone: $e');
      _showPhoneFallback();
    }
  }

  // Web-optimized WhatsApp launch function
  Future<void> _launchWhatsApp() async {
    const String message = 'Hi Faizan! I\'m interested in discussing a project with you.';
    final String whatsappUrl = 'https://wa.me/923096939565?text=${Uri.encodeComponent(message)}';

    try {
      final Uri uri = Uri.parse(whatsappUrl);
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault, // For web, opens in new tab
      );
      print('WhatsApp launched successfully');
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }

  // Fallback method to show email address in a dialog
  void _showEmailFallback() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Email Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Please send an email to:'),
              SizedBox(height: 8),
              SelectableText(
                'faizan.saddique83@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B5CF6),
                ),
              ),
              SizedBox(height: 8),
              Text('You can select and copy the email address above.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Fallback for phone on web
  void _showPhoneFallback() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Phone Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Please call:'),
              SizedBox(height: 8),
              SelectableText(
                '+92-309-6939565',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CustomNavigationBar(
              onHomePressed: () => _scrollToSection(_homeKey),
              onAboutPressed: () => _scrollToSection(_aboutKey),
              onProcessPressed: () => _scrollToSection(_processKey),
              onPortfolioPressed: () => _scrollToSection(_portfolioKey),
              // onServicesPressed: () => _scrollToSection(_servicesKey), // REMOVED
              onContactPressed: _showContactOptions,
            ),

            // Main Sections (removed ServicesSection)
            Container(key: _homeKey, child: HeroSection()),
            Container(key: _aboutKey, child: AboutSection()),
            Container(key: _processKey, child: WorkProcessSection()),
            Container(key: _portfolioKey, child: PortfolioSection()),
            // Container(key: _servicesKey, child: ServicesSection()), // REMOVED
            Container(key: _contactKey, child: ContactSection()),
            FooterSection(),
          ],
        ),
      ),

      // Floating Action Button for quick contact
      floatingActionButton: FloatingActionButton(
        onPressed: _showContactOptions,
        backgroundColor: Color(0xFF8B5CF6),
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
        tooltip: 'Quick Contact',
      ),
    );
  }

  // Contact option widget for bottom sheet
  Widget _ContactOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFFE5E7EB),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF6B7280),
            ),
          ],
        ),
      ),
    );
  }
}