#SingleInstance Force

strings := [
    "2005",
    "AlquistProft",
    "AlwaysFinishTheJob",
    "ArtClub",
    "BingoIVMythicChamp",
    "BORROWEDTIME",
    "BrokerShield",
    "BroughtBack",
    "CabarettiAlliance",
    "CIRCUITMENDER",
    "COURIERBAT",
    "CrimeIsAnArtForm",
    "Crumbelina",
    "DebateDuelists",
    "DelightfulMeadow",
    "EnlightenMe",
    "ExperimentalOverload",
    "FiveBonusLevels",
    "FNMATHOME",
    "FoilFungus",
    "FoodCourt",
    "FunIsntFree",
    "GAMEKNIGHTS",
    "GOLDENCOMMUNITY",
    "HappySwamp",
    "impeccable",
    "InformationIsPower",
    "InnerDemon",
    "IslandWilderness",
    "izoni",
    "LevelUp",
    "MaestroCasualty",
    "MathWhizzes",
    "MELLON",
    "MoveMountains",
    "murdered",
    "MythicMagic",
    "oba",
    "ObscuraConnive",
    "OneBillion",
    "OverTheMoon",
    "PARCELMYR",
    "ParallaxPotion",
    "PlayAlchemyNewCapenna",
    "PlayAllegiance",
    "PlayBRO",
    "PlayDMU",
    "PlayDMUAlchemy",
    "PlayDND",
    "PlayHBG",
    "PlayIkoria",
    "PlayKaldheim",
    "PlayM21",
    "PlayMID",
    "PlayNEO",
    "PlayNEOAlchemy",
    "PlaySNC",
    "PlayStrixhaven",
    "PlayTheros",
    "PlayVOW",
    "PlayZendikar",
    "ReadTheFinePrint",
    "RepairAndRecharge",
    "RestorativeBurst",
    "RiveteerBlitz",
    "RockJocks",
    "SCALEUP",
    "ShieldsUp",
    "ShinyGoblinPirate",
    "SparkleDruid",
    "StarterStyles",
    "SuperScry",
    "SwampPunks",
    "ThatsWild",
    "THREADS",
    "TisAScratch",
    "TreeFriend",
    "TryKaladesh",
    "WrittenInStone",
    "ZendikarLands"
]

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
