import 'package:radartui/radartui.dart';
import 'package:treasure/dungeon/map/bloc/dungeon_map_bloc.dart';
import 'package:treasure/dungeon/map/bloc/dungeon_map_event.dart';
import 'package:treasure/dungeon/map/bloc/dungeon_map_state.dart';

class DungeonMapView extends StatefulWidget {
  const DungeonMapView({required this.viewport});
  final Size viewport;

  @override
  State<DungeonMapView> createState() => _DungeonMapViewState();
}

class _DungeonMapViewState extends State<DungeonMapView> {
  late final DungeonMapBloc _bloc;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _bloc = DungeonMapBloc();
    _focusNode = FocusNode();
    _bloc.add(
      InitializeMap(
        viewportWidth: widget.viewport.width.toInt(),
        viewportHeight: widget.viewport.height.toInt(),
      ),
    );

    // Focus 요청을 다음 프레임에서 수행
    Future.microtask(() {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _bloc.close();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
    switch (event.code) {
      case KeyCode.arrowUp:
        _bloc.add(MoveUp());
        break;
      case KeyCode.arrowDown:
        _bloc.add(MoveDown());
        break;
      case KeyCode.arrowLeft:
        _bloc.add(MoveLeft());
        break;
      case KeyCode.arrowRight:
        _bloc.add(MoveRight());
        break;
      case KeyCode.char:
        // WASD 키 처리
        switch (event.char?.toLowerCase()) {
          case 'w':
            _bloc.add(MoveUp());
            break;
          case 's':
            _bloc.add(MoveDown());
            break;
          case 'a':
            _bloc.add(MoveLeft());
            break;
          case 'd':
            _bloc.add(MoveRight());
            break;
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (event) {
        _handleKeyEvent(event);
      },
      child: StreamBuilder<DungeonMapState>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          return SizedBox(
            width: widget.viewport.width,
            height: widget.viewport.height,
            child: Card(
              child: Center(
                child: () {
                  if (!snapshot.hasData) {
                    return LoadingIndicator();
                  }
                  final state = snapshot.data!;
                  final map = state.dungeonMap;

                  return Column(
                    children: List.generate(
                      map.height,
                      (y) => Text(
                        List.generate(
                          map.width,
                          (x) => state.getCellAt(x, y),
                        ).join(''),
                      ),
                    ),
                  );
                }(),
              ),
            ),
          );
        },
      ),
    );
  }
}
