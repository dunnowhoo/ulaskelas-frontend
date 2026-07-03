abstract class AppAnalyticsEvent {
  String get eventName;
  Map<String, dynamic> toMap();
}

class UserRegisteredEvent extends AppAnalyticsEvent {
  @override
  final String eventName = 'user_registered';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'registered',
        'eventCategory': 'authentication',
        'screenName': 'SSO Web Page',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::user-registered',
      };
}

class FacultyExpansionSignupEvent extends AppAnalyticsEvent {
  final String facultyName;
  final bool isFasilkom;

  FacultyExpansionSignupEvent({
    required this.facultyName,
    required this.isFasilkom,
  });

  @override
  final String eventName = 'faculty_expansion_signup';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'computed',
        'eventCategory': 'acquisition',
        'fieldName': 'fakultas: $facultyName, is_fasilkom: $isFasilkom',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::faculty-expansion-signup',
      };
}

class UserLoginEvent extends AppAnalyticsEvent {
  final bool isNewUser;

  UserLoginEvent({required this.isNewUser});

  @override
  final String eventName = 'user_login';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'login',
        'eventCategory': 'auth',
        'fieldName': 'method: SSO',
        'fieldValue': 'is_new_user: $isNewUser',
        'screenName': 'Beranda',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::user-login',
      };
}

class OnboardingCompletedEvent extends AppAnalyticsEvent {
  final int totalSteps;

  OnboardingCompletedEvent({required this.totalSteps});

  @override
  final String eventName = 'onboarding_completed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'complete',
        'eventCategory': 'onboarding',
        'fieldName': 'total_steps: $totalSteps',
        'screenName': 'Beranda',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::onboarding-completed',
      };
}

class OnboardingSkippedEvent extends AppAnalyticsEvent {
  final int stepSkipped;

  OnboardingSkippedEvent({required this.stepSkipped});

  @override
  final String eventName = 'onboarding_skipped';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'skip',
        'eventCategory': 'onboarding',
        'fieldName': 'skipped_at_step: $stepSkipped',
        'screenName': 'Beranda',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::onboarding-skipped',
      };
}

class CalculatorOpenedEvent extends AppAnalyticsEvent {
  @override
  final String eventName = 'calculator_opened';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'open',
        'eventCategory': 'feature',
        'screenName': 'Kalkulator Nilai Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::calculator-opened',
      };
}

class CalculatorSemesterAddedEvent extends AppAnalyticsEvent {
  final String semesterName;

  CalculatorSemesterAddedEvent({required this.semesterName});

  @override
  final String eventName = 'calculator_semester_added';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'add',
        'eventCategory': 'calculator',
        'fieldName': 'semester: $semesterName',
        'screenName': 'Kalkulator Nilai Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::calculator-semester-added',
      };
}

class CalculatorCompletedEvent extends AppAnalyticsEvent {
  final String semesterName;
  final String matkulName;
  final double calculatedGrade;

  CalculatorCompletedEvent({
    required this.semesterName,
    required this.matkulName,
    required this.calculatedGrade,
  });

  @override
  final String eventName = 'calculator_completed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'complete',
        'eventCategory': 'calculator',
        'fieldName': 'semester: $semesterName, matkul: $matkulName',
        'fieldValue': 'calculated_grade: $calculatedGrade',
        'screenName': 'Kalkulator Nilai Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::calculator-completed',
      };
}

class CalculatorDroppedEvent extends AppAnalyticsEvent {
  final String lastScreen;

  CalculatorDroppedEvent({required this.lastScreen});

  @override
  final String eventName = 'calculator_dropped';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'drop',
        'eventCategory': 'calculator',
        'fieldName': 'last_screen: $lastScreen',
        'screenName': 'Kalkulator Nilai Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::calculator-dropped',
      };
}

class RubyRecommendationViewedEvent extends AppAnalyticsEvent {
  final int matkulCount;

  RubyRecommendationViewedEvent({required this.matkulCount});

  @override
  final String eventName = 'ruby_recommendation_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'view',
        'eventCategory': 'feature',
        'fieldName': 'matkul_count: $matkulCount',
        'screenName': 'Rekomendasi Ruby',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::ruby-recommendation-viewed',
      };
}

class CourseListViewedEvent extends AppAnalyticsEvent {
  @override
  final String eventName = 'course_list_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'view',
        'eventCategory': 'feature',
        'screenName': 'Daftar Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::course-list-viewed',
      };
}

class CourseDetailViewedEvent extends AppAnalyticsEvent {
  final String matkulId;
  final String matkulName;

  CourseDetailViewedEvent({required this.matkulId, required this.matkulName});

  @override
  final String eventName = 'course_detail_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'view',
        'eventCategory': 'course',
        'fieldName': 'matkul_id: $matkulId, matkul_name: $matkulName',
        'screenName': 'Detail Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::course-detail-viewed',
      };
}

class ReviewSubmittedEvent extends AppAnalyticsEvent {
  final String matkulId;
  final String periode;
  final double rating;
  final bool hasTag;

  ReviewSubmittedEvent({
    required this.matkulId,
    required this.periode,
    required this.rating,
    required this.hasTag,
  });

  @override
  final String eventName = 'review_submitted';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'submit',
        'eventCategory': 'review',
        'fieldName': 'matkul_id: $matkulId, periode: $periode, rating: $rating',
        'fieldValue': 'has_tag: $hasTag',
        'screenName': 'Tulis Ulasan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::review-submitted',
      };
}

class SearchUsedEvent extends AppAnalyticsEvent {
  final String query;

  SearchUsedEvent({required this.query});

  @override
  final String eventName = 'search_used';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'search',
        'eventCategory': 'discovery',
        'fieldName': 'query: $query',
        'screenName': 'Daftar Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::search-used',
      };
}

class AppSessionStartedEvent extends AppAnalyticsEvent {
  final String launchType; // 'cold' or 'warm'

  AppSessionStartedEvent({required this.launchType});

  @override
  final String eventName = 'app_session_started';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'session_start',
        'eventCategory': 'engagement',
        'fieldName': 'launch_type: $launchType',
        'screenName': 'Beranda',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::app-session-started',
      };
}

class AutofillUsedEvent extends AppAnalyticsEvent {
  @override
  final String eventName = 'autofill_used';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'tap',
        'eventCategory': 'calculator',
        'ctaTitle': 'Auto-Fill Semester',
        'fieldName': 'source: SIAKNG',
        'screenName': 'Kalkulator Nilai Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::autofill-used',
      };
}

class FilterUsedEvent extends AppAnalyticsEvent {
  final List<String> filterTypes; 
  final List<String> selectedValues;

  FilterUsedEvent({required this.filterTypes, required this.selectedValues});

  @override
  final String eventName = 'filter_used';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'apply',
        'eventCategory': 'discovery',
        'fieldName': 'filter_type: ${filterTypes.join(' | ')}',
        'fieldValue': 'selected_value: ${selectedValues.join(' | ')}',
        'screenName': 'Daftar Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::filter-used',
      };
}

class CourseBookmarkedEvent extends AppAnalyticsEvent {
  final String matkulId;
  final String matkulName;

  CourseBookmarkedEvent({required this.matkulId, required this.matkulName});

  @override
  final String eventName = 'course_bookmarked';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'tap',
        'eventCategory': 'engagement',
        'fieldName': 'matkul_id: $matkulId, matkul_name: $matkulName',
        'screenName': 'Detail Mata Kuliah',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::course-bookmarked',
      };
}

class TanyaTemanViewedEvent extends AppAnalyticsEvent {
  @override
  final String eventName = 'tanyateman_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'view',
        'eventCategory': 'feature',
        'screenName': 'TanyaTeman - Semua Pertanyaan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::tanyateman-viewed',
      };
}

class QuestionPostedEvent extends AppAnalyticsEvent {
  final bool hasMatkulTag;

  QuestionPostedEvent({required this.hasMatkulTag});

  @override
  final String eventName = 'question_posted';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'submit',
        'eventCategory': 'tanyateman',
        'fieldName': 'has_matkul_tag: $hasMatkulTag',
        'screenName': 'Tulis Pertanyaan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::question-posted',
      };
}

class AnswerPostedEvent extends AppAnalyticsEvent {
  final String questionId;

  AnswerPostedEvent({required this.questionId});

  @override
  final String eventName = 'answer_posted';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'submit',
        'eventCategory': 'tanyateman',
        'fieldName': 'question_id: $questionId',
        'screenName': 'Detail Pertanyaan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::answer-posted',
      };
}

class ReviewAbandonedEvent extends AppAnalyticsEvent {
  final String matkulId;
  final bool formFilled;

  ReviewAbandonedEvent({required this.matkulId, required this.formFilled});

  @override
  final String eventName = 'review_abandoned';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'abandon',
        'eventCategory': 'review',
        'fieldName': 'matkul_id: $matkulId, form_filled: $formFilled',
        'screenName': 'Tulis Ulasan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::review-abandoned',
      };
}

class PushNotifOpenedEvent extends AppAnalyticsEvent {
  final String notifType; // <IRS|UTS|UAS|tanyateman>

  PushNotifOpenedEvent({required this.notifType});

  @override
  final String eventName = 'push_notif_opened';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'tap',
        'eventCategory': 'notification',
        'fieldName': 'notif_type: $notifType',
        'screenName': 'Beranda',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::push-notif-opened',
      };
}

class QuestionSearchedEvent extends AppAnalyticsEvent {
  final String query;

  QuestionSearchedEvent({required this.query});

  @override
  final String eventName = 'question_searched';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'search',
        'eventCategory': 'tanyateman',
        'fieldName': 'query: $query',
        'screenName': 'TanyaTeman - Semua Pertanyaan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::question-searched',
      };
}

class QuestionFilterUsedEvent extends AppAnalyticsEvent {
  final String filterType; // <matkul|kategori>
  final String selectedValue;

  QuestionFilterUsedEvent({required this.filterType, required this.selectedValue});

  @override
  final String eventName = 'question_filter_used';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'apply',
        'eventCategory': 'tanyateman',
        'fieldName': 'filter_type: $filterType',
        'fieldValue': 'selected_value: $selectedValue',
        'screenName': 'TanyaTeman - Semua Pertanyaan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::question-filter-used',
      };
}

class RiwayatPertanyaanViewedEvent extends AppAnalyticsEvent {
  @override
  final String eventName = 'riwayat_pertanyaan_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'view',
        'eventCategory': 'tanyateman',
        'screenName': 'TanyaTeman - Riwayat Pertanyaan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::riwayat-pertanyaan-viewed',
      };
}

class SavedCoursesViewedEvent extends AppAnalyticsEvent {
  final int savedCount;

  SavedCoursesViewedEvent({required this.savedCount});

  @override
  final String eventName = 'saved_courses_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'view',
        'eventCategory': 'profile',
        'fieldName': 'saved_count: $savedCount',
        'screenName': 'Mata Kuliah Tersimpan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::saved-courses-viewed',
      };
}

class ReviewHistoryViewedEvent extends AppAnalyticsEvent {
  final int reviewCount;

  ReviewHistoryViewedEvent({required this.reviewCount});

  @override
  final String eventName = 'review_history_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'view',
        'eventCategory': 'profile',
        'fieldName': 'review_count: $reviewCount',
        'screenName': 'Riwayat Ulasan',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::review-history-viewed',
      };
}

class OnboardingReplayedEvent extends AppAnalyticsEvent {
  @override
  final String eventName = 'onboarding_replayed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'tap',
        'eventCategory': 'onboarding',
        'ctaTitle': 'Ulangi Tur',
        'screenName': 'Beranda',
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::onboarding-replayed',
      };
}

class MyReviewViewedEvent extends AppAnalyticsEvent {
  final String sourceScreen;

  MyReviewViewedEvent({required this.sourceScreen});

  @override
  final String eventName = 'my_review_viewed';

  @override
  Map<String, dynamic> toMap() => {
        'eventName': eventName,
        'eventAction': 'tap',
        'eventCategory': 'profile',
        'fieldName': 'source: $sourceScreen',
        'screenName': sourceScreen,
        'screenOwner': 'mobile_app',
        'eventLabel': 'temankuliah::my-review-viewed',
      };
}

// --- LEGACY EVENTS (Preserved from old implementation) ---
class LegacyEvent extends AppAnalyticsEvent {
  @override
  final String eventName;
  final Map<String, dynamic>? params;

  LegacyEvent(this.eventName, {this.params});

  @override
  Map<String, dynamic> toMap() {
    return {
      'eventName': eventName,
      'eventCategory': 'legacy',
      if (params != null) ...params!,
    };
  }
}
