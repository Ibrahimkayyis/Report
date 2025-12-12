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
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordScreen();
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
/// [MasyarakatReopenTicketScreen]
class MasyarakatReopenTicketRoute
    extends PageRouteInfo<MasyarakatReopenTicketRouteArgs> {
  MasyarakatReopenTicketRoute({
    Key? key,
    required String ticketId,
    List<PageRouteInfo>? children,
  }) : super(
         MasyarakatReopenTicketRoute.name,
         args: MasyarakatReopenTicketRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'MasyarakatReopenTicketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MasyarakatReopenTicketRouteArgs>();
      return MasyarakatReopenTicketScreen(
        key: args.key,
        ticketId: args.ticketId,
      );
    },
  );
}

class MasyarakatReopenTicketRouteArgs {
  const MasyarakatReopenTicketRouteArgs({this.key, required this.ticketId});

  final Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'MasyarakatReopenTicketRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MasyarakatReopenTicketRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [MasyarakatReportActivityDetailScreen]
class MasyarakatReportActivityDetailRoute
    extends PageRouteInfo<MasyarakatReportActivityDetailRouteArgs> {
  MasyarakatReportActivityDetailRoute({
    Key? key,
    required String ticketId,
    List<PageRouteInfo>? children,
  }) : super(
         MasyarakatReportActivityDetailRoute.name,
         args: MasyarakatReportActivityDetailRouteArgs(
           key: key,
           ticketId: ticketId,
         ),
         initialChildren: children,
       );

  static const String name = 'MasyarakatReportActivityDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MasyarakatReportActivityDetailRouteArgs>();
      return MasyarakatReportActivityDetailScreen(
        key: args.key,
        ticketId: args.ticketId,
      );
    },
  );
}

class MasyarakatReportActivityDetailRouteArgs {
  const MasyarakatReportActivityDetailRouteArgs({
    this.key,
    required this.ticketId,
  });

  final Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'MasyarakatReportActivityDetailRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MasyarakatReportActivityDetailRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [MasyarakatReportingFormScreen]
class MasyarakatReportingFormRoute
    extends PageRouteInfo<MasyarakatReportingFormRouteArgs> {
  MasyarakatReportingFormRoute({
    Key? key,
    required String opdId,
    String? opdName,
    Color? opdColor,
    String? opdIconUrl,
    List<PageRouteInfo>? children,
  }) : super(
         MasyarakatReportingFormRoute.name,
         args: MasyarakatReportingFormRouteArgs(
           key: key,
           opdId: opdId,
           opdName: opdName,
           opdColor: opdColor,
           opdIconUrl: opdIconUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'MasyarakatReportingFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MasyarakatReportingFormRouteArgs>();
      return MasyarakatReportingFormScreen(
        key: args.key,
        opdId: args.opdId,
        opdName: args.opdName,
        opdColor: args.opdColor,
        opdIconUrl: args.opdIconUrl,
      );
    },
  );
}

class MasyarakatReportingFormRouteArgs {
  const MasyarakatReportingFormRouteArgs({
    this.key,
    required this.opdId,
    this.opdName,
    this.opdColor,
    this.opdIconUrl,
  });

  final Key? key;

  final String opdId;

  final String? opdName;

  final Color? opdColor;

  final String? opdIconUrl;

  @override
  String toString() {
    return 'MasyarakatReportingFormRouteArgs{key: $key, opdId: $opdId, opdName: $opdName, opdColor: $opdColor, opdIconUrl: $opdIconUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MasyarakatReportingFormRouteArgs) return false;
    return key == other.key &&
        opdId == other.opdId &&
        opdName == other.opdName &&
        opdColor == other.opdColor &&
        opdIconUrl == other.opdIconUrl;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      opdId.hashCode ^
      opdName.hashCode ^
      opdColor.hashCode ^
      opdIconUrl.hashCode;
}

/// generated route for
/// [NotificationDetailScreen]
class NotificationDetailRoute
    extends PageRouteInfo<NotificationDetailRouteArgs> {
  NotificationDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
         NotificationDetailRoute.name,
         args: NotificationDetailRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailRouteArgs>();
      return NotificationDetailScreen(key: args.key, id: args.id);
    },
  );
}

class NotificationDetailRouteArgs {
  const NotificationDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'NotificationDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotificationDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
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
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
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
/// [ReopenTicketScreen]
class ReopenTicketRoute extends PageRouteInfo<ReopenTicketRouteArgs> {
  ReopenTicketRoute({
    Key? key,
    required String ticketId,
    List<PageRouteInfo>? children,
  }) : super(
         ReopenTicketRoute.name,
         args: ReopenTicketRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'ReopenTicketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReopenTicketRouteArgs>();
      return ReopenTicketScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class ReopenTicketRouteArgs {
  const ReopenTicketRouteArgs({this.key, required this.ticketId});

  final Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'ReopenTicketRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReopenTicketRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [ReportActivityDetailScreen]
class ReportActivityDetailRoute
    extends PageRouteInfo<ReportActivityDetailRouteArgs> {
  ReportActivityDetailRoute({
    Key? key,
    required String ticketId,
    List<PageRouteInfo>? children,
  }) : super(
         ReportActivityDetailRoute.name,
         args: ReportActivityDetailRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'ReportActivityDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportActivityDetailRouteArgs>();
      return ReportActivityDetailScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class ReportActivityDetailRouteArgs {
  const ReportActivityDetailRouteArgs({this.key, required this.ticketId});

  final Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'ReportActivityDetailRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportActivityDetailRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [ReportSuccessScreen]
class ReportSuccessRoute extends PageRouteInfo<ReportSuccessRouteArgs> {
  ReportSuccessRoute({
    Key? key,
    required dynamic data,
    List<PageRouteInfo>? children,
  }) : super(
         ReportSuccessRoute.name,
         args: ReportSuccessRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'ReportSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportSuccessRouteArgs>();
      return ReportSuccessScreen(key: args.key, data: args.data);
    },
  );
}

class ReportSuccessRouteArgs {
  const ReportSuccessRouteArgs({this.key, required this.data});

  final Key? key;

  final dynamic data;

  @override
  String toString() {
    return 'ReportSuccessRouteArgs{key: $key, data: $data}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportSuccessRouteArgs) return false;
    return key == other.key && data == other.data;
  }

  @override
  int get hashCode => key.hashCode ^ data.hashCode;
}

/// generated route for
/// [ReportingFormScreen]
class ReportingFormRoute extends PageRouteInfo<ReportingFormRouteArgs> {
  ReportingFormRoute({
    Key? key,
    String? opdId,
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
      final args = data.argsAs<ReportingFormRouteArgs>(
        orElse: () => const ReportingFormRouteArgs(),
      );
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
    this.opdId,
    this.opdName,
    this.opdIconUrl,
    this.opdColor,
  });

  final Key? key;

  final String? opdId;

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
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    Key? key,
    required String email,
    required String otpCode,
    List<PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(key: key, email: email, otpCode: otpCode),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return ResetPasswordScreen(
        key: args.key,
        email: args.email,
        otpCode: args.otpCode,
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.email,
    required this.otpCode,
  });

  final Key? key;

  final String email;

  final String otpCode;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, email: $email, otpCode: $otpCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key && email == other.email && otpCode == other.otpCode;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode ^ otpCode.hashCode;
}

/// generated route for
/// [ServiceRequestFormScreen]
class ServiceRequestFormRoute
    extends PageRouteInfo<ServiceRequestFormRouteArgs> {
  ServiceRequestFormRoute({
    Key? key,
    String? opdId,
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
      final args = data.argsAs<ServiceRequestFormRouteArgs>(
        orElse: () => const ServiceRequestFormRouteArgs(),
      );
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
    this.opdId,
    this.opdName,
    this.opdIconUrl,
    this.opdColor,
  });

  final Key? key;

  final String? opdId;

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
    required ServiceRequestResponseModel data,
    List<PageRouteInfo>? children,
  }) : super(
         ServiceRequestSuccessRoute.name,
         args: ServiceRequestSuccessRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'ServiceRequestSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceRequestSuccessRouteArgs>();
      return ServiceRequestSuccessScreen(key: args.key, data: args.data);
    },
  );
}

class ServiceRequestSuccessRouteArgs {
  const ServiceRequestSuccessRouteArgs({this.key, required this.data});

  final Key? key;

  final ServiceRequestResponseModel data;

  @override
  String toString() {
    return 'ServiceRequestSuccessRouteArgs{key: $key, data: $data}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ServiceRequestSuccessRouteArgs) return false;
    return key == other.key && data == other.data;
  }

  @override
  int get hashCode => key.hashCode ^ data.hashCode;
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
    required String ticketId,
    List<PageRouteInfo>? children,
  }) : super(
         TeknisiRatingDetailRoute.name,
         args: TeknisiRatingDetailRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'TeknisiRatingDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeknisiRatingDetailRouteArgs>();
      return TeknisiRatingDetailScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class TeknisiRatingDetailRouteArgs {
  const TeknisiRatingDetailRouteArgs({this.key, required this.ticketId});

  final Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'TeknisiRatingDetailRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TeknisiRatingDetailRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
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

/// generated route for
/// [TicketRatingScreen]
class TicketRatingRoute extends PageRouteInfo<TicketRatingRouteArgs> {
  TicketRatingRoute({
    Key? key,
    required String ticketId,
    List<PageRouteInfo>? children,
  }) : super(
         TicketRatingRoute.name,
         args: TicketRatingRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'TicketRatingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketRatingRouteArgs>();
      return TicketRatingScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class TicketRatingRouteArgs {
  const TicketRatingRouteArgs({this.key, required this.ticketId});

  final Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'TicketRatingRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketRatingRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [VerifyOtpScreen]
class VerifyOtpRoute extends PageRouteInfo<VerifyOtpRouteArgs> {
  VerifyOtpRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
         VerifyOtpRoute.name,
         args: VerifyOtpRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'VerifyOtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyOtpRouteArgs>();
      return VerifyOtpScreen(key: args.key, email: args.email);
    },
  );
}

class VerifyOtpRouteArgs {
  const VerifyOtpRouteArgs({this.key, required this.email});

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyOtpRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerifyOtpRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}
