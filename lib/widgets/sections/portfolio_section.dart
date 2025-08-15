import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatelessWidget {
  // GitHub repository URLs - Update with actual URLs
  static const Map<String, String> githubUrls = {
    'Riddle Puzzle': 'https://github.com/henderson187/Riddle-Puzzle',
    'Sentiment Analyzer': 'https://github.com/henderson187/Sentiment-analysis',
    'DailyNews App': 'https://github.com/henderson187/Android-Applications',
    'Electronics Trade App': 'https://github.com/henderson187/Android-Applications',
    'AWS ECS Deployment': 'https://github.com/henderson187/JenkinsPipieline',
    'CI/CD Pipeline': 'https://github.com/henderson187/JenkinsPipieline',
  };

  // Play Store URLs for live apps - Update with actual Play Store links
  static const Map<String, String> playStoreUrls = {
    'Riddle Puzzle': 'https://play.google.com/store/apps/details?id=com.stickerlimited.PerangStickerFBLucuForWAStickerApps&pcampaignid=web_share',
    'Sentiment Analyzer': 'https://play.google.com/store/apps/details?id=com.stickerlimited.SStickerHewanLucuForWAStickerApps&pcampaignid=web_share',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Here are some of my featured projects including mobile apps,\nDevOps implementations, and web applications.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
          ),
          SizedBox(height: 60),
          Row(
            children: [
              Expanded(child: _ProjectCard(
                'Riddle Puzzle',
                'MOBILE DEVELOPMENT',
                'Brain training app with daily puzzles, word games, and logic challenges. Published on Google Play Store with progress tracking features.',
                'Java, XML, Android',
                Colors.blue[400]!,
                Icons.psychology,
                isLive: true,
              )),
              SizedBox(width: 30),
              Expanded(child: _ProjectCard(
                'Sentiment Analyzer',
                'AI/ML',
                'AI-powered emotion analysis app that provides personalized mood insights and emotional tracking for self-awareness.',
                'Java, XML, AI',
                Colors.purple[400]!,
                Icons.sentiment_satisfied,
                isLive: true,
              )),
              SizedBox(width: 30),
              Expanded(child: _ProjectCard(
                'DailyNews App',
                'FLUTTER DEVELOPMENT',
                'REST API news application built with Flutter, delivering trending stories with customizable categories and offline reading.',
                'Flutter, REST APIs',
                Colors.orange[400]!,
                Icons.newspaper,
              )),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(child: _ProjectCard(
                'Electronics Trade App',
                'FINAL YEAR PROJECT',
                'Flutter-based app revolutionizing electronics trade with AI image recognition, smart search, and real-time transactions.',
                'Flutter, Dart, Firebase',
                Colors.green[400]!,
                Icons.phonelink,
              )),
              SizedBox(width: 30),
              Expanded(child: _ProjectCard(
                'AWS ECS Deployment',
                'DEVOPS',
                'Containerized React.js web application deployed on AWS ECS with Docker, featuring ECR integration and CloudWatch monitoring.',
                'AWS ECS, Docker, React',
                Colors.blue[800]!,
                Icons.cloud,
              )),
              SizedBox(width: 30),
              Expanded(child: _ProjectCard(
                'CI/CD Pipeline',
                'DEVOPS',
                'Automated Jenkins pipeline with GitHub integration, SonarQube analysis, and Docker deployment to AWS EC2 instances.',
                'Jenkins, Docker, AWS',
                Colors.red[400]!,
                Icons.settings,
              )),
            ],
          ),
          SizedBox(height: 60),
          GestureDetector(
            onTap: () async {
              print("View More Projects clicked! Opening GitHub profile...");
              await _launchGitHubProfile();
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
                    Icons.code,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'View All Projects on GitHub',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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

  // Launch GitHub profile
  Future<void> _launchGitHubProfile() async {
    const String githubProfile = 'https://github.com/henderson187'; // Update with actual username
    await _launchURL(githubProfile);
  }

  // Launch specific GitHub repository
  Future<void> _launchGitHubRepo(String projectTitle) async {
    final String? repoUrl = githubUrls[projectTitle];
    if (repoUrl != null) {
      print("Opening GitHub repo for $projectTitle: $repoUrl");
      await _launchURL(repoUrl);
    } else {
      print("GitHub URL not found for $projectTitle");
      // Fallback to general GitHub profile
      await _launchGitHubProfile();
    }
  }

  // Launch Play Store app
  Future<void> _launchPlayStore(String projectTitle) async {
    final String? playStoreUrl = playStoreUrls[projectTitle];
    if (playStoreUrl != null) {
      print("Opening Play Store for $projectTitle: $playStoreUrl");
      await _launchURL(playStoreUrl);
    } else {
      print("Play Store URL not found for $projectTitle");
    }
  }

  // Generic URL launcher
  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  Widget _ProjectCard(String title, String category, String description, String technologies, Color bgColor, IconData icon, {bool isLive = false}) {
    return GestureDetector(
      onTap: () async {
        print("$title project clicked!");
        if (isLive && playStoreUrls.containsKey(title)) {
          // If it's a live app, open Play Store
          await _launchPlayStore(title);
        } else {
          // Otherwise, open GitHub repository
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
                height: 200,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        icon,
                        size: 60,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    if (isLive)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Live',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    // Hover overlay with action text
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isLive ? Icons.play_arrow : Icons.code,
                                  color: Color(0xFF1F2937),
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  isLive ? 'Open in Play Store' : 'View on GitHub',
                                  style: TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: 14,
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
                padding: EdgeInsets.all(24),
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
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: bgColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Tech: $technologies',
                        style: TextStyle(
                          fontSize: 12,
                          color: bgColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // View Details - Always goes to GitHub
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
                                  fontSize: 14,
                                  color: Color(0xFF8B5CF6),
                                  fontWeight: FontWeight.w600,
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
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            if (isLive) SizedBox(width: 8),
                            // GitHub button - Always available
                            GestureDetector(
                              onTap: () async {
                                print("GitHub clicked for $title");
                                await _launchGitHubRepo(title);
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Color(0xFF6B7280).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.code,
                                  size: 16,
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