--------------------------------------------------------------------------------
############################ [ DokusCore Updates ] #############################
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
