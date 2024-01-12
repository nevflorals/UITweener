# UITweener
Welcome to the UI Tweener github page! This module is **Client Side** and will not work correctly on the server. Only require this module using a *localscript*.

# Introduction
This is a module that allows you to open menus in your game with smooth animations without requiring you to code it all yourself. This works with multiple UI at a time and is used in Super Power Evolution Simulator (2M visits) scripted by me.

# How to get
Roblox Marketplace: https://create.roblox.com/marketplace/asset/15955387950

Github Releases: https://github.com/nevflorals/UITweener/releases

# Setup
To set this module up you will need to put this module where the client can access it. *Replicated Storage is recommended*

# Configuration
All of these configuration options are in the attributes of the module.

**ButtonStyle**: *[string](https://create.roblox.com/docs/en-us/luau/strings)* - The EasingStyle you want to button to play when hovering and clicking. Extends [Enum.EasingStyle](https://create.roblox.com/docs/reference/engine/enums/EasingStyle) Default: "Exponential"

**FrameStyle**: *[string](https://create.roblox.com/docs/en-us/luau/strings)* - The EasingStyle you want to frame to play when opening. Extends [Enum.EasingStyle](https://create.roblox.com/docs/reference/engine/enums/EasingStyle). Default: "Linear"

**SoundsFolder**: *[string](https://create.roblox.com/docs/en-us/luau/strings)* - The name of your sounds folder that should be located anywhere in *ReplicatedStorage*. Default: "Sounds"

**Time**: *[number](https://create.roblox.com/docs/en-us/luau/numbers)* - How long the animation will play for. Default: 0.2

# Adding a button
Method **AddButton** arguments:

**button**: *[GuiButton](https://create.roblox.com/docs/reference/engine/classes/GuiButton)* *Required* - The path to your button.

**frame** : *[Frame](https://create.roblox.com/docs/reference/engine/classes/Frame)* *Optional* - The path to the frame you want to open.

**soundName**: *[string](https://create.roblox.com/docs/en-us/luau/strings)* *Optional* - The sound thats in the sounds folder you want to play.

**turn**: *[boolean](https://create.roblox.com/docs/luau/booleans)* *Optional* - If you want your button to turn when hovering over it. Default: False

**Example Local Script**:

```lua
-- Example created by @Nevflorals
-- Local script inside the button
local UITweener = require(game.ReplicatedStorage.UITweener) -- Change this path if the module is in a different place

local button = script.Parent -- Path to your button
local frame = script.Parent.Parent.Frame -- Path to your frame

UITweener.AddButton(button, frame, "click", true)
```
