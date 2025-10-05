// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

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
    as _i159;
import 'package:report/src/modules/auth/data/datasources/local/implementation/auth_local_data_source_impl.dart'
    as _i578;
import 'package:report/src/modules/auth/data/datasources/remote/source/abstract/auth_remote_data_source.dart'
    as _i1005;
import 'package:report/src/modules/auth/data/datasources/remote/source/implementation/api_service.dart'
    as _i37;
import 'package:report/src/modules/auth/data/datasources/remote/source/implementation/auth_remote_data_source_impl.dart'
    as _i345;
import 'package:report/src/modules/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i769;
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart'
    as _i207;
import 'package:report/src/modules/auth/domain/usecase/login_usecase.dart' as _i672;
import 'package:report/src/modules/auth/domain/usecase/register_usecase.dart'
    as _i125;
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart'
    as _i150;
import 'package:report/src/modules/auth/presentation/cubits/login/login_cubit.dart'
    as _i1037;
import 'package:report/src/modules/auth/presentation/cubits/register/register_cubit.dart'
    as _i832;
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
    gh.lazySingleton<_i37.ApiService>(() => _i37.ApiService());
    gh.lazySingleton<_i159.AuthLocalDataSource>(
      () => _i578.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<String>(() => registerModule.baseUrl, instanceName: 'baseUrl');
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<String>(instanceName: 'baseUrl')),
    );
    gh.lazySingleton<_i1005.AuthRemoteDataSource>(
      () => _i345.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i207.AuthRepository>(
      () => _i769.AuthRepositoryImpl(
        remote: gh<_i1005.AuthRemoteDataSource>(),
        local: gh<_i159.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i150.AuthCubit>(
      () => _i150.AuthCubit(gh<_i207.AuthRepository>()),
    );
    gh.factory<_i672.LoginUseCase>(
      () => _i672.LoginUseCase(gh<_i207.AuthRepository>()),
    );
    gh.factory<_i125.RegisterUseCase>(
      () => _i125.RegisterUseCase(gh<_i207.AuthRepository>()),
    );
    gh.factory<_i1037.LoginCubit>(
      () => _i1037.LoginCubit(gh<_i672.LoginUseCase>()),
    );
    gh.factory<_i832.RegisterCubit>(
      () => _i832.RegisterCubit(gh<_i125.RegisterUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i576.RegisterModule {}
