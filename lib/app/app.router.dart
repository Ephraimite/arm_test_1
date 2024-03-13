// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:arm_test_1/ui/views/bottom_navigation/bottom_navigation_view.dart'
    as _i5;
import 'package:arm_test_1/ui/views/chat/chat_view.dart' as _i6;
import 'package:arm_test_1/ui/views/home/home_view.dart' as _i2;
import 'package:arm_test_1/ui/views/login/login_view.dart' as _i4;
import 'package:arm_test_1/ui/views/profile/profile_view.dart' as _i7;
import 'package:arm_test_1/ui/views/signup/signup_view.dart' as _i8;
import 'package:arm_test_1/ui/views/startup/startup_view.dart' as _i3;
import 'package:arm_test_1/ui/views/success_screen/success_screen_view.dart'
    as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const bottomNavigationView = '/bottom-navigation-view';

  static const chatView = '/chat-view';

  static const profileView = '/profile-view';

  static const signupView = '/signup-view';

  static const successScreenView = '/success-screen-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    bottomNavigationView,
    chatView,
    profileView,
    signupView,
    successScreenView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.bottomNavigationView,
      page: _i5.BottomNavigationView,
    ),
    _i1.RouteDef(
      Routes.chatView,
      page: _i6.ChatView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i7.ProfileView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i8.SignupView,
    ),
    _i1.RouteDef(
      Routes.successScreenView,
      page: _i9.SuccessScreenView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.LoginView(key: args.key),
        settings: data,
      );
    },
    _i5.BottomNavigationView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.BottomNavigationView(),
        settings: data,
      );
    },
    _i6.ChatView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ChatView(),
        settings: data,
      );
    },
    _i7.ProfileView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfileView(),
        settings: data,
      );
    },
    _i8.SignupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>  _i8.SignupView(),
        settings: data,
      );
    },
    _i9.SuccessScreenView: (data) {
      final args = data.getArgs<SuccessScreenViewArguments>(
        orElse: () => const SuccessScreenViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.SuccessScreenView(
            key: args.key,
            onTapped: args.onTapped,
            shouldHaveAppBar: args.shouldHaveAppBar,
            title: args.title,
            subTittle: args.subTittle,
            redBtnText: args.redBtnText),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SuccessScreenViewArguments {
  const SuccessScreenViewArguments({
    this.key,
    this.onTapped,
    this.shouldHaveAppBar,
    this.title,
    this.subTittle,
    this.redBtnText,
  });

  final _i10.Key? key;

  final dynamic Function()? onTapped;

  final bool? shouldHaveAppBar;

  final String? title;

  final String? subTittle;

  final String? redBtnText;

  @override
  String toString() {
    return '{"key": "$key", "onTapped": "$onTapped", "shouldHaveAppBar": "$shouldHaveAppBar", "title": "$title", "subTittle": "$subTittle", "redBtnText": "$redBtnText"}';
  }

  @override
  bool operator ==(covariant SuccessScreenViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.onTapped == onTapped &&
        other.shouldHaveAppBar == shouldHaveAppBar &&
        other.title == title &&
        other.subTittle == subTittle &&
        other.redBtnText == redBtnText;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        onTapped.hashCode ^
        shouldHaveAppBar.hashCode ^
        title.hashCode ^
        subTittle.hashCode ^
        redBtnText.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessScreenView({
    _i10.Key? key,
    dynamic Function()? onTapped,
    bool? shouldHaveAppBar,
    String? title,
    String? subTittle,
    String? btnText,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.successScreenView,
        arguments: SuccessScreenViewArguments(
            key: key,
            onTapped: onTapped,
            shouldHaveAppBar: shouldHaveAppBar,
            title: title,
            subTittle: subTittle,
            redBtnText: btnText),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccessScreenView({
    _i10.Key? key,
    dynamic Function()? onTapped,
    bool? shouldHaveAppBar,
    String? title,
    String? subTittle,
    String? redBtnText,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.successScreenView,
        arguments: SuccessScreenViewArguments(
            key: key,
            onTapped: onTapped,
            shouldHaveAppBar: shouldHaveAppBar,
            title: title,
            subTittle: subTittle,
            redBtnText: redBtnText),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
