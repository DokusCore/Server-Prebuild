---
<p align="center">
  <img width="600" height="200" src="https://user-images.githubusercontent.com/49053928/111937011-2e9b8080-8ac7-11eb-914a-a0d94380d611.gif"><br>
 <b>DokusCore Zones (v1.1.2)</b> - All your custom zones in one place, saves you CPU power!.
</p>

---
# Dependencies
This plugin is depending on the [DokusCore](https://github.com/dokucore) Framework!
Make sure that DokusCore is started before this plugin!

---
# Server Prebuild:
If you do not want to build your own server you don't have to, we already did all   <br>
the work for you! Download our [Prebuild](https://github.com/DokusCore/Server-Prebuild) server package and you will be setup  <br>
within minutes. You also do not have to worry about dependencies or if the plugins <br>
are started in the right order. Just insert your server artifacts, change the .cfg <br>
and config files to your liking and off you go! For more information on how to <br>
set up a DokusCore server, see the following video: [Installation video](https://www.youtube.com/watch?v=NlJFFRzWvDE) <br>

---
# Installation
Simply extract the `DokusCore--Zones` into your `resources` folder, <br>
and start it via `ensure DokusCore--Zones`. Then go to the Modules.lua <br>
file of `DokusCore` itself and at `_Modules = { Zones }` set it to `true`. <br>
If left to `false` the core will create its own character on ID 1 and not the <br>
multi characters plugin.

---
# Plugin Information
This plugin defines all your zones for jobs, quests, stores, NPCs and
all other custom zones you would like to create. This plugin has 2 loops
that checks all the zones and your distance to these zones. With this plugin
you do not have to create your distance checks in every single plugin, reducing
your server CPU usages significantly. This plugin runs at 0.00ms, and all plugins
connected this plugin drop between 0.02 / 0.07ms CPU usage due to not having
to use distance checks on each plugin. This is a required plugin for DokusCore
to run properly.

---
# Discord
On our [Discord](https://discord.io/dokuscore) you can find all Information about this<br>
project, feel free to join. Here you can also interact with other playing and testing<br>
the Core, as well as giving your suggestions and opinions.

---
# Searching for Developers
Do you enjoy developing, and would you like to take part into the DokusCore<br>
project ? Join our [Discord](https://discord.io/dokuscore) and contact one of the Administrators.

---
