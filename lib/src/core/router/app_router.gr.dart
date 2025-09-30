// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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
    required String pin,
    required String opdName,
    List<PageRouteInfo>? children,
  }) : super(
         ReportSuccessRoute.name,
         args: ReportSuccessRouteArgs(
           key: key,
           ticketNumber: ticketNumber,
           pin: pin,
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
        pin: args.pin,
        opdName: args.opdName,
      );
    },
  );
}

class ReportSuccessRouteArgs {
  const ReportSuccessRouteArgs({
    this.key,
    required this.ticketNumber,
    required this.pin,
    required this.opdName,
  });

  final Key? key;

  final String ticketNumber;

  final String pin;

  final String opdName;

  @override
  String toString() {
    return 'ReportSuccessRouteArgs{key: $key, ticketNumber: $ticketNumber, pin: $pin, opdName: $opdName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportSuccessRouteArgs) return false;
    return key == other.key &&
        ticketNumber == other.ticketNumber &&
        pin == other.pin &&
        opdName == other.opdName;
  }

  @override
  int get hashCode =>
      key.hashCode ^ ticketNumber.hashCode ^ pin.hashCode ^ opdName.hashCode;
}

/// generated route for
/// [ReportingFormScreen]
class ReportingFormRoute extends PageRouteInfo<ReportingFormRouteArgs> {
  ReportingFormRoute({
    Key? key,
    required String opdName,
    required IconData opdIcon,
    required Color opdColor,
    List<PageRouteInfo>? children,
  }) : super(
         ReportingFormRoute.name,
         args: ReportingFormRouteArgs(
           key: key,
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
    required this.opdName,
    required this.opdIcon,
    required this.opdColor,
  });

  final Key? key;

  final String opdName;

  final IconData opdIcon;

  final Color opdColor;

  @override
  String toString() {
    return 'ReportingFormRouteArgs{key: $key, opdName: $opdName, opdIcon: $opdIcon, opdColor: $opdColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportingFormRouteArgs) return false;
    return key == other.key &&
        opdName == other.opdName &&
        opdIcon == other.opdIcon &&
        opdColor == other.opdColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^ opdName.hashCode ^ opdIcon.hashCode ^ opdColor.hashCode;
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
