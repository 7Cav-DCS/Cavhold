-- Function to call in the various functions defined in CavUtils, without having to call the entirety of CavUtils.

-- Disable player settings via MOOSE
_SETTINGS:SetPlayerMenuOff()

-- Admin Menu Tester, REMOVE BEFORE PUSH TO SERVER
local DemoMenu = CavUtils.AddAdminforAll()
-- Adds in the admin menu via MOOSE function
-- Sets the admin1 variable to the group "Admin-1"
local admin1 = GROUP:FindByName('Admin-1')
local MenuAdd = CavUtils.AddAdminMenu(admin1)
