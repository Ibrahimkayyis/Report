// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ActivityScreen]
class ActivityRoute extends PageRouteInfo<void> {
  const ActivityRoute({List<PageRouteInfo>? children})
    : super(ActivityRoute.name, initialChildren: children);

  static const String name = 'ActivityRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ActivityScreen();
    },
  );
}

/// generated route for
/// [CheckReportStatusResultScreen]
class CheckReportStatusResultRoute
    extends PageRouteInfo<CheckReportStatusResultRouteArgs> {
  CheckReportStatusResultRoute({
    Key? key,
    required String ticketNumber,
    required String status,
    required String serviceType,
    required String opdDestination,
    List<PageRouteInfo>? children,
  }) : super(
         CheckReportStatusResultRoute.name,
         args: CheckReportStatusResultRouteArgs(
           key: key,
           ticketNumber: ticketNumber,
           status: status,
           serviceType: serviceType,
           opdDestination: opdDestination,
         ),
         initialChildren: children,
       );

  static const String name = 'CheckReportStatusResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckReportStatusResultRouteArgs>();
      return CheckReportStatusResultScreen(
        key: args.key,
        ticketNumber: args.ticketNumber,
        status: args.status,
        serviceType: args.serviceType,
        opdDestination: args.opdDestination,
      );
    },
  );
}

class CheckReportStatusResultRouteArgs {
  const CheckReportStatusResultRouteArgs({
    this.key,
    required this.ticketNumber,
    required this.status,
    required this.serviceType,
    required this.opdDestination,
  });

  final Key? key;

  final String ticketNumber;

  final String status;

  final String serviceType;

  final String opdDestination;

  @override
  String toString() {
    return 'CheckReportStatusResultRouteArgs{key: $key, ticketNumber: $ticketNumber, status: $status, serviceType: $serviceType, opdDestination: $opdDestination}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CheckReportStatusResultRouteArgs) return false;
    return key == other.key &&
        ticketNumber == other.ticketNumber &&
        status == other.status &&
        serviceType == other.serviceType &&
        opdDestination == other.opdDestination;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      ticketNumber.hashCode ^
      status.hashCode ^
      serviceType.hashCode ^
      opdDestination.hashCode;
}

/// generated route for
/// [CheckReportStatusScreen]
class CheckReportStatusRoute extends PageRouteInfo<void> {
  const CheckReportStatusRoute({List<PageRouteInfo>? children})
    : super(CheckReportStatusRoute.name, initialChildren: children);

  static const String name = 'CheckReportStatusRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CheckReportStatusScreen();
    },
  );
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required ProfileCubit profileCubit,
    List<PageRouteInfo>? children,
  }) : super(
         EditProfileRoute.name,
         args: EditProfileRouteArgs(key: key, profileCubit: profileCubit),
         initialChildren: children,
       );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>();
      return EditProfileScreen(key: args.key, profileCubit: args.profileCubit);
    },
  );
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.profileCubit});

  final Key? key;

  final ProfileCubit profileCubit;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profileCubit: $profileCubit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditProfileRouteArgs) return false;
    return key == other.key && profileCubit == other.profileCubit;
  }

  @override
  int get hashCode => key.hashCode ^ profileCubit.hashCode;
}

/// generated route for
/// [EditThemeScreen]
class EditThemeRoute extends PageRouteInfo<void> {
  const EditThemeRoute({List<PageRouteInfo>? children})
    : super(EditThemeRoute.name, initialChildren: children);

  static const String name = 'EditThemeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditThemeScreen();
    },
  );
}

/// generated route for
/// [HelpdeskChatScreen]
class HelpdeskChatRoute extends PageRouteInfo<void> {
  const HelpdeskChatRoute({List<PageRouteInfo>? children})
    : super(HelpdeskChatRoute.name, initialChildren: children);

  static const String name = 'HelpdeskChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HelpdeskChatScreen();
    },
  );
}

/// generated route for
/// [HomeMasyarakatScreen]
class HomeMasyarakatRoute extends PageRouteInfo<void> {
  const HomeMasyarakatRoute({List<PageRouteInfo>? children})
    : super(HomeMasyarakatRoute.name, initialChildren: children);

  static const String name = 'HomeMasyarakatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeMasyarakatScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [HomeTeknisiScreen]
class HomeTeknisiRoute extends PageRouteInfo<void> {
  const HomeTeknisiRoute({List<PageRouteInfo>? children})
    : super(HomeTeknisiRoute.name, initialChildren: children);

  static const String name = 'HomeTeknisiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeTeknisiScreen();
    },
  );
}

/// generated route for
/// [KnowledgeBaseScreen]
class KnowledgeBaseRoute extends PageRouteInfo<void> {
  const KnowledgeBaseRoute({List<PageRouteInfo>? children})
    : super(KnowledgeBaseRoute.name, initialChildren: children);

  static const String name = 'KnowledgeBaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const KnowledgeBaseScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainLayoutMasyarakatScreen]
class MainLayoutMasyarakatRoute extends PageRouteInfo<void> {
  const MainLayoutMasyarakatRoute({List<PageRouteInfo>? children})
    : super(MainLayoutMasyarakatRoute.name, initialChildren: children);

  static const String name = 'MainLayoutMasyarakatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainLayoutMasyarakatScreen();
    },
  );
}

/// generated route for
/// [MainLayoutScreen]
class MainLayoutRoute extends PageRouteInfo<void> {
  const MainLayoutRoute({List<PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainLayoutScreen();
    },
  );
}

/// generated route for
/// [MainLayoutTeknisiScreen]
class MainLayoutTeknisiRoute extends PageRouteInfo<void> {
  const MainLayoutTeknisiRoute({List<PageRouteInfo>? children})
    : super(MainLayoutTeknisiRoute.name, initialChildren: children);

  static const String name = 'MainLayoutTeknisiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainLayoutTeknisiScreen();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [OpdSelectionScreen]
class OpdSelectionRoute extends PageRouteInfo<void> {
  const OpdSelectionRoute({List<PageRouteInfo>? children})
    : super(OpdSelectionRoute.name, initialChildren: children);

  static const String name = 'OpdSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OpdSelectionScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [QRAssetDetailScreen]
class QRAssetDetailRoute extends PageRouteInfo<QRAssetDetailRouteArgs> {
  QRAssetDetailRoute({
    Key? key,
    required String qrValue,
    Uint8List? qrImageBytes,
    List<PageRouteInfo>? children,
  }) : super(
         QRAssetDetailRoute.name,
         args: QRAssetDetailRouteArgs(
           key: key,
           qrValue: qrValue,
           qrImageBytes: qrImageBytes,
         ),
         initialChildren: children,
       );

  static const String name = 'QRAssetDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QRAssetDetailRouteArgs>();
      return QRAssetDetailScreen(
        key: args.key,
        qrValue: args.qrValue,
        qrImageBytes: args.qrImageBytes,
      );
    },
  );
}

class QRAssetDetailRouteArgs {
  const QRAssetDetailRouteArgs({
    this.key,
    required this.qrValue,
    this.qrImageBytes,
  });

  final Key? key;

  final String qrValue;

  final Uint8List? qrImageBytes;

  @override
  String toString() {
    return 'QRAssetDetailRouteArgs{key: $key, qrValue: $qrValue, qrImageBytes: $qrImageBytes}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QRAssetDetailRouteArgs) return false;
    return key == other.key &&
        qrValue == other.qrValue &&
        qrImageBytes == other.qrImageBytes;
  }

  @override
  int get hashCode => key.hashCode ^ qrValue.hashCode ^ qrImageBytes.hashCode;
}

/// generated route for
/// [QRScreen]
class QRRoute extends PageRouteInfo<void> {
  const QRRoute({List<PageRouteInfo>? children})
    : super(QRRoute.name, initialChildren: children);

  static const String name = 'QRRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QRScreen();
    },
  );
}

/// generated route for
/// [RFCFormScreen]
class RFCFormRoute extends PageRouteInfo<void> {
  const RFCFormRoute({List<PageRouteInfo>? children})
    : super(RFCFormRoute.name, initialChildren: children);

  static const String name = 'RFCFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RFCFormScreen();
    },
  );
}

/// generated route for
/// [RFCScreen]
class RFCRoute extends PageRouteInfo<void> {
  const RFCRoute({List<PageRouteInfo>? children})
    : super(RFCRoute.name, initialChildren: children);

  static const String name = 'RFCRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RFCScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [ReportSuccessScreen]
class ReportSuccessRoute extends PageRouteInfo<ReportSuccessRouteArgs> {
  ReportSuccessRoute({
    Key? key,
    required String ticketNumber,
    required String status,
    required String opdName,
    List<PageRouteInfo>? children,
  }) : super(
         ReportSuccessRoute.name,
         args: ReportSuccessRouteArgs(
           key: key,
           ticketNumber: ticketNumber,
           status: status,
           opdName: opdName,
         ),
         initialChildren: children,
       );

  static const String name = 'ReportSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportSuccessRouteArgs>();
      return ReportSuccessScreen(
        key: args.key,
        ticketNumber: args.ticketNumber,
        status: args.status,
        opdName: args.opdName,
      );
    },
  );
}

class ReportSuccessRouteArgs {
  const ReportSuccessRouteArgs({
    this.key,
    required this.ticketNumber,
    required this.status,
    required this.opdName,
  });

  final Key? key;

  final String ticketNumber;

  final String status;

  final String opdName;

  @override
  String toString() {
    return 'ReportSuccessRouteArgs{key: $key, ticketNumber: $ticketNumber, status: $status, opdName: $opdName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportSuccessRouteArgs) return false;
    return key == other.key &&
        ticketNumber == other.ticketNumber &&
        status == other.status &&
        opdName == other.opdName;
  }

  @override
  int get hashCode =>
      key.hashCode ^ ticketNumber.hashCode ^ status.hashCode ^ opdName.hashCode;
}

/// generated route for
/// [ReportingFormScreen]
class ReportingFormRoute extends PageRouteInfo<ReportingFormRouteArgs> {
  ReportingFormRoute({
    Key? key,
    required String opdId,
    String? opdName,
    String? opdIconUrl,
    Color? opdColor,
    List<PageRouteInfo>? children,
  }) : super(
         ReportingFormRoute.name,
         args: ReportingFormRouteArgs(
           key: key,
           opdId: opdId,
           opdName: opdName,
           opdIconUrl: opdIconUrl,
           opdColor: opdColor,
         ),
         initialChildren: children,
       );

  static const String name = 'ReportingFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportingFormRouteArgs>();
      return ReportingFormScreen(
        key: args.key,
        opdId: args.opdId,
        opdName: args.opdName,
        opdIconUrl: args.opdIconUrl,
        opdColor: args.opdColor,
      );
    },
  );
}

class ReportingFormRouteArgs {
  const ReportingFormRouteArgs({
    this.key,
    required this.opdId,
    this.opdName,
    this.opdIconUrl,
    this.opdColor,
  });

  final Key? key;

  final String opdId;

  final String? opdName;

  final String? opdIconUrl;

  final Color? opdColor;

  @override
  String toString() {
    return 'ReportingFormRouteArgs{key: $key, opdId: $opdId, opdName: $opdName, opdIconUrl: $opdIconUrl, opdColor: $opdColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportingFormRouteArgs) return false;
    return key == other.key &&
        opdId == other.opdId &&
        opdName == other.opdName &&
        opdIconUrl == other.opdIconUrl &&
        opdColor == other.opdColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      opdId.hashCode ^
      opdName.hashCode ^
      opdIconUrl.hashCode ^
      opdColor.hashCode;
}

/// generated route for
/// [ServiceRequestFormScreen]
class ServiceRequestFormRoute
    extends PageRouteInfo<ServiceRequestFormRouteArgs> {
  ServiceRequestFormRoute({
    Key? key,
    required String opdId,
    String? opdName,
    String? opdIconUrl,
    Color? opdColor,
    List<PageRouteInfo>? children,
  }) : super(
         ServiceRequestFormRoute.name,
         args: ServiceRequestFormRouteArgs(
           key: key,
           opdId: opdId,
           opdName: opdName,
           opdIconUrl: opdIconUrl,
           opdColor: opdColor,
         ),
         initialChildren: children,
       );

  static const String name = 'ServiceRequestFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceRequestFormRouteArgs>();
      return ServiceRequestFormScreen(
        key: args.key,
        opdId: args.opdId,
        opdName: args.opdName,
        opdIconUrl: args.opdIconUrl,
        opdColor: args.opdColor,
      );
    },
  );
}

class ServiceRequestFormRouteArgs {
  const ServiceRequestFormRouteArgs({
    this.key,
    required this.opdId,
    this.opdName,
    this.opdIconUrl,
    this.opdColor,
  });

  final Key? key;

  final String opdId;

  final String? opdName;

  final String? opdIconUrl;

  final Color? opdColor;

  @override
  String toString() {
    return 'ServiceRequestFormRouteArgs{key: $key, opdId: $opdId, opdName: $opdName, opdIconUrl: $opdIconUrl, opdColor: $opdColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ServiceRequestFormRouteArgs) return false;
    return key == other.key &&
        opdId == other.opdId &&
        opdName == other.opdName &&
        opdIconUrl == other.opdIconUrl &&
        opdColor == other.opdColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      opdId.hashCode ^
      opdName.hashCode ^
      opdIconUrl.hashCode ^
      opdColor.hashCode;
}

/// generated route for
/// [ServiceRequestSelectionScreen]
class ServiceRequestSelectionRoute extends PageRouteInfo<void> {
  const ServiceRequestSelectionRoute({List<PageRouteInfo>? children})
    : super(ServiceRequestSelectionRoute.name, initialChildren: children);

  static const String name = 'ServiceRequestSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ServiceRequestSelectionScreen();
    },
  );
}

/// generated route for
/// [ServiceRequestSuccessScreen]
class ServiceRequestSuccessRoute
    extends PageRouteInfo<ServiceRequestSuccessRouteArgs> {
  ServiceRequestSuccessRoute({
    Key? key,
    required String ticketNumber,
    required String status,
    required String requestType,
    List<PageRouteInfo>? children,
  }) : super(
         ServiceRequestSuccessRoute.name,
         args: ServiceRequestSuccessRouteArgs(
           key: key,
           ticketNumber: ticketNumber,
           status: status,
           requestType: requestType,
         ),
         initialChildren: children,
       );

  static const String name = 'ServiceRequestSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceRequestSuccessRouteArgs>();
      return ServiceRequestSuccessScreen(
        key: args.key,
        ticketNumber: args.ticketNumber,
        status: args.status,
        requestType: args.requestType,
      );
    },
  );
}

class ServiceRequestSuccessRouteArgs {
  const ServiceRequestSuccessRouteArgs({
    this.key,
    required this.ticketNumber,
    required this.status,
    required this.requestType,
  });

  final Key? key;

  final String ticketNumber;

  final String status;

  final String requestType;

  @override
  String toString() {
    return 'ServiceRequestSuccessRouteArgs{key: $key, ticketNumber: $ticketNumber, status: $status, requestType: $requestType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ServiceRequestSuccessRouteArgs) return false;
    return key == other.key &&
        ticketNumber == other.ticketNumber &&
        status == other.status &&
        requestType == other.requestType;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      ticketNumber.hashCode ^
      status.hashCode ^
      requestType.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [TeknisiRatingDetailScreen]
class TeknisiRatingDetailRoute
    extends PageRouteInfo<TeknisiRatingDetailRouteArgs> {
  TeknisiRatingDetailRoute({
    Key? key,
    required String senderName,
    String? senderAvatar,
    String? ticketId,
    required String category,
    required String type,
    required String form,
    required int rating,
    String? comment,
    int? easeOfUse,
    int? responseSpeed,
    int? solutionQuality,
    List<PageRouteInfo>? children,
  }) : super(
         TeknisiRatingDetailRoute.name,
         args: TeknisiRatingDetailRouteArgs(
           key: key,
           senderName: senderName,
           senderAvatar: senderAvatar,
           ticketId: ticketId,
           category: category,
           type: type,
           form: form,
           rating: rating,
           comment: comment,
           easeOfUse: easeOfUse,
           responseSpeed: responseSpeed,
           solutionQuality: solutionQuality,
         ),
         initialChildren: children,
       );

  static const String name = 'TeknisiRatingDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeknisiRatingDetailRouteArgs>();
      return TeknisiRatingDetailScreen(
        key: args.key,
        senderName: args.senderName,
        senderAvatar: args.senderAvatar,
        ticketId: args.ticketId,
        category: args.category,
        type: args.type,
        form: args.form,
        rating: args.rating,
        comment: args.comment,
        easeOfUse: args.easeOfUse,
        responseSpeed: args.responseSpeed,
        solutionQuality: args.solutionQuality,
      );
    },
  );
}

class TeknisiRatingDetailRouteArgs {
  const TeknisiRatingDetailRouteArgs({
    this.key,
    required this.senderName,
    this.senderAvatar,
    this.ticketId,
    required this.category,
    required this.type,
    required this.form,
    required this.rating,
    this.comment,
    this.easeOfUse,
    this.responseSpeed,
    this.solutionQuality,
  });

  final Key? key;

  final String senderName;

  final String? senderAvatar;

  final String? ticketId;

  final String category;

  final String type;

  final String form;

  final int rating;

  final String? comment;

  final int? easeOfUse;

  final int? responseSpeed;

  final int? solutionQuality;

  @override
  String toString() {
    return 'TeknisiRatingDetailRouteArgs{key: $key, senderName: $senderName, senderAvatar: $senderAvatar, ticketId: $ticketId, category: $category, type: $type, form: $form, rating: $rating, comment: $comment, easeOfUse: $easeOfUse, responseSpeed: $responseSpeed, solutionQuality: $solutionQuality}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TeknisiRatingDetailRouteArgs) return false;
    return key == other.key &&
        senderName == other.senderName &&
        senderAvatar == other.senderAvatar &&
        ticketId == other.ticketId &&
        category == other.category &&
        type == other.type &&
        form == other.form &&
        rating == other.rating &&
        comment == other.comment &&
        easeOfUse == other.easeOfUse &&
        responseSpeed == other.responseSpeed &&
        solutionQuality == other.solutionQuality;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      senderName.hashCode ^
      senderAvatar.hashCode ^
      ticketId.hashCode ^
      category.hashCode ^
      type.hashCode ^
      form.hashCode ^
      rating.hashCode ^
      comment.hashCode ^
      easeOfUse.hashCode ^
      responseSpeed.hashCode ^
      solutionQuality.hashCode;
}

/// generated route for
/// [TeknisiRatingScreen]
class TeknisiRatingRoute extends PageRouteInfo<void> {
  const TeknisiRatingRoute({List<PageRouteInfo>? children})
    : super(TeknisiRatingRoute.name, initialChildren: children);

  static const String name = 'TeknisiRatingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TeknisiRatingScreen();
    },
  );
}

/// generated route for
/// [TeknisiTicketDetailScreen]
class TeknisiTicketDetailRoute
    extends PageRouteInfo<TeknisiTicketDetailRouteArgs> {
  TeknisiTicketDetailRoute({
    Key? key,
    required String ticketId,
    List<PageRouteInfo>? children,
  }) : super(
         TeknisiTicketDetailRoute.name,
         args: TeknisiTicketDetailRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'TeknisiTicketDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeknisiTicketDetailRouteArgs>();
      return TeknisiTicketDetailScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class TeknisiTicketDetailRouteArgs {
  const TeknisiTicketDetailRouteArgs({this.key, required this.ticketId});

  final Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'TeknisiTicketDetailRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TeknisiTicketDetailRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [TestHelperScreen]
class TestHelperRoute extends PageRouteInfo<void> {
  const TestHelperRoute({List<PageRouteInfo>? children})
    : super(TestHelperRoute.name, initialChildren: children);

  static const String name = 'TestHelperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestHelperScreen();
    },
  );
}
