BINDING_HEADER_KITTYONE = "KittyOne v0.2"
version = "v0.2 by Areesto"
local frame = CreateFrame("FRAME", "KittyFrame");
frame:RegisterEvent("PLAYER_ENTERING_WORLD");
local function KittyEventHandler(self, event, ...)
  KP(version.." loaded! /kitty for options - https://gitlab.com/areesto");
  if not KittySet then
    KP("No presets detected, setting to defaults")
    KittyConsume = false
    KittyInnervate = false
    KittySet = 1
  end
  KP("Consumables are " .. tostring(KittyConsume))
  KP("Innervate is " .. tostring(KittyInnervate))
end
frame:SetScript("OnEvent", KittyEventHandler);

SLASH_KITTYONE1 = "/kitty"
SLASH_KITTYONE2 = "/kittyone"
SLASH_KITTYONE3 = "/ko"
SlashCmdList["KITTYONE"] = function(msg)
  if msg == "" then
    KP(" "..version)
    KP("/kitty consumables <true> or <false> (currently: "..tostring(KittyConsume)..")")
    KP("/kitty innervate <true> or <false> (currently: "..tostring(KittyInnervate)..")")
  end
  local arg1, arg2, arg3 = strsplit(" ",msg)
  if arg1 == "innervate" and arg2 then
    if arg2 == "true" or arg2 == "t"then
      KittyInnervate = true
      KP("Innervate set to " .. tostring(KittyInnervate))
    end
    if arg2 == "false" or arg2 == "f" then
      KittyInnervate = false
      KP("Innervate set to " .. tostring(KittyInnervate))
    end
  end
  if arg1=="consumables" and arg2 then
    if arg2 == "true" or arg2 == "t"then
      KittyConsume = true
      KP("Consumables set to " .. tostring(KittyConsume))
    end
    if arg2 == "false" or arg2 == "f" then
      KittyConsume = false
      KP("Consumables set to " .. tostring(KittyConsume))
    end
  end
end

function Rotation()
  local a=GetActiveForm()
  local c=GetComboPoints()
  GetAttack()

  if a==0 then
    CastShapeshiftForm(3)
  else
    if UnitMana("player") < 15 and c>=4 then
      CastShapeshiftForm(a)
      UseAction(36)
    else
      if UnitMana("player") < 28 and c<4 then
        CastShapeshiftForm(a)
        UseAction(36)
      else
        local i=0 g=GetPlayerBuff
        while not (g(i) == -1) do
          if(strfind(GetPlayerBuffTexture(g(i)),"Spell_Shadow_ManaBurn")) then
            CastSpellByName("Shred")
          end
          i=i+1
        end
        if UnitMana("player") < 63 and c>=4 then
          CastSpellByName("Ferocious Bite")
        else
          CastSpellByName("Shred")
        end
      end
    end
  end
end

function RotationClaw()
  local a=GetActiveForm()
  local c=GetComboPoints()
  GetAttack()

  if a==0 then
    CastShapeshiftForm(3)
  else
    if UnitMana("player") < 15 and c>=4 then
      CastShapeshiftForm(a)
      UseAction(36)
    else
      if UnitMana("player") < 20 and c<4 then
        CastShapeshiftForm(a)
        UseAction(36)
      else
        local i=0 g=GetPlayerBuff
        while not (g(i) == -1) do
          if(strfind(GetPlayerBuffTexture(g(i)),"Spell_Shadow_ManaBurn")) then
            CastSpellByName("Claw")
          end
          i=i+1
        end
        if UnitMana("player") < 55 and c>=4 then
          CastSpellByName("Ferocious Bite")
        else
          CastSpellByName("Claw")
        end
      end
    end
  end
end

function GetAttack()
  currentForm = GetActiveForm()
  if currentForm>0 then
    if not IsCurrentAction(36) then
      UseAction(36)
    end
  else
    if currentForm ==0 and IsCurrentAction(36) then
      UseAction(36)
    end
  end
end

function GetTarget()
  if GetUnitName("target")==nil then
    TargetNearestEnemy()
  end
end

function GetMana()
  if not CasterMana then
    CasterMana=3000
  end
  if GetActiveForm()==0 then
    CasterMana=UnitMana("player")
  end
end

function UseInnervate()
  GetMana()
  if GetActiveForm()==0 and CasterMana<1200 then
    CastSpellByName("Innervate")
  end
end

function UseConsumable()
  if GetActiveForm()==0 and UnitMana("player")<1000 then
    if GetItemCooldown("Major Mana Potion")>0 then
      UseItemByName("Demonic Rune")
    else
      UseItemByName("Major Mana Potion")
    end
  end
end

function KittyOne()
  GetTarget()
  if KittyInnervate then
    UseInnervate()
  end
  if KittyConsume then
    UseConsumable()
  end
  Rotation()
end

function KittyOneClaw()
  GetTarget()
  if KittyInnervate then
    UseInnervate()
  end
  if KittyConsume then
    UseConsumable()
  end
  RotationClaw()
end

function KittyOneVael()
  GetTarget()
  GetAttack()
  if GetComboPoints()>=4 then
    CastSpellByName("Ferocious Bite")
  else
    CastSpellByName("Tiger's Fury")
    CastSpellByName("Shred")
  end
end

function KP(input_str)
  DEFAULT_CHAT_FRAME:AddMessage("KittyOne: "..input_str,244/255,209/255,66/255)
end
