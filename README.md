# KittyOne v0.2 by Areesto
*Addon for World of Warcraft v1.12*


KittyOne is an addon to simplify the feral druid DPS rotation to pressing one button!

### 1. Installation
 - Copy the contents of KittyOne to your World of Warcraft addons folder @ Interface\AddOns.
 - Ensure it is enabled at the character login screen.
 - Bind KittyOne in the keybindings menu.
 - type /ko, /kitty or /kittyone for options

### 2. Rotation Priority
1. Powershift when < 28 energy and < 4 combo points
2. Powershift when < 15 energy and >= 4 combo points
3. Cast **Shred** if clearcasting proc
4. Cast **Ferocious Bite** if < 63 energy and >= 4 combo points
5. Cast **Shred** otherwise

### 3. Options
- **/kitty** to check current settings
- **/kitty innervate** if set to true will auto cast innervate when under **\<innervatethreshold>** mana
- **/kitty innervatethreshold \<value>** will set value for innervate auto cast
- **/kitty consumables** if set to true will auto use raid consumables when under **\<consumethreshold>** mana
- **/kitty innervatethreshold \<value>** will set value for raid consumables auto use
- **/kitty attackid**

### 4. Bindings
| Binding Name | Description |
| ------ | ------ |
| Kitty | One button rotation for shred DPS |
| KittyClaw | One button rotation modified for claw DPS|
| KittyVael | One button rotation for Vaelastrasz the Corrupt in Blackwing Lair|

### 5. To do
 - T.lua library for extended slash command parsing
 - Manual Crowd Pummeler in rotation (spam proof)
 - Manual Crowd equip and destroy after use
 - **Faerie Fire** application
 - Innervate queueing when /w'd
 - Bear form rotation and innervate queueing\
 - GUI menu
