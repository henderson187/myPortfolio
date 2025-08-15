class Testimonial {
  final String id;
  final String name;
  final String position;
  final String company;
  final String content;
  final String? avatarUrl;
  final double rating;
  final DateTime createdAt;
  final bool isFeatured;

  const Testimonial({
    required this.id,
    required this.name,
    required this.position,
    required this.company,
    required this.content,
    this.avatarUrl,
    required this.rating,
    required this.createdAt,
    this.isFeatured = false,
  });

  // Factory constructor for creating from JSON
  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      company: json['company'],
      content: json['content'],
      avatarUrl: json['avatarUrl'],
      rating: json['rating'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'company': company,
      'content': content,
      'avatarUrl': avatarUrl,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
      'isFeatured': isFeatured,
    };
  }

  // Get formatted position and company
  String get fullPosition => '$position, $company';

  // Sample testimonials data
  static List<Testimonial> sampleTestimonials = [
    Testimonial(
      id: '1',
      name: 'Esther Howard',
      position: 'Managing Director',
      company: 'ABC Company',
      content: 'Nulla efficitur nisl sit amet velit malesuada dapibus. Duis mollis felis turpis, nec semper odio convallis at. Curabitur imperdiet semper arcu, a finibus arcu suscipit in. Donec quis placerat nibh. Maecenas est purus, eleifend ac cursus sed, tincidunt ut sapien. Morbi ornare elit at libero suscipit porta.',
      avatarUrl: 'assets/images/testimonials/esther_howard.jpg',
      rating: 5.0,
      createdAt: DateTime(2024, 1, 15),
      isFeatured: true,
    ),
    Testimonial(
      id: '2',
      name: 'John Smith',
      position: 'CTO',
      company: 'Tech Innovators',
      content: 'Working with Brooklyn was an exceptional experience. The attention to detail and technical expertise delivered exceeded our expectations. The project was completed on time and within budget.',
      avatarUrl: 'assets/images/testimonials/john_smith.jpg',
      rating: 5.0,
      createdAt: DateTime(2024, 2, 8),
      isFeatured: true,
    ),
    Testimonial(
      id: '3',
      name: 'Sarah Johnson',
      position: 'Product Manager',
      company: 'Digital Solutions Inc',
      content: 'The user experience design was outstanding. Our conversion rates improved by 40% after implementing the new design. Highly recommended for UX/UI projects.',
      avatarUrl: 'assets/images/testimonials/sarah_johnson.jpg',
      rating: 4.8,
      createdAt: DateTime(2024, 2, 22),
      isFeatured: false,
    ),
    Testimonial(
      id: '4',
      name: 'Michael Chen',
      position: 'Startup Founder',
      company: 'InnovateLab',
      content: 'Brooklyn helped us build our MVP from scratch. The development process was smooth, and the final product perfectly matched our vision. Great communication throughout the project.',
      avatarUrl: 'assets/images/testimonials/michael_chen.jpg',
      rating: 5.0,
      createdAt: DateTime(2024, 3, 5),
      isFeatured: true,
    ),
    Testimonial(
      id: '5',
      name: 'Emily Davis',
      position: 'Marketing Director',
      company: 'CreativeWorks',
      content: 'The website redesign was phenomenal. Our bounce rate decreased significantly, and user engagement increased. The responsive design works flawlessly across all devices.',
      avatarUrl: 'assets/images/testimonials/emily_davis.jpg',
      rating: 4.9,
      createdAt: DateTime(2024, 3, 18),
      isFeatured: false,
    ),
    Testimonial(
      id: '6',
      name: 'David Wilson',
      position: 'CEO',
      company: 'Future Systems',
      content: 'Professional, reliable, and delivers quality work. The mobile app development exceeded our requirements and was delivered ahead of schedule. Will definitely work together again.',
      avatarUrl: 'assets/images/testimonials/david_wilson.jpg',
      rating: 5.0,
      createdAt: DateTime(2024, 4, 2),
      isFeatured: true,
    ),
  ];
}