import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onAboutPressed;
  final VoidCallback? onProcessPressed;
  final VoidCallback? onPortfolioPressed;
  final VoidCallback? onContactPressed;

  const CustomNavigationBar({
    Key? key,
    this.onHomePressed,
    this.onAboutPressed,
    this.onProcessPressed,
    this.onPortfolioPressed,
    this.onContactPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;
    final bool isSmallMobile = MediaQuery.of(context).size.width < 500;

    return Container(
      height: isMobile ? 70 : 80,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: isMobile ? _buildMobileNav(isSmallMobile) : _buildDesktopNav(),
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo Section
        _buildLogo(),
        // Navigation Menu
        Row(
          children: [
            _NavItem('Home', onHomePressed, isActive: true),
            _NavItem('About', onAboutPressed),
            _NavItem('Process', onProcessPressed),
            _NavItem('Portfolio', onPortfolioPressed),
            _buildContactButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNav(bool isSmallMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        _buildMobileMenuButton(isSmallMobile),
      ],
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: onHomePressed,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF8B5CF6),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF8B5CF6).withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'F',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Faizan',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937)),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return GestureDetector(
      onTap: onContactPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            const Text(
            'Contact',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 6),
          const Icon(
              Icons.mail_outline,
              color: Colors.white,
              size: 16),
        ],
      ),
    ),
    ),
    );
  }

  Widget _buildMobileMenuButton(bool isSmallMobile) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, color: Color(0xFF1F2937)),
      onSelected: (value) {
        switch (value) {
          case 'Home':
            onHomePressed?.call();
            break;
          case 'About':
            onAboutPressed?.call();
            break;
          case 'Process':
            onProcessPressed?.call();
            break;
          case 'Portfolio':
            onPortfolioPressed?.call();
            break;
          case 'Contact':
            onContactPressed?.call();
            break;
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'Home',
          child: Text('Home'),
        ),
        PopupMenuItem(
          value: 'About',
          child: Text('About'),
        ),
        PopupMenuItem(
          value: 'Process',
          child: Text('Process'),
        ),
        PopupMenuItem(
          value: 'Portfolio',
          child: Text('Portfolio'),
        ),
        PopupMenuItem(
          value: 'Contact',
          child: Row(
            children: [
              Text('Contact'),
              SizedBox(width: 8),
              Icon(Icons.mail_outline, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isActive;

  const _NavItem(this.text, this.onPressed, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("$text navigation clicked!");
        onPressed?.call();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.only(right: 24),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            border: isActive
                ? Border(bottom: BorderSide(color: Color(0xFF8B5CF6), width: 2))
                : null,
          ),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14,
                color: isActive ? Color(0xFF8B5CF6) : Color(0xFF6B7280),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500),
          ),
        ),
      ),
    );
  }
}