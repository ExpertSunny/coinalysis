import 'package:coinalysis/view/aboutpage.dart';
import 'package:coinalysis/view/explorer.dart';
import 'package:coinalysis/view/homepage.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
        builder: (context, state, child) => HomePage(
              title: 'Coinalysis',
              child: child,
            ),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => AboutPage(),
          ),
          GoRoute(
            path: '/explorer',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: Explorer()),
          ),
          // GoRoute(
          //   path: '/blog',
          //   pageBuilder: (context, state) =>
          //       const NoTransitionPage(child: BlogPage()),
          // ),
          // GoRoute(
          //   path: '/games',
          //   pageBuilder: (context, state) =>
          //       const NoTransitionPage(child: GamesPage()),
          // ),
          // GoRoute(
          //   path: '/login',
          //   pageBuilder: (context, state) =>
          //       const NoTransitionPage(child: LoginPage()),
          // ),
          // GoRoute(
          //   path: '/dashboard',
          //   // name: 'dashboard',
          //   // pageBuilder: (context, state) =>
          //   //     const NoTransitionPage(child: Dashboard()),
          //   builder: (context, state) {
          //     final token = state.extra! as String;
          //     return Dashboard(token: token);
          //   },
          // )
        ])
  ],
);
