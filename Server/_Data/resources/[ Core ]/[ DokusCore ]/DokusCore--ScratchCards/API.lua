--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
--                      How to use the ScratchCards API                       --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--          Manually choose the change of winning and the amount to win       --
--------------------------------------------------------------------------------
TriggerEvent('DokusCore:ScratchCards:ShowCard:Value', Chance, Prize)
TriggerEvent('DokusCore:ScratchCards:ShowCard:Value', 100, 0.5)

-- Chance: This is the % percentage of winning.
--         60 means the player wins 60% of the time.

-- Prize: This is the amount the player will be getting when he or she
--        wins the lottery ticket. This is a fixed amount.
--        The reward amount MUST be a float! So its 0.5 / 1.2 and not 1 / 2
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------- Randomly choose the amount to win ----------------------
--------------------------------------------------------------------------------
-- How to
TriggerEvent('DokusCore:ScratchCards:ShowCard:Random')
-- This will take the values from the Config file within DokusCore.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
