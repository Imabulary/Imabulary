import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mobile/atoms/analytic_click_events.dart';

class AnalyticsEngine {
  AnalyticsEngine({required this.analytics});

  final FirebaseAnalytics analytics;

  void trackLoginEvent(String loginMethod) async {
    await analytics.logLogin(loginMethod: loginMethod);
  }

  void trackSelectContentEvent(String contentType, String itemId) async {
    await analytics.logSelectContent(contentType: contentType, itemId: itemId);
  }

  void trackScreenView(String screenName) async {
    await analytics.logScreenView(screenName: screenName);
  }

  void trackClick(AnalyticClickEvents event,
      [Map<String, Object?>? parameters]) async {
    analytics.logEvent(
      name: event.name,
      parameters: parameters,
    );
  }
}

final analyticsEngine = AnalyticsEngine(analytics: FirebaseAnalytics.instance);
