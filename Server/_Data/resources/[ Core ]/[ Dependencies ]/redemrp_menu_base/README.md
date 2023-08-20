## [Latest Documentation](https://sinatra.gitbook.io/redemrp/ "Latest Documentation")
![](https://img.shields.io/github/stars/RedEM-RP/redemrp_menu_base) ![](https://img.shields.io/github/forks/RedEM-RP/redemrp_menu_base) ![](https://img.shields.io/github/tag/RedEM-RP/redemrp_menu_base) ![](https://img.shields.io/github/release/RedEM-RP/redemrp_menu_base) ![](https://img.shields.io/github/issues/RedEM-RP/redemrp_menu_base) ![](https://img.shields.io/discord/648268213859254309)

[![](https://i.ibb.co/FnNr3Z3/redemrpn.png)](https://discord.gg/nbmTmZR "")

# redemrp_menu_base qadr version
A Menu Base for RedEM:RP This script allows you create menu like RDR2.

qadr version has changed CSS, image compatibility, and add nui focus control.

**This resource has been adopted for use by the RedEMRP Framework "reboot" of 2022.**

## 1. Installation
- Be sure you have RedEM:RP Installed
if not -> [RedEM:RP](https://github.com/RedEM-RP/redem_roleplay)
- Clone redemrp_menu_base into [redemrp] folder
- add ```ensure redemrp_menu_base``` after ```ensure redem_roleplay```

image : 

![alt text](https://media.discordapp.net/attachments/861745255254982676/913365211120029736/unknown.png)

descriptionimages :

![alt text](https://media.discordapp.net/attachments/861745255254982676/913366028749250580/unknown.png)

## 2.Usage
Add this on top your client side file
```
MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)
```
Example:
```
MenuData.CloseAll()
local elements = {
    {
     label = "Test Option",
     value = 'test' ,
     desc = "Press if you want print text",
     image="items/weapon_melee_hammer.png",
     descriptionimages = {
      {
       src = "nui://redemrp_menu_base/html/items/cloth.png",
       text = "Kumaş",
       count = "x1"
      },

      {
       src = "nui://redemrp_menu_base/html/items/woodenplanks.png",
       count = "x5",
       text = "Ahşap"
      }
     },
    },
    {label = "Hop Test", value = 0  ,desc = "Look its so fast" , type = "slider" , min =0 , max =100, hop= 5},
}

local nuifocus = false
MenuData.Open('default', GetCurrentResourceName(), 'test_menu',
{
    title   = 'TestMenu',
    subtext = 'There is a subtext',
    align   = 'top-left',
    elements = elements,
},
function(data, menu)
    if(data.current.value == 'test') then
        print("test")
    end
end,
function(data, menu)
    menu.close()
end,nuifocus)
```

## 3.Credits
- https://github.com/ktos93
- https://github.com/ESX-Org
- https://github.com/abdulkadiraktas
- https://github.com/youngsinatra99