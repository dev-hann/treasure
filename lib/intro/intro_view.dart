import 'package:radartui/radartui.dart';

class IntroView extends StatefulWidget {
  const IntroView();

  @override
  State<IntroView> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<IntroView> {
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
        Navigator.of(context).pushReplacementNamed('/dungeon');
        break;
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
            SizedBox(height: 2),
            const Divider(),
            SizedBox(height: 2),
            ListView(
              initialSelectedIndex: 0,
              items: _menuItems,
              onItemSelected: _onMenuSelected,
            ),
            SizedBox(height: 2),
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
