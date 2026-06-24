part of '_services.dart';

class MixpanelService {
  static Mixpanel? _mixpanel;

  static Future<void> init() async {
    Logger().i('Initializing Mixpanel Service');
    _mixpanel = await Mixpanel.init(
      Secret.mixpanelToken,
      trackAutomaticEvents: true,
    );
  }

  static Future<Mixpanel> get instance async {
    return _mixpanel ??= await Mixpanel.init(
      Secret.mixpanelToken,
      trackAutomaticEvents: true,
    );
  }

  static void track(AppAnalyticsEvent event) {
    _mixpanel!.track(event.eventName, properties: event.toMap());
    Logger().i(
      '''
      Track Events: ${event.eventName},
      Parameters: ${event.toMap()}
      '''
    );
  }
}
