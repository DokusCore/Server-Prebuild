--------------------------------------------------------------------------------
############################ [ DokusCore Updates ] #############################
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.3.0
--------------------------------------------------------------------------------
- Added JS function for rescue the lost horse.
- Added warning on taking horse if horse is already active.
- Added button to rescue your horse when lost to the UI.
- Added function to check what city you are in called Area().
- Restructured the files of the plugin for later expansion.
- Added the function to Flee the horse from and take distance from your location
- Added the function to call your horse if the horse if within the max radius.
- Added the function to let your horse follow if the horse is within the max radius.
- Restarting the stables will not despawn your horse anymore, this is now
  maintained by DataSync, and the plugin will resync after restart.

- Added Idle Horse Walking:
  When a horse is not mounted, it will start to walk every x seconds. Everytime
  the horse gets the action to move, it takes new coordinates at random from its
  current location. When a the horse is mounted or moved, the idle counter resets
  and the process starts over. NOTE: This feature is getting build upon, currently
  the horse does not detect when the horse is attacked to a stack pole.

- Changed (Fixed):
  The Stables will now take the location of the player from DataSync instead of
  the players current location via the zone plugin. This way you can still walk
  out of the stable while the NPC is fetching your horse. If you leave the stable
  when the NPC is fetching your horse, he will bring it to you outside. Then the
  NPC will walk back to its original location and despawn a few moment later.

- Changed (Fixed):
  The stable NPC new despawns when you leave the stable just like the horse decoys
  within the stable visible on entry. This makes sure that the NPC is always spawned
  in at the correct position, before teleporting could make the NPC invisible or
  floating above/below the ground. This also cleans up the game engine ( entity pool )
  so that more entities can be used without impacting the server performance.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
