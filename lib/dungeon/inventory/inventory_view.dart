import 'package:radartui/radartui.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({required this.viewport});
  final Size viewport;
  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.viewport.width,
      height: widget.viewport.height,
      child: Card(child: Text("Inventory")),
    );
  }
}
