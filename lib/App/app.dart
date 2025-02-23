import 'package:chatty_ai/Features/Account/Attach%20Views/Profile%20Info/Views/profile_info.dart';
import 'package:chatty_ai/Features/Account/View/account_view.dart';
import 'package:chatty_ai/Features/Authentication/Choose%20Auth/Views/choose_auth_view.dart';
import 'package:chatty_ai/Features/Authentication/Complete%20Profile/complete_profile_view.dart';
import 'package:chatty_ai/Features/Authentication/Forgot%20Password/Views/forgot_password_view.dart';
import 'package:chatty_ai/Features/Authentication/Log%20in/Views/login_view.dart';
import 'package:chatty_ai/Features/Authentication/Sign%20up/Views/sign_up_view.dart';
import 'package:chatty_ai/Features/Authentication/Splash/Views/splash_view.dart';
import 'package:chatty_ai/Features/Chat/Attach%20Views/Custom%20Chat%20View/Views/custom_chat_view.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart';
import 'package:chatty_ai/Features/History/Attach%20Views/Preview%20Chat/Views/preview_chat_view.dart';
import 'package:chatty_ai/Features/History/Attach%20Views/Search/Views/search_view.dart';
import 'package:chatty_ai/Features/History/Views/history_view.dart';
import 'package:chatty_ai/Services/API%20Service/api_service.dart';
import 'package:chatty_ai/Services/Firebase%20Authentication/auth_service.dart';
import 'package:chatty_ai/Services/Firebase%20Firestore/firestore_service.dart';
import 'package:chatty_ai/Services/Image%20Service/image_service.dart';
import 'package:chatty_ai/Services/Notification%20Bar%20Service/notification_bar_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    CustomRoute(
      page: SplashView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: ChooseAuthView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: LoginView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: ForgotPasswordView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: SignUpView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: CompleteProfileView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: ChatView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: CustomChatView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: HistoryView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: PreviousChatView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: SearchView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: AccountView,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
    CustomRoute(
      page: ProfileInfo,
      transitionsBuilder: TransitionsBuilders.moveInLeft,
    ),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: ImageService),
    LazySingleton(classType: NotificationBarService),
  ],
)
class App {}
