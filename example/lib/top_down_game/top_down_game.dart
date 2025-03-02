import 'package:bonfire/bonfire.dart';
import 'package:example/top_down_game/robot_enemy.dart';
import 'package:example/top_down_game/soldier_player.dart';
import 'package:flutter/material.dart';

import 'armchair_decoration.dart';

///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 27/01/22
class TopDownGame extends StatelessWidget {
  const TopDownGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'tiled/top_down/map.json',
        objectsBuilder: {
          'enemy': (prop) => ZombieEnemy(prop.position),
          'armchair': (prop) => ArmchairDecoration(prop.position),
        },
      ),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(),
        directional: JoystickDirectional(),
        actions: [
          JoystickAction(
            actionId: 1,
            margin: EdgeInsets.all(50),
          ),
        ],
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
      ),
      player: SoldierPlayer(Vector2(64 * 17, 64 * 4)),
      lightingColorGame: Colors.black.withOpacity(0.7),
    );
  }
}
