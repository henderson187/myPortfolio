import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatelessWidget {
  static const Map<String, String> githubUrls = {
    'Riddle Puzzle': 'https://github.com/henderson187/Riddle-Puzzle',
    'Sentiment Analyzer': 'https://github.com/henderson187/Sentiment-analysis',
    'DailyNews App': 'https://github.com/henderson187/Android-Applications',
    'Electronics Trade App': 'https://github.com/henderson187/Android-Applications',
    'AWS ECS Deployment': 'https://github.com/henderson187/JenkinsPipieline',
    'CI/CD Pipeline': 'https://github.com/henderson187/JenkinsPipieline',
  };

  static const Map<String, String> playStoreUrls = {
    'Riddle Puzzle': 'https://play.google.com/store/apps/details?id=com.stickerlimited.PerangStickerFBLucuForWAStickerApps&pcampaignid=web_share',
    'Sentiment Analyzer': 'https://play.google.com/store/apps/details?id=com.stickerlimited.SStickerHewanLucuForWAStickerApps&pcampaignid=web_share',
  };

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
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Here are some of my featured projects including mobile apps,\nDevOps implementations, and web applications.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          // Projects Grid
          if (isMobile)
            _buildMobileProjectGrid()
          else if (isTablet)
            _buildTabletProjectGrid()
          else
            _buildDesktopProjectGrid(),

          SizedBox(height: isMobile ? 40 : 60),
          GestureDetector(
            onTap: () async {
              print("View More Projects clicked! Opening GitHub profile...");
              await _launchGitHubProfile();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 32,
                  vertical: isMobile ? 12 : 16
              ),
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
                    Icons.code,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'View All Projects on GitHub',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.open_in_new,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectGrid() {
    final projects = [
      {'title': 'Riddle Puzzle', 'category': 'MOBILE DEVELOPMENT', 'description': 'Brain training app with daily puzzles, word games, and logic challenges. Published on Google Play Store with progress tracking features.', 'tech': 'Java, XML, Android', 'color': Colors.blue[400]!, 'icon': Icons.psychology, 'isLive': true},
      {'title': 'Sentiment Analyzer', 'category': 'AI/ML', 'description': 'AI-powered emotion analysis app that provides personalized mood insights and emotional tracking for self-awareness.', 'tech': 'Java, XML, AI', 'color': Colors.purple[400]!, 'icon': Icons.sentiment_satisfied, 'isLive': true},
      {'title': 'DailyNews App', 'category': 'FLUTTER DEVELOPMENT', 'description': 'REST API news application built with Flutter, delivering trending stories with customizable categories and offline reading.', 'tech': 'Flutter, REST APIs', 'color': Colors.orange[400]!, 'icon': Icons.newspaper, 'isLive': false},
      {'title': 'Electronics Trade App', 'category': 'FINAL YEAR PROJECT', 'description': 'Flutter-based app revolutionizing electronics trade with AI image recognition, smart search, and real-time transactions.', 'tech': 'Flutter, Dart, Firebase', 'color': Colors.green[400]!, 'icon': Icons.phonelink, 'isLive': false},
      {'title': 'AWS ECS Deployment', 'category': 'DEVOPS', 'description': 'Containerized React.js web application deployed on AWS ECS with Docker, featuring ECR integration and CloudWatch monitoring.', 'tech': 'AWS ECS, Docker, React', 'color': Colors.blue[800]!, 'icon': Icons.cloud, 'isLive': false},
      {'title': 'CI/CD Pipeline', 'category': 'DEVOPS', 'description': 'Automated Jenkins pipeline with GitHub integration, SonarQube analysis, and Docker deployment to AWS EC2 instances.', 'tech': 'Jenkins, Docker, AWS', 'color': Colors.red[400]!, 'icon': Icons.settings, 'isLive': false},
    ];

    return Column(
      children: projects.map((project) => Container(
        margin: EdgeInsets.only(bottom: 20),
        child: _ProjectCard(
          project['title'] as String,
          project['category'] as String,
          project['description'] as String,
          project['tech'] as String,
          project['color'] as Color,
          project['icon'] as IconData,
          isLive: project['isLive'] as bool,
          isMobile: true,
        ),
      )).toList(),
    );
  }

  Widget _buildTabletProjectGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _ProjectCard('Riddle Puzzle', 'MOBILE DEVELOPMENT', 'Brain training app with daily puzzles, word games, and logic challenges. Published on Google Play Store with progress tracking features.', 'Java, XML, Android', Colors.blue[400]!, Icons.psychology, isLive: true)),
            SizedBox(width: 20),
            Expanded(child: _ProjectCard('Sentiment Analyzer', 'AI/ML', 'AI-powered emotion analysis app that provides personalized mood insights and emotional tracking for self-awareness.', 'Java, XML, AI', Colors.purple[400]!, Icons.sentiment_satisfied, isLive: true)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _ProjectCard('DailyNews App', 'FLUTTER DEVELOPMENT', 'REST API news application built with Flutter, delivering trending stories with customizable categories and offline reading.', 'Flutter, REST APIs', Colors.orange[400]!, Icons.newspaper)),
            SizedBox(width: 20),
            Expanded(child: _ProjectCard('Electronics Trade App', 'FINAL YEAR PROJECT', 'Flutter-based app revolutionizing electronics trade with AI image recognition, smart search, and real-time transactions.', 'Flutter, Dart, Firebase', Colors.green[400]!, Icons.phonelink)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _ProjectCard('AWS ECS Deployment', 'DEVOPS', 'Containerized React.js web application deployed on AWS ECS with Docker, featuring ECR integration and CloudWatch monitoring.', 'AWS ECS, Docker, React', Colors.blue[800]!, Icons.cloud)),
            SizedBox(width: 20),
            Expanded(child: _ProjectCard('CI/CD Pipeline', 'DEVOPS', 'Automated Jenkins pipeline with GitHub integration, SonarQube analysis, and Docker deployment to AWS EC2 instances.', 'Jenkins, Docker, AWS', Colors.red[400]!, Icons.settings)),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopProjectGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _ProjectCard('Riddle Puzzle', 'MOBILE DEVELOPMENT', 'Brain training app with daily puzzles, word games, and logic challenges. Published on Google Play Store with progress tracking features.', 'Java, XML, Android', Colors.blue[400]!, Icons.psychology, isLive: true)),
            SizedBox(width: 30),
            Expanded(child: _ProjectCard('Sentiment Analyzer', 'AI/ML', 'AI-powered emotion analysis app that provides personalized mood insights and emotional tracking for self-awareness.', 'Java, XML, AI', Colors.purple[400]!, Icons.sentiment_satisfied, isLive: true)),
            SizedBox(width: 30),
            Expanded(child: _ProjectCard('DailyNews App', 'FLUTTER DEVELOPMENT', 'REST API news application built with Flutter, delivering trending stories with customizable categories and offline reading.', 'Flutter, REST APIs', Colors.orange[400]!, Icons.newspaper)),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(child: _ProjectCard('Electronics Trade App', 'FINAL YEAR PROJECT', 'Flutter-based app revolutionizing electronics trade with AI image recognition, smart search, and real-time transactions.', 'Flutter, Dart, Firebase', Colors.green[400]!, Icons.phonelink)),
            SizedBox(width: 30),
            Expanded(child: _ProjectCard('AWS ECS Deployment', 'DEVOPS', 'Containerized React.js web application deployed on AWS ECS with Docker, featuring ECR integration and CloudWatch monitoring.', 'AWS ECS, Docker, React', Colors.blue[800]!, Icons.cloud)),
            SizedBox(width: 30),
            Expanded(child: _ProjectCard('CI/CD Pipeline', 'DEVOPS', 'Automated Jenkins pipeline with GitHub integration, SonarQube analysis, and Docker deployment to AWS EC2 instances.', 'Jenkins, Docker, AWS', Colors.red[400]!, Icons.settings)),
          ],
        ),
      ],
    );
  }

  Future<void> _launchGitHubProfile() async {
    const String githubProfile = 'https://github.com/henderson187';
    await _launchURL(githubProfile);
  }

  Future<void> _launchGitHubRepo(String projectTitle) async {
    final String? repoUrl = githubUrls[projectTitle];
    if (repoUrl != null) {
      print("Opening GitHub repo for $projectTitle: $repoUrl");
      await _launchURL(repoUrl);
    } else {
      print("GitHub URL not found for $projectTitle");
      await _launchGitHubProfile();
    }
  }

  Future<void> _launchPlayStore(String projectTitle) async {
    final String? playStoreUrl = playStoreUrls[projectTitle];
    if (playStoreUrl != null) {
      print("Opening Play Store for $projectTitle: $playStoreUrl");
      await _launchURL(playStoreUrl);
    } else {
      print("Play Store URL not found for $projectTitle");
    }
  }

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  Widget _ProjectCard(String title, String category, String description, String technologies, Color bgColor, IconData icon, {bool isLive = false, bool isMobile = false}) {
    return GestureDetector(
      onTap: () async {
        print("$title project clicked!");
        if (isLive && playStoreUrls.containsKey(title)) {
          await _launchPlayStore(title);
        } else {
          await _launchGitHubRepo(title);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
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
            children: [
              Container(
                height: isMobile ? 160 : 200,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        icon,
                        size: isMobile ? 50 : 60,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    if (isLive)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                'Live',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isLive ? Icons.play_arrow : Icons.code,
                                  color: Color(0xFF1F2937),
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  isLive ? 'Open in Play Store' : 'View on GitHub',
                                  style: TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: isMobile ? 12 : 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF6B7280),
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
                        color: Color(0xFF6B7280),
                        height: 1.5,
                      ),
                      maxLines: isMobile ? 3 : 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: bgColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Tech: $technologies',
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 12,
                          color: bgColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // View Details
                        GestureDetector(
                          onTap: () async {
                            print("View Details clicked for $title");
                            await _launchGitHubRepo(title);
                          },
                          child: Row(
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(
                                  fontSize: isMobile ? 12 : 14,
                                  color: Color(0xFF8B5CF6),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward,
                                size: isMobile ? 14 : 16,
                                color: Color(0xFF8B5CF6),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            // Live demo button - Only for live apps
                            if (isLive)
                              GestureDetector(
                                onTap: () async {
                                  print("Live demo clicked for $title");
                                  await _launchPlayStore(title);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(isMobile ? 4 : 6),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: isMobile ? 14 : 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            if (isLive) SizedBox(width: 6),
                            // GitHub button
                            GestureDetector(
                              onTap: () async {
                                print("GitHub clicked for $title");
                                await _launchGitHubRepo(title);
                              },
                              child: Container(
                                padding: EdgeInsets.all(isMobile ? 4 : 6),
                                decoration: BoxDecoration(
                                  color: Color(0xFF6B7280).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.code,
                                  size: isMobile ? 14 : 16,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
}