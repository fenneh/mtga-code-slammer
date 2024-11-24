#SingleInstance Force

; Define the array of codes - alphabetically sorted with duplicates removed
strings := []
strings.Insert("2005")
strings.Insert("AlquistProft")
strings.Insert("AlwaysFinishTheJob")
strings.Insert("ArtClub")
strings.Insert("BingoIVMythicChamp")
strings.Insert("BORROWEDTIME")
strings.Insert("BrokerShield")
strings.Insert("BroughtBack")
strings.Insert("CabarettiAlliance")
strings.Insert("CIRCUITMENDER")
strings.Insert("COURIERBAT")
strings.Insert("CrimeIsAnArtForm")
strings.Insert("Crumbelina")
strings.Insert("DebateDuelists")
strings.Insert("DelightfulMeadow")
strings.Insert("EnlightenMe")
strings.Insert("ExperimentalOverload")
strings.Insert("FiveBonusLevels")
strings.Insert("FNMATHOME")
strings.Insert("FoilFungus")
strings.Insert("FoodCourt")
strings.Insert("FunIsntFree")
strings.Insert("GAMEKNIGHTS")
strings.Insert("GOLDENCOMMUNITY")
strings.Insert("HappySwamp")
strings.Insert("impeccable")
strings.Insert("InformationIsPower")
strings.Insert("InnerDemon")
strings.Insert("IslandWilderness")
strings.Insert("izoni")
strings.Insert("LevelUp")
strings.Insert("MaestroCasualty")
strings.Insert("MathWhizzes")
strings.Insert("MELLON")
strings.Insert("Mellon")
strings.Insert("MoveMountains")
strings.Insert("murdered")
strings.Insert("MythicMagic")
strings.Insert("oba")
strings.Insert("ObscuraConnive")
strings.Insert("OneBillion")
strings.Insert("OverTheMoon")
strings.Insert("PARCELMYR")
strings.Insert("ParallaxPotion")
strings.Insert("PlayAlchemyNewCapenna")
strings.Insert("PlayAllegiance")
strings.Insert("PlayBRO")
strings.Insert("PlayDMU")
strings.Insert("PlayDMUAlchemy")
strings.Insert("PlayDND")
strings.Insert("PlayHBG")
strings.Insert("PlayIkoria")
strings.Insert("PlayKaldheim")
strings.Insert("PlayM21")
strings.Insert("PlayMID")
strings.Insert("PlayNEO")
strings.Insert("PlayNEOAlchemy")
strings.Insert("PLAYVOW")
strings.Insert("PlaySNC")
strings.Insert("PlayStrixhaven")
strings.Insert("PlayTheros")
strings.Insert("PlayVOW")
strings.Insert("PlayZendikar")
strings.Insert("ReadTheFinePrint")
strings.Insert("RepairAndRecharge")
strings.Insert("RestorativeBurst")
strings.Insert("RiveteerBlitz")
strings.Insert("RockJocks")
strings.Insert("SCALEUP")
strings.Insert("ShieldsUp")
strings.Insert("ShinyGoblinPirate")
strings.Insert("SparkleDruid")
strings.Insert("StarterStyles")
strings.Insert("SuperScry")
strings.Insert("SwampPunks")
strings.Insert("ThatsWild")
strings.Insert("THREADS")
strings.Insert("TisAScratch")
strings.Insert("TreeFriend")
strings.Insert("TryKaladesh")
strings.Insert("WrittenInStone")
strings.Insert("ZendikarLands")

; Global variable to track if script should stop
global shouldStop := false

; Hotkey to stop the script
^Escape::
    shouldStop := true
    return

; Function to check if MTGA is active
IsMTGAActive() {
    return WinActive("ahk_exe MTGA.exe")
}

; Main hotkey to start the process
^j::  ; Ctrl+J to trigger the process
    shouldStop := false  ; Reset the stop flag when starting
    
    ; Display start message with total number of codes
    totalCodes := strings.MaxIndex()
    MsgBox, 0, MTGA Code Slammer, Starting code entry process for %totalCodes% codes.`n`nPress Ctrl + Escape at any time to stop the script.`n`nPress Enter to begin...

    ; Loop through each string in the array
    Loop, % strings.MaxIndex()
    {
        ; Check if stop was requested or MTGA lost focus
        if (shouldStop || !IsMTGAActive())
        {
            if (!IsMTGAActive())
                MsgBox, Script stopped - MTGA window lost focus
            else
                MsgBox, Script stopped by user
            return
        }

        ; Get the current string
        currentString := strings[A_Index]

        ; Perform a left click
        Click

        ; Wait for a short period to ensure the click is registered
        Sleep, 100

        ; Send the current string (paste the value)
        SendInput, %currentString%

        ; Press Enter
        SendInput, {Enter}

        ; Wait for 1 second before proceeding to the next action
        Sleep, 1000

        ; Press Escape
        SendInput, {Escape}

        ; Wait for 1 second before proceeding to the next string
        Sleep, 1000
    }

    MsgBox, All codes have been entered
Return