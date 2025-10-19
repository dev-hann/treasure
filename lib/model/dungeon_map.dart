class DungeonMap {
  const DungeonMap({this.tileList = const []});
  final List<List<String>> tileList;

  int get width => tileList.first.length;
  int get height => tileList.length;
}
