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
    "GAMEAWARDS",
    "GAMEKNIGHTS",
    "GOLDENCOMMUNITY",
    "Golgari",
    "Greenblack",
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
    "ParallaxPotion",
    "PARCELMYR",
    "PATCHUP",
    "PlayACR",
    "PlayAED",
    "PlayAlchemyNewCapenna",
    "PlayAllegiance",
    "PlayBLB",
    "PlayBRO",
    "PlayDMU",
    "PlayDMUAlchemy",
    "PlayDND",
    "PlayDSK",
    "PlayEldraine",
    "PlayEOE",
    "PlayFDN",
    "PlayFIN",
    "PlayHBG",
    "PlayIkoria",
    "PlayINR",
    "PlayKaldheim",
    "PlayLCI",
    "PlayLTR",
    "PlayM20",
    "PlayM21",
    "PlayMID",
    "PlayMKM",
    "PlayMOM",
    "PlayNEO",
    "PlayNEOAlchemy",
    "PlayONE",
    "PlayOTJ",
    "PlayRavnica",
    "PlaySNC",
    "PlayStrixhaven",
    "PlayTDM",
    "PlayTheros",
    "PlayVOW",
    "PlayWarSpark",
    "PlayWOE",
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
    "StickTogether",
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
