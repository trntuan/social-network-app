// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:social_network_app/bloc/auth/auth_bloc.dart' as _i3;
import 'package:social_network_app/bloc/home_page/home_page_bloc.dart' as _i5;
import 'package:social_network_app/bloc/post_detail/post_detail_bloc.dart'
    as _i6;
import 'package:social_network_app/bloc/post_new_letter/post_new_letter_bloc.dart'
    as _i7;
import 'package:social_network_app/bloc/splash/splash_bloc.dart' as _i8;
import 'package:social_network_app/services/navigator/config_navigator.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthBloc>(() => _i3.AuthBloc());
    gh.lazySingleton<_i4.ConfigNavigator>(() => const _i4.ConfigNavigator());
    gh.factory<_i5.HomePageBloc>(() => _i5.HomePageBloc());
    gh.factory<_i6.PostDetailBloc>(() => _i6.PostDetailBloc());
    gh.factory<_i7.PostNewLetterBloc>(() => _i7.PostNewLetterBloc());
    gh.factory<_i8.SplashBloc>(() => _i8.SplashBloc());
    return this;
  }
}
