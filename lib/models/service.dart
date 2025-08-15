import 'package:flutter/material.dart';

class Service {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final List<String> features;
  final String? price;
  final bool isPopular;

  const Service({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
    this.price,
    this.isPopular = false,
  });

  // Factory constructor for creating from JSON
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      icon: IconData(json['iconCode'], fontFamily: 'MaterialIcons'),
      features: List<String>.from(json['features']),
      price: json['price'],
      isPopular: json['isPopular'] ?? false,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconCode': icon.codePoint,
      'features': features,
      'price': price,
      'isPopular': isPopular,
    };
  }

  // Sample services data
  static List<Service> sampleServices = [
    Service(
      id: '1',
      title: 'User Experience (UX)',
      description: 'I design and develop services for customers specializing in creating stylish, modern websites, web services and online stores. My passion is to design digital user experiences through carefully crafted code and user-centric design.',
      icon: Icons.psychology,
      features: [
        'User Research & Analysis',
        'Wireframing & Prototyping',
        'Information Architecture',
        'Usability Testing',
        'User Journey Mapping',
      ],
      price: 'Starting at \$2,500',
      isPopular: true,
    ),
    Service(
      id: '2',
      title: 'User Interface (UI)',
      description: 'Creating beautiful and intuitive user interfaces that provide exceptional user experiences. I focus on modern design principles, accessibility, and responsive layouts that work seamlessly across all devices.',
      icon: Icons.design_services,
      features: [
        'Visual Design Systems',
        'Responsive Web Design',
        'Mobile App Interface',
        'Brand Identity Design',
        'Interactive Prototypes',
      ],
      price: 'Starting at \$2,000',
      isPopular: false,
    ),
    Service(
      id: '3',
      title: 'Web Development',
      description: 'Full-stack web development services using modern technologies and frameworks. I build scalable, performant web applications with clean code architecture and best development practices.',
      icon: Icons.code,
      features: [
        'Frontend Development',
        'Backend Development',
        'Database Design',
        'API Development',
        'Performance Optimization',
      ],
      price: 'Starting at \$3,500',
      isPopular: false,
    ),
    Service(
      id: '4',
      title: 'Mobile Development',
      description: 'Native and cross-platform mobile application development for iOS and Android. Specializing in Flutter and React Native for efficient, high-quality mobile solutions.',
      icon: Icons.phone_android,
      features: [
        'Cross-platform Development',
        'Native iOS & Android',
        'App Store Optimization',
        'Push Notifications',
        'In-app Purchases',
      ],
      price: 'Starting at \$4,000',
      isPopular: true,
    ),
    Service(
      id: '5',
      title: 'DevOps & Cloud',
      description: 'Cloud infrastructure setup, CI/CD pipeline implementation, and DevOps automation. Ensuring reliable, scalable, and secure deployment of applications.',
      icon: Icons.cloud,
      features: [
        'AWS/Azure/GCP Setup',
        'CI/CD Pipelines',
        'Docker Containerization',
        'Monitoring & Logging',
        'Security Implementation',
      ],
      price: 'Starting at \$3,000',
      isPopular: false,
    ),
    Service(
      id: '6',
      title: 'Consultation',
      description: 'Technical consultation and project planning services. I help businesses make informed decisions about technology stack, architecture, and development strategies.',
      icon: Icons.lightbulb,
      features: [
        'Technology Assessment',
        'Project Planning',
        'Code Review',
        'Team Training',
        'Technical Documentation',
      ],
      price: '\$150/hour',
      isPopular: false,
    ),
  ];
}