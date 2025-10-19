import 'package:radartui/radartui.dart';
import 'package:treasure/dungeon/inventory/inventory_view.dart';
import 'package:treasure/dungeon/map/dungeon_map_view.dart';
import 'package:treasure/dungeon/status/status_view.dart';
import 'package:treasure/model/hero/hero.dart';
import 'package:treasure/model/hero/hero_status.dart';

class DungeonView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DungeonViewState();
}

class _DungeonViewState extends State<DungeonView> {
  final hero = Hero(
    name: '',
    heroStatus: HeroStatus(
      hp: 10,
      maxHp: 10,
      mp: 10,
      maxMp: 10,
      strength: 10,
      dexterity: 10,
      intelligence: 10,
      level: 1,
      experience: 0,
      nextExperience: 100,
      gold: 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DungeonMapView(
          viewport: Size(100, 40),
        ),
        Column(
          children: [
            StatusView(viewport: Size(50, 20), heroStatus: hero.heroStatus),
            InventoryView(viewport: Size(50, 20)),
          ],
        ),
      ],
    );
  }
}
