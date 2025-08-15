import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      color: Color(0xFF1F2937),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              ),
              Row(
                children: [
                  _FooterNavItem('Home'),
                  _FooterNavItem('About'),
                  _FooterNavItem('Process'),
                  _FooterNavItem('Portfolio'),
                  _FooterNavItem('Contact'),
                ],
              ),
              const Text(
                'Copyright © 2024 Faizan Saddique.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _FooterNavItem(String text) {
    return Container(
      margin: EdgeInsets.only(right: 32),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF9CA3AF),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}