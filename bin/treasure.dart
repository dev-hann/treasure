import 'package:radartui/radartui.dart';
import 'package:treasure/dungeon/dungeon_view.dart';
import 'package:treasure/intro/intro_view.dart';

void main() {
  runApp(const TreasureApp());
}

// 앱의 최상위 위젯, 네비게이터를 설정합니다.
class TreasureApp extends StatelessWidget {
  const TreasureApp();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroView(),
        "/dungeon": (context) => DungeonView(),
      },
    );
  }
}
