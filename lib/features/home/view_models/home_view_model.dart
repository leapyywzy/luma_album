import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 首页状态。
class HomeState {
  const HomeState({this.selectedTab = 0});

  final int selectedTab;

  HomeState copyWith({int? selectedTab}) {
    return HomeState(selectedTab: selectedTab ?? this.selectedTab);
  }
}

/// 首页 ViewModel，负责维护底部导航状态。
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeState();

  void selectTab(int index) {
    state = state.copyWith(selectedTab: index);
  }
}

final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(HomeViewModel.new);
