-- ATIS Anapa Airport on 143.00 MHz AM.
atisAnapa=ATIS:New(AIRBASE.Caucasus.Anapa_Vityazevo, 143.00)
atisAnapa:SetTowerFrequencies({121, 250})
atisAnapa:Start()