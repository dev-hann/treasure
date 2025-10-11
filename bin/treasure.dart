import 'package:radartui/radartui.dart';

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
      routes: {'/': (context) => const MenuScreen()},
    );
  }
}

// 시작 메뉴 화면
class MenuScreen extends StatefulWidget {
  const MenuScreen();

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _menuItems = ['Start', 'Exit'];
  final titleList = [
    r' _____ ____  _____ ____  ____  _     ____  _____',
    r'/__ __Y  __\/  __//  _ \/ ___\/ \ /\/  __\/  __/',
    r'  / \ |  \/||  \  | / \||    \| | |||  \/||  \',
    r'  | | |    /|  /_ | |-||\___ || \_/||    /|  /_',
    r'  \_/ \_/\_\\____\\_/ \|\____/\____/\_/\_\\____\',
  ];

  void _onMenuSelected(int index, String item) {
    switch (index) {
      case 0:
        // "게임 시작" 선택 시 /game 경로로 이동
        Navigator.of(context).pushNamed('/game');
      case 1:
        shutdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Center(
                child: Column(
                  children: titleList.map((item) {
                    return Text(
                      item,
                      style: TextStyle(bold: true, color: Color.yellow),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 2),
            const Divider(),
            const SizedBox(height: 2),
            ListView(
              initialSelectedIndex: 0,
              items: _menuItems,
              onItemSelected: _onMenuSelected,
            ),
            const SizedBox(height: 2),
            const Text(
              'Use ↑/↓ to move, Enter to select',
              style: TextStyle(color: Color.brightBlack),
            ),
          ],
        ),
      ),
    );
  }
}
