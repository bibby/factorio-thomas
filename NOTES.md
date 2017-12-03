# Really Useful Engines

Notes on making [factorio-thomas](https://github.com/bibby/factorio-thomas), a mod for [Factorio](https://factorio.com/) that adds several talking locomotives.

My son starting walking not long ago, and he can say a few words (mostly "this" and "that"), but he really likes Thomas & Friends, and will give an enthusiastic *"toot, toot"* whenever the little blue engine is seen.

Having just logged 200 hours in Factorio, I immediately got the itch to add these engines to the game, and get them huffing and puffing around my base. I set about reading the docs in [the wiki](https://wiki.factorio.com/Modding), unpacking a few mods to inspect, and dusting cobwebs off the little bit of Lua that I knew.

# Sprites

I knew that the hardest for me would be the making the sprites. As the graphics were make-or-break for the project, I decided to tackle that first.

This [tutorial by SkaceKachna (Aug 2014)](https://forums.factorio.com/viewtopic.php?f=34&t=5336) proved the most helpful. Having never touched [Blender](https://www.blender.org/) before, it guided me well enough until I could get a hang of it myself. The newest blender supposedly has a first-class shadow catcher, but the plane method described in the post works well. The only thing I had to do differently was set the light source to cast Ray Shadows, otherwise no shadows were seen.

The [Spritify plugin](http://wiki.blender.org/index.php/Extensions:2.6/Py/Scripts/Render/Spritify) linked in the article worked well to generate the sheet.

From observing other mods with locomotives, I opted for 256 frames at 256x256 pixel dimension and allowed Spritify to generate one sheet. SkaceKachna's modified plugin would split spritesheets into multiple files, but I noticed that the frames were in a random order. Imagemagick can easily split an image, no problem.

    convert -crop 2048x2048 sprites.png really_useful_engine_0.0.1/graphics/${train}_%d.png

Following the [Yuoki Railway](https://mods.factorio.com/mods/YuokiTani/yi_railway) mod, I positioned the first frame facing _player-north_, and turning to the right until all the way round. My lighting will have to be redone, but I made sure there was a Sun for casting shadow. I also added a Hemi to light the south-west side of the trains, so their faces, as they were coming out quite dark.

# Audio

Sound clips were all grabbed using `youtube-dl`. There's an alias that I keep that extracts audio as mp3 that I use often, disposing of the video portion.

    youtube-dl -x --audio-format mp3 --audio-quality 0 "${url}"

My goto audio editor, Audacity, has been having a hard time lately, so I needed a quick replacement. I installed [mhwaveedit](https://launchpad.net/ubuntu/+source/mhwaveedit), and it's been very good; I'll be keeping that one. Listening to content and saving snippets became something to do while doing other things. Even as I write this, I'm listening and saving content for the second release. I save as mp3, and batch convert the results to ogg using `ffmpeg` and normalize the volume.

    # mp3 to ogg
    for m in $(ls *.mp3); do ffmpeg -i $m ${m%%mp3}ogg; done
    # normalize to 5db
    for m in *.ogg; do ffmpeg -i $m -af "volume=5dB" $m; done

# Scripting

Help for the mod setup came mostly from [this article](http://kovarex.com/wiki/index.php?title=Modding_Tutorial) (adjusting for version 0.15) and from digging through other mods. One thing that helped was to use functions to reduce much of the duplication in the entity data. Adding the locomotive behaviors was largely a matter of copying from the base train.

To add a little spice to the project, I wanted the trains to play a sound file every now and then. Making an `on_tick` event handler in `control.lua`, I added logic that runs basically this:

- keeps a timer from the last played sound
- if 30 seconds of ticks (approx) have passed,
- scan for my trains around the player
- filter to those with sounds (not all do yet)
- pick a random train, then pick one of its sounds.
- finally, play it at the train's location

I saw multiple forum posts about playing sounds, but what worked for me was [this procedure](https://github.com/ChurchOrganist/DelticHonk/blob/master/control.lua#L17-L19) from the [DelticHonk](https://mods.factorio.com/mods/ChurchOrganist/DelticHonk) mod, which also does train horns. The premise is to add sound files as explosion entities, and then spawn the entity at the desired location so that distance and direction come into play.

I'm pretty happy with how it's turned out, and feels great to have scratched an itch that also made the kids smile.