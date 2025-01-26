import 'package:go_router/go_router.dart';
import 'package:stroll_test/ui/features/bonfire_home/presentation/view.dart';
import 'package:stroll_test/ui/features/bottom_navigation/presentation/view.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => DashboardShellView(child: child),
      branches: [
        StatefulShellBranch(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const BonfireHomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: '/1',
          routes: [
            GoRoute(
              path: '/1',
              builder: (context, state) => const BonfireHomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: '/2',
          routes: [
            GoRoute(
              path: '/2',
              builder: (context, state) => const BonfireHomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: '/3',
          routes: [
            GoRoute(
              path: '/3',
              builder: (context, state) => const BonfireHomeView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
