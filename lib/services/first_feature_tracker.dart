import 'package:ulaskelas/core/constants/_constants.dart';
import 'package:ulaskelas/services/_services.dart';

class FirstFeatureTracker {
  static const _allFeatures = {
    FirstFeature.matkul,
    FirstFeature.tanyateman,
    FirstFeature.kalkulator,
  };

  /* Bertujuan melakukan first_feature track hanya untuk user baru 
  yang memakai app setelah changes ini dibawa ke production*/
  static Future<void> migrateExistingUsersForMixpanel() async {
    if ((Pref.getBool('doneAppTour') ?? false) &&
        !Pref.containsKey(
          PreferencesKeys.firstFeaturePendingOnboardingStatus,
        ) &&
        !(Pref.getBool(PreferencesKeys.firstFeatureUsedTracked) ?? false)) {
      // Untuk User lama.
      await Pref.saveBool(
        PreferencesKeys.firstFeatureUsedTracked,
        value: true,
      );
    }
  }

  static Future<void> onOnboardingEnded({
    required String status,
    Set<FirstFeature>? eligibleFeatures,
    int? skipStepNumber,
  }) async {
    if (Pref.getBool(PreferencesKeys.firstFeatureUsedTracked) ?? false) {
      return;
    }

    final eligible = eligibleFeatures ??
        (status == 'skipped'
            ? eligibleFeaturesForSkipStep(skipStepNumber ?? 0)
            : _allFeatures);

    await Pref.saveString(
      PreferencesKeys.firstFeaturePendingOnboardingStatus,
      status,
    );
    await Pref.saveString(
      PreferencesKeys.firstFeatureEligibleFeatures,
      _encodeEligibleFeatures(eligible),
    );
  }

  static void tryTrackFeature(int tabIndex) {
    if (Pref.getBool(PreferencesKeys.firstFeatureUsedTracked) ?? false) {
      return;
    }

    final pendingStatus = Pref.getString(
      PreferencesKeys.firstFeaturePendingOnboardingStatus,
    );
    if (pendingStatus == null) {
      return;
    }

    final feature = _featureFromTabIndex(tabIndex);
    if (feature == null) {
      return;
    }

    final eligible = _decodeEligibleFeatures(
      Pref.getString(PreferencesKeys.firstFeatureEligibleFeatures),
    );
    if (!eligible.contains(feature)) {
      return;
    }

    MixpanelService.track(
      FirstFeatureUsedEvent(
        firstFeature: feature,
        onboardingStatus: pendingStatus,
      ),
    );

    Pref.saveBool(PreferencesKeys.firstFeatureUsedTracked, value: true);
    Pref.removeKey(PreferencesKeys.firstFeaturePendingOnboardingStatus);
    Pref.removeKey(PreferencesKeys.firstFeatureEligibleFeatures);
  }

  /* Pada step tertentu user sedang berada di spesifik page, 
  disini dilakukan separasi if condition agar mixpanel track first_feature 
  yang bukan user sedang tempati saat melakukan skip*/
  static Set<FirstFeature> eligibleFeaturesForSkipStep(int stepNumber) {
    if (stepNumber <= 0) {
      return _allFeatures;
    }
    if (stepNumber <= 7) {
      return {FirstFeature.tanyateman, FirstFeature.kalkulator};
    }
    if (stepNumber <= 10) {
      return {FirstFeature.kalkulator};
    }
    return _allFeatures;
  }

  static FirstFeature? _featureFromTabIndex(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return FirstFeature.matkul;
      case 2:
        return FirstFeature.tanyateman;
      case 3:
        return FirstFeature.kalkulator;
      default:
        return null;
    }
  }

  static String _encodeEligibleFeatures(Set<FirstFeature> features) {
    return features.map((f) => f.name).join(',');
  }

  static Set<FirstFeature> _decodeEligibleFeatures(String? encoded) {
    if (encoded == null || encoded.isEmpty) {
      return _allFeatures;
    }
    return encoded
        .split(',')
        .map((name) => FirstFeature.values.byName(name))
        .toSet();
  }
}
