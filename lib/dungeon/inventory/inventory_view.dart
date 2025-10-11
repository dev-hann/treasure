import 'package:radartui/radartui.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({required this.viewport});
  final Size viewport;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: viewport.width,
      height: viewport.height,
      child: Card(child: Text("Inventory")),
    );
  }
}
