import 'package:flutter/material.dart';
import '../constants/dimensions.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppDimensions.mobileBreakpoint &&
        width < AppDimensions.tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppDimensions.tabletBreakpoint;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static EdgeInsets getSectionPadding(BuildContext context) {
    if (isMobile(context)) {
      return EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing20,
        vertical: AppDimensions.spacing60,
      );
    } else if (isTablet(context)) {
      return EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing40,
        vertical: AppDimensions.spacing80,
      );
    } else {
      return EdgeInsets.symmetric(
        horizontal: AppDimensions.sectionPaddingHorizontal,
        vertical: AppDimensions.sectionPaddingVertical,
      );
    }
  }

  static double getGridChildAspectRatio(BuildContext context) {
    if (isMobile(context)) {
      return 0.7;
    } else if (isTablet(context)) {
      return 0.8;
    } else {
      return 0.9;
    }
  }

  static int getGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) {
      return 1;
    } else if (isTablet(context)) {
      return 2;
    } else {
      return 3;
    }
  }

  static double getFontSize(BuildContext context, double baseFontSize) {
    if (isMobile(context)) {
      return baseFontSize * 0.8;
    } else if (isTablet(context)) {
      return baseFontSize * 0.9;
    } else {
      return baseFontSize;
    }
  }

  static SizedBox getVerticalSpacing(BuildContext context, {double? mobile, double? tablet, double? desktop}) {
    if (isMobile(context)) {
      return SizedBox(height: mobile ?? AppDimensions.spacing24);
    } else if (isTablet(context)) {
      return SizedBox(height: tablet ?? AppDimensions.spacing32);
    } else {
      return SizedBox(height: desktop ?? AppDimensions.spacing40);
    }
  }

  static SizedBox getHorizontalSpacing(BuildContext context, {double? mobile, double? tablet, double? desktop}) {
    if (isMobile(context)) {
      return SizedBox(width: mobile ?? AppDimensions.spacing16);
    } else if (isTablet(context)) {
      return SizedBox(width: tablet ?? AppDimensions.spacing24);
    } else {
      return SizedBox(width: desktop ?? AppDimensions.spacing32);
    }
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) {
      return mobile;
    } else if (ResponsiveUtils.isTablet(context)) {
      return tablet ?? desktop;
    } else {
      return desktop;
    }
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints) builder;

  const ResponsiveBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: builder,
    );
  }
}

class ResponsiveValue<T> {
  final T mobile;
  final T? tablet;
  final T desktop;

  const ResponsiveValue({
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  T getValue(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) {
      return mobile;
    } else if (ResponsiveUtils.isTablet(context)) {
      return tablet ?? desktop;
    } else {
      return desktop;
    }
  }
}

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  const ResponsiveRow({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    } else {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    }
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final ResponsiveValue<int> crossAxisCount;
  final ResponsiveValue<double>? childAspectRatio;

  const ResponsiveGrid({
    Key? key,
    required this.children,
    this.spacing = 20.0,
    required this.crossAxisCount,
    this.childAspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = crossAxisCount.getValue(context);
    final aspectRatio = childAspectRatio?.getValue(context) ?? 1.0;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: aspectRatio,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}