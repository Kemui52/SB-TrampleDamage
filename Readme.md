# Trample Damage and Other Starbound Mods

A mod that lets you grow into a giant and destroy planets by walking over everything; a dream come true! Other mods I made to supplement this behavior are included, but are not necessary.

Online functionality not tested and prolly never will be. Might be fine, though. It uses scripts, so I at least know it's server-side.

Feel free to browse the code and make your own stuff with it if you like.

## Installation

Just drop your desired mods into your mods folder inside the Starbound installation.

Some mods **require** another mod. Please read the [Mod Descriptions] below so you know what you need.

### Uninstallation

Starbound is notoriously bad at handling uninstalled mods. You will need to trash any custom items before uninstalling a mod and hope no modded effects are running. I will likely need to create an uninstallation mod in the future to handle certain things.

For now, make a backup of your storage folder before adding or removing any mods.

# Mod Descriptions

## Trample Damage

Requires [Size of Life](https://steamcommunity.com/sharedfiles/filedetails/?id=3218820111) (and [StarExtensions](https://github.com/StarExtensions/StarExtensions) helps visuals)

Highly Recommends [Stardust Core Lite](https://steamcommunity.com/sharedfiles/filedetails/?id=2512589532) so you can edit your Techs on the fly! If you don't want admin mode on all the time, also add [Quickbar Unlocker](https://steamcommunity.com/sharedfiles/filedetails/?id=1089421344).

Adds a bunch of techs to let you control your size and what kind of damage you want to deal. Not all options are available as of now, but the basics are here. Enable ``/admin`` mode and use the chat command ``/updatetrample`` to add all the techs to your character. There is currently no normal way to add them.

Current features: Immunity to all damage (not yet done hazardous planets), kill creatures by walking into them, destroy blocks by walking into them, does NOT destroy blocks you're standing on, increased jump strength and infinite jumps, slower ground acceleration, removed jumping particles since they render wrong when giant.

It is also recommended to have some way to toggle walking, but there is no mod for that. I'm still looking into that...maybe an AutoHotKey script?

## Handheld GPR Station

Requires [Ground-Penetrating Radar Station](https://steamcommunity.com/sharedfiles/filedetails/?id=1140386986)   

Adds a super portable version of the GPR Console that doesn't require anything to be placed in the current world. This was shockingly difficult to create. Really! I hate you, ``world.loadRegion()``... Anyway, this mod basically gives you a map of any world.

(This mod will currently spam your log with info since it has not been fully tested yet. It should be fully operational, but I'm still trying to track how certain things work)

Use ``/spawnitem handheldgprconsole`` to obtain it. I guess I can make a recipe for this one eventually since the template already exists...

## Edible Gnomes

A little mod that lets you craft an edible Handful of Gnomes from a Ball of Gnomes. Tiny screams included!

## No Ship Pet Spawns

Prevents the SAIL from trying to spawn ship pets for new characters. You can use [No Pets](https://steamcommunity.com/sharedfiles/filedetails/?id=733729084) to remove any pre-existing pets a character may have.

# Appreciation

Many thanks to [Bagger 288](https://steamcommunity.com/sharedfiles/filedetails/?id=1391734304) and [Screw Attack](https://steamcommunity.com/sharedfiles/filedetails/?id=750726369) for showing what the game is capable of!
