import 'package:chatty_ai/Features/AI%20Assistants/Views/ai_assistants_view.dart';
import 'package:chatty_ai/Features/Account/Attach%20Views/Profile%20Info/Views/profile_info.dart';
import 'package:chatty_ai/Features/Account/Attach%20Views/Security/Views/security_view.dart';
import 'package:chatty_ai/Features/Account/View/account_view.dart';
import 'package:chatty_ai/Features/Authentication/Choose%20Auth/Views/choose_auth_view.dart';
import 'package:chatty_ai/Features/Authentication/Complete%20Profile/complete_profile_view.dart';
import 'package:chatty_ai/Features/Authentication/Forgot%20Password/Views/forgot_password_view.dart';
import 'package:chatty_ai/Features/Authentication/Log%20in/Views/login_view.dart';
import 'package:chatty_ai/Features/Authentication/Sign%20up/Views/sign_up_view.dart';
import 'package:chatty_ai/Features/Authentication/Splash/Views/splash_view.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart';
import 'package:chatty_ai/Features/History/Attach%20Views/Search/Views/search_view.dart';
import 'package:chatty_ai/Features/History/Views/history_view.dart';
import 'package:chatty_ai/Widgets/custom_chat_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView),
    MaterialRoute(page: ChooseAuthView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: CompleteProfileView),
    MaterialRoute(page: ChatView),
    MaterialRoute(page: CustomChatView),
    MaterialRoute(page: AIAssistantsView),
    MaterialRoute(page: HistoryView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: SecurityView),
    MaterialRoute(page: ProfileInfo),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
