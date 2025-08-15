import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onAboutPressed;
  final VoidCallback? onProcessPressed;
  final VoidCallback? onPortfolioPressed;
  // final VoidCallback? onServicesPressed; // REMOVED
  final VoidCallback? onContactPressed;

  const CustomNavigationBar({
    Key? key,
    this.onHomePressed,
    this.onAboutPressed,
    this.onProcessPressed,
    this.onPortfolioPressed,
    // this.onServicesPressed, // REMOVED
    this.onContactPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        color: Colors.white,  // ✅ Moved color inside decoration
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Section
          GestureDetector(
            onTap: onHomePressed,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5CF6),
                    borderRadius: BorderRadius.circular(25),
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Faizan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),

          // Navigation Menu
          Row(
            children: [
              _NavItem('Home', onHomePressed, isActive: true),
              _NavItem('About', onAboutPressed),
              _NavItem('Process', onProcessPressed),
              _NavItem('Portfolio', onPortfolioPressed),
              // _NavItem('Services', onServicesPressed), // REMOVED

              // Contact Button
              GestureDetector(
                onTap: onContactPressed,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
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
                        Text(
                          'Contact',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                          size: 18,
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
    );
  }

  Widget _NavItem(String text, VoidCallback? onPressed, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        print("$text navigation clicked!");
        onPressed?.call();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.only(right: 32),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            border: isActive
                ? Border(bottom: BorderSide(color: Color(0xFF8B5CF6), width: 2))
                : null,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: isActive ? Color(0xFF8B5CF6) : Color(0xFF6B7280),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}