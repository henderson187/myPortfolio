import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkProcessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      color: Color(0xFFF9FAFB),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildProcessDescription(),
        ),
        SizedBox(width: 80),
        Expanded(
          flex: 1,
          child: _buildProcessCards(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProcessDescription(),
        SizedBox(height: 40),
        _buildProcessCards(),
      ],
    );
  }

  Widget _buildProcessDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Work Process',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'I follow a systematic approach to deliver high-quality mobile applications and cloud solutions. My process ensures efficient development cycles, robust testing, and seamless deployment workflows.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
            height: 1.6,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'From initial concept to final deployment, I leverage modern development tools and AI-assisted coding to accelerate delivery while maintaining code quality and system reliability.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
            height: 1.6,
          ),
        ),
        SizedBox(height: 32),
        // Process highlights
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF8B5CF6).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xFF8B5CF6).withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Color(0xFF8B5CF6),
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Process Highlights',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF8B5CF6),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                '• AI-assisted development with Claude & ChatGPT\n• Agile methodology with 2-week sprints\n• Continuous Integration/Continuous Deployment\n• Automated testing and quality assurance',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1F2937),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProcessCards() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isNarrow = constraints.maxWidth < 500;

        if (isNarrow) {
          return Column(
            children: [
              _ProcessCard(
                '1',
                'Requirements & Planning',
                Icons.assignment,
                'Analyze requirements, define scope, and create detailed project roadmap with timeline estimates.',
              ),
              SizedBox(height: 20),
              _ProcessCard(
                '2',
                'Design & Architecture',
                Icons.architecture,
                'Create system architecture, UI/UX designs, and establish development environment setup.',
              ),
              SizedBox(height: 20),
              _ProcessCard(
                '3',
                'Development & Testing',
                Icons.code,
                'Build features using modern frameworks, implement automated testing, and ensure code quality.',
              ),
              SizedBox(height: 20),
              _ProcessCard(
                '4',
                'Deploy & Maintain',
                Icons.cloud_upload,
                'Deploy to production using CI/CD pipelines, monitor performance, and provide ongoing support.',
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _ProcessCard(
                      '1',
                      'Requirements & Planning',
                      Icons.assignment,
                      'Analyze requirements, define scope, and create detailed project roadmap with timeline estimates.',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: _ProcessCard(
                      '2',
                      'Design & Architecture',
                      Icons.architecture,
                      'Create system architecture, UI/UX designs, and establish development environment setup.',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _ProcessCard(
                      '3',
                      'Development & Testing',
                      Icons.code,
                      'Build features using modern frameworks, implement automated testing, and ensure code quality.',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: _ProcessCard(
                      '4',
                      'Deploy & Maintain',
                      Icons.cloud_upload,
                      'Deploy to production using CI/CD pipelines, monitor performance, and provide ongoing support.',
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}

class _ProcessCard extends StatelessWidget {
  final String number;
  final String title;
  final IconData icon;
  final String description;

  const _ProcessCard(this.number, this.title, this.icon, this.description);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Process step $number: $title clicked!");
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF8B5CF6),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF8B5CF6).withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(icon, color: Colors.white, size: 24),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF8B5CF6).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Step $number',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12),
              // Process duration indicator
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 14,
                      color: Colors.green[700],
                    ),
                    SizedBox(width: 4),
                    Text(
                      _getProcessDuration(number),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getProcessDuration(String stepNumber) {
    switch (stepNumber) {
      case '1':
        return '1-2 Days';
      case '2':
        return '3-5 Days';
      case '3':
        return '1-3 Weeks';
      case '4':
        return '2-3 Days';
      default:
        return 'Varies';
    }
  }
}