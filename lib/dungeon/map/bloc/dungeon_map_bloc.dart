import 'package:bloc/bloc.dart';
import 'package:treasure/dungeon/map/bloc/dungeon_map_event.dart';
import 'package:treasure/dungeon/map/bloc/dungeon_map_state.dart';
import 'package:treasure/model/dungeon_map.dart';

class DungeonMapBloc extends Bloc<DungeonMapEvent, DungeonMapState> {
  DungeonMapBloc() : super(DungeonMapState()) {
    on<InitializeMap>(_onInitializeMap);
    on<MoveUp>(_onMoveUp);
    on<MoveDown>(_onMoveDown);
    on<MoveLeft>(_onMoveLeft);
    on<MoveRight>(_onMoveRight);
  }

  DungeonMap generateDefaultMap() {
    final tiles = List.generate(10, (y) => List.generate(10, (x) => '.'));
    return DungeonMap(tileList: tiles);
  }

  void _onInitializeMap(InitializeMap event, Emitter<DungeonMapState> emit) {
    emit(DungeonMapState(dungeonMap: generateDefaultMap()));
  }

  void _onMoveUp(MoveUp event, Emitter<DungeonMapState> emit) {
    final newY = state.heroY - 1;
    // 맵 경계 체크
    if (newY >= 0) {
      emit(state.copyWith(heroY: newY));
    }
  }

  void _onMoveDown(MoveDown event, Emitter<DungeonMapState> emit) {
    final newY = state.heroY + 1;
    // 맵 경계 체크
    if (newY < state.dungeonMap.height) {
      emit(state.copyWith(heroY: newY));
    }
  }

  void _onMoveLeft(MoveLeft event, Emitter<DungeonMapState> emit) {
    final newX = state.heroX - 1;
    // 맵 경계 체크
    if (newX >= 0) {
      emit(state.copyWith(heroX: newX));
    }
  }

  void _onMoveRight(MoveRight event, Emitter<DungeonMapState> emit) {
    final newX = state.heroX + 1;
    // 맵 경계 체크
    if (newX < state.dungeonMap.width) {
      emit(state.copyWith(heroX: newX));
    }
  }
}
