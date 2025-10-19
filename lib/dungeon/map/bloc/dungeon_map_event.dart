sealed class DungeonMapEvent {}

class MoveUp extends DungeonMapEvent {}

class MoveDown extends DungeonMapEvent {}

class MoveLeft extends DungeonMapEvent {}

class MoveRight extends DungeonMapEvent {}

class InitializeMap extends DungeonMapEvent {
  final int viewportWidth;
  final int viewportHeight;

  InitializeMap({required this.viewportWidth, required this.viewportHeight});
}
