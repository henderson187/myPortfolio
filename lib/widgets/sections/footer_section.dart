import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;
    final bool isSmallMobile = MediaQuery.of(context).size.width < 500;

    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80,
          vertical: isMobile ? 40 : 60,
        ),
        color: Color(0xFF1F2937),
        child: Column(
            children: [
            if (!isMobile) _buildDesktopFooter(),
    if (isMobile) _buildMobileFooter(isSmallMobile),
    SizedBox(height: isMobile ? 24 : 40),
    Divider(color: Color(0xFF374151)),  // Added divider
    SizedBox(height: isMobile ? 16 : 24),  // Fixed this line
    _buildFooterBottom(isMobile),
    ],
    ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildLogoAndDescription(),
        ),
        SizedBox(width: 40),
        Expanded(
          flex: 1,
          child: _buildNavigationItems(false),
        ),
        SizedBox(width: 40),
        Expanded(
          flex: 1,
          child: _buildSocialLinks(),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(bool isSmallMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLogoAndDescription(),
        SizedBox(height: 32),
        if (isSmallMobile)
          _buildMobileNavigationColumn()
        else
          _buildNavigationItems(true),
        SizedBox(height: 32),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildLogoAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLogoAndName(),
        SizedBox(height: 16),
        Text(
          'Creating beautiful, functional mobile and web applications with Flutter.',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF9CA3AF),
            height: 1.6,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Based in Pakistan, working with clients worldwide.',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF9CA3AF),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildLogoAndName() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFF8B5CF6),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              'F',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        const Text(
          'Faizan Saddique',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationItems(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Navigation',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: isMobile ? 24 : 0,
          runSpacing: 12,
          direction: isMobile ? Axis.horizontal : Axis.vertical,
          children: [
            _FooterNavItem('Home'),
            _FooterNavItem('About'),
            _FooterNavItem('Process'),
            _FooterNavItem('Portfolio'),
            _FooterNavItem('Contact'),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNavigationColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Navigation',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FooterNavItem('Home'),
            SizedBox(height: 12),
            _FooterNavItem('About'),
            SizedBox(height: 12),
            _FooterNavItem('Process'),
            SizedBox(height: 12),
            _FooterNavItem('Portfolio'),
            SizedBox(height: 12),
            _FooterNavItem('Contact'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Me',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            _SocialIcon(Icons.email, 'mailto:faizan.saddique83@gmail.com'),
            SizedBox(width: 16),
            _SocialIcon(Icons.link, 'https://github.com/henderson187'),
            SizedBox(width: 16),
            _SocialIcon(Icons.work, 'https://www.linkedin.com/in/faizan-saddique-41ab8722a?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BXh%2FaXHwDTg299Rf1i8RCqg%3D%3D'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterBottom(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Copyright © 2024 Faizan Saddique. All rights reserved.',
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: Color(0xFF9CA3AF),
          ),
        ),
        if (!isMobile)
          const Text(
            'Made with Flutter',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF9CA3AF),
            ),
          ),
      ],
    );
  }
}

class _FooterNavItem extends StatelessWidget {
  final String text;

  const _FooterNavItem(this.text);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Handle navigation item tap
          print('$text tapped');
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF9CA3AF),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon(this.icon, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Opening: $url');
        // Implement URL launching functionality
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFF374151),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}