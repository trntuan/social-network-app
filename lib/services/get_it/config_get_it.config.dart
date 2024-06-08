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
import 'package:social_network_app/bloc/chat_message/chat_message_bloc.dart'
    as _i4;
import 'package:social_network_app/bloc/friend/friend_bloc.dart' as _i6;
import 'package:social_network_app/bloc/home_page/home_page_bloc.dart' as _i7;
import 'package:social_network_app/bloc/messages/messages_bloc.dart' as _i8;
import 'package:social_network_app/bloc/my_page/my_page_bloc.dart' as _i9;
import 'package:social_network_app/bloc/post_detail/post_detail_bloc.dart'
    as _i10;
import 'package:social_network_app/bloc/post_new_letter/post_new_letter_bloc.dart'
    as _i11;
import 'package:social_network_app/bloc/splash/splash_bloc.dart' as _i12;
import 'package:social_network_app/bloc/team_list/team_list_bloc.dart' as _i13;
import 'package:social_network_app/bloc/user_detail/user_detail_bloc.dart'
    as _i14;
import 'package:social_network_app/services/navigator/config_navigator.dart'
    as _i5;

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
    gh.factory<_i4.ChatMessageBloc>(() => _i4.ChatMessageBloc());
    gh.lazySingleton<_i5.ConfigNavigator>(() => const _i5.ConfigNavigator());
    gh.factory<_i6.FriendBloc>(() => _i6.FriendBloc());
    gh.factory<_i7.HomePageBloc>(() => _i7.HomePageBloc());
    gh.factory<_i8.MessagesBloc>(() => _i8.MessagesBloc());
    gh.factory<_i9.MyPageBloc>(() => _i9.MyPageBloc());
    gh.factory<_i10.PostDetailBloc>(() => _i10.PostDetailBloc());
    gh.factory<_i11.PostNewLetterBloc>(() => _i11.PostNewLetterBloc());
    gh.factory<_i12.SplashBloc>(() => _i12.SplashBloc());
    gh.factory<_i13.TeamListBloc>(() => _i13.TeamListBloc());
    gh.factory<_i14.UserDetailBloc>(() => _i14.UserDetailBloc());
    return this;
  }
}
