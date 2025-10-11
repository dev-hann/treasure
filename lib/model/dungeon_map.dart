class DungeonMap {
  DungeonMap({required this.tileList});
  final List<List<String>> tileList;

  int get width => tileList.first.length;
  int get height => tileList.length;
}
