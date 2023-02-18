--------------------------------------------------------------------------------
############################ [ DokusCore Updates ] #############################
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.3.0
--------------------------------------------------------------------------------
- Fixed: Inventory closes automatically when a duplicate glitch is found. Now
  also a log is created into the database alerting the admins of the users action.
- Added: A couple more items to the inventory to support the new plugins and
  converted plugins in DokusCore.
- Changed: Increased the gold nuggets item size in the inventory
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.2.3
--------------------------------------------------------------------------------
- Added: Added items for the converted fishing plugin
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.2.2
--------------------------------------------------------------------------------
- Added: Romanian language added and made by @RABBIT in discord!
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.2.1
--------------------------------------------------------------------------------
- Fixed: Last update we changed the box key object name, but we did not update
  the code within the inventory prompting an error on opening drop boxes. We've
  fixed the code and you can open the boxes again.
- Added: Preventing property keys from being dropped on the ground, this we have
  to do for now as it is not transporting the keys meta data over to the drop box.
- Added: Message that will display when user tries to duplicate items using the
  DevTools. If an item is increased by manipulating the UI, when the user wants
  to drop the item, the inventory sends a warning and restores to original.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.2.0
--------------------------------------------------------------------------------
- Added: Option to open the inventory via key bind. ( Config )
- Added: Option to open the inventory via chat command ( Config )
- Added: New item Key to the inventory and database
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.1.4
--------------------------------------------------------------------------------
- Fixed: Renamed the `Items` folder to `items` as this was preventing the
  item inventory pictures to load.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.1.3
--------------------------------------------------------------------------------
- Added: Item Axe that will specifically work for the lumberjack plugin. This
  way we do not need to use the weapon hatchet as this will get equipped to your
  weapon wheel what renders the item useless for the job.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.1.2
--------------------------------------------------------------------------------
- Added: Items for the LumberJack plugin. Items added are Log, Lumber, Treesap,
  Tree bark, and sticks.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v2.1.1
--------------------------------------------------------------------------------
- Changed: The UI `Items` folder is now renamed to `items`. The capital letter
  of the folder was preventing the images to be loaded in the inventory and
  those plugins that use the same images like the stores.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
