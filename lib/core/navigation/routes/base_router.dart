import 'package:go_router/go_router.dart';
import 'package:stroll_test/ui/features/bonfire_home/presentation/view.dart';

GoRouter router =
    GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
  //Splash
  GoRoute(
    path: '/',
    builder: (context, state) => const BonfireHomeView(),
  ),
]);
