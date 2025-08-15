import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      color: Color(0xFFF9FAFB),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, I\'m',
                  style: TextStyle(
                    fontSize: 48,
                    color: Color(0xFF1F2937),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Text(
                  'Faizan Saddique',
                  style: TextStyle(
                    fontSize: 48,
                    color: Color(0xFF1F2937),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                const Text(
                  'I\'m a passionate Android Developer with 5+ published apps on Google Play Store.\nExpertise in Java, Kotlin, Flutter, and Firebase. I specialize in AI-assisted\ndevelopment and have strong DevOps background with AWS and Docker.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    print("Say Hello clicked!");
                    // Navigate to contact section or show contact modal
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
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Say Hello!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.waving_hand,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Inline Stats (replacing separate StatsBar)
                Row(
                  children: [
                    _StatItem('2+ M.', 'Experience'),
                    SizedBox(width: 60),
                    _StatItem('10+', 'Projects Completed'),
                    SizedBox(width: 60),
                    _StatItem('5+', 'Published Apps'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 600, // ✅ Increased from 400 to 600
              margin: EdgeInsets.only(left: 40),
              child: Stack(
                children: [
                  // Main profile image container
                  Center(
                    child: Container(
                      width: 380, // ✅ Increased from 320 to 380
                      height: 520, // ✅ Increased from 320 to 520 (portrait ratio)
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF8B5CF6).withOpacity(0.2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _buildProfileImage(),
                      ),
                    ),
                  ),

                  // Decorative elements
                  Positioned(
                    top: 30,
                    right: 20, // ✅ Adjusted position for larger image
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Available',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Tech stack indicators
                  Positioned(
                    bottom: 30,
                    left: 20, // ✅ Adjusted position for larger image
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _TechIcon(Icons.phone_android, 'Android'),
                          SizedBox(width: 8),
                          _TechIcon(Icons.flutter_dash, 'Flutter'),
                          SizedBox(width: 8),
                          _TechIcon(Icons.cloud, 'AWS'),
                        ],
                      ),
                    ),
                  ),

                  // Years of experience badge
                  // ✅ ADDED: Play Store achievement badge
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profile image widget with fallback
  Widget _buildProfileImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Try to load actual image, fallback to placeholder
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8B5CF6).withOpacity(0.8),
                  Color(0xFF3B82F6).withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Actual profile image
          Image.asset(
            'assets/images/profile/faizan_profile.png', // Add your image here
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // ✅ Changed from fitHeight to cover for better scaling
            errorBuilder: (context, error, stackTrace) {
              // Fallback if image not found
              return _buildPlaceholderProfile();
            },
          ),

          // Overlay for better text readability
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder profile when image is not available
  Widget _buildPlaceholderProfile() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8B5CF6),
            Color(0xFF3B82F6),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120, // ✅ Increased placeholder icon size
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: 80, // ✅ Increased icon size
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Faizan Saddique',
            style: TextStyle(
              fontSize: 24, // ✅ Increased font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Android Developer',
            style: TextStyle(
              fontSize: 18, // ✅ Increased font size
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '5+ Published Apps',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _TechIcon(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Color(0xFF8B5CF6).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: Color(0xFF8B5CF6),
        ),
      ),
    );
  }

  Widget _StatItem(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}
