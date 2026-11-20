import 'package:go_router/go_router.dart';

import '../features/home/views/home_page.dart';

/// 应用统一路由配置。
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
