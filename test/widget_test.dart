import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:luma_album/app/app.dart';

void main() {
  testWidgets('应用首页可以正常显示', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: LumaAlbumApp()),
    );

    expect(find.text('Luma Album'), findsOneWidget);
    expect(find.text('整理每一份美好回忆'), findsOneWidget);
  });
}
