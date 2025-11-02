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
    IconData? opdIcon,
    Color? opdColor,
    List<PageRouteInfo>? children,
  }) : super(
         ReportingFormRoute.name,
         args: ReportingFormRouteArgs(
           key: key,
           opdId: opdId,
           opdName: opdName,
           opdIcon: opdIcon,
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
        opdIcon: args.opdIcon,
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
    this.opdIcon,
    this.opdColor,
  });

  final Key? key;

  final String opdId;

  final String? opdName;

  final IconData? opdIcon;

  final Color? opdColor;

  @override
  String toString() {
    return 'ReportingFormRouteArgs{key: $key, opdId: $opdId, opdName: $opdName, opdIcon: $opdIcon, opdColor: $opdColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportingFormRouteArgs) return false;
    return key == other.key &&
        opdId == other.opdId &&
        opdName == other.opdName &&
        opdIcon == other.opdIcon &&
        opdColor == other.opdColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      opdId.hashCode ^
      opdName.hashCode ^
      opdIcon.hashCode ^
      opdColor.hashCode;
}

/// generated route for
/// [ServiceRequestFormScreen]
class ServiceRequestFormRoute
    extends PageRouteInfo<ServiceRequestFormRouteArgs> {
  ServiceRequestFormRoute({
    Key? key,
    required ServiceType serviceType,
    List<PageRouteInfo>? children,
  }) : super(
         ServiceRequestFormRoute.name,
         args: ServiceRequestFormRouteArgs(key: key, serviceType: serviceType),
         initialChildren: children,
       );

  static const String name = 'ServiceRequestFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceRequestFormRouteArgs>();
      return ServiceRequestFormScreen(
        key: args.key,
        serviceType: args.serviceType,
      );
    },
  );
}

class ServiceRequestFormRouteArgs {
  const ServiceRequestFormRouteArgs({this.key, required this.serviceType});

  final Key? key;

  final ServiceType serviceType;

  @override
  String toString() {
    return 'ServiceRequestFormRouteArgs{key: $key, serviceType: $serviceType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ServiceRequestFormRouteArgs) return false;
    return key == other.key && serviceType == other.serviceType;
  }

  @override
  int get hashCode => key.hashCode ^ serviceType.hashCode;
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
