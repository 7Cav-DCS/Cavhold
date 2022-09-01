-- Bomb Range Caucasus Bombing Range
local bombTgtsCBR = {"BombTgt1", "BombTgt2", "BombTgt3", "BombTgt4"}
local StrafeCBR = {"ST1"}
local StrafeCBR2 = {"ST2"}
RangeCBR = RANGE:New("Caucasus Bombing Range (CBR)")
	RangeCBR:SetRangeZone(ZONE:New("ZoneRangeCBR"))
	RangeCBR:SetScoreBombDistance(200)
	RangeCBR:AddBombingTargets( bombTgtsCBR, 30)
	RangeCBR:AddStrafePit(StrafeCBR, 2000, 1000, nil, true, 20, 305)
	RangeCBR:AddStrafePit(StrafeCBR2, 2000, 1000, nil, true, 20, 305)
RangeCBR:Start()

-- A/A Range Commands, draft snippet. Needs testing. 9.1.22
local _aatgts = missionCommands.addSubMenuForCoalition(coalition.side.BLUE,"A/A Range","On the Range")

