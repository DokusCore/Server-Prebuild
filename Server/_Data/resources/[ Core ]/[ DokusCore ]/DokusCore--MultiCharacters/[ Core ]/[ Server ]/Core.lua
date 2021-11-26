--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local function GetNumbers(String) return string.match(String,"%d+") end
--------------------------------------------------------------------------------
RSC('DokusCore:MultiChar:CreateNewCharacter', function(source, Data)
  local _source = source
  local ErrReason = nil
  local cName = Data.Firstname.." "..Data.Lastname
  local Nat, CharID = Data.Nationality, Data.CharID
  local Birth, Gender, Steam = Data.Birthdate, Data.Gender, Data.Steam

  -- Check if the first name is empty
  if (Data.Firstname == "") then ErrReason = 'FirstNameIsEmpty' end
  if (ErrReason ~= nil) then return { Error = true, ErrReason = ErrReason } end

  -- Check if the second name is empty
  if (Data.Lastname == "") then ErrReason = 'LastNameIsEmpty' end
  if (ErrReason ~= nil) then return { Error = true, ErrReason = ErrReason } end

  -- Check if the nationality is empty
  if (Nat == "") then ErrReason = "NatIsEmpty" end
  if (ErrReason ~= nil) then return { Error = true, ErrReason = ErrReason } end

  -- Check if teh Birthdate is set
  if (Birth == "") then ErrReason = 'BirthIsEmpty' end
  if (ErrReason ~= nil) then return { Error = true, ErrReason = ErrReason } end

  -- Check if the users name contains numbers.
  local nNum = GetNumbers(cName)
  if ((ErrReason == nil) and (nNum ~= nil)) then ErrReason = 'NameError' end
  if (ErrReason ~= nil) then return { Error = true, ErrReason = ErrReason } end

  -- Check if the Nationality has numbers in the name
  local nNat = GetNumbers(Nat)
  if ((ErrReason == nil) and (nNat ~= nil)) then ErrReason = 'NatError' end
  if (ErrReason ~= nil) then return { Error = true, ErrReason = ErrReason } end

  -- When everything is A-Okey continue create the character
  local Coords = _MultiCharacters.StartPositions[1].Coords
  local Encoded = json.encode(Coords)
  local Index = { Steam, CharID, _Moderation.User, cName, Gender, Nat, Birth, 0, 0, 'unemployed', 0, Encoded, '--', '--' }
  TCC(-1, 'DokusCore:Core:DBIns:Characters', { 'User', Index } )

  -- Attach an bank account to this character.
  local SW = _StartWealth
  local Money, BankMoney, Gold, BankGold = SW.Money, SW.BankMoney, SW.Gold, SW.BankGold
  TCC(-1, 'DokusCore:Core:DBIns:Banks', { 'User', { Steam, CharID, Money, Gold, BankMoney, BankGold } })

  return { Error = false, ErrReason = nil }
end)










































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
