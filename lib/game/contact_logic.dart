import '/assetlib/asset_constants.dart';
import '/providers/app_provider.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'vehicle/parts/vehicle_body.dart';
import '../providers/game_view_provider.dart';
import 'vehicle/player_components.dart';
import 'terrain/terrain_chunk.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import '../collectible/collectible.dart';
import '../collectible/fuel.dart';
import '../collectible/trash.dart';
import '../collectible/coin.dart';

class ContactLogic extends ContactListener {
  GameViewProvider gameViewProvider;
  final BuildContext context;

  ContactLogic({required this.gameViewProvider, required this.context});

  @override
  void beginContact(Contact contact) {
    Object? objectA = contact.bodyA.userData;
    Object? objectB = contact.bodyB.userData;

    if (objectA is VechicleBody && objectB is Collectible) {
      collectibleCallBack(objectB);
    } else if (objectB is VechicleBody && objectA is Collectible) {
      collectibleCallBack(objectA);
    } else if (objectA is TerrainChunk && objectB is HeadComponent ||
        objectB is TerrainChunk && objectA is HeadComponent) {
      gameViewProvider.gameEnd();
    }
  }

  void collectibleCallBack(Collectible collectible) {
    if (collectible is Fuel) {
      checkAudioEnabled()
          ? FlameAudio.play(AssetConstants.fuelCollectedAudio)
          : null;

      gameViewProvider.refuel();
      gameViewProvider.setNextFuelLocation(null);
    } else if (collectible is Trash) {
      checkAudioEnabled()
          ? FlameAudio.play(AssetConstants.trashCollectedAudio)
          : null;
      gameViewProvider.incrementTrashCollected();
    } else if (collectible is Coin) {
      checkAudioEnabled()
          ? FlameAudio.play(AssetConstants.coinCollectedAudio)
          : null;
      gameViewProvider.incrementCoinCollected();
    }

    collectible.destroy();
  }

  bool checkAudioEnabled() {
    return Provider.of<AppProvider>(context, listen: false).isAudioEnabled;
  }
}
