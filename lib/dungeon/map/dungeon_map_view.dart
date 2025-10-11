import 'package:radartui/radartui.dart';
import 'package:treasure/model/dungeon_map.dart';

class DungeonMapView extends StatelessWidget {
  const DungeonMapView({required this.viewport, required this.dungeonMap});
  final Size viewport;
  final DungeonMap dungeonMap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: viewport.width,
      height: viewport.height,
      child: Card(
        child: Center(
          child: Column(
            children: dungeonMap.tileList
                .map((row) => Text(row.join('')))
                .toList(),
          ),
        ),
      ),
    );
  }
}
