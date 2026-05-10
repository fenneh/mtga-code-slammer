#SingleInstance Force

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

global shouldStop := false

^Escape::
    shouldStop := true
    return

IsMTGAActive() {
    return WinActive("ahk_exe MTGA.exe")
}

^j::
    shouldStop := false

    totalCodes := strings.MaxIndex()
    MsgBox, 0, MTGA Code Slammer, Starting code entry process for %totalCodes% codes.`n`nPress Ctrl + Escape at any time to stop the script.`n`nPress Enter to begin...

    Loop, % strings.MaxIndex()
    {
        if (shouldStop || !IsMTGAActive())
        {
            if (!IsMTGAActive())
                MsgBox, Script stopped - MTGA window lost focus
            else
                MsgBox, Script stopped by user
            return
        }

        currentString := strings[A_Index]
        Click
        Sleep, 100
        SendInput, %currentString%
        SendInput, {Enter}
        Sleep, 1000
        SendInput, {Escape}
        Sleep, 1000
    }

    MsgBox, All codes have been entered
Return
