# UITweener
Welcome to the UI Tweener github page! This module is **Client Side** and will not work correctly on the server. Only require this module using a *localscript*.

# Introduction
This is a module that allows you to open menus in your game with smooth animations without requiring you to code it all yourself. This works with multiple UI at a time and is used in Super Power Evolution Simulator (2M visits) scripted by me.

# How to get
Roblox Marketplace: https://create.roblox.com/marketplace/asset/15954835037

Github Releases: https://github.com/nevflorals/UITweener/releases

# Setup
To set this module up you will need to put this module where the client can access it. *Replicated Storage is recommended*

# Configuration
All of these configuration options are in the attributes of the module.

**ButtonStyle**: *[string](https://create.roblox.com/docs/en-us/luau/strings)* - The EasingStyle you want to button to play when hovering and clicking. Extends [Enum.EasingStyle](https://create.roblox.com/docs/reference/engine/enums/EasingStyle) Default: "Exponential"

**FrameStyle**: *[string](https://create.roblox.com/docs/en-us/luau/strings)* - The EasingStyle you want to frame to play when opening. Extends [Enum.EasingStyle](https://create.roblox.com/docs/reference/engine/enums/EasingStyle). Default: "Linear"

**SoundsFolder**: *[string](https://create.roblox.com/docs/en-us/luau/strings)* - The name of your sounds folder that should be located anywhere in *ReplicatedStorage*. Default: "Sounds"

**Time**: *[number](https://create.roblox.com/docs/en-us/luau/numbers)* - How long the animation will play for. Default: 0.2
