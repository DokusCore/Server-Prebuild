---
<p align="center">
  <img width="600" height="200" src="https://user-images.githubusercontent.com/49053928/111937011-2e9b8080-8ac7-11eb-914a-a0d94380d611.gif"><br>
 <b>DokusCore Trains (v0.0.2) [BETA]</b> - Trains for public transport!.
</p>

---
# IN DEVELOPMENT
This plugin is in development and is only recommended to use to test!

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
Simply extract the `DokusCore--Trains` into your `resources` folder, and <br>
start it via `ensure DokusCore--Trains`.

---
# Plugin Information
This adds a train to your server that will loop around on the map. The train<br>
will stop at every station along the way, and a round trip takes 35 minutes.<br>
The train's route is made in such a way it feels realistic. The train speeds up<br>
slowly and depending on the inclination, it can go faster or slower in speeding and<br>
breaking.

# Important To Note
The train is linked to a client as a host. If this host leaves the server, the train<br>
will continue to drive but wound follow its route anymore, and it will not stop<br>
at any stations. The host to this script will be the first to join, we recommend<br>
using a dummy account or the host of the server that logs in first. Later this will<br>
be reworked so that the trains sync up with all clients so that they continue to drive.<br>

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
# Future ideas for this plugin
This plugin is just a blueprint of what is to come, at a later stage I will be<br>
re-writing this plugin and extend it massively. On a later update, you will be able<br>
to have multiple trains on the track, and to prevent a pool size error, only 1<br>
train will be attached to 1 player's client. So the more players on the server, the<br>
more trains on the track with a maximum limit.<br><br>

You will be able to drive the train. You will not be able to spawn in the train<br>
if you have the job like other scripts, this is simply too unrealistic. How it works<br>
is, you will assign yourself as on duty at one of the train stations that hold an<br>
NPC behind the ticket counter. The first train that arrives at the station<br>
will stop and the NPC will step out of the train, from this moment on you take<br>
over his shift and yours starts. The same go's for getting off duty, you will park<br>
the train at one of the stations and then sign yourself off duty. The NPC will spawn<br>
back in, walk to the trains and take over again.<br><br>

You will be able to drive the train completely by yourself, or choose to let the train<br>
drive itself via the route that is pre-programmed. This gives the train driver the<br>
change to also walk through the train, and see if the travelers have a valid ticket.<br><br>

Another thing will be the coal itself. You will need to shove the coal into the oven<br>
of the train, or the train will grind to a halt. On the train route, there are<br>
multiple coal fill stations, here you will be able to fill the train if the<br>
tank is filled as these need to be manually filled by a player.<br><br>

So a lot of nice things to come for the future of this plugin. For the rest<br>
IT IS NOT RECOMMENDED TO RESTART THIS PLUGIN!!  Not that it is not possible but<br>
this will despawn the train and everyone in it will get stranded. After the plugin<br>
starts again, it will simply start at Rhodes again and start its journey.<br>
