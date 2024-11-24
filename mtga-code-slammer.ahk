; Define the array of strings
strings := ["PlayAlchemyNewCapenna", "ObscuraConnive", "RiveteerBlitz", "CabarettiAlliance", "MaestroCasualty", "BrokerShield", "PlaySNC", "PlayNEO", "FNMATHOME", "AlwaysFinishTheJob", "PlayTheros", "PlayIkoria", "PlayM21", "PlayZendikar", "PlayKaldheim", "PlayStrixhaven", "PlayMID", "PLAYVOW", "InformationIsPower", "CrimeIsAnArtForm", "FunIsntFree", "PlayNEOAlchemy", "Mellon", "ReadTheFinePrint", "RepairAndRecharge", "EnlightenMe", "WrittenInStone", "ShieldsUp", "InnerDemon", "OverTheMoon", "SparkleDruid", "ShinyGoblinPirate", "FoilFungus", "ParallaxPotion", "SuperScry", "LevelUp", "RockJocks", "ArtClub", "SwampPunks", "MathWhizzes", "TryKaladesh", "DebateDuelists", "COURIERBAT", "CIRCUITMENDER", "BingoIVMythicChamp", "BORROWEDTIME", "BroughtBack", "Crumbelina", "DelightfulMeadow", "ExperimentalOverload", "FiveBonusLevels", "FoodCourt", "GAMEKNIGHTS", "GOLDENCOMMUNITY", "HappySwamp", "IslandWilderness", "MoveMountains", "MythicMagic", "OneBillion", "PARCELMYR", "PlayAllegiance", "RestorativeBurst", "SCALEUP", "StarterStyles", "ThatsWild", "TisAScratch", "TreeFriend", "ZendikarLands"]


; Set up a hotkey to start the process
^j:: ; Ctrl+J to trigger the process

; Loop through each string in the array
Loop, % strings.MaxIndex()
{
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

    ; Press and hold Escape for 1 second
    SendInput, {Escape down}
    Sleep, 1000
    SendInput, {Escape up}

    ; Wait for 1 second before proceeding to the next string
    Sleep, 1000
}

Return
