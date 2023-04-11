---
<p align="center">
  <img width="600" height="200" src="https://user-images.githubusercontent.com/49053928/111937011-2e9b8080-8ac7-11eb-914a-a0d94380d611.gif"><br>
 <b>DokusCore Metabolism (v1.3.3) BETA</b> - Controls your players vitals.
</p>

---
# Dependencies
This plugin is depending on the [DokusCore](https://github.com/dokucore) Framework!
Make sure that DokusCore is started before this plugin!

---
# Installation
Simply extract the `DokusCore--Metabolism` into your `resources` folder, <br>
and start it via `ensure DokusCore--Metabolism`. Then go to the Modules.lua <br>
file of `DokusCore` itself and at `_Modules = { Metabolism }` set it to `true`.
If left to `false` the core will create its own character on ID 1 and not the
multi characters plugin

---
# Server Prebuild:
If you do not want to build your own server you don't have to, we already did all   <br>
the work for you! Download our [Prebuild](https://github.com/DokusCore/Server-Prebuild) server package and you will be setup  <br>
within minutes. You also do not have to worry about dependencies or if the plugins <br>
are started in the right order. Just insert your server artifacts, change the .cfg <br>
and config files to your liking and off you go! For more information on how to <br>
set up a DokusCore server, see the following video: [Installation video](https://www.youtube.com/watch?v=NlJFFRzWvDE) <br>

---
# Plugin Information
This plugin controls the vitals of the characters in game, the vitals it keeps <br>
track of is Health, Stamina, Thirst and Hunger. This plugin will take the <br>
environment in mind, meaning the temperature effects your hunger and thirst drain. <br>
If you are in a cold area, you use more food than water to keep your body warm. <br>
If you are in a hot area, your thirst will drain faster than your food. <br>
Furthermore, this plugin looks at what you are doing with your character, standing <br>
idle will drain the least, walking drains a little more, running will drain <br>
your vitals significantly more, and sprinting is an impact on your vitals. <br>
All settings for drainage, temperate, and movement parameters can be changed <br>
in the config.

---
# Features
- Movement speed of the character impacts the amount of vital drain
- Temperature of the environment impacts the amount of vital drain
- 4 movement modes: Idle, Walking, Running and Sprinting.
- Fully customizable in the config.
- Flashing vital icons on low thirst/hunger
- Flashing vital icons when taking more drain due or to hot or cold temperate

---
# Multi Language Support
  - English
  - Dutch
  - Bulgarian
  - German
  - Danish
  - Spanish
  - French
  - Greek
  - Italian
  - Polish
  - Portuguese
  - Russian

---
# Discord
On our [Discord](https://discord.io/dokuscore) you can find all Information about this<br>
project, feel free to join. Here you can also interact with other playing and testing<br>
the Core, as well as giving your suggestions and opinions.

---
# Searching for Developers
Do you enjoy developing, and would you like to take part into the DokusCore<br>
project ? Join our Discord and contact one of the Administrators.
