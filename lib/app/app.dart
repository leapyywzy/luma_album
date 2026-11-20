import 'package:material_ui/material_ui.dart';

import '../core/theme/app_theme.dart';
import 'router.dart';

/// Luma Album 应用根组件。
class LumaAlbumApp extends StatelessWidget {
  const LumaAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Luma Album',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
