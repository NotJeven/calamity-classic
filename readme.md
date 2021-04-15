## Calamity: Classic

### About

A collection of the original Calamity by Moesh map and mechanics, updated to run on [Minecraft current version].

Calamity is a 2 lane attack/defend Minecraft PvP map.

Originally forked from [github.com/moesh/calamity](https://github.com/moesh/calamity) 

Everything is a Runescape joke so maybe this will be called "Old School Calamity".

### Building

The project is a Minecraft world save folder.

The dev branch is updated with every change and is generally in a state that is not playable. This branch contains tags referencing specific commits of playtest versions and are configured to be functional. It is recommended that, if wanting to play, you checkout one of the tags.

Using Git:

	In your Minecraft saves folder/server folder:
	
    1. Clone the repository ```git clone https://github.com/notjeven/adversity.git```
    2. Go into the repository ```cd adversity```
    3. Use Git to checkout a tag ```git checkout <latest tag>```

Without Git:

    1. Navigate to tags at https://github.com/NotJeven/eris/tags.
    2. Find your prefered version.
    3. Download the ```.zip``` or ```.tar``` archive of the latest release.
    4. Extract your downloaded archive into your Minecraft saves folder/server folder.

If running a server, find ```level-name=``` in the file ```server.properties``` and change the level name to the extracted folder name.
