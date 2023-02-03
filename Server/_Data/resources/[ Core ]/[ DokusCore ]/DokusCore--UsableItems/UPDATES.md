--------------------------------------------------------------------------------
############################ [ DokusCore Updates ] #############################
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.5.1
--------------------------------------------------------------------------------
- Changed: Small Database query update
- Added: Romanian language added and made by @RABBIT in discord!
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.5.0
--------------------------------------------------------------------------------
- Reworked Logics: We've once again reworked the logics on how the framework is
  handling items and objects when used from out of the inventory.
- Added: Logics to place a campfire and interact with it.
- Added: Multiple interactions for the campfire. You can add 3 types of fuel that
  have their own burning time, items you can add to the fuel are
  Logs, Lumber, and Bark.
- Added: Logic for object expire time. The campfire comes with a default 5 minute
  burn time, once the burn time is finished, the object will be deleted. You can
  extend the burn time with adding more fuel.
- Added: Placeable objects are persistent and stay on the map as long they did
  not expire. If the server is restarted, the objects will respawn back on the map.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.4.0
--------------------------------------------------------------------------------
- Changed: Deleting the item is now also separate, you are now fully able to
  use all values separate.
- Added: Warning message for items that are not yet usable.
- Reworked: The way animations are done, it takes now more animation options
  then before.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.3.0
--------------------------------------------------------------------------------
- Reworked the whole plugin.
  - Items can now use all values at the same time. You can trigger the metabolism
    as well as the animation, and trigger the event at the item on the same use.
    The switches to enable item modules are located in the database.
  - The database entries for items for the values `Metabolism` `CanPlace` and
    `UseEvent` are changed from varchar to tinyint. true now equals to 1 and
    false now equals to 0.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
