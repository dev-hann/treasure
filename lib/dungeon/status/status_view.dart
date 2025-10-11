import 'package:radartui/radartui.dart';
import 'package:treasure/model/hero/hero_status.dart';

class StatusView extends StatelessWidget {
  StatusView({required this.viewport, required this.heroStatus});
  final Size viewport;
  final HeroStatus heroStatus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: viewport.width,
      height: viewport.height,
      child: Card(
        child: Column(
          children: [
            Text("HP: ${heroStatus.hp}/${heroStatus.maxHp}"),
            Text("MP: ${heroStatus.mp}/${heroStatus.maxMp}"),
            Text("Strength: ${heroStatus.strength}"),
            Text("Dexterity: ${heroStatus.dexterity}"),
            Text("Intelligence: ${heroStatus.intelligence}"),
            Text("Level: ${heroStatus.level}"),
            Text(
              "Experience: ${heroStatus.experience}/${heroStatus.nextExperience}",
            ),
            Text("Gold: ${heroStatus.gold}"),
          ],
        ),
      ),
    );
  }
}
