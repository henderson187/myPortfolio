class Project {
  final String id;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final String? liveUrl;
  final String? githubUrl;
  final List<String> technologies;
  final DateTime createdAt;
  final bool isFeatured;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
    this.liveUrl,
    this.githubUrl,
    required this.technologies,
    required this.createdAt,
    this.isFeatured = false,
  });

  // Factory constructor for creating from JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      liveUrl: json['liveUrl'],
      githubUrl: json['githubUrl'],
      technologies: List<String>.from(json['technologies']),
      createdAt: DateTime.parse(json['createdAt']),
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'liveUrl': liveUrl,
      'githubUrl': githubUrl,
      'technologies': technologies,
      'createdAt': createdAt.toIso8601String(),
      'isFeatured': isFeatured,
    };
  }

  // Sample data
  static List<Project> sampleProjects = [
    Project(
      id: '1',
      title: 'E-commerce Mobile App',
      description: 'A modern e-commerce mobile application built with Flutter, featuring user authentication, product catalog, shopping cart, and payment integration.',
      category: 'Mobile Development',
      imageUrl: 'assets/images/projects/project_1.jpg',
      liveUrl: 'https://play.google.com/store/apps/details?id=com.example.ecommerce',
      githubUrl: 'https://github.com/username/ecommerce-app',
      technologies: ['Flutter', 'Dart', 'Firebase', 'Stripe'],
      createdAt: DateTime(2024, 1, 15),
      isFeatured: true,
    ),
    Project(
      id: '2',
      title: 'Task Management Dashboard',
      description: 'A comprehensive task management dashboard with team collaboration features, real-time updates, and analytics.',
      category: 'Web Development',
      imageUrl: 'assets/images/projects/project_2.jpg',
      liveUrl: 'https://taskmanager.example.com',
      githubUrl: 'https://github.com/username/task-manager',
      technologies: ['React', 'Node.js', 'MongoDB', 'Socket.io'],
      createdAt: DateTime(2024, 2, 20),
      isFeatured: true,
    ),
    Project(
      id: '3',
      title: 'AI-Powered Image Editor',
      description: 'An intelligent image editing application that uses machine learning for automatic enhancements and smart cropping.',
      category: 'AI/ML',
      imageUrl: 'assets/images/projects/project_3.jpg',
      liveUrl: 'https://imageeditor.example.com',
      githubUrl: 'https://github.com/username/ai-image-editor',
      technologies: ['Python', 'TensorFlow', 'OpenCV', 'Flask'],
      createdAt: DateTime(2024, 3, 10),
      isFeatured: false,
    ),
    Project(
      id: '4',
      title: 'Social Media Analytics Tool',
      description: 'A powerful analytics platform that provides insights into social media performance across multiple platforms.',
      category: 'Data Analytics',
      imageUrl: 'assets/images/projects/project_4.jpg',
      liveUrl: 'https://socialanalytics.example.com',
      githubUrl: 'https://github.com/username/social-analytics',
      technologies: ['Vue.js', 'Python', 'PostgreSQL', 'Chart.js'],
      createdAt: DateTime(2024, 4, 5),
      isFeatured: false,
    ),
    Project(
      id: '5',
      title: 'IoT Smart Home System',
      description: 'An integrated smart home solution with IoT devices, mobile app control, and automated scheduling.',
      category: 'IoT',
      imageUrl: 'assets/images/projects/project_5.jpg',
      liveUrl: 'https://smarthome.example.com',
      githubUrl: 'https://github.com/username/smart-home',
      technologies: ['Arduino', 'Raspberry Pi', 'Flutter', 'MQTT'],
      createdAt: DateTime(2024, 5, 12),
      isFeatured: true,
    ),
    Project(
      id: '6',
      title: 'Blockchain Voting System',
      description: 'A secure and transparent voting system built on blockchain technology ensuring election integrity.',
      category: 'Blockchain',
      imageUrl: 'assets/images/projects/project_6.jpg',
      liveUrl: 'https://blockvote.example.com',
      githubUrl: 'https://github.com/username/blockchain-voting',
      technologies: ['Solidity', 'Web3.js', 'Ethereum', 'React'],
      createdAt: DateTime(2024, 6, 8),
      isFeatured: false,
    ),
  ];
}