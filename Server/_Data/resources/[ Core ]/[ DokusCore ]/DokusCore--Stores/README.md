---
<p align="center">
  <img width="600" height="200" src="https://user-images.githubusercontent.com/49053928/111937011-2e9b8080-8ac7-11eb-914a-a0d94380d611.gif"><br>
 <b>DokusCore Stores (v2.1.0)</b> - The place to be for all your goods!.
</p>

---
# Dependencies
This plugin is depending on the [DokusCore](https://github.com/dokucore) Framework!
Make sure that DokusCore is started before this plugin!

# Server Prebuild:
If you do not want to build your own server you don't have to, we already did all   <br>
the work for you! Download our [Prebuild](https://github.com/DokusCore/Server-Prebuild) server package and you will be setup  <br>
within minutes. You also do not have to worry about dependencies or if the plugins <br>
are started in the right order. Just insert your server artifacts, change the .cfg <br>
and config files to your liking and off you go! For more information on how to <br>
set up a DokusCore server, see the following video: [Installation video](https://www.youtube.com/watch?v=NlJFFRzWvDE) <br>

---
# Installation
Simply extract the `DokusCore--Stores` into your `resources` folder, and <br>
start it via `ensure DokusCore--Stores`.

---
# Plugin Information
With this plugin you can buy, sell and manage your server general store items. <br>
The UI is simple and easy to control. All items are listed within a grid and you <br>
are able to scroll through the list. This UI also supports keyboard controls! <br>

# How to insert new store items?
Simply go to the database and select the stores table. Then make a new entry in <br>
this table and the only information you need to add in is the item name, the stock <br>
limit, the buy price, and the sell price. Whenever you start the plugin, or when you <br>
use the module sync in the admin menu, the database will automatically fill in all <br>
the rest of the data. After this is synced, you can now open all data tabs, and <br>
edit them to your liking.

# NOTE:
The inventory items icons are tied to the inventory plugin! For the icons to <br>
display correctly, you need to add them also to the item list of the inventory! <br>

---
# Discord
On our [Discord](https://discord.io/DokusCore) you can find all Information about this <br>
project, feel free to join. Here you can also interact with other playing and testing<br>
the Core, as well as giving your suggestions and opinions.

---
# Searching for Developers
Do you enjoy developing, and would you like to take part into the DokusCore<br>
project ? Join our [Discord](https://discord.io/DokusCore) and contact one of the Administrators.

---
# Future ideas for this plugin
Right now, you can only buy and sell items from the store. In the future, we want to
intergrade much more into this plugin. We want to intergrade a stock so that the store
can run out of items to sell, then players need to sell items to the store, or use
the stock market transport job to stock up the stores. Also, we would like to implement
taxation for the economy auto inflate / deflate system. This will increase the default
price if many purchases are done in this store, but will deflate the price when there
are few. Furthermore, we want to add price fluctuations depending on the current items
in stock. Example: If Valentine has 20/100 cigar boxes in stock, you will receive $0.25
per item, you deliver, but if the stock is 80/100 you will only receive $0.12. This way
players will roam over the map to search for the best prices, and stores with the most
need for items will get filled first.
