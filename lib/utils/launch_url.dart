import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  // Launch URL in browser
  static Future<void> launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  // Launch email
  static Future<void> launchEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    String emailUrl = 'mailto:$email';

    List<String> params = [];
    if (subject != null) {
      params.add('subject=${Uri.encodeComponent(subject)}');
    }
    if (body != null) {
      params.add('body=${Uri.encodeComponent(body)}');
    }

    if (params.isNotEmpty) {
      emailUrl += '?${params.join('&')}';
    }

    await launchURL(emailUrl);
  }

  // Launch phone call
  static Future<void> launchPhone(String phoneNumber) async {
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    await launchURL('tel:$cleanNumber');
  }

  // Launch SMS
  static Future<void> launchSMS({
    required String phoneNumber,
    String? message,
  }) async {
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    String smsUrl = 'sms:$cleanNumber';

    if (message != null) {
      smsUrl += '?body=${Uri.encodeComponent(message)}';
    }

    await launchURL(smsUrl);
  }

  // Launch WhatsApp
  static Future<void> launchWhatsApp({
    required String phoneNumber,
    String? message,
  }) async {
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    String whatsappUrl = 'https://wa.me/$cleanNumber';

    if (message != null) {
      whatsappUrl += '?text=${Uri.encodeComponent(message)}';
    }

    await launchURL(whatsappUrl);
  }

  // Launch social media profiles
  static Future<void> launchLinkedIn(String username) async {
    await launchURL('https://linkedin.com/in/$username');
  }

  static Future<void> launchGitHub(String username) async {
    await launchURL('https://github.com/$username');
  }

  static Future<void> launchTwitter(String username) async {
    await launchURL('https://twitter.com/$username');
  }

  static Future<void> launchInstagram(String username) async {
    await launchURL('https://instagram.com/$username');
  }

  static Future<void> launchFacebook(String username) async {
    await launchURL('https://facebook.com/$username');
  }

  static Future<void> launchYouTube(String channelId) async {
    await launchURL('https://youtube.com/channel/$channelId');
  }

  static Future<void> launchDribbble(String username) async {
    await launchURL('https://dribbble.com/$username');
  }

  static Future<void> launchBehance(String username) async {
    await launchURL('https://behance.net/$username');
  }

  // Launch map location
  static Future<void> launchMap({
    required double latitude,
    required double longitude,
    String? label,
  }) async {
    String mapUrl = 'https://maps.google.com/?q=$latitude,$longitude';
    if (label != null) {
      mapUrl += '($label)';
    }
    await launchURL(mapUrl);
  }

  // Launch Google Play Store
  static Future<void> launchPlayStore(String packageName) async {
    await launchURL('https://play.google.com/store/apps/details?id=$packageName');
  }

  // Launch App Store
  static Future<void> launchAppStore(String appId) async {
    await launchURL('https://apps.apple.com/app/id$appId');
  }

  // Download file
  static Future<void> downloadFile(String url, {String? filename}) async {
    await launchURL(url);
  }

  // Launch with confirmation dialog
  static Future<void> launchWithConfirmation(
      BuildContext context, {
        required String url,
        String? title,
        String? message,
      }) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Open Link'),
          content: Text(
            message ?? 'You are about to open an external link. Do you want to continue?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Open'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await launchURL(url);
    }
  }

  // Share content
  static Future<void> shareText(String text) async {
    // Note: This would require the share_plus package
    // For now, we'll copy to clipboard
    await _copyToClipboard(text);
  }

  static Future<void> _copyToClipboard(String text) async {
    // This would require additional implementation
    debugPrint('Copy to clipboard: $text');
  }

  // Validate URL
  static bool isValidUrl(String url) {
    try {
      final Uri uri = Uri.parse(url);
      return uri.hasScheme && (uri.hasAuthority || uri.scheme == 'mailto');
    } catch (e) {
      return false;
    }
  }

  // Get domain from URL
  static String? getDomainFromUrl(String url) {
    try {
      final Uri uri = Uri.parse(url);
      return uri.host;
    } catch (e) {
      return null;
    }
  }
}