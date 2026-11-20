import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../view_models/home_view_model.dart';

/// 应用首页。
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Luma Album',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: '搜索',
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _buildContent(state.selectedTab),
      bottomNavigationBar: NavigationBar(
        selectedIndex: state.selectedTab,
        onDestinationSelected: (index) {
          ref.read(homeViewModelProvider.notifier).selectTab(index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.photo_library_outlined),
            selectedIcon: Icon(Icons.photo_library_rounded),
            label: '照片',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_album_outlined),
            selectedIcon: Icon(Icons.photo_album_rounded),
            label: '相簿',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
            label: '探索',
          ),
        ],
      ),
    );
  }

  Widget _buildContent(int selectedTab) {
    final String title = switch (selectedTab) {
      0 => '整理每一份美好回忆',
      1 => '你的相簿空间',
      _ => '发现照片的新方式',
    };

    final String description = switch (selectedTab) {
      0 => 'Luma Album 将帮助你浏览、整理和管理设备中的照片。',
      1 => '创建相簿、归类照片，让珍贵回忆井然有序。',
      _ => '更多照片管理能力正在准备中。',
    };

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B8DEF).withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.photo_library_rounded,
                  size: 52,
                  color: Color(0xFF5B8DEF),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Color(0xFF747B88),
                ),
              ),
              const SizedBox(height: 24),
              const Chip(
                avatar: Icon(Icons.auto_awesome, size: 16),
                label: Text('Luma Album · 初始版本'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
