import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../constants/dimensions.dart';
import '../../models/service.dart';

class ServiceCard extends StatefulWidget {
  final Service service;
  final VoidCallback? onTap;
  final bool isActive;
  final bool showPrice;
  final bool showFeatures;

  const ServiceCard({
    Key? key,
    required this.service,
    this.onTap,
    this.isActive = false,
    this.showPrice = false,
    this.showFeatures = false,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
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
            ..translate(0.0, _isHovered ? -3.0 : 0.0),
          padding: EdgeInsets.all(AppDimensions.cardPadding),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: Border.all(
              color: widget.isActive || _isHovered
                  ? AppColors.primary
                  : AppColors.gray200,
              width: widget.isActive ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? AppColors.shadowMedium : AppColors.shadowLight,
                blurRadius: _isHovered
                    ? AppDimensions.shadowBlurRadiusLarge
                    : AppDimensions.shadowBlurRadius,
                offset: Offset(0, _isHovered
                    ? AppDimensions.shadowOffsetYLarge
                    : AppDimensions.shadowOffsetY),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: AppDimensions.spacing16),
              _buildDescription(),
              if (widget.showFeatures) ...[
                SizedBox(height: AppDimensions.spacing20),
                _buildFeatures(),
              ],
              if (widget.showPrice && widget.service.price != null) ...[
                SizedBox(height: AppDimensions.spacing20),
                _buildPrice(),
              ],
              if (widget.service.isPopular) ...[
                SizedBox(height: AppDimensions.spacing16),
                _buildPopularBadge(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Icon
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: widget.isActive || _isHovered
                ? AppColors.primary
                : AppColors.gray100,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
          child: Icon(
            widget.service.icon,
            color: widget.isActive || _isHovered
                ? AppColors.white
                : AppColors.gray500,
            size: AppDimensions.iconMedium,
          ),
        ),
        SizedBox(width: AppDimensions.spacing16),

        // Title
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.service.title,
                style: AppTextStyles.h4.copyWith(
                  color: widget.isActive
                      ? AppColors.primary
                      : AppColors.textPrimary,
                ),
              ),
              if (widget.service.isPopular)
                Container(
                  margin: EdgeInsets.only(top: AppDimensions.spacing4),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing8,
                    vertical: AppDimensions.spacing4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                  ),
                  child: Text(
                    'Popular',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.service.description,
      style: AppTextStyles.bodySmall.copyWith(
        height: 1.6,
      ),
      maxLines: widget.showFeatures ? null : 4,
      overflow: widget.showFeatures ? null : TextOverflow.ellipsis,
    );
  }

  Widget _buildFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Features:',
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppDimensions.spacing12),
        ...widget.service.features.map((feature) => _buildFeatureItem(feature)),
      ],
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.spacing8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: AppDimensions.spacing12),
          Expanded(
            child: Text(
              feature,
              style: AppTextStyles.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Container(
      padding: EdgeInsets.all(AppDimensions.spacing16),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        border: Border.all(color: AppColors.gray200),
      ),
      child: Row(
        children: [
          Icon(
            Icons.attach_money,
            color: AppColors.primary,
            size: AppDimensions.iconMedium,
          ),
          SizedBox(width: AppDimensions.spacing8),
          Text(
            widget.service.price!,
            style: AppTextStyles.h6.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularBadge() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppDimensions.spacing8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: AppColors.primary,
            size: AppDimensions.iconSmall,
          ),
          SizedBox(width: AppDimensions.spacing8),
          Text(
            'Most Popular Service',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}