# KittyOne v0.2 by Areesto
*Addon for World of Warcraft v1.12*


KittyOne is an addon to simplify the feral druid DPS rotation to pressing one button!

### 1. Installation
 - Copy the contents of KittyOne to your World of Warcraft addons folder @ Interface\AddOns.
 - Ensure it is enabled at the character login screen.
 - Bind KittyOne in the keybindings menu.
 - type /ko, /kitty or /kittyone for options
 - make sure to set /kitty attackid and drag the attack spell onto your action bars somewhere! This is very important for toggling off autoattack in caster form (long swing timer cooldown).

### 2. Rotation Priority
1. Powershift when < 28 energy and < 4 combo points.
2. Powershift when < 15 energy and >= 4 combo points.
3. Cast **Shred** if clearcasting proc.
4. Cast **Ferocious Bite** if < 63 energy and >= 4 combo points.
5. Cast **Shred** otherwise.

### 3. Consumables Priority
1. Use major mana potion under threshold
2. Use dark rune under threshold

### 3. Options
- **/kitty** to check current settings.
- **/kitty i** if set to true will auto cast innervate when under **\<innervatethreshold>** mana.
- **/kitty it \<value>** will set value for innervate auto cast.
- **/kitty c** if set to true will auto use raid consumables when under **\<consumethreshold>** mana.
- **/kitty ct \<value>** will set value for raid consumables auto use.
- **/kitty attackid \<value>** - set it to the actionbar ID value of your attack spell (default is 1).

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
 - Innervate queueing when /w'd
 - Bear form rotation and innervate queueing\
 - GUI menu
 - Separate addon for consumable management