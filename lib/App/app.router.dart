// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatty_ai/Features/Account/Attach%20Views/Profile%20Info/Views/profile_info.dart'
    as _i15;
import 'package:chatty_ai/Features/Account/Attach%20Views/Security/Views/security_view.dart'
    as _i14;
import 'package:chatty_ai/Features/Account/View/account_view.dart' as _i13;
import 'package:chatty_ai/Features/AI%20Assistants/Views/ai_assistants_view.dart'
    as _i10;
import 'package:chatty_ai/Features/Authentication/Choose%20Auth/Views/choose_auth_view.dart'
    as _i3;
import 'package:chatty_ai/Features/Authentication/Complete%20Profile/complete_profile_view.dart'
    as _i7;
import 'package:chatty_ai/Features/Authentication/Forgot%20Password/Views/forgot_password_view.dart'
    as _i5;
import 'package:chatty_ai/Features/Authentication/Log%20in/Views/login_view.dart'
    as _i4;
import 'package:chatty_ai/Features/Authentication/Sign%20up/Views/sign_up_view.dart'
    as _i6;
import 'package:chatty_ai/Features/Authentication/Splash/Views/splash_view.dart'
    as _i2;
import 'package:chatty_ai/Features/Chat/Attach%20Views/Custom%20Chat%20View/Views/custom_chat_view.dart'
    as _i9;
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart' as _i8;
import 'package:chatty_ai/Features/History/Attach%20Views/Search/Views/search_view.dart'
    as _i12;
import 'package:chatty_ai/Features/History/Views/history_view.dart' as _i11;
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;

class Routes {
  static const splashView = '/splash-view';

  static const chooseAuthView = '/choose-auth-view';

  static const loginView = '/login-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const signUpView = '/sign-up-view';

  static const completeProfileView = '/complete-profile-view';

  static const chatView = '/chat-view';

  static const customChatView = '/custom-chat-view';

  static const aIAssistantsView = '/a-iassistants-view';

  static const historyView = '/history-view';

  static const searchView = '/search-view';

  static const accountView = '/account-view';

  static const securityView = '/security-view';

  static const profileInfo = '/profile-info';

  static const all = <String>{
    splashView,
    chooseAuthView,
    loginView,
    forgotPasswordView,
    signUpView,
    completeProfileView,
    chatView,
    customChatView,
    aIAssistantsView,
    historyView,
    searchView,
    accountView,
    securityView,
    profileInfo,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.chooseAuthView,
      page: _i3.ChooseAuthView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i5.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i6.SignUpView,
    ),
    _i1.RouteDef(
      Routes.completeProfileView,
      page: _i7.CompleteProfileView,
    ),
    _i1.RouteDef(
      Routes.chatView,
      page: _i8.ChatView,
    ),
    _i1.RouteDef(
      Routes.customChatView,
      page: _i9.CustomChatView,
    ),
    _i1.RouteDef(
      Routes.aIAssistantsView,
      page: _i10.AIAssistantsView,
    ),
    _i1.RouteDef(
      Routes.historyView,
      page: _i11.HistoryView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i12.SearchView,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i13.AccountView,
    ),
    _i1.RouteDef(
      Routes.securityView,
      page: _i14.SecurityView,
    ),
    _i1.RouteDef(
      Routes.profileInfo,
      page: _i15.ProfileInfo,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.ChooseAuthView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.ChooseAuthView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.ForgotPasswordView: (data) {
      final args = data.getArgs<ForgotPasswordViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.ForgotPasswordView(title: args.title, key: args.key),
        settings: data,
      );
    },
    _i6.SignUpView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SignUpView(),
        settings: data,
      );
    },
    _i7.CompleteProfileView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.CompleteProfileView(),
        settings: data,
      );
    },
    _i8.ChatView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ChatView(),
        settings: data,
      );
    },
    _i9.CustomChatView: (data) {
      final args = data.getArgs<CustomChatViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.CustomChatView(
            key: args.key,
            title: args.title,
            capabilitiesTitle: args.capabilitiesTitle,
            capabilites: args.capabilites,
            showLogo: args.showLogo),
        settings: data,
      );
    },
    _i10.AIAssistantsView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.AIAssistantsView(),
        settings: data,
      );
    },
    _i11.HistoryView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.HistoryView(),
        settings: data,
      );
    },
    _i12.SearchView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SearchView(),
        settings: data,
      );
    },
    _i13.AccountView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.AccountView(),
        settings: data,
      );
    },
    _i14.SecurityView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.SecurityView(),
        settings: data,
      );
    },
    _i15.ProfileInfo: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ProfileInfo(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ForgotPasswordViewArguments {
  const ForgotPasswordViewArguments({
    required this.title,
    this.key,
  });

  final String title;

  final _i16.Key? key;

  @override
  String toString() {
    return '{"title": "$title", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ForgotPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.title == title && other.key == key;
  }

  @override
  int get hashCode {
    return title.hashCode ^ key.hashCode;
  }
}

class CustomChatViewArguments {
  const CustomChatViewArguments({
    this.key,
    required this.title,
    required this.capabilitiesTitle,
    required this.capabilites,
    required this.showLogo,
  });

  final _i16.Key? key;

  final String title;

  final String capabilitiesTitle;

  final List<Map<String, String>> capabilites;

  final bool showLogo;

  @override
  String toString() {
    return '{"key": "$key", "title": "$title", "capabilitiesTitle": "$capabilitiesTitle", "capabilites": "$capabilites", "showLogo": "$showLogo"}';
  }

  @override
  bool operator ==(covariant CustomChatViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.title == title &&
        other.capabilitiesTitle == capabilitiesTitle &&
        other.capabilites == capabilites &&
        other.showLogo == showLogo;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        title.hashCode ^
        capabilitiesTitle.hashCode ^
        capabilites.hashCode ^
        showLogo.hashCode;
  }
}

extension NavigatorStateExtension on _i17.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChooseAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chooseAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView({
    required String title,
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(title: title, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCompleteProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.completeProfileView,
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

  Future<dynamic> navigateToCustomChatView({
    _i16.Key? key,
    required String title,
    required String capabilitiesTitle,
    required List<Map<String, String>> capabilites,
    required bool showLogo,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.customChatView,
        arguments: CustomChatViewArguments(
            key: key,
            title: title,
            capabilitiesTitle: capabilitiesTitle,
            capabilites: capabilites,
            showLogo: showLogo),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAIAssistantsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aIAssistantsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSecurityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.securityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileInfo([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileInfo,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChooseAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chooseAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView({
    required String title,
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(title: title, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCompleteProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.completeProfileView,
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

  Future<dynamic> replaceWithCustomChatView({
    _i16.Key? key,
    required String title,
    required String capabilitiesTitle,
    required List<Map<String, String>> capabilites,
    required bool showLogo,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.customChatView,
        arguments: CustomChatViewArguments(
            key: key,
            title: title,
            capabilitiesTitle: capabilitiesTitle,
            capabilites: capabilites,
            showLogo: showLogo),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAIAssistantsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aIAssistantsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSecurityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.securityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileInfo([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileInfo,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
