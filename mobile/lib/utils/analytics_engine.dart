import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsEngine {
  AnalyticsEngine({required this.analytics});

  final FirebaseAnalytics analytics;

  trackLoginEvent(String loginMethod) async {
    await analytics.logLogin(loginMethod: loginMethod);
  }

  trackSelectContentEvent(String contentType, String itemId) async {
    await analytics.logSelectContent(contentType: contentType, itemId: itemId);
  }
}

final analyticsEngine =
    new AnalyticsEngine(analytics: FirebaseAnalytics.instance);
