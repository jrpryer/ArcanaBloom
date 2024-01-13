# ArcanaBloom

# DESIGN DOCUMENT

By DaemonsRuin, for the [Pirate Software](https://www.twitch.tv/piratesoftware) [Game Jam](https://itch.io/jam/pirate) 14

* * *


**Intro**
- Game Summary
- Influences
- Player Experience
- Platforms
- Dev Software
- Genre
- Target Audience

**Concept**
- Gameplay
- Theme Interpretation: "Overload"
- Mechanics

**Art**
- Design

**Audio**
- Music
- Sound FX

**Game Experience**
- UI
- Controls

**Development Timeline**

* * *


# Introduction

### Game Summary

ArcanaBloom is an isometric exploration game about cultivating magical plants and unlocking secrets from the past.

  

### Influences

#### Potion Craft: Alchemist Simulator

Potion Craft sets the player in a simple story with direct goals and a rewarding progression loop to fill the alchemical demands of a thriving apothecary business.

  

### Player Experience

Exploring the ancient grounds of a long abandoned magical garden, the player must find and plant mystical seeds, completing simple minigames to cultivate the growth of each plant and collect the arcane essence each shrub, flower, and herb produces. Using this essence, the player can overcharge the locks on the massive garden doors, opening new areas to explore, collect new seed colors, and unravel the mystery of the garden. To goal is to discover the long-lost alchemical formulas the essences unlock and learn the garden's greatest secret.

### Platforms

This game will be built for Windows, Mac, and Linux

  

### Dev Software

- Godot 4
- Photoshop and Aseprite for visuals

  
### Genre

Isometric, Idle Clicker, Casual

  

### Target Audience

The simple mechanics and immersive visuals lend this game to be marketed towards casual game players who enjoy short levels and layering progression systems, as well as players who enjoy a story-rich game with alchemical experimentation mechanics.

  

# Concept

### Gameplay

The player controls a single character, #PLAYER\_NAME, exploring single-screen greenhouse-style rooms and interacting with seeds, pots, doors, and an alchemy table. Planted seeds need to be **cultivated** by accomplishing short, repeatable tasks that reward colored **essence**, determined by the plant type. By collecting enough essence, the player can charge up the **locks** of the doors to open them and progress to new rooms. The alchemy table allows players to slot in essences and **experiment** with different color combinations in an attempt to discover the lost alchemical formulas.

  

### Theme Interpretation (Overload)

Once the player has collected enough essence from their nurtured plants, the locks of the doors can be 'overloaded' with magical energy, forcing them open and allowing the progression to new rooms.

  

The wildcard theme of 'Unspoken Stories' will be used to show what happened to the garden. Through the discovery of the Lost Formulas and by observing the state of the Garden around you, the player will be able to see the story of the past unfold, as well as heed the warnings and choose how to proceed. 

There are three possible end conditions for the game, as per the wildcard 'The Good Ending', allowing the player to either:

- a) Heed the warnings of the past and leave after opening the third door
- b) Proceed to the final room and discover all the formulas
- c) Use Destruction alchemy on their Book of Lost Formulas and/or the plants so no one can ever use these secrets again

  

### Mechanics

> Room Exploration
>
> Walking around the room will prompt the player to perform a _Search_ interaction. Each room has at least one seed, allowing the player access to either another cultivation method or another essence color for their alchemical experiments. 
>
> Each room has a specific layout, telling a visual story.

![](https://t8575695.p.clickup-attachments.com/t8575695/d8b16caa-947a-4448-8dbf-464509669165/image.png)

  

>Essence Collection
>
>Each plant needs to be nurtured by performing its cultivation task. Once the task is complete, the plant drops its corresponding essence color to be collected. The task can be spammed an unlimited number of times.

![](https://t8575695.p.clickup-attachments.com/t8575695/8632826f-d7b4-4ddf-8e25-94a2e6c3f577/image.png)

  

>Unlocking Doors
>
>Every room has at least one door, barred with a magic lock. Interacting with the door will display a meter showing how much essence is needed to overcharge the lock. Some of the doors require a mix of essence colors to be used. Once enough of the specified essence is dumped into the door, the lock overloads and the door disintegrates. Walking through the door to the next room resets your collected essence count and moves the alchemy table and your grown plants into the next room automatically.

![](https://t8575695.p.clickup-attachments.com/t8575695/77c74740-3b1b-4f8f-9221-fe54100bf5ac/image.png)

  

>Discovering Formulas
>
>Interacting with the alchemy table allows the player to choose between one of seven preset alchemical patterns with their choice of essence color. Properly guessing the essence color and number rewards the player with a filled formula page and clear artwork of what the formula is/was used for.

![](https://t8575695.p.clickup-attachments.com/t8575695/bc93cd73-735d-48d3-86e4-5dadd4fd5a2c/image.png)![](https://t8575695.p.clickup-attachments.com/t8575695/ac391072-d860-4a8c-b592-8dd140b08a5c/image.png)

  

# Art

### Design

A soft-box lighting style will be used to convey a cozy feeling of taking care of plants and walking amongst nature. The use of vibrant effects and particles will illicit that fantasy feeling of unknown magic. A slightly more dilapidated feel will be used near the end of the game. Environment and level design will be the primary method of telling the game's story.

  

# Audio

### Music

Soft music, with orchestral tones will be used to fill the downtime and lack of text prompts. The use of dramatic swells and ambient undertones will be used as a secondary method to tell the game's story.

  

### Sound FX

Sound effects are light, simple, and thumpy. A generous use of foley and realistic atmosphere will help immerse the player in the cozy feelings of the game's botanical feel.

  

# Game Experience

### UI

Most of the game will be seen through panels and windows to simulate the actions of taking care of plants, overloading locks, and experimenting with formulas. A dark wood and leather theme will be used, with high-fidelity pixel art layouts and blocky, readable text wherever needed.


### Controls

#### Keyboard

> WASD / Arrow Keys, Spacebar, Mouse Pointer

#### Gamepad

> Dpad, (X) or (A), and Joystick


# Development Timeline
https://app.clickup.com/8575695/v/dc/85ppf-720
https://app.clickup.com/8575695/v/b/4-90090549586-2