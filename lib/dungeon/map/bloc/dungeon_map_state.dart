import 'package:treasure/model/dungeon_map.dart';

class DungeonMapState {
  final int heroX;
  final int heroY;
  final DungeonMap dungeonMap;

  DungeonMapState({
    this.heroX = 5,
    this.heroY = 5,
    this.dungeonMap = const DungeonMap(),
  });

  DungeonMapState copyWith({int? heroX, int? heroY, DungeonMap? dungeonMap}) {
    return DungeonMapState(
      heroX: heroX ?? this.heroX,
      heroY: heroY ?? this.heroY,
      dungeonMap: dungeonMap ?? this.dungeonMap,
    );
  }

  // 맵의 특정 좌표에 있는 셀 반환
  String getCellAt(int x, int y) {
    // return dungeonMap.tileList[y][x];
    // 영웅 위치면 @ 반환
    if (x == heroX && y == heroY) {
      return '@';
    }

    // 맵 범위 내면 맵 데이터 반환
    if (y >= 0 && y < dungeonMap.height && x >= 0 && x < dungeonMap.width) {
      return dungeonMap.tileList[y][x];
    }

    return ' ';
  }
}
