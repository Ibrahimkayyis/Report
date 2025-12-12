// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:report/src/core/download/download_service.dart' as _i242;
import 'package:report/src/core/download/pdf_download_service.dart' as _i671;
import 'package:report/src/core/service_locator/register_module.dart' as _i576;
import 'package:report/src/modules/auth/data/datasources/local/abstract/auth_local_data_source.dart'
    as _i344;
import 'package:report/src/modules/auth/data/datasources/local/implementation/auth_local_data_source_impl.dart'
    as _i172;
import 'package:report/src/modules/auth/data/datasources/remote/source/abstract/auth_remote_data_source.dart'
    as _i260;
import 'package:report/src/modules/auth/data/datasources/remote/source/implementation/auth_remote_data_source_impl.dart'
    as _i1028;
import 'package:report/src/modules/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i138;
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart'
    as _i292;
import 'package:report/src/modules/auth/domain/usecase/login_usecase.dart'
    as _i95;
import 'package:report/src/modules/auth/domain/usecase/register_usecase.dart'
    as _i96;
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart'
    as _i428;
import 'package:report/src/modules/auth/presentation/cubits/login/login_cubit.dart'
    as _i531;
import 'package:report/src/modules/auth/presentation/cubits/register/register_cubit.dart'
    as _i243;
import 'package:report/src/modules/helpdesk/data/datasources/remote/source/abstract/helpdesk_remote_data_source.dart'
    as _i417;
import 'package:report/src/modules/helpdesk/data/datasources/remote/source/implementation/helpdesk_remote_data_source_impl.dart'
    as _i20;
import 'package:report/src/modules/helpdesk/data/repositories_impl/helpdesk_repository_impl.dart'
    as _i734;
import 'package:report/src/modules/helpdesk/domain/repositories/helpdesk_repository.dart'
    as _i724;
import 'package:report/src/modules/helpdesk/domain/usecase/get_chat_history_use_case.dart'
    as _i70;
import 'package:report/src/modules/helpdesk/domain/usecase/send_message_use_case.dart'
    as _i351;
import 'package:report/src/modules/helpdesk/domain/usecase/send_reply_use_case.dart'
    as _i112;
import 'package:report/src/modules/helpdesk/presentation/cubits/helpdesk_chat_cubit.dart'
    as _i284;
import 'package:report/src/modules/knowledge_base/data/datasources/remote/source/abstract/knowledge_base_remote_data_source.dart'
    as _i27;
import 'package:report/src/modules/knowledge_base/data/datasources/remote/source/implementation/knowledge_base_remote_data_source_impl.dart'
    as _i757;
import 'package:report/src/modules/knowledge_base/data/repositories_impl/knowledge_base_repository_impl.dart'
    as _i840;
import 'package:report/src/modules/knowledge_base/domain/repositories/knowledge_base_repository.dart'
    as _i131;
import 'package:report/src/modules/knowledge_base/domain/usecase/get_all_articles_usecase.dart'
    as _i12;
import 'package:report/src/modules/knowledge_base/domain/usecase/get_all_tags_usecase.dart'
    as _i11;
import 'package:report/src/modules/knowledge_base/presentation/cubits/knowledge_base_cubit.dart'
    as _i385;
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/source/abstract/masyarakat_report_remote_data_source.dart'
    as _i969;
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/source/abstract/opd_remote_data_source.dart'
    as _i96;
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/source/implementation/implementation/masyarakat_report_remote_data_source_impl.dart'
    as _i991;
import 'package:report/src/modules/masyarakat_reporting/data/datasources/remote/source/implementation/opd_remote_data_source_impl.dart'
    as _i848;
import 'package:report/src/modules/masyarakat_reporting/data/repositories_impl/masyarakat_report_repository_impl.dart'
    as _i807;
import 'package:report/src/modules/masyarakat_reporting/data/repositories_impl/opd_repository_impl.dart'
    as _i129;
import 'package:report/src/modules/masyarakat_reporting/domain/repositories/masyarakat_report_repository.dart'
    as _i411;
import 'package:report/src/modules/masyarakat_reporting/domain/repositories/opd_repository.dart'
    as _i295;
import 'package:report/src/modules/masyarakat_reporting/domain/usecase/create_public_report_usecase.dart'
    as _i526;
import 'package:report/src/modules/masyarakat_reporting/domain/usecase/get_all_opd_usecase.dart'
    as _i1046;
import 'package:report/src/modules/masyarakat_reporting/presentation/cubits/opd_cubit.dart'
    as _i190;
import 'package:report/src/modules/masyarakat_reporting/presentation/cubits/report/masyarakat_report_cubit.dart'
    as _i784;
import 'package:report/src/modules/notification/data/datasources/remote/source/abstract/notification_remote_data_source.dart'
    as _i241;
import 'package:report/src/modules/notification/data/datasources/remote/source/implementation/notification_remote_data_source_impl.dart'
    as _i258;
import 'package:report/src/modules/notification/data/repositories_impl/notification_repository_impl.dart'
    as _i821;
import 'package:report/src/modules/notification/domain/repositories/notification_repository.dart'
    as _i5;
import 'package:report/src/modules/notification/domain/usecase/delete_notification_usecase.dart'
    as _i1008;
import 'package:report/src/modules/notification/domain/usecase/get_notification_detail_usecase.dart'
    as _i249;
import 'package:report/src/modules/notification/domain/usecase/get_notifications_usecase.dart'
    as _i614;
import 'package:report/src/modules/notification/domain/usecase/mark_all_notifications_read_usecase.dart'
    as _i188;
import 'package:report/src/modules/notification/domain/usecase/mark_notification_read_usecase.dart'
    as _i431;
import 'package:report/src/modules/notification/presentation/cubits/notification_cubit.dart'
    as _i144;
import 'package:report/src/modules/notification/presentation/cubits/notification_detail_cubit.dart'
    as _i1029;
import 'package:report/src/modules/onboarding/data/datasources/local/abstract/onboarding_local_data_source.dart'
    as _i156;
import 'package:report/src/modules/onboarding/data/datasources/local/implementation/onboarding_local_data_source_impl.dart'
    as _i590;
import 'package:report/src/modules/onboarding/data/repositories_impl/onboarding_repository_impl.dart'
    as _i663;
import 'package:report/src/modules/onboarding/domain/repositories/onboarding_repository.dart'
    as _i564;
import 'package:report/src/modules/onboarding/domain/usecase/check_onboarding_status_usecase.dart'
    as _i1006;
import 'package:report/src/modules/onboarding/domain/usecase/complete_onboarding_usecase.dart'
    as _i287;
import 'package:report/src/modules/onboarding/presentation/cubits/onboarding_cubit.dart'
    as _i845;
import 'package:report/src/modules/profile/data/datasources/remote/source/abstract/profile_remote_data_source.dart'
    as _i257;
import 'package:report/src/modules/profile/data/datasources/remote/source/implementation/profile_remote_data_source_impl.dart'
    as _i741;
import 'package:report/src/modules/profile/data/repositories_impl/profile_repository_impl.dart'
    as _i799;
import 'package:report/src/modules/profile/domain/repositories/profile_repository.dart'
    as _i429;
import 'package:report/src/modules/profile/domain/usecase/get_profile_usecase.dart'
    as _i963;
import 'package:report/src/modules/profile/domain/usecase/update_profile_usecase.dart'
    as _i40;
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart'
    as _i96;
import 'package:report/src/modules/report_activity/data/datasources/remote/source/abstract/report_activity_remote_data_source.dart'
    as _i636;
import 'package:report/src/modules/report_activity/data/datasources/remote/source/implementation/report_activity_remote_data_source_impl.dart'
    as _i703;
import 'package:report/src/modules/report_activity/data/repositories_impl/report_activity_repository_impl.dart'
    as _i26;
import 'package:report/src/modules/report_activity/domain/repositories/report_activity_repository.dart'
    as _i754;
import 'package:report/src/modules/report_activity/domain/usecase/get_finished_activities_usecase.dart'
    as _i320;
import 'package:report/src/modules/report_activity/domain/usecase/get_ticket_detail_usecase.dart'
    as _i578;
import 'package:report/src/modules/report_activity/domain/usecase/reopen_ticket_usecase.dart'
    as _i247;
import 'package:report/src/modules/report_activity/domain/usecase/submit_ticket_rating_usecase.dart'
    as _i626;
import 'package:report/src/modules/report_activity/domain/usecase/track_ticket_usecase.dart'
    as _i337;
import 'package:report/src/modules/report_activity/presentation/cubits/reopen_ticket/reopen_ticket_cubit.dart'
    as _i139;
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_cubit.dart'
    as _i430;
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_cubit.dart'
    as _i750;
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_rating/ticket_rating_cubit.dart'
    as _i882;
import 'package:report/src/modules/report_activity/presentation/cubits/track_ticket/track_ticket_cubit.dart'
    as _i932;
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/asset_remote_data_source.dart'
    as _i803;
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/report_remote_data_source.dart'
    as _i425;
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/ticket_category_remote_data_source.dart'
    as _i312;
import 'package:report/src/modules/reporting/data/datasources/remote/source/implementation/asset_remote_data_source_impl.dart'
    as _i989;
import 'package:report/src/modules/reporting/data/datasources/remote/source/implementation/report_remote_data_source_impl.dart'
    as _i715;
import 'package:report/src/modules/reporting/data/datasources/remote/source/implementation/ticket_category_remote_data_source_impl.dart'
    as _i774;
import 'package:report/src/modules/reporting/data/repositories_impl/asset_repository_impl.dart'
    as _i146;
import 'package:report/src/modules/reporting/data/repositories_impl/report_repository_impl.dart'
    as _i533;
import 'package:report/src/modules/reporting/data/repositories_impl/ticket_category_repository_impl.dart'
    as _i593;
import 'package:report/src/modules/reporting/domain/repositories/asset_repository.dart'
    as _i671;
import 'package:report/src/modules/reporting/domain/repositories/report_repository.dart'
    as _i277;
import 'package:report/src/modules/reporting/domain/repositories/ticket_category_repository.dart'
    as _i514;
import 'package:report/src/modules/reporting/domain/usecase/create_public_report_usecase.dart'
    as _i901;
import 'package:report/src/modules/reporting/domain/usecase/get_assets_usecase.dart'
    as _i308;
import 'package:report/src/modules/reporting/domain/usecase/get_ticket_categories_usecase.dart'
    as _i813;
import 'package:report/src/modules/reporting/presentation/cubits/asset/asset_cubit.dart'
    as _i171;
import 'package:report/src/modules/reporting/presentation/cubits/report_cubit.dart'
    as _i377;
import 'package:report/src/modules/reporting/presentation/cubits/ticket_category_cubit.dart'
    as _i573;
import 'package:report/src/modules/service_request/data/datasources/remote/source/abstract/service_request_remote_data_source.dart'
    as _i698;
import 'package:report/src/modules/service_request/data/datasources/remote/source/implementation/service_request_remote_data_source_impl.dart'
    as _i297;
import 'package:report/src/modules/service_request/data/repositories_impl/service_request_repository_impl.dart'
    as _i1065;
import 'package:report/src/modules/service_request/domain/repositories/service_request_repository.dart'
    as _i886;
import 'package:report/src/modules/service_request/domain/usecase/create_service_request_usecase.dart'
    as _i68;
import 'package:report/src/modules/service_request/domain/usecase/get_asset_sub_categories_usecase.dart'
    as _i133;
import 'package:report/src/modules/service_request/presentation/cubits/service_request_cubit.dart'
    as _i621;
import 'package:report/src/modules/teknisi_home/data/datasources/remote/source/abstract/teknisi_home_remote_data_source.dart'
    as _i134;
import 'package:report/src/modules/teknisi_home/data/datasources/remote/source/implementation/teknisi_home_remote_data_source_impl.dart'
    as _i651;
import 'package:report/src/modules/teknisi_home/data/repositories_impl/teknisi_home_repository_impl.dart'
    as _i598;
import 'package:report/src/modules/teknisi_home/domain/repositories/teknisi_home_repository.dart'
    as _i510;
import 'package:report/src/modules/teknisi_home/domain/usecase/get_teknisi_tickets_usecase.dart'
    as _i874;
import 'package:report/src/modules/teknisi_home/presentation/cubits/teknisi_home_cubit.dart'
    as _i348;
import 'package:report/src/modules/teknisi_rating/data/datasources/remote/source/abstract/teknisi_rating_remote_data_source.dart'
    as _i304;
import 'package:report/src/modules/teknisi_rating/data/datasources/remote/source/implementation/teknisi_rating_remote_data_source_impl.dart'
    as _i171;
import 'package:report/src/modules/teknisi_rating/data/repositories_impl/teknisi_rating_repository_impl.dart'
    as _i1007;
import 'package:report/src/modules/teknisi_rating/domain/repositories/teknisi_rating_repository.dart'
    as _i275;
import 'package:report/src/modules/teknisi_rating/domain/usecase/get_teknisi_rating_detail_usecase.dart'
    as _i217;
import 'package:report/src/modules/teknisi_rating/domain/usecase/get_teknisi_ratings_usecase.dart'
    as _i199;
import 'package:report/src/modules/teknisi_rating/presentation/cubits/teknisi_rating_cubit.dart'
    as _i870;
import 'package:report/src/modules/teknisi_rating/presentation/cubits/teknisi_rating_detail_cubit.dart'
    as _i303;
import 'package:report/src/modules/teknisi_ticket_handling/data/datasources/remote/source/abstract/teknisi_ticket_handling_remote_data_source.dart'
    as _i683;
import 'package:report/src/modules/teknisi_ticket_handling/data/datasources/remote/source/implementation/teknisi_ticket_handling_remote_data_source_impl.dart'
    as _i1046;
import 'package:report/src/modules/teknisi_ticket_handling/data/repositories_impl/teknisi_ticket_handling_repository_impl.dart'
    as _i571;
import 'package:report/src/modules/teknisi_ticket_handling/domain/repositories/teknisi_ticket_handling_repository.dart'
    as _i141;
import 'package:report/src/modules/teknisi_ticket_handling/domain/usecase/complete_ticket_usecase.dart'
    as _i1062;
import 'package:report/src/modules/teknisi_ticket_handling/domain/usecase/get_ticket_detail_usecase.dart'
    as _i410;
import 'package:report/src/modules/teknisi_ticket_handling/domain/usecase/start_ticket_process_usecase.dart'
    as _i621;
import 'package:report/src/modules/teknisi_ticket_handling/presentation/cubits/teknisi_ticket_detail_cubit.dart'
    as _i643;
import 'package:report/src/modules/test_helper/presentation/cubits/test_helper_cubit.dart'
    as _i876;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i344.AuthLocalDataSource>(
      () => _i172.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i156.OnboardingLocalDataSource>(
      () => _i590.OnboardingLocalDataSourceImpl(),
    );
    gh.factory<String>(() => registerModule.baseUrl, instanceName: 'baseUrl');
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<String>(instanceName: 'baseUrl')),
    );
    gh.lazySingleton<_i683.TeknisiTicketHandlingRemoteDataSource>(
      () => _i1046.TeknisiTicketHandlingRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i242.DownloadService>(() => _i671.PdfDownloadService());
    gh.lazySingleton<_i564.OnboardingRepository>(
      () =>
          _i663.OnboardingRepositoryImpl(gh<_i156.OnboardingLocalDataSource>()),
    );
    gh.lazySingleton<_i636.ReportActivityRemoteDataSource>(
      () => _i703.ReportActivityRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i257.ProfileRemoteDataSource>(
      () => _i741.ProfileRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i27.KnowledgeBaseRemoteDataSource>(
      () => _i757.KnowledgeBaseRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i134.TeknisiHomeRemoteDataSource>(
      () => _i651.TeknisiHomeRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i969.MasyarakatReportRemoteDataSource>(
      () => _i991.MasyarakatReportRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i312.TicketCategoryRemoteDataSource>(
      () => _i774.TicketCategoryRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i425.ReportRemoteDataSource>(
      () => _i715.ReportRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i803.AssetRemoteDataSource>(
      () => _i989.AssetRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i304.TeknisiRatingRemoteDataSource>(
      () => _i171.TeknisiRatingRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i698.ServiceRequestRemoteDataSource>(
      () => _i297.ServiceRequestRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i241.NotificationRemoteDataSource>(
      () => _i258.NotificationRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i96.OpdRemoteDataSource>(
      () => _i848.OpdRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i411.MasyarakatReportRepository>(
      () => _i807.MasyarakatReportRepositoryImpl(
        gh<_i969.MasyarakatReportRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i671.AssetRepository>(
      () => _i146.AssetRepositoryImpl(gh<_i803.AssetRemoteDataSource>()),
    );
    gh.lazySingleton<_i141.TeknisiTicketHandlingRepository>(
      () => _i571.TeknisiTicketHandlingRepositoryImpl(
        gh<_i683.TeknisiTicketHandlingRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i417.HelpdeskRemoteDataSource>(
      () => _i20.HelpdeskRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i429.ProfileRepository>(
      () => _i799.ProfileRepositoryImpl(gh<_i257.ProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i260.AuthRemoteDataSource>(
      () => _i1028.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i5.NotificationRepository>(
      () => _i821.NotificationRepositoryImpl(
        gh<_i241.NotificationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i510.TeknisiHomeRepository>(
      () => _i598.TeknisiHomeRepositoryImpl(
        gh<_i134.TeknisiHomeRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i275.TeknisiRatingRepository>(
      () => _i1007.TeknisiRatingRepositoryImpl(
        gh<_i304.TeknisiRatingRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1008.DeleteNotificationUseCase>(
      () => _i1008.DeleteNotificationUseCase(gh<_i5.NotificationRepository>()),
    );
    gh.lazySingleton<_i249.GetNotificationDetailUseCase>(
      () =>
          _i249.GetNotificationDetailUseCase(gh<_i5.NotificationRepository>()),
    );
    gh.lazySingleton<_i614.GetNotificationsUseCase>(
      () => _i614.GetNotificationsUseCase(gh<_i5.NotificationRepository>()),
    );
    gh.lazySingleton<_i188.MarkAllNotificationsReadUseCase>(
      () => _i188.MarkAllNotificationsReadUseCase(
        gh<_i5.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i431.MarkNotificationReadUseCase>(
      () => _i431.MarkNotificationReadUseCase(gh<_i5.NotificationRepository>()),
    );
    gh.lazySingleton<_i886.ServiceRequestRepository>(
      () => _i1065.ServiceRequestRepositoryImpl(
        gh<_i698.ServiceRequestRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i514.TicketCategoryRepository>(
      () => _i593.TicketCategoryRepositoryImpl(
        gh<_i312.TicketCategoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1006.CheckOnboardingStatusUseCase>(
      () =>
          _i1006.CheckOnboardingStatusUseCase(gh<_i564.OnboardingRepository>()),
    );
    gh.lazySingleton<_i287.CompleteOnboardingUseCase>(
      () => _i287.CompleteOnboardingUseCase(gh<_i564.OnboardingRepository>()),
    );
    gh.lazySingleton<_i68.CreateServiceRequestUseCase>(
      () => _i68.CreateServiceRequestUseCase(
        gh<_i886.ServiceRequestRepository>(),
      ),
    );
    gh.lazySingleton<_i133.GetAssetSubCategoriesUseCase>(
      () => _i133.GetAssetSubCategoriesUseCase(
        gh<_i886.ServiceRequestRepository>(),
      ),
    );
    gh.lazySingleton<_i217.GetTeknisiRatingDetailUseCase>(
      () => _i217.GetTeknisiRatingDetailUseCase(
        gh<_i275.TeknisiRatingRepository>(),
      ),
    );
    gh.lazySingleton<_i199.GetTeknisiRatingsUseCase>(
      () => _i199.GetTeknisiRatingsUseCase(gh<_i275.TeknisiRatingRepository>()),
    );
    gh.lazySingleton<_i1062.CompleteTicketUseCase>(
      () => _i1062.CompleteTicketUseCase(
        gh<_i141.TeknisiTicketHandlingRepository>(),
      ),
    );
    gh.lazySingleton<_i410.GetTicketDetailUseCase>(
      () => _i410.GetTicketDetailUseCase(
        gh<_i141.TeknisiTicketHandlingRepository>(),
      ),
    );
    gh.lazySingleton<_i621.StartTicketProcessUseCase>(
      () => _i621.StartTicketProcessUseCase(
        gh<_i141.TeknisiTicketHandlingRepository>(),
      ),
    );
    gh.lazySingleton<_i131.KnowledgeBaseRepository>(
      () => _i840.KnowledgeBaseRepositoryImpl(
        gh<_i27.KnowledgeBaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i874.GetTeknisiTicketsUseCase>(
      () => _i874.GetTeknisiTicketsUseCase(gh<_i510.TeknisiHomeRepository>()),
    );
    gh.lazySingleton<_i277.ReportRepository>(
      () => _i533.ReportRepositoryImpl(gh<_i425.ReportRemoteDataSource>()),
    );
    gh.factory<_i621.ServiceRequestCubit>(
      () => _i621.ServiceRequestCubit(
        gh<_i133.GetAssetSubCategoriesUseCase>(),
        gh<_i68.CreateServiceRequestUseCase>(),
      ),
    );
    gh.lazySingleton<_i295.OpdRepository>(
      () => _i129.OpdRepositoryImpl(gh<_i96.OpdRemoteDataSource>()),
    );
    gh.lazySingleton<_i12.GetAllArticlesUseCase>(
      () => _i12.GetAllArticlesUseCase(gh<_i131.KnowledgeBaseRepository>()),
    );
    gh.lazySingleton<_i11.GetAllTagsUseCase>(
      () => _i11.GetAllTagsUseCase(gh<_i131.KnowledgeBaseRepository>()),
    );
    gh.lazySingleton<_i308.GetAssetsUseCase>(
      () => _i308.GetAssetsUseCase(gh<_i671.AssetRepository>()),
    );
    gh.lazySingleton<_i754.ReportActivityRepository>(
      () => _i26.ReportActivityRepositoryImpl(
        gh<_i636.ReportActivityRemoteDataSource>(),
      ),
    );
    gh.factory<_i385.KnowledgeBaseCubit>(
      () => _i385.KnowledgeBaseCubit(
        gh<_i12.GetAllArticlesUseCase>(),
        gh<_i11.GetAllTagsUseCase>(),
      ),
    );
    gh.lazySingleton<_i724.HelpdeskRepository>(
      () => _i734.HelpdeskRepositoryImpl(gh<_i417.HelpdeskRemoteDataSource>()),
    );
    gh.factory<_i144.NotificationCubit>(
      () => _i144.NotificationCubit(
        gh<_i614.GetNotificationsUseCase>(),
        gh<_i188.MarkAllNotificationsReadUseCase>(),
        gh<_i1008.DeleteNotificationUseCase>(),
      ),
    );
    gh.lazySingleton<_i813.GetTicketCategoriesUseCase>(
      () => _i813.GetTicketCategoriesUseCase(
        gh<_i514.TicketCategoryRepository>(),
      ),
    );
    gh.factory<_i303.TeknisiRatingDetailCubit>(
      () => _i303.TeknisiRatingDetailCubit(
        gh<_i217.GetTeknisiRatingDetailUseCase>(),
      ),
    );
    gh.factory<_i870.TeknisiRatingCubit>(
      () => _i870.TeknisiRatingCubit(gh<_i199.GetTeknisiRatingsUseCase>()),
    );
    gh.lazySingleton<_i901.CreatePublicReportUseCase>(
      () => _i901.CreatePublicReportUseCase(gh<_i277.ReportRepository>()),
    );
    gh.lazySingleton<_i526.CreatePublicReportUseCase>(
      () => _i526.CreatePublicReportUseCase(
        gh<_i411.MasyarakatReportRepository>(),
      ),
    );
    gh.factory<_i1029.NotificationDetailCubit>(
      () => _i1029.NotificationDetailCubit(
        gh<_i249.GetNotificationDetailUseCase>(),
        gh<_i431.MarkNotificationReadUseCase>(),
      ),
    );
    gh.factory<_i845.OnboardingCubit>(
      () => _i845.OnboardingCubit(
        checkStatus: gh<_i1006.CheckOnboardingStatusUseCase>(),
        completeOnboarding: gh<_i287.CompleteOnboardingUseCase>(),
      ),
    );
    gh.factory<_i963.GetProfileUsecase>(
      () => _i963.GetProfileUsecase(gh<_i429.ProfileRepository>()),
    );
    gh.factory<_i40.UpdateProfileUsecase>(
      () => _i40.UpdateProfileUsecase(gh<_i429.ProfileRepository>()),
    );
    gh.lazySingleton<_i578.GetTicketDetailUseCase>(
      () => _i578.GetTicketDetailUseCase(gh<_i754.ReportActivityRepository>()),
    );
    gh.lazySingleton<_i247.ReopenTicketUseCase>(
      () => _i247.ReopenTicketUseCase(gh<_i754.ReportActivityRepository>()),
    );
    gh.lazySingleton<_i626.SubmitTicketRatingUseCase>(
      () =>
          _i626.SubmitTicketRatingUseCase(gh<_i754.ReportActivityRepository>()),
    );
    gh.factory<_i320.GetFinishedActivitiesUseCase>(
      () => _i320.GetFinishedActivitiesUseCase(
        gh<_i754.ReportActivityRepository>(),
      ),
    );
    gh.factory<_i337.TrackTicketUseCase>(
      () => _i337.TrackTicketUseCase(gh<_i754.ReportActivityRepository>()),
    );
    gh.factory<_i377.ReportCubit>(
      () => _i377.ReportCubit(gh<_i901.CreatePublicReportUseCase>()),
    );
    gh.factory<_i932.TrackTicketCubit>(
      () => _i932.TrackTicketCubit(gh<_i337.TrackTicketUseCase>()),
    );
    gh.lazySingleton<_i292.AuthRepository>(
      () => _i138.AuthRepositoryImpl(
        remote: gh<_i260.AuthRemoteDataSource>(),
        local: gh<_i344.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i348.TeknisiHomeCubit>(
      () => _i348.TeknisiHomeCubit(gh<_i874.GetTeknisiTicketsUseCase>()),
    );
    gh.factory<_i750.TicketDetailCubit>(
      () => _i750.TicketDetailCubit(
        gh<_i578.GetTicketDetailUseCase>(),
        gh<_i292.AuthRepository>(),
      ),
    );
    gh.factory<_i171.AssetCubit>(
      () => _i171.AssetCubit(gh<_i308.GetAssetsUseCase>()),
    );
    gh.factory<_i430.ReportActivityCubit>(
      () => _i430.ReportActivityCubit(gh<_i320.GetFinishedActivitiesUseCase>()),
    );
    gh.factory<_i784.MasyarakatReportCubit>(
      () => _i784.MasyarakatReportCubit(gh<_i526.CreatePublicReportUseCase>()),
    );
    gh.factory<_i1046.GetAllOpdUsecase>(
      () => _i1046.GetAllOpdUsecase(gh<_i295.OpdRepository>()),
    );
    gh.factory<_i643.TeknisiTicketDetailCubit>(
      () => _i643.TeknisiTicketDetailCubit(
        gh<_i410.GetTicketDetailUseCase>(),
        gh<_i621.StartTicketProcessUseCase>(),
        gh<_i1062.CompleteTicketUseCase>(),
      ),
    );
    gh.factory<_i139.ReopenTicketCubit>(
      () => _i139.ReopenTicketCubit(gh<_i247.ReopenTicketUseCase>()),
    );
    gh.lazySingleton<_i428.AuthCubit>(
      () => _i428.AuthCubit(gh<_i292.AuthRepository>()),
    );
    gh.factory<_i876.TestHelperCubit>(
      () => _i876.TestHelperCubit(gh<_i292.AuthRepository>()),
    );
    gh.factory<_i95.LoginUseCase>(
      () => _i95.LoginUseCase(gh<_i292.AuthRepository>()),
    );
    gh.factory<_i96.RegisterUseCase>(
      () => _i96.RegisterUseCase(gh<_i292.AuthRepository>()),
    );
    gh.factory<_i70.GetChatHistoryUseCase>(
      () => _i70.GetChatHistoryUseCase(gh<_i724.HelpdeskRepository>()),
    );
    gh.factory<_i351.SendMessageUseCase>(
      () => _i351.SendMessageUseCase(gh<_i724.HelpdeskRepository>()),
    );
    gh.factory<_i112.SendReplyUseCase>(
      () => _i112.SendReplyUseCase(gh<_i724.HelpdeskRepository>()),
    );
    gh.factory<_i573.TicketCategoryCubit>(
      () => _i573.TicketCategoryCubit(gh<_i813.GetTicketCategoriesUseCase>()),
    );
    gh.factory<_i190.OpdCubit>(
      () => _i190.OpdCubit(gh<_i1046.GetAllOpdUsecase>()),
    );
    gh.factory<_i882.TicketRatingCubit>(
      () => _i882.TicketRatingCubit(gh<_i626.SubmitTicketRatingUseCase>()),
    );
    gh.factory<_i284.HelpdeskChatCubit>(
      () => _i284.HelpdeskChatCubit(
        gh<_i351.SendMessageUseCase>(),
        gh<_i112.SendReplyUseCase>(),
        gh<_i70.GetChatHistoryUseCase>(),
      ),
    );
    gh.factory<_i96.ProfileCubit>(
      () => _i96.ProfileCubit(
        gh<_i963.GetProfileUsecase>(),
        gh<_i40.UpdateProfileUsecase>(),
      ),
    );
    gh.factory<_i531.LoginCubit>(
      () =>
          _i531.LoginCubit(gh<_i95.LoginUseCase>(), gh<_i292.AuthRepository>()),
    );
    gh.factory<_i243.RegisterCubit>(
      () => _i243.RegisterCubit(gh<_i96.RegisterUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i576.RegisterModule {}
