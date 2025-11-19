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
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/opd_remote_data_source.dart'
    as _i144;
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/report_remote_data_source.dart'
    as _i425;
import 'package:report/src/modules/reporting/data/datasources/remote/source/abstract/ticket_category_remote_data_source.dart'
    as _i312;
import 'package:report/src/modules/reporting/data/datasources/remote/source/implementation/opd_remote_data_source_impl.dart'
    as _i972;
import 'package:report/src/modules/reporting/data/datasources/remote/source/implementation/report_remote_data_source_impl.dart'
    as _i715;
import 'package:report/src/modules/reporting/data/datasources/remote/source/implementation/ticket_category_remote_data_source_impl.dart'
    as _i774;
import 'package:report/src/modules/reporting/data/repositories_impl/opd_repository_impl.dart'
    as _i235;
import 'package:report/src/modules/reporting/data/repositories_impl/report_repository_impl.dart'
    as _i533;
import 'package:report/src/modules/reporting/data/repositories_impl/ticket_category_repository_impl.dart'
    as _i593;
import 'package:report/src/modules/reporting/domain/repositories/opd_repository.dart'
    as _i189;
import 'package:report/src/modules/reporting/domain/repositories/report_repository.dart'
    as _i277;
import 'package:report/src/modules/reporting/domain/repositories/ticket_category_repository.dart'
    as _i514;
import 'package:report/src/modules/reporting/domain/usecase/create_public_report_usecase.dart'
    as _i901;
import 'package:report/src/modules/reporting/domain/usecase/get_all_opd_usecase.dart'
    as _i166;
import 'package:report/src/modules/reporting/domain/usecase/get_ticket_categories_usecase.dart'
    as _i813;
import 'package:report/src/modules/reporting/presentation/cubits/opd_cubit.dart'
    as _i988;
import 'package:report/src/modules/reporting/presentation/cubits/report_cubit.dart'
    as _i377;
import 'package:report/src/modules/reporting/presentation/cubits/ticket_category_cubit.dart'
    as _i573;
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
    gh.factory<String>(() => registerModule.baseUrl, instanceName: 'baseUrl');
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<String>(instanceName: 'baseUrl')),
    );
    gh.lazySingleton<_i257.ProfileRemoteDataSource>(
      () => _i741.ProfileRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i27.KnowledgeBaseRemoteDataSource>(
      () => _i757.KnowledgeBaseRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i312.TicketCategoryRemoteDataSource>(
      () => _i774.TicketCategoryRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i425.ReportRemoteDataSource>(
      () => _i715.ReportRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i144.OpdRemoteDataSource>(
      () => _i972.OpdRemoteDataSourceImpl(gh<_i361.Dio>()),
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
    gh.lazySingleton<_i514.TicketCategoryRepository>(
      () => _i593.TicketCategoryRepositoryImpl(
        gh<_i312.TicketCategoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i131.KnowledgeBaseRepository>(
      () => _i840.KnowledgeBaseRepositoryImpl(
        gh<_i27.KnowledgeBaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i12.GetAllArticlesUseCase>(
      () => _i12.GetAllArticlesUseCase(gh<_i131.KnowledgeBaseRepository>()),
    );
    gh.lazySingleton<_i11.GetAllTagsUseCase>(
      () => _i11.GetAllTagsUseCase(gh<_i131.KnowledgeBaseRepository>()),
    );
    gh.lazySingleton<_i189.OpdRepository>(
      () => _i235.OpdRepositoryImpl(gh<_i144.OpdRemoteDataSource>()),
    );
    gh.factory<_i385.KnowledgeBaseCubit>(
      () => _i385.KnowledgeBaseCubit(
        gh<_i12.GetAllArticlesUseCase>(),
        gh<_i11.GetAllTagsUseCase>(),
      ),
    );
    gh.lazySingleton<_i277.ReportRepository>(
      () => _i533.ReportRepositoryImpl(gh<_i425.ReportRemoteDataSource>()),
    );
    gh.lazySingleton<_i724.HelpdeskRepository>(
      () => _i734.HelpdeskRepositoryImpl(gh<_i417.HelpdeskRemoteDataSource>()),
    );
    gh.lazySingleton<_i813.GetTicketCategoriesUseCase>(
      () => _i813.GetTicketCategoriesUseCase(
        gh<_i514.TicketCategoryRepository>(),
      ),
    );
    gh.factory<_i901.CreatePublicReportUsecase>(
      () => _i901.CreatePublicReportUsecase(gh<_i277.ReportRepository>()),
    );
    gh.factory<_i963.GetProfileUsecase>(
      () => _i963.GetProfileUsecase(gh<_i429.ProfileRepository>()),
    );
    gh.factory<_i40.UpdateProfileUsecase>(
      () => _i40.UpdateProfileUsecase(gh<_i429.ProfileRepository>()),
    );
    gh.lazySingleton<_i292.AuthRepository>(
      () => _i138.AuthRepositoryImpl(
        remote: gh<_i260.AuthRemoteDataSource>(),
        local: gh<_i344.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i166.GetAllOpdUsecase>(
      () => _i166.GetAllOpdUsecase(gh<_i189.OpdRepository>()),
    );
    gh.lazySingleton<_i428.AuthCubit>(
      () => _i428.AuthCubit(gh<_i292.AuthRepository>()),
    );
    gh.factory<_i876.TestHelperCubit>(
      () => _i876.TestHelperCubit(gh<_i292.AuthRepository>()),
    );
    gh.factory<_i377.ReportCubit>(
      () => _i377.ReportCubit(gh<_i901.CreatePublicReportUsecase>()),
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
    gh.factory<_i988.OpdCubit>(
      () => _i988.OpdCubit(gh<_i166.GetAllOpdUsecase>()),
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
