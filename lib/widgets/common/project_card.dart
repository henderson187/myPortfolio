import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../constants/dimensions.dart';
import '../../models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback? onTap;
  final bool showFullDescription;

  const ProjectCard({
    Key? key,
    required this.project,
    this.onTap,
    this.showFullDescription = false,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -5.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? AppColors.shadowMedium : AppColors.shadowLight,
                blurRadius: _isHovered ? AppDimensions.shadowBlurRadiusLarge : AppDimensions.shadowBlurRadius,
                offset: Offset(0, _isHovered ? AppDimensions.shadowOffsetYLarge : AppDimensions.shadowOffsetY),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectImage(),
              _buildProjectContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage() {
    return Container(
      height: AppDimensions.portfolioCardImageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusMedium),
        ),
      ),
      child: Stack(
        children: [
          // Project Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _getProjectColor(),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppDimensions.radiusMedium),
              ),
              image: widget.project.imageUrl.startsWith('http')
                  ? DecorationImage(
                image: NetworkImage(widget.project.imageUrl),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: widget.project.imageUrl.startsWith('http')
                ? null
                : Center(
              child: Icon(
                _getProjectIcon(),
                size: 60,
                color: AppColors.white.withOpacity(0.8),
              ),
            ),
          ),

          // Overlay on hover
          if (_isHovered)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.dark.withOpacity(0.7),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.radiusMedium),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.visibility,
                      color: AppColors.white,
                      size: AppDimensions.iconLarge,
                    ),
                    SizedBox(height: AppDimensions.spacing8),
                    Text(
                      'View Project',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Featured badge
          if (widget.project.isFeatured)
            Positioned(
              top: AppDimensions.spacing16,
              right: AppDimensions.spacing16,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing8,
                  vertical: AppDimensions.spacing4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                ),
                child: Text(
                  'Featured',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProjectContent() {
    return Container(
      padding: EdgeInsets.all(AppDimensions.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDimensions.radiusMedium),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category
          Text(
            widget.project.category.toUpperCase(),
            style: AppTextStyles.captionBold.copyWith(
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: AppDimensions.spacing8),

          // Title
          Text(
            widget.project.title,
            style: AppTextStyles.h5,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppDimensions.spacing12),

          // Description
          Text(
            widget.project.description,
            style: AppTextStyles.bodySmall,
            maxLines: widget.showFullDescription ? null : 3,
            overflow: widget.showFullDescription ? null : TextOverflow.ellipsis,
          ),
          SizedBox(height: AppDimensions.spacing16),

          // Technologies
          if (widget.project.technologies.isNotEmpty)
            Wrap(
              spacing: AppDimensions.spacing8,
              runSpacing: AppDimensions.spacing4,
              children: widget.project.technologies
                  .take(3)
                  .map((tech) => _buildTechChip(tech))
                  .toList(),
            ),
          SizedBox(height: AppDimensions.spacing16),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Case Study',
                      style: AppTextStyles.link,
                    ),
                    SizedBox(width: AppDimensions.spacing8),
                    Icon(
                      Icons.arrow_forward,
                      size: AppDimensions.iconSmall,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
              if (widget.project.githubUrl != null)
                IconButton(
                  onPressed: () {
                    // Handle GitHub link
                  },
                  icon: Icon(
                    Icons.code,
                    color: AppColors.gray500,
                    size: AppDimensions.iconMedium,
                  ),
                  tooltip: 'View Code',
                ),
              if (widget.project.liveUrl != null)
                IconButton(
                  onPressed: () {
                    // Handle live URL
                  },
                  icon: Icon(
                    Icons.launch,
                    color: AppColors.gray500,
                    size: AppDimensions.iconMedium,
                  ),
                  tooltip: 'Live Demo',
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(String technology) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing8,
        vertical: AppDimensions.spacing4,
      ),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Text(
        technology,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getProjectColor() {
    // Generate color based on project category
    switch (widget.project.category.toLowerCase()) {
      case 'mobile development':
        return Colors.blue[400]!;
      case 'web development':
        return Colors.green[400]!;
      case 'ai/ml':
        return Colors.purple[400]!;
      case 'data analytics':
        return Colors.orange[400]!;
      case 'iot':
        return Colors.teal[400]!;
      case 'blockchain':
        return Colors.indigo[400]!;
      default:
        return AppColors.primary;
    }
  }

  IconData _getProjectIcon() {
    // Generate icon based on project category
    switch (widget.project.category.toLowerCase()) {
      case 'mobile development':
        return Icons.phone_android;
      case 'web development':
        return Icons.web;
      case 'ai/ml':
        return Icons.psychology;
      case 'data analytics':
        return Icons.analytics;
      case 'iot':
        return Icons.sensors;
      case 'blockchain':
        return Icons.link;
      default:
        return Icons.code;
    }
  }
}