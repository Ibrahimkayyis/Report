import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:report/src/core/router/auth_guard.dart';
import 'package:report/src/modules/notification/presentation/screens/notification_screen.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/screens/profile_screen.dart';
import 'package:report/src/modules/qr/presentation/screens/qr_asset_detail_screen.dart';
import 'package:report/src/modules/qr/presentation/screens/qr_screen.dart';
import 'package:report/src/modules/report_activity/presentation/screens/activity_screen.dart';
import 'package:report/src/modules/reporting/presentation/screens/opd_selection_screen.dart';
import 'package:report/src/modules/reporting/presentation/screens/report_success_screen.dart';
import 'package:report/src/modules/reporting/presentation/screens/reporting_form_screen.dart';
import '../../modules/auth/presentation/screens/splash/splash_screen.dart';
import '../../modules/auth/presentation/screens/register/register_screen.dart';
import '../../modules/auth/presentation/screens/login/login_screen.dart';
import '../../modules/home/presentation/screens/home_screen.dart';
import '../../modules/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:report/src/modules/service_request/presentation/screens/service_request_selection_screen.dart';
import 'package:report/src/modules/service_request/presentation/screens/service_request_form_screen.dart';
import 'package:report/src/modules/service_request/domain/models/service_type.dart';
import 'package:report/src/modules/knowledge_base/presentation/screens/knowledge_base_screen.dart';
import 'package:report/src/modules/report_activity/presentation/screens/check_report_status_screen.dart';
import 'package:report/src/modules/service_request/presentation/screens/service_request_success_screen.dart';
import 'package:report/src/modules/helpdesk/presentation/screens/helpdesk_chat_screen.dart';
import 'package:report/src/modules/report_activity/presentation/screens/check_report_status_result_screen.dart';
import 'package:report/src/modules/profile/presentation/screens/edit_profile_screen.dart';
import 'package:report/src/modules/profile/presentation/screens/edit_theme_screen.dart';





part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  // @override
  // List<AutoRoute> get routes => [
  //   AutoRoute(page: SplashRoute.page, ),
  //   AutoRoute(page: RegisterRoute.page),
  //   AutoRoute(page: LoginRoute.page),
  //   AutoRoute(page: HomeRoute.page),
  //   AutoRoute(page: MainLayoutRoute.page,initial: true),
  //   AutoRoute(page: OpdSelectionRoute.page),
  //   AutoRoute(page: ReportingFormRoute.page),
  //   AutoRoute(page: ReportSuccessRoute.page),
  //   AutoRoute(page: ServiceRequestSelectionRoute.page),
  //   AutoRoute(page: ServiceRequestFormRoute.page),
  //   AutoRoute(page: KnowledgeBaseRoute.page),
  //   AutoRoute(page: CheckReportStatusRoute.page),
  //   AutoRoute(page: ServiceRequestSuccessRoute.page),
  //   AutoRoute(page: HelpdeskChatRoute.page),
  //   AutoRoute(page: CheckReportStatusResultRoute.page),
  //   AutoRoute(page: EditProfileRoute.page),
  //   AutoRoute(page: EditThemeRoute.page),
  //   AutoRoute(page: QRAssetDetailRoute.page),
  // ];

   @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: MainLayoutRoute.page, guards: [AuthGuard()]),
    AutoRoute(page: OpdSelectionRoute.page),
    AutoRoute(page: ReportingFormRoute.page),
    AutoRoute(page: ReportSuccessRoute.page),
    AutoRoute(page: ServiceRequestSelectionRoute.page),
    AutoRoute(page: ServiceRequestFormRoute.page),
    AutoRoute(page: KnowledgeBaseRoute.page),
    AutoRoute(page: CheckReportStatusRoute.page),
    AutoRoute(page: ServiceRequestSuccessRoute.page),
    AutoRoute(page: HelpdeskChatRoute.page),
    AutoRoute(page: CheckReportStatusResultRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: EditThemeRoute.page),
    AutoRoute(page: QRAssetDetailRoute.page),
  ];
}
