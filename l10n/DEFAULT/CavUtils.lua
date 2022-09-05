----------------------------- 7cav Lua Utility Module ----------------------------------
-- ****** Note that this script MUST be ran before Moose_X_X_X.lua, because Moose depends on 7cav APIs. ******
CavUtils = {}

----------------------------- A/A UI Initialization ----------------------------------
-- Code assumes N_SLOT number of red hostiles of each group type [AA-DUMMY-TGT-X, AA-ARH-TGT-X, AA-SARH-TGT-X] are available as late activation

-- Global Config, Variables
CavUtils.N_SLOTS=10
CavUtils.AA_DUMMY_MSG='A/A Dummy Targets'
CavUtils.AA_ARH_HOSTILE_MSG='A/A ARH Hostiles'
CavUtils.AA_SARH_HOSTILE_MSG='A/A SARH Hostiles'
CavUtils.AA_DUMMY_PREFIX='AA-DUMMY-TGT-'
CavUtils.AA_ARH_HOSTILE_PREFIX='AA-ARH-TGT-'
CavUtils.AA_SARH_HOSTILE_PREFIX='AA-SARH-TGT-'

CavUtils.AA_DUMMY_NAMES={}
CavUtils.AA_ARH_HOSTILE_NAMES={}
CavUtils.AA_SARH_HOSTILE_NAMES={}
for i = 1,CavUtils.N_SLOTS do
    CavUtils.AA_DUMMY_NAMES[i] = CavUtils.AA_DUMMY_PREFIX .. tostring(i)
    CavUtils.AA_ARH_HOSTILE_NAMES[i] = CavUtils.AA_ARH_HOSTILE_PREFIX .. tostring(i)
    CavUtils.AA_SARH_HOSTILE_NAMES[i] = CavUtils.AA_SARH_HOSTILE_PREFIX .. tostring(i)
end



-- Global Functions
local function DestroyAAGroups(group_names, group_type_name)
    for index, grp_name in ipairs(group_names) do
        local grp = Group.getByName(grp_name)
        if grp ~= nil then
            grp:destroy()
        end
    end

    local out_msg = 'A/A Training Zone:' 
                    .. '\nDestroyed ' .. group_type_name .. ' groups.'
    trigger.action.outTextForCoalition(coalition.side.BLUE, out_msg, 10)
end

local function RespawnAAGroups(group_names, group_type_name)
    for index, grp_name in ipairs(group_names) do
        mist.respawnGroup(grp_name, true)
    end

    local out_msg = 'A/A Training Zone:' 
                    .. '\nSpawned ' .. group_type_name .. ' south of training zone, 40 nm south of HOLD WP, Angels 15.'
    trigger.action.outTextForCoalition(coalition.side.BLUE, out_msg, 10)
end

function CavUtils.setSpawnDummy()
    RespawnAAGroups(CavUtils.AA_DUMMY_NAMES, CavUtils.AA_DUMMY_MSG)
    return 0
end

function CavUtils.setDespawnDummy()
    DestroyAAGroups(CavUtils.AA_DUMMY_NAMES, CavUtils.AA_DUMMY_MSG)
    return 0
end

function CavUtils.setSpawnARHHostile()
    RespawnAAGroups(CavUtils.AA_ARH_HOSTILE_NAMES, CavUtils.AA_ARH_HOSTILE_MSG)
    return 0
end

function CavUtils.setDespawnARHHostile()
    DestroyAAGroups(CavUtils.AA_ARH_HOSTILE_NAMES, CavUtils.AA_ARH_HOSTILE_MSG)
    return 0
end

function CavUtils.setSpawnSARHHostile()
    RespawnAAGroups(CavUtils.AA_SARH_HOSTILE_NAMES, CavUtils.AA_SARH_HOSTILE_MSG)
    return 0
end

function CavUtils.setDespawnSARHHostile()
    DestroyAAGroups(CavUtils.AA_SARH_HOSTILE_NAMES, CavUtils.AA_SARH_HOSTILE_MSG)
    return 0
end

function CavUtils.delayRestart()
    flag_value = trigger.misc.getUserFlag('777')
    trigger.action.setUserFlag('777', flag_value + 1)
    timeremaining = ((21600-timer.getTime())/60)/60
    local out_msg = 'Server Restart paused.'
                    .. timeremaining .. ' hours remaning until restart'
    trigger.action.outTextForCoalition(coalition.side.BLUE, out_msg, 10)
    return 0
end

function CavUtils.resumeRestart()
    flag_value = trigger.misc.getUserFlag('777')
    trigger.action.setUserFlag('777', flag_value - 1)
    timeremaining = ((21600-timer.getTime())/60)/60
    local out_msg = 'Server Restart resumed.'
                    .. timeremaining .. ' hours remaning until restart'
    trigger.action.outTextForCoalition(coalition.side.BLUE, out_msg, 10)
    return 0
end