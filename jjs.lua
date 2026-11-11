
local _dcoqbTable = {["A"] = 0, ["B"] = 1, ["C"] = 2, ["D"] = 3, ["E"] = 4, ["F"] = 5, ["G"] = 6, ["H"] = 7, ["I"] = 8, ["J"] = 9, ["K"] = 10, ["L"] = 11, ["M"] = 12, ["N"] = 13, ["O"] = 14, ["P"] = 15, ["Q"] = 16, ["R"] = 17, ["S"] = 18, ["T"] = 19, ["U"] = 20, ["V"] = 21, ["W"] = 22, ["X"] = 23, ["Y"] = 24, ["Z"] = 25, ["a"] = 26, ["b"] = 27, ["c"] = 28, ["d"] = 29, ["e"] = 30, ["f"] = 31, ["g"] = 32, ["h"] = 33, ["i"] = 34, ["j"] = 35, ["k"] = 36, ["l"] = 37, ["m"] = 38, ["n"] = 39, ["o"] = 40, ["p"] = 41, ["q"] = 42, ["r"] = 43, ["s"] = 44, ["t"] = 45, ["u"] = 46, ["v"] = 47, ["w"] = 48, ["x"] = 49, ["y"] = 50, ["z"] = 51, ["0"] = 52, ["1"] = 53, ["2"] = 54, ["3"] = 55, ["4"] = 56, ["5"] = 57, ["6"] = 58, ["7"] = 59, ["8"] = 60, ["9"] = 61, ["+"] = 62, ["/"] = 63}
local function _dcoqb(s)
    local bytes = {}
    local buffer, bits = 0, 0
    for i = 1, #s do
        local ch = s:sub(i, i)
        if ch == "=" then break end
        local val = _dcoqbTable[ch]
        if val ~= nil then
            buffer = bit32.bor(bit32.lshift(buffer, 6), val)
            bits = bits + 6
            if bits >= 8 then
                bits = bits - 8
                bytes[#bytes + 1] = bit32.band(bit32.rshift(buffer, bits), 0xFF)
            end
        end
    end
    local key = "zvoxfmenxeka"
    local out = {}
    for i = 1, #bytes do
        local k = key:byte(((i - 1) % #key) + 1)
        out[i] = string.char(bit32.bxor(bytes[i], k))
    end
    return table.concat(out)
end
local Players = game:GetService(_dcoqb("KhoOAQMfFg=="))
local UserInputService = game:GetService(_dcoqb("LwUKCi8DFRsMNg4TDB8MHQ=="))
local Workspace = game:GetService(_dcoqb("LRkdExUdBA0d"))
local RunService = game:GetService(_dcoqb("KAMBKwMfEwcbAA=="))
local PathfindingService = game:GetService(_dcoqb("KhcbEAAECwoRCwwyHwQZEQUI"))
local VirtualInputManager = game:GetService(_dcoqb("LB8dDBMMCScWFR4VNxcBGQEIFw=="))
local VirtualUser = game:GetService(_dcoqb("LB8dDBMMCTsLABk="))
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild(_dcoqb("KhoOAQMfIhsR"))
local Config = {
autoFarmEnabled = false,
instantOpenEnabled = false,
autoOpenNearbyWhenReady = true,
waitUntilDoorDisappears = true,
antiAfkEnabled = true,
espEnabled = false,
espShowTimer = true,
movementMode = _dcoqb("HBoW"),
cframeSpeed = (125 - 45),
flyHeight = (76 - 34),
startTimerThreshold = (24 - 12),
approachEarlyWaitTimer = false,
tapCount = (16 - 8),
openedDoorMemoryTime = (38 - 18),
avoidPlayersEnabled = false,
safeRetreatEnabled = false,
playerAvoidRadius = (11 - 1),
safeRetreatDistance = (121 - 56),
drawNeonPath = true,
syncNeonWithTheme = false,
neonColor = Color3.fromRGB((90 - 35), (146 - 26), (505 - 250)),
neonThickness = 0.45,
theme = _dcoqb("OBoaHQ=="),
rainbowSpeed = 0.08,
guiVisible = true,
}
local Themes = {
[_dcoqb("PQQKHQg=")] = {
bgWindow = Color3.fromRGB((11 - 1), (24 - 10), (18 - 6)),
bgSidebar = Color3.fromRGB((23 - 10), (35 - 17), (23 - 8)),
bgGroup = Color3.fromRGB((28 - 12), (40 - 18), (20 - 1)),
bgElement = Color3.fromRGB((36 - 14), (57 - 27), (47 - 21)),
border = Color3.fromRGB((38 - 6), (54 - 6), (52 - 12)),
accent = Color3.fromRGB((46 - 1), (282 - 67), (173 - 63)),
},
[_dcoqb("OBoaHQ==")] = {
bgWindow = Color3.fromRGB((13 - 2), (20 - 7), (18 - 1)),
bgSidebar = Color3.fromRGB((25 - 11), (29 - 12), (25 - 3)),
bgGroup = Color3.fromRGB((35 - 17), (42 - 21), (52 - 24)),
bgElement = Color3.fromRGB((38 - 14), (41 - 13), (63 - 26)),
border = Color3.fromRGB((63 - 27), (57 - 15), (93 - 37)),
accent = Color3.fromRGB((77 - 22), (204 - 84), (345 - 90)),
},
[_dcoqb("PRkDHA==")] = {
bgWindow = Color3.fromRGB((19 - 5), (18 - 6), (18 - 8)),
bgSidebar = Color3.fromRGB((25 - 7), (27 - 11), (19 - 7)),
bgGroup = Color3.fromRGB((43 - 20), (31 - 11), (18 - 3)),
bgElement = Color3.fromRGB((49 - 18), (51 - 24), (35 - 15)),
border = Color3.fromRGB((75 - 25), (83 - 40), (34 - 4)),
accent = Color3.fromRGB((411 - 166), (287 - 102), (51 - 6)),
},
[_dcoqb("KBML")] = {
bgWindow = Color3.fromRGB((28 - 13), (16 - 6), (17 - 6)),
bgSidebar = Color3.fromRGB((29 - 10), (23 - 10), (26 - 12)),
bgGroup = Color3.fromRGB((30 - 6), (32 - 16), (29 - 11)),
bgElement = Color3.fromRGB((41 - 8), (25 - 3), (48 - 24)),
border = Color3.fromRGB((73 - 21), (58 - 26), (69 - 33)),
accent = Color3.fromRGB((328 - 93), (64 - 9), (76 - 6)),
},
[_dcoqb("KBcGFgQCEg==")] = {
bgWindow = Color3.fromRGB((18 - 6), (14 - 2), (32 - 16)),
bgSidebar = Color3.fromRGB((27 - 12), (18 - 3), (38 - 18)),
bgGroup = Color3.fromRGB((23 - 4), (30 - 11), (49 - 24)),
bgElement = Color3.fromRGB((40 - 15), (45 - 20), (62 - 29)),
border = Color3.fromRGB((70 - 30), (65 - 25), (84 - 32)),
accent = Color3.fromRGB((90 - 35), (176 - 56), (449 - 194)),
},
[_dcoqb("PQQKAQ==")] = {
bgWindow = Color3.fromRGB((20 - 8), (13 - 1), (25 - 12)),
bgSidebar = Color3.fromRGB((20 - 4), (21 - 5), (23 - 5)),
bgGroup = Color3.fromRGB((29 - 9), (24 - 4), (30 - 8)),
bgElement = Color3.fromRGB((54 - 27), (47 - 20), (38 - 8)),
border = Color3.fromRGB((63 - 19), (76 - 32), (66 - 18)),
accent = Color3.fromRGB((251 - 86), (314 - 144), (194 - 14)),
},
}
local NeonPresets = {
{ name = _dcoqb("OBoaHQ=="), color = Color3.fromRGB((92 - 37), (232 - 112), (470 - 215)) },
{ name = _dcoqb("LhkXEQU="), color = Color3.fromRGB((57 - 12), (238 - 13), (196 - 86)) },
{ name = _dcoqb("PRkDHA=="), color = Color3.fromRGB((366 - 116), (333 - 143), (64 - 24)) },
{ name = _dcoqb("KBML"), color = Color3.fromRGB((247 - 7), (64 - 14), (120 - 55)) },
{ name = _dcoqb("LB8AFAMZ"), color = Color3.fromRGB((195 - 10), (94 - 29), (388 - 138)) },
{ name = _dcoqb("OwcaGQ=="), color = Color3.fromRGB((77 - 37), (331 - 101), (318 - 73)) },
{ name = _dcoqb("LR4GDAM="), color = Color3.fromRGB((439 - 194), (458 - 213), (325 - 70)) },
}
for _, oldName in ipairs({
_dcoqb("MhcDFAkaAAsWIQQOCDUAFhIfCgIUABkmDx8="),
_dcoqb("KhcdGQICHSYXCgAjHwIOPxME"),
_dcoqb("NBMXFxQMJi0/EAI="),
_dcoqb("NBMXFxQMM10/EAI="),
_dcoqb("NBMXFxQMM11OIh4I"),
_dcoqb("NBMXFxQMM11PIh4I"),
_dcoqb("NBMXFxQMM11AIh4I"),
_dcoqb("NBMXFxQMM11BIh4I"),
}) do
local old = playerGui:FindFirstChild(oldName)
if old then
old:Destroy()
end
end
for _, folderName in ipairs({
_dcoqb("KhcdGQICHSAdCgUxGwIH"),
_dcoqb("NBMXFxQMKwsXCzsADh4="),
_dcoqb("NBMXFxQMM10oBB8J"),
_dcoqb("NBMXFxQMM11ONQoVEg=="),
_dcoqb("NBMXFxQMM11PNQoVEg=="),
_dcoqb("NBMXFxQMM11ANQoVEg=="),
_dcoqb("NBMXFxQMM11BNQoVEg=="),
}) do
local oldF = Workspace:FindFirstChild(folderName)
if oldF then
oldF:Destroy()
end
end
local neonFolder = Instance.new(_dcoqb("PBkDHAMf"))
neonFolder.Name = _dcoqb("NBMXFxQMM11BNQoVEg==")
neonFolder.Parent = Workspace
local antiAfkActionsCount = 0
local lastAntiAfkPulse = os.clock()
local antiAfkStatusLabel = nil
local function triggerAntiAfkPulse()
if not Config.antiAfkEnabled then
return
end
antiAfkActionsCount = antiAfkActionsCount + 1
lastAntiAfkPulse = os.clock()
pcall(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new(0, 0))
end)
pcall(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
task.delay(0.05, function()
pcall(function()
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.RightControl, false, game)
end)
end)
end)
if antiAfkStatusLabel then
antiAfkStatusLabel.Text = string.format(_dcoqb("OxgbEUssIyVCRSoCDh8ZHUZFNRsUFg4SQFZKHE8="), antiAfkActionsCount)
end
end
localPlayer.Idled:Connect(function()
if Config.antiAfkEnabled then
triggerAntiAfkPulse()
end
end)
pcall(function()
if type(getconnections) == _dcoqb("HAMBGxIECgA=") then
for _, _v1 in pairs(getconnections(localPlayer.Idled)) do
if _v1.Disable then
_v1:Disable()
elseif _v1.Disconnect then
_v1:Disconnect()
end
end
end
end)
local UIRegistry = {
windowBg = {},
sidebarBg = {},
groupBg = {},
elementBg = {},
borders = {},
accentBg = {},
accentText = {},
accentStroke = {},
checkboxes = {},
sliders = {},
tabButtons = {},
segmentedGroups = {},
}
local function getCurrentAccent()
if Config.theme == _dcoqb("KBcGFgQCEg==") then
local _v2 = (os.clock() * Config.rainbowSpeed) % 1
return Color3.fromHSV(_v2, 0.78, 0.96)
end
local _v3 = Themes[Config.theme] or Themes[_dcoqb("OBoaHQ==")]
return _v3.accent
end
local function refreshThemeColors()
local _v4 = Themes[Config.theme] or Themes[_dcoqb("OBoaHQ==")]
local _v5 = getCurrentAccent()
for _, _v6 in ipairs(UIRegistry.windowBg) do
_v6.BackgroundColor3 = _v4.bgWindow
end
for _, _v6 in ipairs(UIRegistry.sidebarBg) do
_v6.BackgroundColor3 = _v4.bgSidebar
end
for _, _v6 in ipairs(UIRegistry.groupBg) do
_v6.BackgroundColor3 = _v4.bgGroup
end
for _, _v6 in ipairs(UIRegistry.elementBg) do
_v6.BackgroundColor3 = _v4.bgElement
end
for _, _v7 in ipairs(UIRegistry.borders) do
_v7.Color = _v4.border
end
for _, _v6 in ipairs(UIRegistry.accentBg) do
_v6.BackgroundColor3 = _v5
end
for _, _v6 in ipairs(UIRegistry.accentText) do
_v6.TextColor3 = _v5
end
for _, _v7 in ipairs(UIRegistry.accentStroke) do
_v7.Color = _v5
end
for _, _v8 in ipairs(UIRegistry.checkboxes) do
_v8.box.BackgroundColor3 = _v8.getState() and _v5 or _v4.bgWindow
_v8.stroke.Color = _v8.getState() and _v5 or _v4.border
end
for _, _v9 in ipairs(UIRegistry.segmentedGroups) do
_v9.refresh(_v5, _v4)
end
for _, _va in ipairs(UIRegistry.tabButtons) do
if _va.isActive() then
_va.btn.BackgroundColor3 = _v4.bgElement
_va.title.TextColor3 = _v5
_va.bar.BackgroundColor3 = _v5
_va.bar.Visible = true
else
_va.btn.BackgroundColor3 = _v4.bgGroup
_va.title.TextColor3 = Color3.fromRGB((239 - 69), (232 - 57), (367 - 182))
_va.bar.Visible = false
end
end
end
local screenGui = Instance.new(_dcoqb("KRUdHQMDIhsR"))
screenGui.Name = _dcoqb("NBMXFxQMM11BIh4I")
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui
local mainFrame = Instance.new(_dcoqb("PAQOFQM="))
mainFrame.Name = _dcoqb("NxcGFiAfBAMd")
mainFrame.Size = UDim2.new(0, (811 - 91), 0, (675 - 195))
mainFrame.Position = UDim2.new(0.5, -(678 - 318), 0.5, -(431 - 191))
mainFrame.BackgroundColor3 = Themes.Blue.bgWindow
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui
table.insert(UIRegistry.windowBg, mainFrame)
local mainCorner = Instance.new(_dcoqb("Lz8sFxQDABw="))
mainCorner.CornerRadius = UDim.new(0, (8 - 4))
mainCorner.Parent = mainFrame
local mainStroke = Instance.new(_dcoqb("Lz88DBQCDgs="))
mainStroke.Color = Themes.Blue.border
mainStroke.Thickness = 1.5
mainStroke.Parent = mainFrame
table.insert(UIRegistry.borders, mainStroke)
local headerBar = Instance.new(_dcoqb("PAQOFQM="))
headerBar.Name = _dcoqb("MhMOHAMfJw8K")
headerBar.Size = UDim2.new(1, 0, 0, (49 - 15))
headerBar.BackgroundColor3 = Themes.Blue.bgSidebar
headerBar.BorderSizePixel = 0
headerBar.Parent = mainFrame
table.insert(UIRegistry.sidebarBg, headerBar)
local headerLine = Instance.new(_dcoqb("PAQOFQM="))
headerLine.Name = _dcoqb("MhMOHAMfKQcWAA==")
headerLine.Size = UDim2.new(1, 0, 0, (4 - 2))
headerLine.Position = UDim2.new(0, 0, 1, -(4 - 2))
headerLine.BackgroundColor3 = Themes.Blue.accent
headerLine.BorderSizePixel = 0
headerLine.Parent = headerBar
table.insert(UIRegistry.accentBg, headerLine)
local logoContainer = Instance.new(_dcoqb("PAQOFQM="))
logoContainer.Name = _dcoqb("NhkIFyUCCxoZDAUECA==")
logoContainer.Size = UDim2.new(0, (182 - 27), 1, -(4 - 2))
logoContainer.Position = UDim2.new(0, (22 - 10), 0, 0)
logoContainer.BackgroundTransparency = 1
logoContainer.Parent = headerBar
local logoList = Instance.new(_dcoqb("Lz8jERUZKQ8BCh4V"))
logoList.FillDirection = Enum.FillDirection.Horizontal
logoList.HorizontalAlignment = Enum.HorizontalAlignment.Left
logoList.VerticalAlignment = Enum.VerticalAlignment.Center
logoList.SortOrder = Enum.SortOrder.LayoutOrder
logoList.Padding = UDim.new(0, 1)
logoList.Parent = logoContainer
local logoMain = Instance.new(_dcoqb("LhMXDCoMBwsU"))
logoMain.LayoutOrder = 1
logoMain.Size = UDim2.new(0, 0, 1, 0)
logoMain.AutomaticSize = Enum.AutomaticSize.X
logoMain.BackgroundTransparency = 1
logoMain.Text = _dcoqb("NDM3NzQs")
logoMain.TextColor3 = Color3.fromRGB((464 - 219), (264 - 19), (259 - 9))
logoMain.Font = Enum.Font.GothamBold
logoMain.TextSize = (18 - 3)
logoMain.TextXAlignment = Enum.TextXAlignment.Left
logoMain.Parent = logoContainer
local logoExt = Instance.new(_dcoqb("LhMXDCoMBwsU"))
logoExt.LayoutOrder = (4 - 2)
logoExt.Size = UDim2.new(0, 0, 1, 0)
logoExt.AutomaticSize = Enum.AutomaticSize.X
logoExt.BackgroundTransparency = 1
logoExt.Text = _dcoqb("VDUs")
logoExt.TextColor3 = Themes.Blue.accent
logoExt.Font = Enum.Font.GothamBold
logoExt.TextSize = (28 - 13)
logoExt.TextXAlignment = Enum.TextXAlignment.Left
logoExt.Parent = logoContainer
table.insert(UIRegistry.accentText, logoExt)
local statusTopLabel = Instance.new(_dcoqb("LhMXDCoMBwsU"))
statusTopLabel.Size = UDim2.new(1, -(300 - 120), 1, -(4 - 2))
statusTopLabel.Position = UDim2.new(0, (296 - 128), 0, 0)
statusTopLabel.BackgroundTransparency = 1
statusTopLabel.Text = _dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWDQIBAoB")
statusTopLabel.TextColor3 = Color3.fromRGB((296 - 136), (200 - 35), (303 - 128))
statusTopLabel.Font = Enum.Font.Code
statusTopLabel.TextSize = (16 - 4)
statusTopLabel.TextTruncate = Enum.TextTruncate.AtEnd
statusTopLabel.TextXAlignment = Enum.TextXAlignment.Right
statusTopLabel.Parent = headerBar
do
local dragging = false
local dragInput, dragStart, startPos
headerBar.InputBegan:Connect(function(_vb)
if _vb.UserInputType == Enum.UserInputType.MouseButton1 or _vb.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = _vb.Position
startPos = mainFrame.Position
_vb.Changed:Connect(function()
if _vb.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
headerBar.InputChanged:Connect(function(_vc)
if _vc.UserInputType == Enum.UserInputType.MouseMovement or _vc.UserInputType == Enum.UserInputType.Touch then
dragInput = _vc
end
end)
UserInputService.InputChanged:Connect(function(_vd)
if _vd == dragInput and dragging then
local _ve = _vd.Position - dragStart
mainFrame.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + _ve.X,
startPos.Y.Scale,
startPos.Y.Offset + _ve.Y
)
end
end)
end
local sidebarFrame = Instance.new(_dcoqb("PAQOFQM="))
sidebarFrame.Name = _dcoqb("KR8LHQQMFw==")
sidebarFrame.Size = UDim2.new(0, (254 - 104), 1, -(91 - 45))
sidebarFrame.Position = UDim2.new(0, (8 - 2), 0, (63 - 23))
sidebarFrame.BackgroundColor3 = Themes.Blue.bgSidebar
sidebarFrame.BorderSizePixel = 0
sidebarFrame.Parent = mainFrame
table.insert(UIRegistry.sidebarBg, sidebarFrame)
local sidebarStroke = Instance.new(_dcoqb("Lz88DBQCDgs="))
sidebarStroke.Color = Themes.Blue.border
sidebarStroke.Thickness = 1
sidebarStroke.Parent = sidebarFrame
table.insert(UIRegistry.borders, sidebarStroke)
local sidebarList = Instance.new(_dcoqb("Lz8jERUZKQ8BCh4V"))
sidebarList.SortOrder = Enum.SortOrder.LayoutOrder
sidebarList.Padding = UDim.new(0, (7 - 1))
sidebarList.Parent = sidebarFrame
local sidebarPad = Instance.new(_dcoqb("Lz8/GQIJDAAf"))
sidebarPad.PaddingTop = UDim.new(0, (13 - 5))
sidebarPad.PaddingLeft = UDim.new(0, (14 - 6))
sidebarPad.PaddingRight = UDim.new(0, (15 - 7))
sidebarPad.Parent = sidebarFrame
local pagesContainer = Instance.new(_dcoqb("PAQOFQM="))
pagesContainer.Name = _dcoqb("KhcIHRUuCgAMBAIPHwQ=")
pagesContainer.Size = UDim2.new(1, -(324 - 156), 1, -(82 - 36))
pagesContainer.Position = UDim2.new(0, (201 - 39), 0, (80 - 40))
pagesContainer.BackgroundColor3 = Themes.Blue.bgSidebar
pagesContainer.BorderSizePixel = 0
pagesContainer.ClipsDescendants = true
pagesContainer.Parent = mainFrame
table.insert(UIRegistry.sidebarBg, pagesContainer)
local pagesStroke = Instance.new(_dcoqb("Lz88DBQCDgs="))
pagesStroke.Color = Themes.Blue.border
pagesStroke.Thickness = 1
pagesStroke.Parent = pagesContainer
table.insert(UIRegistry.borders, pagesStroke)
local activeTabIndex = 1
local tabPages = {}
local function createTab(_vf, _vg, _vh)
local _vi = Instance.new(_dcoqb("PAQOFQM="))
_vi.Name = _dcoqb("KhcIHTk=") .. _vf
_vi.Size = UDim2.new(1, -(24 - 8), 1, -(31 - 15))
_vi.Position = UDim2.new(0, (12 - 4), 0, (11 - 3))
_vi.BackgroundTransparency = 1
_vi.Visible = (_vh == 1)
_vi.Parent = pagesContainer
tabPages[_vh] = _vi
local _vj = Instance.new(_dcoqb("LhMXDCQYERoXCw=="))
_vj.Name = _dcoqb("LhcNOhIDOg==") .. _vf
_vj.LayoutOrder = _vh
_vj.Size = UDim2.new(1, 0, 0, (88 - 44))
_vj.BackgroundColor3 = Themes.Blue.bgGroup
_vj.BorderSizePixel = 0
_vj.Text = ""
_vj.AutoButtonColor = false
_vj.ClipsDescendants = true
_vj.Parent = sidebarFrame
local _vk = Instance.new(_dcoqb("Lz88DBQCDgs="))
_vk.Color = Themes.Blue.border
_vk.Thickness = 1
_vk.Parent = _vj
table.insert(UIRegistry.borders, _vk)
local _vl = Instance.new(_dcoqb("PAQOFQM="))
_vl.Size = UDim2.new(0, (4 - 1), 1, 0)
_vl.Position = UDim2.new(0, 0, 0, 0)
_vl.BackgroundColor3 = Themes.Blue.accent
_vl.BorderSizePixel = 0
_vl.Visible = (_vh == 1)
_vl.Parent = _vj
local _vm = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_vm.Size = UDim2.new(1, -(21 - 7), 0, (36 - 18))
_vm.Position = UDim2.new(0, (18 - 8), 0, (7 - 1))
_vm.BackgroundTransparency = 1
_vm.Text = _vf
_vm.Font = Enum.Font.GothamBold
_vm.TextSize = (17 - 5)
_vm.TextTruncate = Enum.TextTruncate.AtEnd
_vm.TextXAlignment = Enum.TextXAlignment.Left
_vm.Parent = _vj
local _vn = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_vn.Size = UDim2.new(1, -(21 - 7), 0, (15 - 1))
_vn.Position = UDim2.new(0, (17 - 7), 0, (46 - 22))
_vn.BackgroundTransparency = 1
_vn.Text = _vg
_vn.TextColor3 = Color3.fromRGB((153 - 33), (243 - 118), (159 - 24))
_vn.Font = Enum.Font.Code
_vn.TextSize = (15 - 5)
_vn.TextTruncate = Enum.TextTruncate.AtEnd
_vn.TextXAlignment = Enum.TextXAlignment.Left
_vn.Parent = _vj
table.insert(UIRegistry.tabButtons, {
btn = _vj,
title = _vm,
bar = _vl,
isActive = function()
return activeTabIndex == _vh
end,
})
_vj.MouseButton1Click:Connect(function()
activeTabIndex = _vh
for _vw, _vx in pairs(tabPages) do
_vx.Visible = (_vw == _vh)
end
refreshThemeColors()
end)
local _vq = Instance.new(_dcoqb("KRUdFwoBDAAfIxkAFxM="))
_vq.Name = _dcoqb("NhMJDCUCCRsVCw==")
_vq.Size = UDim2.new(0.49, 0, 1, 0)
_vq.Position = UDim2.new(0, 0, 0, 0)
_vq.BackgroundTransparency = 1
_vq.BorderSizePixel = 0
_vq.ScrollBarThickness = (3 - 1)
_vq.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vq.CanvasSize = UDim2.new(0, 0, 0, 0)
_vq.Parent = _vi
local _vr = Instance.new(_dcoqb("Lz8jERUZKQ8BCh4V"))
_vr.SortOrder = Enum.SortOrder.LayoutOrder
_vr.Padding = UDim.new(0, (11 - 1))
_vr.Parent = _vq
local _vs = Instance.new(_dcoqb("Lz8/GQIJDAAf"))
_vs.PaddingTop = UDim.new(0, (4 - 2))
_vs.PaddingBottom = UDim.new(0, (10 - 2))
_vs.PaddingLeft = UDim.new(0, (4 - 2))
_vs.PaddingRight = UDim.new(0, (7 - 2))
_vs.Parent = _vq
local _vt = Instance.new(_dcoqb("KRUdFwoBDAAfIxkAFxM="))
_vt.Name = _dcoqb("KB8IEBIuCgINCAU=")
_vt.Size = UDim2.new(0.49, 0, 1, 0)
_vt.Position = UDim2.new(0.51, 0, 0, 0)
_vt.BackgroundTransparency = 1
_vt.BorderSizePixel = 0
_vt.ScrollBarThickness = (4 - 2)
_vt.AutomaticCanvasSize = Enum.AutomaticSize.Y
_vt.CanvasSize = UDim2.new(0, 0, 0, 0)
_vt.Parent = _vi
local _vu = Instance.new(_dcoqb("Lz8jERUZKQ8BCh4V"))
_vu.SortOrder = Enum.SortOrder.LayoutOrder
_vu.Padding = UDim.new(0, (12 - 2))
_vu.Parent = _vt
local _vv = Instance.new(_dcoqb("Lz8/GQIJDAAf"))
_vv.PaddingTop = UDim.new(0, (3 - 1))
_vv.PaddingBottom = UDim.new(0, (12 - 4))
_vv.PaddingLeft = UDim.new(0, (4 - 2))
_vv.PaddingRight = UDim.new(0, (10 - 5))
_vv.Parent = _vt
return _vq, _vt
end
local function createSection(_vy, _vz, _v10)
local _v11 = Instance.new(_dcoqb("PAQOFQM="))
_v11.Name = _dcoqb("KRMMDA8CCzE=") .. _vz
_v11.LayoutOrder = _v10
_v11.Size = UDim2.new(1, 0, 0, 0)
_v11.AutomaticSize = Enum.AutomaticSize.Y
_v11.BackgroundColor3 = Themes.Blue.bgGroup
_v11.BorderSizePixel = 0
_v11.ClipsDescendants = true
_v11.Parent = _vy
table.insert(UIRegistry.groupBg, _v11)
local _v12 = Instance.new(_dcoqb("Lz8jERUZKQ8BCh4V"))
_v12.SortOrder = Enum.SortOrder.LayoutOrder
_v12.Padding = UDim.new(0, 0)
_v12.Parent = _v11
local _v13 = Instance.new(_dcoqb("Lz88DBQCDgs="))
_v13.Color = Themes.Blue.border
_v13.Thickness = 1
_v13.Parent = _v11
table.insert(UIRegistry.borders, _v13)
local _v14 = Instance.new(_dcoqb("PAQOFQM="))
_v14.LayoutOrder = 1
_v14.Size = UDim2.new(1, 0, 0, (45 - 21))
_v14.BackgroundColor3 = Themes.Blue.bgElement
_v14.BorderSizePixel = 0
_v14.Parent = _v11
table.insert(UIRegistry.elementBg, _v14)
local _v15 = Instance.new(_dcoqb("PAQOFQM="))
_v15.Size = UDim2.new(1, 0, 0, 1)
_v15.Position = UDim2.new(0, 0, 1, -1)
_v15.BackgroundColor3 = Themes.Blue.accent
_v15.BorderSizePixel = 0
_v15.Parent = _v14
table.insert(UIRegistry.accentBg, _v15)
local _v16 = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_v16.Size = UDim2.new(1, -(29 - 13), 1, 0)
_v16.Position = UDim2.new(0, (10 - 2), 0, 0)
_v16.BackgroundTransparency = 1
_v16.Text = string.upper(_vz)
_v16.TextColor3 = Color3.fromRGB((358 - 133), (387 - 157), (270 - 30))
_v16.Font = Enum.Font.GothamBold
_v16.TextSize = (18 - 7)
_v16.TextTruncate = Enum.TextTruncate.AtEnd
_v16.TextXAlignment = Enum.TextXAlignment.Left
_v16.Parent = _v14
local _v17 = Instance.new(_dcoqb("PAQOFQM="))
_v17.Name = _dcoqb("ORkBDAMDEQ==")
_v17.LayoutOrder = (3 - 1)
_v17.Size = UDim2.new(1, 0, 0, 0)
_v17.AutomaticSize = Enum.AutomaticSize.Y
_v17.BackgroundTransparency = 1
_v17.Parent = _v11
local _v18 = Instance.new(_dcoqb("Lz8jERUZKQ8BCh4V"))
_v18.SortOrder = Enum.SortOrder.LayoutOrder
_v18.Padding = UDim.new(0, (11 - 3))
_v18.Parent = _v17
local _v19 = Instance.new(_dcoqb("Lz8/GQIJDAAf"))
_v19.PaddingTop = UDim.new(0, (13 - 3))
_v19.PaddingBottom = UDim.new(0, (19 - 9))
_v19.PaddingLeft = UDim.new(0, (15 - 5))
_v19.PaddingRight = UDim.new(0, (16 - 6))
_v19.Parent = _v17
return _v17
end
local function addToggle(_v1a, _v1b, _v1c, _v1d, _v1e, _v1f)
local _v1g = Instance.new(_dcoqb("PAQOFQM="))
_v1g.LayoutOrder = _v1b
_v1g.Size = UDim2.new(1, 0, 0, (38 - 16))
_v1g.BackgroundTransparency = 1
_v1g.Parent = _v1a
local _v1h = Instance.new(_dcoqb("LhMXDCQYERoXCw=="))
_v1h.Size = UDim2.new(0, (24 - 10), 0, (24 - 10))
_v1h.Position = UDim2.new(0, 0, 0.5, -(10 - 3))
_v1h.BackgroundColor3 = _v1e and getCurrentAccent() or Themes.Blue.bgWindow
_v1h.BorderSizePixel = 0
_v1h.Text = ""
_v1h.AutoButtonColor = false
_v1h.Parent = _v1g
local _v1i = Instance.new(_dcoqb("Lz88DBQCDgs="))
_v1i.Color = _v1e and getCurrentAccent() or Themes.Blue.border
_v1i.Thickness = 1
_v1i.Parent = _v1h
local _v1j = _v1d and (101 - 47) or (6 - 2)
local _v1k = Instance.new(_dcoqb("LhMXDCQYERoXCw=="))
_v1k.Size = UDim2.new(1, -((30 - 8) + _v1j), 1, 0)
_v1k.Position = UDim2.new(0, (28 - 6), 0, 0)
_v1k.BackgroundTransparency = 1
_v1k.Text = _v1c
_v1k.TextColor3 = Color3.fromRGB((229 - 14), (417 - 197), (410 - 180))
_v1k.Font = Enum.Font.Code
_v1k.TextSize = (16 - 4)
_v1k.TextTruncate = Enum.TextTruncate.AtEnd
_v1k.TextXAlignment = Enum.TextXAlignment.Left
_v1k.Parent = _v1g
if _v1d then
local _v1l = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_v1l.Size = UDim2.new(0, (70 - 20), 1, 0)
_v1l.Position = UDim2.new(1, -(76 - 26), 0, 0)
_v1l.BackgroundTransparency = 1
_v1l.Text = _v1d
_v1l.TextColor3 = Color3.fromRGB((190 - 60), (138 - 3), (197 - 52))
_v1l.Font = Enum.Font.Code
_v1l.TextSize = (12 - 2)
_v1l.TextXAlignment = Enum.TextXAlignment.Right
_v1l.Parent = _v1g
end
local _v1m = _v1e
local function _v1n(_v1q)
_v1m = _v1q
local _v1r = getCurrentAccent()
local _v1s = Themes[Config.theme] or Themes.Blue
_v1h.BackgroundColor3 = _v1m and _v1r or _v1s.bgWindow
_v1i.Color = _v1m and _v1r or _v1s.border
if _v1f then
_v1f(_v1m)
end
end
_v1h.MouseButton1Click:Connect(function()
_v1n(not _v1m)
end)
_v1k.MouseButton1Click:Connect(function()
_v1n(not _v1m)
end)
table.insert(UIRegistry.checkboxes, {
box = _v1h,
stroke = _v1i,
getState = function()
return _v1m
end,
})
return {
Set = _v1n,
Get = function()
return _v1m
end,
}
end
local function addSlider(_v1t, _v1u, _v1v, _v1w, _v1x, _v1y, _v1z, _v20)
local _v21 = Instance.new(_dcoqb("PAQOFQM="))
_v21.LayoutOrder = _v1u
_v21.Size = UDim2.new(1, 0, 0, (54 - 20))
_v21.BackgroundTransparency = 1
_v21.Parent = _v1t
local _v22 = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_v22.Size = UDim2.new(1, -(80 - 18), 0, (20 - 5))
_v22.Position = UDim2.new(0, 0, 0, 0)
_v22.BackgroundTransparency = 1
_v22.Text = _v1v
_v22.TextColor3 = Color3.fromRGB((357 - 167), (209 - 14), (217 - 12))
_v22.Font = Enum.Font.Code
_v22.TextSize = (13 - 2)
_v22.TextTruncate = Enum.TextTruncate.AtEnd
_v22.TextXAlignment = Enum.TextXAlignment.Left
_v22.Parent = _v21
local _v23 = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_v23.Size = UDim2.new(0, (108 - 48), 0, (19 - 4))
_v23.Position = UDim2.new(1, -(61 - 1), 0, 0)
_v23.BackgroundTransparency = 1
_v23.Text = tostring(_v1y) .. (_v1z or "")
_v23.TextColor3 = Color3.fromRGB((340 - 105), (462 - 222), (344 - 94))
_v23.Font = Enum.Font.Code
_v23.TextSize = (20 - 9)
_v23.TextXAlignment = Enum.TextXAlignment.Right
_v23.Parent = _v21
local _v24 = Instance.new(_dcoqb("PAQOFQM="))
_v24.Size = UDim2.new(1, 0, 0, (19 - 9))
_v24.Position = UDim2.new(0, 0, 0, (32 - 12))
_v24.BackgroundColor3 = Themes.Blue.bgWindow
_v24.BorderSizePixel = 0
_v24.Parent = _v21
table.insert(UIRegistry.windowBg, _v24)
local _v25 = Instance.new(_dcoqb("Lz88DBQCDgs="))
_v25.Color = Themes.Blue.border
_v25.Thickness = 1
_v25.Parent = _v24
table.insert(UIRegistry.borders, _v25)
local _v26 = math.clamp((_v1y - _v1w) / (_v1x - _v1w), 0, 1)
local _v27 = Instance.new(_dcoqb("PAQOFQM="))
_v27.Size = UDim2.new(_v26, 0, 1, 0)
_v27.BackgroundColor3 = Themes.Blue.accent
_v27.BorderSizePixel = 0
_v27.Parent = _v24
table.insert(UIRegistry.accentBg, _v27)
local _v28 = false
local function _v29(_v2f)
local _v2g = _v24.AbsolutePosition.X
local _v2h = _v24.AbsoluteSize.X
if _v2h <= 0 then
return
end
local _v2i = math.clamp((_v2f.Position.X - _v2g) / _v2h, 0, 1)
local _v2j = math.floor(_v1w + (_v1x - _v1w) * _v2i + 0.5)
local _v2k = (_v2j - _v1w) / (_v1x - _v1w)
_v27.Size = UDim2.new(_v2k, 0, 1, 0)
_v23.Text = tostring(_v2j) .. (_v1z or "")
if _v20 then
_v20(_v2j)
end
end
_v24.InputBegan:Connect(function(_v2l)
if _v2l.UserInputType == Enum.UserInputType.MouseButton1 or _v2l.UserInputType == Enum.UserInputType.Touch then
_v28 = true
_v29(_v2l)
end
end)
UserInputService.InputEnded:Connect(function(_v2m)
if _v2m.UserInputType == Enum.UserInputType.MouseButton1 or _v2m.UserInputType == Enum.UserInputType.Touch then
_v28 = false
end
end)
UserInputService.InputChanged:Connect(function(_v2n)
if _v28 and (_v2n.UserInputType == Enum.UserInputType.MouseMovement or _v2n.UserInputType == Enum.UserInputType.Touch) then
_v29(_v2n)
end
end)
end
local function addSegmentedSelector(_v2o, _v2p, _v2q, _v2r, _v2s, _v2t)
local _v2u = Instance.new(_dcoqb("PAQOFQM="))
_v2u.LayoutOrder = _v2p
_v2u.Size = UDim2.new(1, 0, 0, (52 - 8))
_v2u.BackgroundTransparency = 1
_v2u.Parent = _v2o
local _v2v = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_v2v.Size = UDim2.new(1, 0, 0, (18 - 3))
_v2v.BackgroundTransparency = 1
_v2v.Text = _v2q
_v2v.TextColor3 = Color3.fromRGB((347 - 157), (334 - 139), (276 - 71))
_v2v.Font = Enum.Font.Code
_v2v.TextSize = (15 - 4)
_v2v.TextTruncate = Enum.TextTruncate.AtEnd
_v2v.TextXAlignment = Enum.TextXAlignment.Left
_v2v.Parent = _v2u
local _v2w = Instance.new(_dcoqb("PAQOFQM="))
_v2w.Size = UDim2.new(1, 0, 0, (38 - 14))
_v2w.Position = UDim2.new(0, 0, 0, (27 - 9))
_v2w.BackgroundTransparency = 1
_v2w.Parent = _v2u
local _v2x = _v2s
local _v2y = {}
local _v2z = #_v2r
for _v30, _v31 in ipairs(_v2r) do
local _v32 = Instance.new(_dcoqb("LhMXDCQYERoXCw=="))
_v32.Size = UDim2.new(1 / _v2z, -(7 - 3), 1, 0)
_v32.Position = UDim2.new((_v30 - 1) / _v2z, (_v30 == 1) and 0 or (3 - 1), 0, 0)
_v32.BackgroundColor3 = Themes.Blue.bgElement
_v32.BorderSizePixel = 0
_v32.Text = string.upper(tostring(_v31))
_v32.Font = Enum.Font.GothamBold
_v32.TextSize = (18 - 7)
_v32.AutoButtonColor = false
_v32.ClipsDescendants = true
_v32.Parent = _v2w
table.insert(UIRegistry.elementBg, _v32)
local st = Instance.new(_dcoqb("Lz88DBQCDgs="))
st.Thickness = 1
st.Parent = _v32
_v2y[_v31] = { btn = _v32, stroke = st }
_v32.MouseButton1Click:Connect(function()
_v2x = _v31
local _v38 = getCurrentAccent()
local _v39 = Themes[Config.theme] or Themes.Blue
for _v3a, _v3b in pairs(_v2y) do
if _v3a == _v2x then
_v3b.btn.TextColor3 = _v38
_v3b.stroke.Color = _v38
else
_v3b.btn.TextColor3 = Color3.fromRGB((224 - 59), (273 - 103), (343 - 163))
_v3b.stroke.Color = _v39.border
end
end
if _v2t then
_v2t(_v31)
end
end)
end
local function _v37(_v3c, _v3d)
for _v3e, _v3f in pairs(_v2y) do
if _v3e == _v2x then
_v3f.btn.TextColor3 = _v3c
_v3f.stroke.Color = _v3c
else
_v3f.btn.TextColor3 = Color3.fromRGB((248 - 83), (276 - 106), (316 - 136))
_v3f.stroke.Color = _v3d.border
end
end
end
table.insert(UIRegistry.segmentedGroups, { refresh = _v37 })
_v37(getCurrentAccent(), Themes[Config.theme] or Themes.Blue)
end
local function addButton(_v3g, _v3h, _v3i, _v3j)
local _v3k = Instance.new(_dcoqb("LhMXDCQYERoXCw=="))
_v3k.LayoutOrder = _v3h
_v3k.Size = UDim2.new(1, 0, 0, (32 - 6))
_v3k.BackgroundColor3 = Themes.Blue.bgElement
_v3k.BorderSizePixel = 0
_v3k.Text = _v3i
_v3k.TextColor3 = Color3.fromRGB((379 - 154), (285 - 55), (364 - 124))
_v3k.Font = Enum.Font.Code
_v3k.TextSize = (19 - 8)
_v3k.TextTruncate = Enum.TextTruncate.AtEnd
_v3k.AutoButtonColor = true
_v3k.ClipsDescendants = true
_v3k.Parent = _v3g
table.insert(UIRegistry.elementBg, _v3k)
local _v3l = Instance.new(_dcoqb("Lz8/GQIJDAAf"))
_v3l.PaddingLeft = UDim.new(0, (7 - 1))
_v3l.PaddingRight = UDim.new(0, (7 - 1))
_v3l.Parent = _v3k
local _v3m = Instance.new(_dcoqb("Lz88DBQCDgs="))
_v3m.Color = Themes.Blue.border
_v3m.Thickness = 1
_v3m.Parent = _v3k
table.insert(UIRegistry.borders, _v3m)
_v3k.MouseButton1Click:Connect(function()
if _v3j then
_v3j()
end
end)
return _v3k
end
local function addInfoLabel(_v3n, _v3o, _v3p)
local _v3q = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_v3q.LayoutOrder = _v3o
_v3q.Size = UDim2.new(1, 0, 0, (27 - 9))
_v3q.BackgroundTransparency = 1
_v3q.Text = _v3p
_v3q.TextColor3 = Color3.fromRGB((252 - 107), (178 - 23), (312 - 142))
_v3q.Font = Enum.Font.Code
_v3q.TextSize = (16 - 5)
_v3q.TextTruncate = Enum.TextTruncate.AtEnd
_v3q.TextXAlignment = Enum.TextXAlignment.Left
_v3q.Parent = _v3n
return _v3q
end
local farmLeft, farmRight = createTab(_dcoqb("OyM7N0YrJDw1"), "", 1)
local visLeft, visRight = createTab(_dcoqb("LD88LSchNg=="), "", (4 - 2))
local thmLeft, thmRight = createTab(_dcoqb("Lj4qNSM+"), "", (5 - 2))
local scanAllHalloweenDoors
local clearNeonPathPool
local forceOpenClosestDoor
local recolorNeonPath
local clearOpenedDoorsCache
local resetActiveNavigationState
local restoreCharacterPhysics
local secAutoFarm = createSection(farmLeft, _dcoqb("OwMbF0YrBBwV"), 1)
local secDoorOpen = createSection(farmLeft, _dcoqb("PhkACkYhCg0TRQoPHlYuDRICRSEIAAUECA=="), (4 - 2))
local secMovement = createSection(farmRight, _dcoqb("GwMbF0YLBBwVRTgRHxML"), 1)
local secSafety = createSection(farmRight, _dcoqb("KhoOAQMfRS8OCgIFGxgMHUYMCwpYJAUVE1YuPi0="), (4 - 2))
local instantToggleCtrl
addToggle(secAutoFarm, 1, _dcoqb("PxgOGgoIRS8NEQRBPBcdFQ=="), _dcoqb("ITAuKisw"), false, function(_v3r)
Config.autoFarmEnabled = _v3r
if _v3r then
Config.instantOpenEnabled = true
if instantToggleCtrl then
instantToggleCtrl.Set(true)
end
if resetActiveNavigationState then
resetActiveNavigationState()
end
if scanAllHalloweenDoors then
scanAllHalloweenDoors()
end
else
if resetActiveNavigationState then
resetActiveNavigationState()
end
if clearNeonPathPool then
clearNeonPathPool()
end
if restoreCharacterPhysics then
restoreCharacterPhysics()
end
statusTopLabel.Text = _dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWDQIBAoB")
end
end)
addSlider(secAutoFarm, (3 - 1), _dcoqb("KQIOChJNNQ8MDUs2EhMBWDIECAsK"), 1, (52 - 22), Config.startTimerThreshold, _dcoqb("CQ=="), function(_v3s)
Config.startTimerThreshold = _v3s
end)
addToggle(secAutoFarm, (6 - 3), _dcoqb("OwYfCgkMBgZYIAoTFg9PUDEMDBpYMQIMHwRPSBVE"), _dcoqb("ISEuMTIw"), false, function(_v3t)
Config.approachEarlyWaitTimer = _v3t
end)
addToggle(secAutoFarm, (8 - 4), _dcoqb("LRcGDEY4CxoRCUsuChMBHQJNIQEXF0slEwUOCBYIBBwL"), _dcoqb("ITogOy0w"), Config.waitUntilDoorDisappears, function(_v3u)
Config.waitUntilDoorDisappears = _v3u
end)
instantToggleCtrl = addToggle(secDoorOpen, 1, _dcoqb("MxgcDAcDEU4oFwQMCgJPUFYeRSYXCQ9I"), _dcoqb("ITMy"), false, function(_v3v)
Config.instantOpenEnabled = _v3v
if scanAllHalloweenDoors then
scanAllHalloweenDoors()
end
end)
addToggle(secDoorOpen, (4 - 2), _dcoqb("OwMbF0siFQsWRSUEGwQNAUYsAxodF0s1ExsKCg=="), _dcoqb("ITc6LCkw"), Config.autoOpenNearbyWhenReady, function(_v3w)
Config.autoOpenNearbyWhenReady = _v3w
end)
addSlider(secDoorOpen, (5 - 2), _dcoqb("KBcfEQJNIE4sBBtBORkaFhI="), 1, (29 - 11), Config.tapCount, _dcoqb("Ag=="), function(_v3x)
Config.tapCount = _v3x
end)
addSlider(secDoorOpen, (8 - 4), _dcoqb("NQYKFgMJRT4XFgIVExkBWCsICAEKHA=="), (10 - 5), (65 - 25), Config.openedDoorMemoryTime, _dcoqb("CQ=="), function(_v3y)
Config.openedDoorMemoryTime = _v3y
end)
addButton(secDoorOpen, (9 - 4), _dcoqb("PBkdGwNNKh4dC0svHxcdHRUZRTwdBA8YWjIAFxQ="), function()
if forceOpenClosestDoor then
forceOpenClosestDoor()
end
end)
addButton(secDoorOpen, (11 - 5), _dcoqb("KBMcHRJNKh4dCw4FWjIAFxQeRSMdCAQTAw=="), function()
if clearOpenedDoorsCache then
clearOpenedDoorsCache()
end
end)
addSegmentedSelector(secMovement, 1, _dcoqb("NxkZHQsICxpYNh8YFhNPUCABHEEvBAcKUw=="), { _dcoqb("HBoW"), _dcoqb("DRcDEw==") }, Config.movementMode, function(_v3z)
Config.movementMode = _v3z
if restoreCharacterPhysics then
restoreCharacterPhysics()
end
if resetActiveNavigationState then
resetActiveNavigationState()
end
end)
addSlider(secMovement, (3 - 1), _dcoqb("KQYKHQI="), (21 - 5), (408 - 188), Config.cframeSpeed, _dcoqb("WgUbVxU="), function(_v40)
Config.cframeSpeed = _v40
end)
addSlider(secMovement, (5 - 2), _dcoqb("Mh8IEEssCRoRER4FH1YpFB9NLQsRAgMV"), (7 - 1), (189 - 59), math.floor(Config.flyHeight), _dcoqb("WgUb"), function(_v41)
Config.flyHeight = _v41
if Config.movementMode == _dcoqb("HBoW") and resetActiveNavigationState then
resetActiveNavigationState()
end
end)
addToggle(secSafety, 1, _dcoqb("PxgOGgoIRU45Cx8IWjcpMw=="), _dcoqb("ITcpMzs="), Config.antiAfkEnabled, function(_v42)
Config.antiAfkEnabled = _v42
if antiAfkStatusLabel then
antiAfkStatusLabel.Text = _v42
and string.format(_dcoqb("OxgbEUssIyVCRSoCDh8ZHUZFNRsUFg4SQFZKHE8="), antiAfkActionsCount)
or _dcoqb("OxgbEUssIyVCRS8ICRcNFAMJ")
end
end)
antiAfkStatusLabel = addInfoLabel(secSafety, (4 - 2), _dcoqb("OxgbEUssIyVCRSoCDh8ZHUZFNRsUFg4SQFZfUQ=="))
addToggle(secSafety, (4 - 1), _dcoqb("OwAAEQJNNQIZHA4TCVYgFkY9BBoQ"), _dcoqb("ITc5Ny8pOA=="), Config.avoidPlayersEnabled, function(_v43)
Config.avoidPlayersEnabled = _v43
end)
addToggle(secSafety, (6 - 2), _dcoqb("KBMbCgMMEU4vDQ4PWj8LFAM="), _dcoqb("ISUuPiMw"), Config.safeRetreatEnabled, function(_v44)
Config.safeRetreatEnabled = _v44
if resetActiveNavigationState then
resetActiveNavigationState()
end
end)
addSlider(secSafety, (6 - 1), _dcoqb("OwAAEQJNNQIZHA4TCVY9GQIEEB0="), (7 - 3), (27 - 1), Config.playerAvoidRadius, _dcoqb("WgUb"), function(_v45)
Config.playerAvoidRadius = _v45
end)
addSlider(secSafety, (10 - 4), _dcoqb("KRcJHUY/ABoKAAoVWjIGCxIMCw0d"), (66 - 31), (246 - 96), Config.safeRetreatDistance, _dcoqb("WgUb"), function(_v46)
Config.safeRetreatDistance = _v46
end)
local secEsp = createSection(visLeft, _dcoqb("MhcDFAkaAAsWIQQOCFYqKzY="), 1)
local secNeon = createSection(visRight, _dcoqb("NBMAFkY+DQEKEQ4SDlY/GRIFRTgRFh4AFh8VHRQ="), 1)
addToggle(secEsp, 1, _dcoqb("PxgOGgoIRSoXChlBMh8IEAoEAgYMRSgJGxsc"), _dcoqb("ITM8KDs="), false, function(_v47)
Config.espEnabled = _v47
if scanAllHalloweenDoors then
scanAllHalloweenDoors()
end
end)
addToggle(secEsp, (3 - 1), _dcoqb("KR4AD0YpCgEKRT8IFxMdWAcDAU48DBgVGxgMHQ=="), _dcoqb("ISIuPzs="), true, function(_v48)
Config.espShowTimer = _v48
if scanAllHalloweenDoors then
scanAllHalloweenDoors()
end
end)
addToggle(secNeon, 1, _dcoqb("PgQOD0YjAAEWRTsADh5PLAlNIQEXFw=="), nil, true, function(_v49)
Config.drawNeonPath = _v49
if not _v49 and clearNeonPathPool then
clearNeonPathPool()
end
end)
addToggle(secNeon, (4 - 2), _dcoqb("KQ8BG0YjAAEWRTwIDh5PNQMDEE4sDQ4MHw=="), nil, false, function(_v4a)
Config.syncNeonWithTheme = _v4a
if _v4a and recolorNeonPath then
recolorNeonPath(getCurrentAccent())
end
end)
addSlider(secNeon, (4 - 1), _dcoqb("OQMcDAkARSAdCgVBORkDFxRNLRsd"), 0, (676 - 316), (384 - 169), _dcoqb("yg=="), function(_v4b)
local _v4c = Color3.fromHSV(_v4b / (646 - 286), 0.85, 0.98)
Config.neonColor = _v4c
if not Config.syncNeonWithTheme and recolorNeonPath then
recolorNeonPath(_v4c)
end
end)
addSlider(secNeon, (8 - 4), _dcoqb("NBMAFkY9BBoQRT8JExUEFgMeFg=="), (4 - 2), (14 - 4), (6 - 1), "", function(_v4d)
Config.neonThickness = _v4d * 0.1
end)
for idx, preset in ipairs(NeonPresets) do
addButton(secNeon, (8 - 4) + idx, _dcoqb("KgQKCwMZX04=") .. preset.name, function()
Config.syncNeonWithTheme = false
Config.neonColor = preset.color
if recolorNeonPath then
recolorNeonPath(preset.color)
end
end)
end
local secThemes = createSection(thmLeft, _dcoqb("KRMDHQUZRSA9PSQzO1gsO0Y5DQsVAA=="), 1)
local secRainbow = createSection(thmRight, _dcoqb("KBcGFgQCEk4tLEsyHwIbEQgKFg=="), 1)
local themeDescriptions = {
{ id = _dcoqb("PQQKHQg="), name = _dcoqb("S1hPPxQIAAA=") },
{ id = _dcoqb("OBoaHQ=="), name = _dcoqb("SFhPOgoYAA==") },
{ id = _dcoqb("PRkDHA=="), name = _dcoqb("SVhPPwkBAQ==") },
{ id = _dcoqb("KBML"), name = _dcoqb("TlhPKgMJ") },
{ id = _dcoqb("KBcGFgQCEg=="), name = _dcoqb("T1hPKgcECwwXEg==") },
{ id = _dcoqb("PQQKAQ=="), name = _dcoqb("TFhPPxQIHA==") },
}
for idx, tData in ipairs(themeDescriptions) do
addButton(secThemes, idx, tData.name, function()
Config.theme = tData.id
refreshThemeColors()
if Config.syncNeonWithTheme and recolorNeonPath then
recolorNeonPath(getCurrentAccent())
end
end)
end
addSlider(secRainbow, 1, _dcoqb("KBcGFgQCEk4rFQ4EHg=="), (4 - 2), (49 - 24), (12 - 4), "", function(_v4e)
Config.rainbowSpeed = _v4e * 0.01
end)



local doorHighlights = {}
local doorBillboards = {}
local segmentPool = {}
local nodePool = {}
clearNeonPathPool = function()
for _, _v4f in ipairs(segmentPool) do
_v4f.Transparency = 1
_v4f.Parent = nil
end
for _, _v4g in ipairs(nodePool) do
_v4g.Transparency = 1
_v4g.Parent = nil
end
end
recolorNeonPath = function(_v4h)
for _, _v4i in ipairs(segmentPool) do
_v4i.Color = _v4h
end
for _, _v4j in ipairs(nodePool) do
_v4j.Color = _v4h
end
end
local function getOrCreateSegment(_v4k)
local _v4l = segmentPool[_v4k]
if not _v4l then
_v4l = Instance.new(_dcoqb("KhcdDA=="))
_v4l.Name = _dcoqb("NBMXFxQMJwsZCDQ=") .. _v4k
_v4l.Anchored = true
_v4l.CanCollide = false
_v4l.CanQuery = false
_v4l.CanTouch = false
_v4l.CastShadow = false
_v4l.Material = Enum.Material.Neon
segmentPool[_v4k] = _v4l
end
return _v4l
end
local function getOrCreateNode(_v4m)
local _v4n = nodePool[_v4m]
if not _v4n then
_v4n = Instance.new(_dcoqb("KhcdDA=="))
_v4n.Name = _dcoqb("NBMXFxQMKwEcADQ=") .. _v4m
_v4n.Shape = Enum.PartType.Ball
_v4n.Anchored = true
_v4n.CanCollide = false
_v4n.CanQuery = false
_v4n.CanTouch = false
_v4n.CastShadow = false
_v4n.Material = Enum.Material.Neon
nodePool[_v4m] = _v4n
end
return _v4n
end



local openedDoorRecords = {}
local openedPositionRecords = {}
local unreachableDoorRecords = {}
local lockedDoorInstance = nil
local lockedDoorInitialPos = nil
local lockedDoorOpenedStart = 0
local lockedDoorHasBeenTapped = false
local isTappingDoor = false
local tappingStartedAt = 0
local activeWaypoints = {}
local currentWpIndex = 1
local lastPathTargetDoor = nil
local isComputingPath = false
local pathComputeStartedAt = 0
local lastPathComputeTime = 0
local pathComputeGeneration = 0
local cachedRetreatSpot = nil
local lastRetreatComputeTime = 0
local lastEspScanTime = 0
local lastGarbageCollectTime = 0
local lastProgressPos = nil
local lastProgressTime = os.clock()
local stuckStrikes = 0
local cornerEscapeWp = nil
local cornerEscapeUntil = 0
restoreCharacterPhysics = function()
local _v4o = localPlayer.Character
if _v4o then
local _v4p = _v4o:FindFirstChildOfClass(_dcoqb("MgMCGQgCDAo="))
if _v4p then
_v4p.PlatformStand = false
_v4p:Move(Vector3.zero, false)
end
local _v4q = _v4o:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
if _v4q then
_v4q.AssemblyLinearVelocity = Vector3.zero
_v4q.AssemblyAngularVelocity = Vector3.zero
end
end
end
clearOpenedDoorsCache = function()
table.clear(openedDoorRecords)
table.clear(openedPositionRecords)
table.clear(unreachableDoorRecords)
lockedDoorInstance = nil
lockedDoorInitialPos = nil
lockedDoorOpenedStart = 0
lockedDoorHasBeenTapped = false
end
resetActiveNavigationState = function()
pathComputeGeneration = pathComputeGeneration + 1
isComputingPath = false
activeWaypoints = {}
currentWpIndex = 1
lastPathTargetDoor = nil
cachedRetreatSpot = nil
lastProgressPos = nil
lastProgressTime = os.clock()
stuckStrikes = 0
cornerEscapeWp = nil
cornerEscapeUntil = 0
end
local function cleanupDeadReferences()
local _v4r = os.clock()
for _v4s, _v4t in pairs(doorHighlights) do
if not _v4s or not _v4s.Parent or not _v4s:IsDescendantOf(Workspace) then
if _v4t and _v4t.Parent then
_v4t:Destroy()
end
doorHighlights[_v4s] = nil
end
end
for _v4s, _v4u in pairs(doorBillboards) do
if not _v4s or not _v4s.Parent or not _v4s:IsDescendantOf(Workspace) then
if _v4u and _v4u.Parent then
_v4u:Destroy()
end
doorBillboards[_v4s] = nil
end
end
for _v4s, _v4v in pairs(openedDoorRecords) do
if not _v4s or not _v4s.Parent or (_v4r - _v4v.openedAt) > (Config.openedDoorMemoryTime + (25 - 10)) then
openedDoorRecords[_v4s] = nil
end
end
for _v4s, _v4w in pairs(unreachableDoorRecords) do
if not _v4s or not _v4s.Parent or _v4r >= _v4w then
unreachableDoorRecords[_v4s] = nil
end
end
for _v4x = #openedPositionRecords, 1, -1 do
if (_v4r - openedPositionRecords[_v4x].openedAt) >= (Config.openedDoorMemoryTime or (38 - 18)) then
table.remove(openedPositionRecords, _v4x)
end
end
end
local function getAllHalloweenDoors()
local _v4y = {}
local _v4z = {}
local _v50 = Workspace:FindFirstChild(_dcoqb("PxAJHQUZFg=="))
local _v51 = _v50 or Workspace
for _, _v52 in ipairs(_v51:GetChildren()) do
if _v52.Name == _dcoqb("MhcDFAkaAAsWIQQOCA==") and not _v4z[_v52] then
_v4z[_v52] = true
table.insert(_v4y, _v52)
end
end
if _v50 and #_v4y == 0 then
for _, _v53 in ipairs(_v50:GetDescendants()) do
if _v53.Name == _dcoqb("MhcDFAkaAAsWIQQOCA==") and (_v53:IsA(_dcoqb("NxkLHQo=")) or _v53:IsA(_dcoqb("OBccHTYMFxo="))) and not _v4z[_v53] then
_v4z[_v53] = true
table.insert(_v4y, _v53)
end
end
end
return _v4y
end
local function findPromptsForDoor(_v54)
local _v55 = {}
local _v56 = {}
if not _v54 or not _v54.Parent then
return _v55
end
local function _v57(_v59)
if _v59 and _v59:IsA(_dcoqb("KgQAAA8ADBoBNRkOFwYb")) and not _v56[_v59] then
_v56[_v59] = true
table.insert(_v55, _v59)
end
end
_v57(_v54)
for _, _v58 in ipairs(_v54:GetDescendants()) do
_v57(_v58)
end
if #_v55 == 0 and _v54.Parent and _v54.Parent ~= Workspace and _v54.Parent.Name ~= _dcoqb("PxAJHQUZFg==") then
for _, _v58 in ipairs(_v54.Parent:GetDescendants()) do
_v57(_v58)
end
end
return _v55
end
local function getDoorExactTargetPos(_v5a)
if not _v5a or not _v5a.Parent then
return nil
end
local _v5b = findPromptsForDoor(_v5a)
for _, _v5c in ipairs(_v5b) do
local _v5d = _v5c.Parent
if _v5d then
if _v5d:IsA(_dcoqb("OwIbGQUFCAsWEQ==")) then
return _v5d.WorldPosition
elseif _v5d:IsA(_dcoqb("OBccHTYMFxo=")) then
return _v5d.Position
end
end
end
if _v5a:IsA(_dcoqb("OBccHTYMFxo=")) then
return _v5a.Position
end
if _v5a:IsA(_dcoqb("NxkLHQo=")) and _v5a.PrimaryPart then
return _v5a.PrimaryPart.Position
end
local _v5e = Vector3.zero
local _v5f = 0
local _v5g = math.huge
for _, _v5h in ipairs(_v5a:GetDescendants()) do
if _v5h:IsA(_dcoqb("OBccHTYMFxo=")) then
_v5e = _v5e + _v5h.Position
_v5f = _v5f + 1
if _v5h.Position.Y < _v5g then
_v5g = _v5h.Position.Y
end
end
end
if _v5f > 0 then
local _v5i = _v5e / _v5f
return Vector3.new(_v5i.X, _v5g + 2.5, _v5i.Z)
end
local _v5j, _v5k = pcall(function()
return _v5a:GetPivot()
end)
if _v5j and _v5k then
return _v5k.Position
end
return nil
end
local function hasDoorDisappeared(_v5l, _v5m)
if not _v5l or not _v5l.Parent or not _v5l:IsDescendantOf(Workspace) then
return true
end
local _v5n = 0
if _v5l:IsA(_dcoqb("OBccHTYMFxo=")) and _v5l.Transparency < 0.95 then
_v5n = _v5n + 1
end
for _, _v5o in ipairs(_v5l:GetDescendants()) do
if _v5o:IsA(_dcoqb("OBccHTYMFxo=")) and _v5o.Transparency < 0.95 then
_v5n = _v5n + 1
break
end
end
if _v5n == 0 then
return true
end
if _v5m then
local _v5p = getDoorExactTargetPos(_v5l)
if not _v5p or (_v5p - _v5m).Magnitude > 10.0 then
return true
end
end
return false
end
local function getDoorTimerSeconds(_v5q)
if not _v5q or not _v5q.Parent then
return 0
end
local _v5r = nil
local _v5s = _v5q:GetDescendants()
table.insert(_v5s, _v5q)
for _, _v5t in ipairs(_v5s) do
for _v5u, _v5v in pairs(_v5t:GetAttributes()) do
local _v5w = string.lower(_v5u)
if string.find(_v5w, _dcoqb("Dh8CHRQ=")) or string.find(_v5w, _dcoqb("GRkAFAICEgA=")) or string.find(_v5w, _dcoqb("Dh8CHQ==")) or string.find(_v5w, _dcoqb("GRI=")) then
if type(_v5v) == _dcoqb("FAMCGgMf") and _v5v >= 0 and _v5v <= (972 - 372) then
_v5r = math.min(_v5r or math.huge, _v5v)
end
end
end
if _v5t:IsA(_dcoqb("NAMCGgMfMw8UEA4=")) or _v5t:IsA(_dcoqb("MxgbLgcBEAs=")) then
local _v5x = string.lower(_v5t.Name)
if string.find(_v5x, _dcoqb("Dh8CHRQ=")) or string.find(_v5x, _dcoqb("GRkAFAICEgA=")) or string.find(_v5x, _dcoqb("GRkaFhIJChkW")) or string.find(_v5x, _dcoqb("Dh8CHQ==")) or string.find(_v5x, _dcoqb("GRI=")) then
local _v5y = _v5t.Value
if type(_v5y) == _dcoqb("FAMCGgMf") and _v5y >= 0 and _v5y <= (904 - 304) then
_v5r = math.min(_v5r or math.huge, _v5y)
end
end
elseif _v5t:IsA(_dcoqb("KQIdEQgKMw8UEA4=")) then
local _v5z = _v5t.Value or ""
local _v60, s = string.match(_v5z, _dcoqb("UlMLU09IFkRCQBhLUlMLU08="))
if _v60 and s then
local _v61 = tonumber(_v60) * (98 - 38) + tonumber(s)
if _v61 >= 0 and _v61 <= (722 - 122) then
_v5r = math.min(_v5r or math.huge, _v61)
end
else
local _v62 = string.match(_v5z, _dcoqb("UlMLU0NDWkscT0I="))
if _v62 then
local _v5y = tonumber(_v62)
if _v5y and _v5y >= 0 and _v5y <= (635 - 35) then
_v5r = math.min(_v5r or math.huge, _v5y)
end
end
end
elseif _v5t:IsA(_dcoqb("LhMXDCoMBwsU")) and _v5t.Visible and _v5t.Name ~= _dcoqb("MxgJFzIIHRo=") then
local _v63 = _v5t.Text or ""
local _v64 = string.gsub(_v63, _dcoqb("Ri0xRjtGWw=="), "")
local _v65 = string.lower(_v64)
local _v60, s = string.match(_v64, _dcoqb("UlMLU09IFkRCQBhLUlMLU08="))
if _v60 and s then
local _v61 = tonumber(_v60) * (114 - 54) + tonumber(s)
if _v61 >= 0 and _v61 <= (903 - 303) then
_v5r = math.min(_v5r or math.huge, _v61)
end
else
local _v66 = string.match(_v65, _dcoqb("UlMLU0NDWkscT0JECVwc"))
or string.match(_v65, _dcoqb("ExhKC0xFQApTQEVeXxJFUQ=="))
or string.match(_v65, _dcoqb("QFMcUk5IAUVdS1REHlxG"))
or string.match(_v65, _dcoqb("JFMcUk5IAUVdS1REHlxGXRVHQQ=="))
if _v66 then
local _v5y = tonumber(_v66)
if _v5y and _v5y >= 0 and _v5y <= (605 - 5) then
_v5r = math.min(_v5r or math.huge, _v5y)
end
elseif string.find(_v65, _dcoqb("CBMOHB8=")) or string.find(_v65, _dcoqb("CgQKCxU=")) or _v65 == _dcoqb("FQYKFg==") or _v65 == _dcoqb("DxgDFwUGAAo=") then
if not string.find(_v65, _dcoqb("XxI=")) then
_v5r = math.min(_v5r or math.huge, 0)
end
end
end
end
end
if _v5r ~= nil then
return math.max(0, _v5r)
end
return 0
end
local function isDoorAlreadyOpenedRecently(_v67, _v68, _v69)
if hasDoorDisappeared(_v67, nil) then
return true
end
local _v6a = os.clock()
local _v6b = Config.openedDoorMemoryTime or (36 - 16)
local _v6c = openedDoorRecords[_v67]
if _v6c then
if _v69 > 4.0 then
_v6c.sawNewCooldown = true
end
if _v6c.sawNewCooldown and _v69 <= 0.5 then
openedDoorRecords[_v67] = nil
elseif (_v6a - _v6c.openedAt) < _v6b then
return true
else
openedDoorRecords[_v67] = nil
end
end
if _v68 then
for _v6d = #openedPositionRecords, 1, -1 do
local _v6e = openedPositionRecords[_v6d]
local _v6f = _v6a - _v6e.openedAt
if _v6f >= _v6b then
table.remove(openedPositionRecords, _v6d)
else
local _v6g = (_v68 - _v6e.pos).Magnitude
if _v6g < 5.0 and _v69 <= 3.0 then
return true
end
end
end
end
return false
end
local function markDoorAsOpened(_v6h, _v6i)
local _v6j = os.clock()
if _v6h then
openedDoorRecords[_v6h] = {
openedAt = _v6j,
sawNewCooldown = false,
}
end
if _v6i then
table.insert(openedPositionRecords, {
pos = _v6i,
openedAt = _v6j,
})
end
end



local function isPartOfHalloweenDoor(_v6k)
local _v6l = _v6k
while _v6l and _v6l ~= Workspace do
if _v6l.Name == _dcoqb("MhcDFAkaAAsWIQQOCA==") then
return true
end
_v6l = _v6l.Parent
end
return false
end
local function makeObstacleRayParams(_v6m)
local _v6n = RaycastParams.new()


local _v6o = { neonFolder }
if localPlayer.Character then
table.insert(_v6o, localPlayer.Character)
end
if _v6m then
table.insert(_v6o, _v6m)
end
for _, _v6p in ipairs(Players:GetPlayers()) do
if _v6p.Character then
table.insert(_v6o, _v6p.Character)
end
end
_v6n.FilterDescendantsInstances = _v6o
_v6n.FilterType = Enum.RaycastFilterType.Exclude
_v6n.IgnoreWater = true
return _v6n
end
local function raycastSolidOnly(_v6q, _v6r, _v6s, _v6t)
local _v6u = _v6q
local _v6v = _v6r
for _ = 1, (12 - 4) do
local _v6w = Workspace:Raycast(_v6u, _v6v, _v6s)
if not _v6w then
return nil
end
local _v6x = _v6w.Instance
local _v6y = _v6x and _v6x.CanCollide and _v6x.Transparency < 0.98 and not isPartOfHalloweenDoor(_v6x)
if _v6y and _v6t and _v6w.Normal.Y > 0.65 then
_v6y = false
end
if _v6y then
return _v6w
end
local _v6z = (_v6w.Position - _v6u).Magnitude
local _v70 = _v6v.Magnitude - _v6z - 0.05
if _v70 <= 0.05 then
return nil
end
local _v71 = _v6v.Unit
_v6u = _v6w.Position + _v71 * 0.05
_v6v = _v71 * _v70
end
return nil
end
local function getGroundPosition(_v72, _v73)
local _v74 = makeObstacleRayParams(nil)
local _v75 = _v73 or 3.0
local _v76 = raycastSolidOnly(_v72, Vector3.new(0, 3.8, 0), _v74, false)
local _v77 = _v72.Y + 3.0
if _v76 then
_v77 = math.max(_v72.Y, _v76.Position.Y - 0.4)
end
local _v78 = raycastSolidOnly(Vector3.new(_v72.X, _v77, _v72.Z), Vector3.new(0, -(508 - 208), 0), _v74, false)
if _v78 then
return Vector3.new(_v72.X, _v78.Position.Y + _v75, _v72.Z), true, _v78.Position.Y
end
return Vector3.new(_v72.X, _v72.Y, _v72.Z), false, _v72.Y - _v75
end
local function isPointClear3D(_v79, _v7a, _v7b)
local _v7c = _v7b or 1.35
local _v7d = makeObstacleRayParams(_v7a)
local _v7e = {
Vector3.new(_v7c, 0, 0),
Vector3.new(-_v7c, 0, 0),
Vector3.new(0, 0, _v7c),
Vector3.new(0, 0, -_v7c),
Vector3.new(0, 1.9, 0),
Vector3.new(0, -1.6, 0),
Vector3.new(_v7c * 0.7, 0, _v7c * 0.7),
Vector3.new(_v7c * 0.7, 0, -_v7c * 0.7),
Vector3.new(-_v7c * 0.7, 0, _v7c * 0.7),
Vector3.new(-_v7c * 0.7, 0, -_v7c * 0.7),
}
for _, d in ipairs(_v7e) do
local _v7f = (d.Y == 0)
local _v7g = raycastSolidOnly(_v79, d, _v7d, _v7f)
if _v7g then
return false, _v7g
end
end
return true, nil
end
local function isBoxClear3D(_v7h, _v7i, _v7j, _v7k, _v7l)
local _v7m = _v7i - _v7h
local _v7n = _v7m.Magnitude
if _v7n < 0.2 then
return true, nil
end
local _v7o = makeObstacleRayParams(_v7j)
local _v7p = _v7m / _v7n
local _v7q = _v7k or 1.25

local _v7r = (_v7l == true) and (math.abs(_v7p.Y) < 0.25)

local _v7s = nil
pcall(function()
local _v82 = CFrame.lookAt(_v7h, _v7i)
local _v83 = Vector3.new(_v7q * 1.6, 3.0, 0.35)
local _v84 = Workspace:Blockcast(_v82, _v83, _v7m, _v7o)
if _v84 and _v84.Instance and _v84.Instance.CanCollide and _v84.Instance.Transparency < 0.98 and not isPartOfHalloweenDoor(_v84.Instance) then
if not (_v7r and _v84.Normal.Y > 0.65) then
_v7s = _v84
end
end
end)
if _v7s then
return false, _v7s
end

local _v7w = math.abs(_v7p.Y) < 0.92 and Vector3.new(0, 1, 0) or Vector3.new(1, 0, 0)
local _v7x = _v7p:Cross(_v7w).Unit
local _v7y = _v7x:Cross(_v7p).Unit
local _v7z = {
Vector3.zero,
_v7x * _v7q,
-_v7x * _v7q,
_v7y * 1.35,
-_v7y * 0.95,
_v7x * (_v7q * 0.8) + _v7y * 1.1,
-_v7x * (_v7q * 0.8) + _v7y * 1.1,
}
for _, _v80 in ipairs(_v7z) do
local _v81 = raycastSolidOnly(_v7h + _v80, _v7m, _v7o, _v7r)
if _v81 then
return false, _v81
end
end
return true, nil
end
local function isSkyColumnClear(_v85, _v86, _v87)
if _v86 <= _v85.Y + 0.5 then
return isPointClear3D(_v85, _v87, 1.2)
end
local _v88 = Vector3.new(_v85.X, _v86, _v85.Z)
local _v89 = isPointClear3D(_v88, _v87, 1.2)
if not _v89 then
return false
end
local _v8a = isBoxClear3D(_v85, _v88, _v87, 1.2, false)
return _v8a
end



local function getOtherPlayerPositions()
local _v8b = {}
for _, _v8c in ipairs(Players:GetPlayers()) do
if _v8c ~= localPlayer and _v8c.Character then
local _v8d = _v8c.Character:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
local _v8e = _v8c.Character:FindFirstChildOfClass(_dcoqb("MgMCGQgCDAo="))
if _v8d and (not _v8e or _v8e.Health > 0) then
table.insert(_v8b, _v8d.Position)
end
end
end
return _v8b
end
local function getMinDistanceToPlayers(_v8f, _v8g)
local _v8h = math.huge
for _, _v8i in ipairs(_v8g) do
local d = (_v8f - _v8i).Magnitude
if d < _v8h then
_v8h = d
end
end
return _v8h
end
local function computeBoundedPlayerAvoidDir(_v8j, _v8k, _v8l, _v8m)
if not Config.avoidPlayersEnabled or Config.playerAvoidRadius <= 0 then
return _v8k, false
end
local _v8n = _v8l and (_v8l - _v8j).Magnitude or math.huge
if _v8n <= 6.5 then
return _v8k, false
end
local _v8o = getOtherPlayerPositions()
if #_v8o == 0 then
return _v8k, false
end
local _v8p = (Config.movementMode == _dcoqb("HBoW"))
local _v8q = Config.playerAvoidRadius
local _v8r = _v8q + 3.0
local _v8s = Vector3.zero
local _v8t = false
for _, _v8u in ipairs(_v8o) do
local _v8v = _v8l and (_v8u - _v8l).Magnitude or math.huge
if _v8v > 4.5 then
local _v8w = _v8j - _v8u
local _v8x = Vector3.new(_v8w.X, 0, _v8w.Z)
local _v8y = _v8x.Magnitude
local _v8z = _v8j.Y - _v8u.Y
local _v90 = _v8p and (math.abs(_v8z) < 7.5) or (math.abs(_v8z) < 9.0)
if _v8y < _v8r and _v90 then
_v8t = true
local _v91 = (_v8y > 0.05) and _v8x.Unit or Vector3.new(1, 0, 0)
local _v92 = Vector3.new(-_v91.Z, 0, _v91.X)
local _v93 = Vector3.new(_v91.Z, 0, -_v91.X)
local _v94 = (_v92:Dot(_v8k) >= _v93:Dot(_v8k)) and _v92 or _v93
local _v95 = math.clamp((_v8r - _v8y) / math.max(_v8q, 1), 0.15, 1.0)
if _v8p then
_v8s = _v8s + (_v94 * 0.45 + Vector3.new(0, 0.85, 0)) * _v95
else
_v8s = _v8s + (_v94 * 0.85 + _v91 * 0.35) * _v95
end
end
end
end
if not _v8t or _v8s.Magnitude < 0.05 then
return _v8k, false
end
local _v96 = (_v8k + _v8s).Unit
if _v96:Dot(_v8k) < 0.35 then
local _v97 = Vector3.new(-_v8k.Z, 0, _v8k.X)
local _v98 = (_v8s:Dot(_v97) >= 0) and 1 or -1
_v96 = (_v8k * 0.65 + _v97 * (0.75 * _v98)).Unit
end
if not _v8p then
local _v99 = Vector3.new(_v96.X, 0, _v96.Z)
if _v99.Magnitude > 0.05 then
_v96 = _v99.Unit
end
end
local _v9a, _ = isBoxClear3D(_v8j, _v8j + _v96 * 3.8, _v8m, 1.1, not _v8p)
if _v9a then
return _v96, true
end
return _v8k, false
end



local function findBestDoorStandPoint(_v9b, _v9c, _v9d)
local _v9e = makeObstacleRayParams(_v9b)
local _v9f = getOtherPlayerPositions()
local _v9g = {}
local _v9h = _v9b:IsA(_dcoqb("OBccHTYMFxo=")) and _v9b
or (_v9b:IsA(_dcoqb("NxkLHQo=")) and (_v9b.PrimaryPart or _v9b:FindFirstChildWhichIsA(_dcoqb("OBccHTYMFxo="), true)))
if _v9h then
local _v9i = _v9h.CFrame
for _, _v9j in ipairs({ _v9i.LookVector, -_v9i.LookVector, _v9i.RightVector, -_v9i.RightVector }) do
local _v9k = Vector3.new(_v9j.X, 0, _v9j.Z)
if _v9k.Magnitude > 0.1 then
table.insert(_v9g, _v9k.Unit)
end
end
end
for _v9l = 0, (16 - 1) do
local _v9m = math.rad(_v9l * 22.5)
table.insert(_v9g, Vector3.new(math.cos(_v9m), 0, math.sin(_v9m)))
end
local _v9n = nil
local _v9o = math.huge
local _v9p = Vector3.new(_v9c.X, _v9c.Y + 0.8, _v9c.Z)
for _, _v9q in ipairs({ 2.4, 3.2, 4.0 }) do
for _, _v9r in ipairs(_v9g) do

local _v9s = raycastSolidOnly(_v9p, _v9r * _v9q, _v9e, true)
if not _v9s then
local _v9t = _v9c + _v9r * _v9q
local _v9u, _v9v = getGroundPosition(_v9t, 3.0)
local _v9w = (_v9v and math.abs(_v9u.Y - _v9c.Y) <= 6.0)
and _v9u
or Vector3.new(_v9t.X, _v9c.Y + 0.6, _v9t.Z)
local _v9x = isPointClear3D(_v9w, _v9b, 1.05)
local _v9y = not raycastSolidOnly(_v9w, _v9p - _v9w, _v9e, true)
if _v9x and _v9y then
local _v9z = (_v9w - _v9d).Magnitude
local _va0 = 0
if Config.avoidPlayersEnabled and #_v9f > 0 then
local _va1 = getMinDistanceToPlayers(_v9w, _v9f)
if _va1 < Config.playerAvoidRadius then
_va0 = (Config.playerAvoidRadius - _va1) * 10.0
end
end
local _va2 = _v9z + _va0
if _va2 < _v9o then
_v9o = _va2
_v9n = _v9w
end
end
end
end
if _v9n then
break
end
end
return _v9n or getGroundPosition(_v9c, 3.0)
end



local function drawNeonPathSmooth(_va3, _va4, _va5, _va6)
if not Config.drawNeonPath then
clearNeonPathPool()
return
end
local _va7 = {}
local _va8 = (Config.movementMode == _dcoqb("HBoW"))
if _va8 then
table.insert(_va7, _va3)
if _va4 and #_va4 > 0 then
local _va9 = math.clamp(_va5 or 1, 1, #_va4)
for _vaa = _va9, #_va4 do
local _vab = _va4[_vaa]
local _vac = _va7[#_va7]
if (_vab - _vac).Magnitude > 0.6 then
table.insert(_va7, _vab)
end
end
end
if _va6 then
local _vac = _va7[#_va7]
if not _vac or (_va6 - _vac).Magnitude > 0.5 then
table.insert(_va7, _va6)
end
end
else
local _vad = getGroundPosition(_va3, 0.45)
table.insert(_va7, _vad)
if _va4 and #_va4 > 0 then
local _va9 = math.clamp(_va5 or 1, 1, #_va4)
for _vaa = _va9, #_va4 do
local _vab = getGroundPosition(_va4[_vaa], 0.45)
local _vac = _va7[#_va7]
if (_vab - _vac).Magnitude > 0.7 then
table.insert(_va7, _vab)
end
end
end
if _va6 then
local _vae = getGroundPosition(_va6, 0.45)
local _vac = _va7[#_va7]
if not _vac or (_vae - _vac).Magnitude > 0.5 then
table.insert(_va7, _vae)
end
end
end
local _vaf = Config.syncNeonWithTheme and getCurrentAccent() or Config.neonColor
local _vag = Config.neonThickness
local _vah = 0
for _vaa = 1, #_va7 - 1 do
local _vai = _va7[_vaa]
local _vaj = _va7[_vaa + 1]
local _vak = (_vaj - _vai).Magnitude
if _vak > 0.15 then
_vah = _vah + 1
local _val = getOrCreateSegment(_vah)
_val.Color = _vaf
_val.Transparency = 0.08
_val.Size = Vector3.new(_vag, _vag * 0.45, _vak)
_val.CFrame = CFrame.lookAt((_vai + _vaj) * 0.5, _vaj)
_val.Parent = neonFolder
local _vam = getOrCreateNode(_vah)
_vam.Color = _vaf
_vam.Transparency = 0.02
_vam.Size = Vector3.new(_vag * 1.5, _vag * 1.5, _vag * 1.5)
_vam.Position = _vaj
_vam.Parent = neonFolder
end
end
for _vaa = _vah + 1, #segmentPool do
segmentPool[_vaa].Parent = nil
end
for _vaa = _vah + 1, #nodePool do
nodePool[_vaa].Parent = nil
end
end



local function smoothWaypointsStrict3D(_van, _vao, _vap)
if not _van or #_van <= (3 - 1) then
return _van
end
local _vaq = { _van[1] }
local _var = 1
while _var < #_van do
local _vas = _var + 1
local _vat = math.min(#_van, _var + (11 - 3))
for _vau = _vat, _var + (4 - 2), -1 do
local _vav = _van[_var]
local _vaw = _van[_vau]
local _vax = (_vaw - _vav).Magnitude
local _vay = _vap and 35.0 or 85.0
local _vaz = (not _vap) or (math.abs(_vaw.Y - _vav.Y) <= 3.5)
if _vax <= _vay and _vaz and isBoxClear3D(_vav, _vaw, _vao, 1.3, _vap) then
_vas = _vau
break
end
end
table.insert(_vaq, _van[_vas])
_var = _vas
end
return _vaq
end
local function computeNavMeshChain(_vb0, _vb1, _vb2)
local _vb3 = _vb2 or 3.0
local _vb4 = getGroundPosition(_vb0, 0.4)
local _vb5 = getGroundPosition(_vb1, 0.4)
for _, _vb6 in ipairs({ 1.5, 1.0 }) do
local _vb7 = PathfindingService:CreatePath({
AgentRadius = _vb6,
AgentHeight = 4.4,
AgentCanJump = true,
WaypointSpacing = 4.0,
})
local _vb8 = pcall(function()
_vb7:ComputeAsync(_vb4, _vb5)
end)
if _vb8 and (_vb7.Status == Enum.PathStatus.Success or _vb7.Status == Enum.PathStatus.ClosestNoPath) then
local _vb9 = _vb7:GetWaypoints()
if #_vb9 >= (3 - 1) then
local _vba = {}
for _vbb = (4 - 2), #_vb9 do
table.insert(_vba, getGroundPosition(_vb9[_vbb].Position, _vb3))
end
return _vba
end
end
end
return nil
end

local function findSkyAccessChain(_vbc, _vbd, _vbe, _vbf)
if isSkyColumnClear(_vbc, _vbd, _vbf) then
return {}
end
local _vbg = nil
local _vbh = math.huge
local _vbi = {}
for _, _vbj in ipairs({ 4.5, 8.0, 12.5, 18.0, 25.0, 34.0, 45.0 }) do
for _vbk = 0, (24 - 9) do
local _vbl = math.rad(_vbk * 22.5)
local _vbm = Vector3.new(math.cos(_vbl), 0, math.sin(_vbl))
local _vbn = Vector3.new(_vbc.X + _vbm.X * _vbj, _vbc.Y, _vbc.Z + _vbm.Z * _vbj)
local _vbo, _vbp = getGroundPosition(_vbn, 3.0)
local _vbq = (_vbp and math.abs(_vbo.Y - _vbc.Y) <= 7.5) and _vbo or _vbn
if isPointClear3D(_vbq, _vbf, 1.15) and isBoxClear3D(_vbc, _vbq, _vbf, 1.15, true) then
if isSkyColumnClear(_vbq, _vbd, _vbf) then
local _vbr = _vbe
and Vector3.new(_vbe.X - _vbq.X, 0, _vbe.Z - _vbq.Z).Magnitude
or 0
local _vbs = (_vbj * 1.5) + (_vbr * 0.25)
if _vbs < _vbh then
_vbh = _vbs
_vbg = _vbq
end
elseif _vbj >= 6.0 and _vbj <= 26.0 then
table.insert(_vbi, _vbq)
end
end
end
if _vbg then
return { _vbg }
end
end

local _vbt = nil
local _vbu = math.huge
for _vbv = 1, math.min(#_vbi, (21 - 7)) do
local _vbw = _vbi[_vbv]
for _, _vbx in ipairs({ 6.5, 13.0, 21.0, 30.0 }) do
for _vby = 0, (15 - 4) do
local _vbl = math.rad(_vby * (40 - 10))
local _vbz = Vector3.new(math.cos(_vbl), 0, math.sin(_vbl))
local _vc0 = Vector3.new(_vbw.X + _vbz.X * _vbx, _vbw.Y, _vbw.Z + _vbz.Z * _vbx)
local _vc1, _vc2 = getGroundPosition(_vc0, 3.0)
local _vc3 = (_vc2 and math.abs(_vc1.Y - _vbw.Y) <= 7.5) and _vc1 or _vc0
if isPointClear3D(_vc3, _vbf, 1.15)
and isBoxClear3D(_vbw, _vc3, _vbf, 1.15, true)
and isSkyColumnClear(_vc3, _vbd, _vbf)
then
local _vc4 = (_vbw - _vbc).Magnitude + (_vc3 - _vbw).Magnitude
local _vbr = _vbe
and Vector3.new(_vbe.X - _vc3.X, 0, _vbe.Z - _vc3.Z).Magnitude
or 0
local _vbs = (_vc4 * 1.4) + (_vbr * 0.25)
if _vbs < _vbu then
_vbu = _vbs
_vbt = { _vbw, _vc3 }
end
end
end
end
end
return _vbt
end

local function buildAirBypassRoute(_vc5, _vc6, _vc7)
if isBoxClear3D(_vc5, _vc6, _vc7, 1.35, false) then
return { _vc6 }, true
end

for _, _vc8 in ipairs({ (22 - 6), (60 - 28), (89 - 37), (123 - 47), (175 - 70) }) do
local _vc9 = math.max(_vc5.Y, _vc6.Y) + _vc8
local _vca = Vector3.new(_vc5.X, _vc9, _vc5.Z)
local _vcb = Vector3.new(_vc6.X, _vc9, _vc6.Z)
if isPointClear3D(_vca, _vc7, 1.25)
and isPointClear3D(_vcb, _vc7, 1.25)
and isBoxClear3D(_vc5, _vca, _vc7, 1.25, false)
and isBoxClear3D(_vca, _vcb, _vc7, 1.30, false)
and isBoxClear3D(_vcb, _vc6, _vc7, 1.25, false)
then
return { _vca, _vcb, _vc6 }, true
end
end

local _vcc = Vector3.new(_vc6.X - _vc5.X, 0, _vc6.Z - _vc5.Z)
if _vcc.Magnitude > 0.5 then
local _vcd = _vcc.Unit
local _vce = Vector3.new(-_vcd.Z, 0, _vcd.X)
local _vcf = (_vc5 + _vc6) * 0.5
for _, _vcg in ipairs({ 0, (25 - 7), -(15 - 5), (52 - 16) }) do
local _vch = Vector3.new(0, _vcg, 0)
for _, _vci in ipairs({ (19 - 5), (52 - 26), (80 - 38), (105 - 43), (148 - 60) }) do
for _, _vcj in ipairs({ 1, -1 }) do
local _vck = _vce * (_vci * _vcj) + _vch
local _vcl = _vcf + _vck
if isPointClear3D(_vcl, _vc7, 1.25)
and isBoxClear3D(_vc5, _vcl, _vc7, 1.25, false)
and isBoxClear3D(_vcl, _vc6, _vc7, 1.25, false)
then
return { _vcl, _vc6 }, true
end
local _vcm = _vc5 + _vck
local _vcn = _vc6 + _vck
if isPointClear3D(_vcm, _vc7, 1.25)
and isPointClear3D(_vcn, _vc7, 1.25)
and isBoxClear3D(_vc5, _vcm, _vc7, 1.25, false)
and isBoxClear3D(_vcm, _vcn, _vc7, 1.25, false)
and isBoxClear3D(_vcn, _vc6, _vc7, 1.25, false)
then
return { _vcm, _vcn, _vc6 }, true
end
end
end
end
end
return { _vc6 }, false
end
local function buildCompleteFlyPath(_vco, _vcp, _vcq)
local _vcr = _vcq and findBestDoorStandPoint(_vcq, _vcp, _vco) or getGroundPosition(_vcp, 3.0)

if (_vcr - _vco).Magnitude <= 18.0 and isBoxClear3D(_vco, _vcr, _vcq, 1.25, false) then
return { _vcr }, true
end
local _, _, _vcs = getGroundPosition(_vco, 0)
local _, _, _vct = getGroundPosition(_vcr, 0)
local _vcu = math.max(_vcs, _vct, _vco.Y - 2.5, _vcr.Y)
local _vcv = _vcu + Config.flyHeight
local _vcw = { _vco }
local _vcx = _vco
local _vcy = isSkyColumnClear(_vco, _vcv, _vcq)

if not _vcy then
local _vcz = findSkyAccessChain(_vco, _vcv, _vcr, _vcq)
if _vcz and #_vcz > 0 then
for _, _vd0 in ipairs(_vcz) do
table.insert(_vcw, _vd0)
end
_vcx = _vcz[#_vcz]
_vcy = true
else
local _vd1 = computeNavMeshChain(_vco, _vcr, 3.2)
if _vd1 and #_vd1 > 0 then
for _, _vd2 in ipairs(_vd1) do
table.insert(_vcw, _vd2)
if isSkyColumnClear(_vd2, _vcv, _vcq) then
_vcx = _vd2
_vcy = true
break
end
end
if not _vcy then
table.insert(_vcw, _vcr)
local _vd3 = smoothWaypointsStrict3D(_vcw, _vcq, false)
table.remove(_vd3, 1)
return _vd3, true
end
end
end
end

local _vd4 = {}
local _vd5 = _vcr
local _vd6 = isSkyColumnClear(_vcr, _vcv, _vcq)
if not _vd6 then
local _vd7 = findSkyAccessChain(_vcr, _vcv, _vcx, _vcq)
if _vd7 and #_vd7 > 0 then
_vd5 = _vd7[#_vd7]
for _vd8 = #_vd7, 1, -1 do
table.insert(_vd4, _vd7[_vd8])
end
_vd6 = true
else
local _vd9 = computeNavMeshChain(_vcx, _vcr, 3.2)
if _vd9 and #_vd9 > 0 then
local _vda = nil
for _vd8 = #_vd9, 1, -1 do
if isSkyColumnClear(_vd9[_vd8], _vcv, _vcq) then
_vda = _vd8
break
end
end
if _vda then
_vd5 = _vd9[_vda]
for _vd8 = _vda, #_vd9 do
table.insert(_vd4, _vd9[_vd8])
end
_vd6 = true
end
end
end
end

if _vcy and _vd6 then
local _vdb = Vector3.new(_vcx.X, _vcv, _vcx.Z)
local _vdc = Vector3.new(_vd5.X, _vcv, _vd5.Z)
if (_vdb - _vcx).Magnitude > 1.2 then
table.insert(_vcw, _vdb)
end
if (_vdc - _vdb).Magnitude > 1.5 then
local _vdd, _ = buildAirBypassRoute(_vdb, _vdc, _vcq)
for _, _vde in ipairs(_vdd) do
table.insert(_vcw, _vde)
end
end
for _, _vdf in ipairs(_vd4) do
table.insert(_vcw, _vdf)
end
table.insert(_vcw, _vcr)
local _vdg = { _vcw[(4 - 2)] or _vcr }
for _vd8 = (5 - 2), #_vcw do
if (_vcw[_vd8] - _vdg[#_vdg]).Magnitude > 0.8 then
table.insert(_vdg, _vcw[_vd8])
end
end
return _vdg, true
end

local _vdh = computeNavMeshChain(_vco, _vcr, 3.2)
if _vdh and #_vdh > 0 then
table.insert(_vdh, 1, _vco)
table.insert(_vdh, _vcr)
local _vdi = smoothWaypointsStrict3D(_vdh, _vcq, false)
table.remove(_vdi, 1)
return _vdi, true
end
return { _vcr }, false
end
local function buildCompleteWalkPath(_vdj, _vdk, _vdl)
local _vdm = _vdl and findBestDoorStandPoint(_vdl, _vdk, _vdj) or getGroundPosition(_vdk, 3.0)
local _vdn = Vector3.new(_vdm.X - _vdj.X, 0, _vdm.Z - _vdj.Z).Magnitude
if _vdn <= 14.0
and math.abs(_vdm.Y - _vdj.Y) <= 3.5
and isBoxClear3D(_vdj, _vdm, _vdl, 1.2, true)
then
return { _vdm }, true
end
local _vdo = computeNavMeshChain(_vdj, _vdm, 3.0)
if _vdo and #_vdo > 0 then
table.insert(_vdo, 1, getGroundPosition(_vdj, 3.0))
table.insert(_vdo, _vdm)
local _vdp = smoothWaypointsStrict3D(_vdo, _vdl, true)
table.remove(_vdp, 1)
if #_vdp > 0 then
return _vdp, true
end
end
return { _vdm }, false
end
local function findBestStartingWaypointIndex(_vdq, _vdr, _vds)
if not _vdr or #_vdr <= 1 then
return 1
end
local _vdt = 1
local _vdu = math.huge
for _vdv = 1, #_vdr do
local d = (_vdr[_vdv] - _vdq).Magnitude
if d < _vdu then
_vdu = d
_vdt = _vdv
end
end
if _vdt < #_vdr then
local _vdw = _vdr[_vdt]
local _vdx = _vdr[_vdt + 1]
local _vdy = _vdx - _vdw
local _vdz = _vdq - _vdw
if _vdy.Magnitude > 0.1 and _vdz:Dot(_vdy.Unit) > 0 then
if isBoxClear3D(_vdq, _vdx, _vds, 1.15, Config.movementMode == _dcoqb("DRcDEw==")) then
_vdt = _vdt + 1
end
end
end
return math.clamp(_vdt, 1, #_vdr)
end
local function requestPathRebuild(_ve0, _ve1, _ve2)
local _ve3 = os.clock()
if isComputingPath and (_ve3 - pathComputeStartedAt) > 2.0 then
isComputingPath = false
end
if isComputingPath and not _ve2 then
return
end
if not _ve2 and lastPathTargetDoor == _ve1 and #activeWaypoints > 0 then
return
end
if not _ve2 and (_ve3 - lastPathComputeTime) < 0.45 then
return
end
local _ve4 = localPlayer.Character
local _ve5 = _ve4 and _ve4:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
if not _ve5 then
return
end
isComputingPath = true
pathComputeStartedAt = _ve3
lastPathComputeTime = _ve3
pathComputeGeneration = pathComputeGeneration + 1
local _ve6 = pathComputeGeneration
local _ve7 = _ve5.Position
local _ve8 = Config.movementMode
task.spawn(function()
local _vef, _veg = pcall(function()
if _ve8 == _dcoqb("HBoW") then
local _vel, _ = buildCompleteFlyPath(_ve7, _ve0, _ve1)
return _vel
else
local _vel, _ = buildCompleteWalkPath(_ve7, _ve0, _ve1)
return _vel
end
end)
if _ve6 == pathComputeGeneration then
if _vef and _veg and #_veg > 0 then
local _vei = localPlayer.Character
local _vej = _vei and _vei:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
local _vek = _vej and _vej.Position or _ve7
activeWaypoints = _veg
currentWpIndex = findBestStartingWaypointIndex(_vek, _veg, _ve1)
lastPathTargetDoor = _ve1
end
isComputingPath = false
end
end)
end



local function findCornerEscapePoint(_vem, _ven, _veo)
local _vep = (Config.movementMode == _dcoqb("HBoW"))
local _veq = nil
local _ver = -math.huge
local _ves = _vep and { 0, 8.0, -6.0, 16.0 } or { 0 }
for _, _vet in ipairs(_ves) do
for _veu = 0, (23 - 8) do
local _vev = math.rad(_veu * 22.5)
local _vew = Vector3.new(math.cos(_vev), 0, math.sin(_vev))
for _, _vex in ipairs({ 14.0, 9.0, 5.5 }) do
local _vey = _vep
and (_vem + _vew * _vex + Vector3.new(0, _vet, 0))
or getGroundPosition(_vem + _vew * _vex, 3.0)
if isPointClear3D(_vey, _veo, 1.1) and isBoxClear3D(_vem, _vey, _veo, 1.1, not _vep) then
local _vez = _ven and (_ven - _vey).Magnitude or 0
local _vf0 = (_vex * 3.5) - (_vez * 0.30)
if _vf0 > _ver then
_ver = _vf0
_veq = _vey
end
break
end
end
end
end
return _veq
end
local function findClearSteeringDirection3D(_vf1, _vf2, _vf3, _vf4, _vf5, _vf6)
local _vf7 = Vector3.new(0, 1, 0)
local _vf8 = Vector3.new(_vf2.X, 0, _vf2.Z)
local _vf9 = (_vf8.Magnitude > 0.05) and _vf8.Unit or Vector3.new(0, 0, 1)
local _vfa = Vector3.new(-_vf9.Z, 0, _vf9.X)
local _vfb = {}

if _vf4 and _vf4.Normal then
local _vfc = _vf4.Normal
local _vfd = _vf2 - _vfc * _vf2:Dot(_vfc)
if not _vf6 then
_vfd = Vector3.new(_vfd.X, 0, _vfd.Z)
end
if _vfd.Magnitude > 0.1 then
table.insert(_vfb, _vfd.Unit)
table.insert(_vfb, (_vfd.Unit + _vfc * 0.35).Unit)
end
end

for _, _vfe in ipairs({ (32 - 2), -(49 - 19), (85 - 30), -(84 - 29), (127 - 47), -(97 - 17), (153 - 43), -(182 - 72), (155 - 10), -(212 - 67) }) do
local _vff = math.rad(_vfe)
local _vfg = Vector3.new(
_vf9.X * math.cos(_vff) - _vf9.Z * math.sin(_vff),
0,
_vf9.X * math.sin(_vff) + _vf9.Z * math.cos(_vff)
)
table.insert(_vfb, _vfg)
if _vf6 then
table.insert(_vfb, (_vfg + _vf7 * 0.75).Unit)
table.insert(_vfb, (_vfg - _vf7 * 0.65).Unit)
end
end
if _vf6 then
table.insert(_vfb, _vf7)
table.insert(_vfb, -_vf7)
table.insert(_vfb, (_vf2 + _vf7 * 1.1).Unit)
table.insert(_vfb, (_vf2 - _vf7 * 1.1).Unit)
table.insert(_vfb, _vfa)
table.insert(_vfb, -_vfa)
end
local _vfh = math.max(_vf3 + 2.2, 3.6)
local _vfi = nil
local _vfj = -math.huge
for _, _vfk in ipairs(_vfb) do
if isBoxClear3D(_vf1, _vf1 + _vfk * _vfh, _vf5, 1.05, not _vf6) then
local _vfl = _vfk:Dot(_vf2) * 4.0
local _vfm = isBoxClear3D(_vf1, _vf1 + _vfk * 7.5, _vf5, 1.0, not _vf6) and 2.5 or 0.0
local _vfn = _vfl + _vfm
if _vfn > _vfj then
_vfj = _vfn
_vfi = _vfk
end
end
end
return _vfi
end
local function stepCharacterAlongWaypoints(_vfo, _vfp, _vfq, _vfr, _vfs, _vft, _vfu)
local _vfv = (Config.movementMode == _dcoqb("HBoW"))
local _vfw = _vfo.Position
local _vfx = Config.cframeSpeed * math.min(_vfu, 0.085)
local _vfy = math.clamp(_vfr or 1, 1, math.max(1, #_vfq))
local _vfz = false
if _vfv then
_vfp:Move(Vector3.zero, false)
_vfo.AssemblyLinearVelocity = Vector3.zero
_vfo.AssemblyAngularVelocity = Vector3.zero
end
local _vg0 = _vfo.CFrame.LookVector
local _vg1 = 0
while _vfx > 0.02 and _vfy <= #_vfq and _vg1 < (8 - 2) do
_vg1 = _vg1 + 1
local _vg2 = _vfq[_vfy]
local _vg3 = _vfv
and (_vg2 - _vfw)
or Vector3.new(_vg2.X - _vfw.X, 0, _vg2.Z - _vfw.Z)
local _vg4 = _vg3.Magnitude
local _vg5 = (_vfy < #_vfq) and (_vfv and 2.4 or 1.6) or 0.8
if _vg4 <= _vg5 then
if _vfy < #_vfq then
_vfy = _vfy + 1
else
break
end
else
local _vg6 = _vg3 / _vg4
local _vg7, _ = computeBoundedPlayerAvoidDir(_vfw, _vg6, _vfs, _vft)
if not _vfv then
local _vg8 = Vector3.new(_vg7.X, 0, _vg7.Z)
_vg7 = (_vg8.Magnitude > 0.05) and _vg8.Unit or _vg6
end
local _vg9 = math.min(_vfx, _vg4, _vfv and 6.0 or 4.2)
local _vga = math.max(_vg9 + 1.6, 2.8)

local _vgb, _vgc = isBoxClear3D(
_vfw,
_vfw + _vg7 * _vga,
_vft,
1.1,
not _vfv
)
local _vgd = _vg7
if not _vgb then
_vfz = true
local _vge = findClearSteeringDirection3D(_vfw, _vg7, _vg9, _vgc, _vft, _vfv)
if _vge then
_vgd = _vge
_vg9 = math.min(_vg9, 3.2)
else

if _vgc and _vgc.Normal then
local _vgf = _vfv
and _vgc.Normal
or Vector3.new(_vgc.Normal.X, 0, _vgc.Normal.Z)
if _vgf.Magnitude > 0.05 then
local _vgg = _vfw + _vgf.Unit * 0.6
if isPointClear3D(_vgg, _vft, 0.9) then
_vfw = _vgg
end
end
end
if not _vfv then
_vfp.Jump = true
end
break
end
end
_vg0 = _vgd
local _vgh = _vfw + _vgd * _vg9
if not _vfv then
local _vgi, _vgj = getGroundPosition(_vgh, 3.0)
if _vgj and math.abs(_vgi.Y - _vfw.Y) <= 5.5 then
_vgh = Vector3.new(_vgh.X, _vgi.Y, _vgh.Z)
end
end
_vfw = _vgh
_vfx = _vfx - _vg9
end
end
if not _vfv then
_vfp.WalkSpeed = (30 - 14)
_vfp:Move(Vector3.new(_vg0.X, 0, _vg0.Z), false)
_vfo.AssemblyLinearVelocity = Vector3.new(0, math.clamp(_vfo.AssemblyLinearVelocity.Y, -(54 - 9), (37 - 2)), 0)
_vfo.AssemblyAngularVelocity = Vector3.zero
end
local _vgk = Vector3.new(_vg0.X, 0, _vg0.Z)
if _vgk.Magnitude > 0.05 then
_vfo.CFrame = CFrame.lookAt(_vfw, _vfw + _vgk.Unit)
else
_vfo.CFrame = CFrame.new(_vfw)
end
return _vfy, _vfz
end



local function executeDoorOpenPulse(_vgl)
local _vgm = os.clock()
if isTappingDoor and (_vgm - tappingStartedAt) < 2.5 then
return
end
if not _vgl or not _vgl.Parent then
isTappingDoor = false
return
end
local _vgn = getDoorTimerSeconds(_vgl)
if _vgn > 0.05 then
return
end
isTappingDoor = true
tappingStartedAt = _vgm
pcall(function()
local _vgx = localPlayer.Character
local _vgy = _vgx and _vgx:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
local _vgz = _vgx and _vgx:FindFirstChildOfClass(_dcoqb("MgMCGQgCDAo="))
local _vh0 = getDoorExactTargetPos(_vgl)
if _vgz then
_vgz:Move(Vector3.zero, false)
end
if _vgy and _vh0 then
_vgy.AssemblyLinearVelocity = Vector3.zero
local _vh1 = Vector3.new(_vh0.X, _vgy.Position.Y, _vh0.Z)
if (_vh1 - _vgy.Position).Magnitude > 0.05 then
_vgy.CFrame = CFrame.lookAt(_vgy.Position, _vh1)
end
end
local _vh2 = findPromptsForDoor(_vgl)
for _, _vh3 in ipairs(_vh2) do
pcall(function()
_vh3.Enabled = true
_vh3.HoldDuration = 0
_vh3.RequiresLineOfSight = false
_vh3.MaxActivationDistance = (51 - 19)
end)
end
local _vh4 = Config.tapCount or (11 - 3)
for _ = 1, _vh4 do
if hasDoorDisappeared(_vgl, _vh0) then
break
end
_vgx = localPlayer.Character
_vgy = _vgx and _vgx:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
if _vgy and _vh0 then
_vgy.AssemblyLinearVelocity = Vector3.zero
local _vh1 = Vector3.new(_vh0.X, _vgy.Position.Y, _vh0.Z)
if (_vh1 - _vgy.Position).Magnitude > 0.05 then
_vgy.CFrame = CFrame.lookAt(_vgy.Position, _vh1)
end
end
pcall(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
end)
if type(keypress) == _dcoqb("HAMBGxIECgA=") then
pcall(function()
keypress(0x45)
end)
end
_vh2 = findPromptsForDoor(_vgl)
for _, _vh3 in ipairs(_vh2) do
if _vh3 and _vh3.Parent then
pcall(function()
_vh3.Enabled = true
_vh3.HoldDuration = 0
_vh3.RequiresLineOfSight = false
_vh3.MaxActivationDistance = (45 - 13)
end)
if type(fireproximityprompt) == _dcoqb("HAMBGxIECgA=") then
pcall(function()
fireproximityprompt(_vh3)
end)
pcall(function()
fireproximityprompt(_vh3, 0)
end)
pcall(function()
fireproximityprompt(_vh3, 1)
end)
end
pcall(function()
_vh3:InputHoldBegin()
end)
end
end
if _vgy then
for _, _vh5 in ipairs(_vgl:GetDescendants()) do
if _vh5:IsA(_dcoqb("LhkaGw45Fw8WFgYIDgIKCg==")) and _vh5.Parent and _vh5.Parent:IsA(_dcoqb("OBccHTYMFxo=")) and type(firetouchinterest) == _dcoqb("HAMBGxIECgA=") then
pcall(function()
firetouchinterest(_vgy, _vh5.Parent, 0)
firetouchinterest(_vgy, _vh5.Parent, 1)
end)
elseif _vh5:IsA(_dcoqb("ORoGGw0pABodBh8OCA==")) and type(fireclickdetector) == _dcoqb("HAMBGxIECgA=") then
pcall(function()
fireclickdetector(_vh5)
end)
end
end
end
task.wait(0.03)
for _, _vh3 in ipairs(_vh2) do
if _vh3 and _vh3.Parent then
pcall(function()
_vh3:InputHoldEnd()
end)
end
end
pcall(function()
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end)
if type(keyrelease) == _dcoqb("HAMBGxIECgA=") then
pcall(function()
keyrelease(0x45)
end)
end
task.wait(0.02)
end
lockedDoorHasBeenTapped = true
if not Config.waitUntilDoorDisappears or hasDoorDisappeared(_vgl, _vh0) then
markDoorAsOpened(_vgl, _vh0)
end
end)
isTappingDoor = false
end
forceOpenClosestDoor = function()
local _vh6 = localPlayer.Character
local _vh7 = _vh6 and _vh6:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
if not _vh7 then
return
end
local _vh8 = nil
local _vh9 = math.huge
for _, d in ipairs(getAllHalloweenDoors()) do
local _vha = getDoorExactTargetPos(d)
local cd = getDoorTimerSeconds(d)
if _vha and cd <= 0.05 then
local _vhb = (_vha - _vh7.Position).Magnitude
if _vhb < _vh9 then
_vh9 = _vhb
_vh8 = d
end
end
end
if _vh8 then
task.spawn(function()
executeDoorOpenPulse(_vh8)
end)
end
end
local function updateDoorEspAndPrompts(_vhc)
if not _vhc or not _vhc.Parent then
return
end
for _, _vhd in ipairs(findPromptsForDoor(_vhc)) do
if Config.instantOpenEnabled or Config.autoFarmEnabled or Config.autoOpenNearbyWhenReady then
pcall(function()
_vhd.HoldDuration = 0
_vhd.RequiresLineOfSight = false
if _vhd.MaxActivationDistance < (38 - 10) then
_vhd.MaxActivationDistance = (42 - 14)
end
end)
end
end
local _vhe = getCurrentAccent()
local _vhf = doorHighlights[_vhc]
if not _vhf or not _vhf.Parent then
_vhf = Instance.new(_dcoqb("Mh8IEAoEAgYM"))
_vhf.Name = _dcoqb("NBMXFxQMIQEXFygJGxsc")
_vhf.Adornee = _vhc
_vhf.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
_vhf.FillTransparency = 0.45
_vhf.OutlineColor = Color3.fromRGB((333 - 83), (354 - 104), (439 - 184))
_vhf.OutlineTransparency = 0
_vhf.Parent = _vhc
doorHighlights[_vhc] = _vhf
end
_vhf.FillColor = _vhe
_vhf.Enabled = Config.espEnabled
local _vhg = doorBillboards[_vhc]
local _vhh = _vhc:IsA(_dcoqb("OBccHTYMFxo=")) and _vhc or _vhc:FindFirstChildWhichIsA(_dcoqb("OBccHTYMFxo="), true)
if _vhh then
if not _vhg or not _vhg.Parent then
_vhg = Instance.new(_dcoqb("OB8DFAQCBBwcIh4I"))
_vhg.Name = _dcoqb("NBMXFxQMIQEXFykIFhoNFwcfAQ==")
_vhg.Adornee = _vhh
_vhg.Size = UDim2.new(0, (301 - 126), 0, (59 - 25))
_vhg.StudsOffset = Vector3.new(0, 4.5, 0)
_vhg.AlwaysOnTop = true
_vhg.Parent = _vhc
local _vhi = Instance.new(_dcoqb("LhMXDCoMBwsU"))
_vhi.Name = _dcoqb("MxgJFzIIHRo=")
_vhi.Size = UDim2.new(1, 0, 1, 0)
_vhi.BackgroundTransparency = 1
_vhi.Font = Enum.Font.Code
_vhi.TextSize = (22 - 9)
_vhi.TextStrokeTransparency = 0.1
_vhi.TextColor3 = Color3.fromRGB((467 - 222), (482 - 237), (473 - 218))
_vhi.Text = _dcoqb("MhcDFAkaAAsWIQQOCA==")
_vhi.Parent = _vhg
doorBillboards[_vhc] = _vhg
end
_vhg.Enabled = Config.espEnabled and Config.espShowTimer
end
end
scanAllHalloweenDoors = function()
for _, _vhj in ipairs(getAllHalloweenDoors()) do
updateDoorEspAndPrompts(_vhj)
end
end
local function selectBestDoorForFarm(_vhk)
local _vhl = os.clock()
if lockedDoorInstance then
if hasDoorDisappeared(lockedDoorInstance, lockedDoorInitialPos) then
markDoorAsOpened(lockedDoorInstance, lockedDoorInitialPos)
lockedDoorInstance = nil
lockedDoorInitialPos = nil
lockedDoorOpenedStart = 0
lockedDoorHasBeenTapped = false
elseif lockedDoorHasBeenTapped and (_vhl - lockedDoorOpenedStart) > 7.5 then
markDoorAsOpened(lockedDoorInstance, lockedDoorInitialPos)
lockedDoorInstance = nil
lockedDoorInitialPos = nil
lockedDoorOpenedStart = 0
lockedDoorHasBeenTapped = false
elseif lockedDoorHasBeenTapped and getDoorTimerSeconds(lockedDoorInstance) > 3.5 then
markDoorAsOpened(lockedDoorInstance, lockedDoorInitialPos)
lockedDoorInstance = nil
lockedDoorInitialPos = nil
lockedDoorOpenedStart = 0
lockedDoorHasBeenTapped = false
else
local cd = getDoorTimerSeconds(lockedDoorInstance)
return lockedDoorInstance, cd, 1, cd
end
end
local _vhm = getAllHalloweenDoors()
local _vhn = getOtherPlayerPositions()
local _vho = nil
local _vhp = math.huge
local _vhq = 0
local _vhr = math.huge
for _, _vhs in ipairs(_vhm) do
local _vht = unreachableDoorRecords[_vhs]
if not (_vht and _vhl < _vht) then
local _vhu = getDoorExactTargetPos(_vhs)
if _vhu then
local _vhv = getDoorTimerSeconds(_vhs)
if not isDoorAlreadyOpenedRecently(_vhs, _vhu, _vhv) then
if _vhv < _vhr then
_vhr = _vhv
end
local _vhw = Config.approachEarlyWaitTimer or (_vhv <= Config.startTimerThreshold)
if _vhw then
local _vhx = (_vhu - _vhk).Magnitude
local _vhy = 0
if Config.avoidPlayersEnabled and #_vhn > 0 then
local _vhz = getMinDistanceToPlayers(_vhu, _vhn)
if _vhz < Config.playerAvoidRadius then
_vhy = (Config.playerAvoidRadius - _vhz) * 5.0
end
end
local _vi0 = _vhx + (_vhv * 12.0) + _vhy
if _vi0 < _vhp then
_vhp = _vi0
_vho = _vhs
_vhq = _vhv
end
end
end
end
end
end
return _vho, _vhq, #_vhm, _vhr
end



local function getBoundedSafeRetreatSpot(_vi1)
if not Config.safeRetreatEnabled then
cachedRetreatSpot = nil
return nil
end
local _vi2 = getOtherPlayerPositions()
if #_vi2 == 0 then
cachedRetreatSpot = nil
return nil
end
local _vi3 = getMinDistanceToPlayers(_vi1, _vi2)
if _vi3 >= Config.safeRetreatDistance then
cachedRetreatSpot = nil
return nil
end
local _vi4 = os.clock()
if cachedRetreatSpot and (_vi4 - lastRetreatComputeTime) < 1.5 then
local _vi5 = getMinDistanceToPlayers(cachedRetreatSpot, _vi2)
if _vi5 >= Config.safeRetreatDistance * 0.85 then
return cachedRetreatSpot
end
end
lastRetreatComputeTime = _vi4
if Config.movementMode == _dcoqb("HBoW") then
local _vi6, _vi7, _vi8 = getGroundPosition(_vi1, 0)
local _vi9 = (_vi7 and _vi8 or _vi1.Y) + math.max(Config.flyHeight, Config.safeRetreatDistance)
local _via = Vector3.new(_vi6.X, _vi9, _vi6.Z)
if isSkyColumnClear(_vi1, _vi9, nil) and getMinDistanceToPlayers(_via, _vi2) >= Config.safeRetreatDistance then
cachedRetreatSpot = _via
return _via
end
end
local _vib = Vector3.zero
for _, _vic in ipairs(_vi2) do
local _vid = Vector3.new(_vi1.X - _vic.X, 0, _vi1.Z - _vic.Z)
local d = _vid.Magnitude
if d > 0.1 and d < Config.safeRetreatDistance + (16 - 1) then
_vib = _vib + (_vid.Unit / math.max(1, d))
end
end
_vib = (_vib.Magnitude > 0.05) and _vib.Unit or Vector3.new(1, 0, 0)
local _vie = makeObstacleRayParams(nil)
local _vif = math.clamp(Config.safeRetreatDistance - _vi3 + 8.0, 10.0, 35.0)
local _vig = nil
local _vih = -math.huge
for _, _vii in ipairs({ 0, (44 - 4), -(77 - 37), (136 - 56), -(112 - 32), (209 - 84), -(207 - 82), (348 - 168) }) do
local _vij = math.rad(_vii)
local _vik = Vector3.new(
_vib.X * math.cos(_vij) - _vib.Z * math.sin(_vij),
0,
_vib.X * math.sin(_vij) + _vib.Z * math.cos(_vij)
)
local _vil = _vi1 + Vector3.new(0, 1.5, 0)
local _vim = raycastSolidOnly(_vil, _vik * _vif, _vie, true)
local _vin = _vim and math.max(0, (_vim.Position - _vil).Magnitude - 3.0) or _vif
if _vin >= 6.0 then
local _vio, _vi7, _vi8 = getGroundPosition(_vi1 + _vik * _vin, 3.0)
if _vi7 and isPointClear3D(_vio, nil, 1.1) then
local _vip = _vio
if Config.movementMode == _dcoqb("HBoW") and isSkyColumnClear(_vio, _vi8 + Config.flyHeight, nil) then
_vip = Vector3.new(_vio.X, _vi8 + Config.flyHeight, _vio.Z)
end
local _viq = getMinDistanceToPlayers(_vip, _vi2)
if _viq > _vih then
_vih = _viq
_vig = _vip
end
end
end
end
cachedRetreatSpot = _vig
return _vig
end



RunService.Heartbeat:Connect(function(_vir)
local _vis = os.clock()
if (_vis - lastGarbageCollectTime) >= 2.0 then
lastGarbageCollectTime = _vis
cleanupDeadReferences()
end
if Config.antiAfkEnabled and (_vis - lastAntiAfkPulse) >= (72 - 27) then
triggerAntiAfkPulse()
end
if Config.theme == _dcoqb("KBcGFgQCEg==") then
refreshThemeColors()
if Config.syncNeonWithTheme then
recolorNeonPath(getCurrentAccent())
end
end
local _vit = localPlayer.Character
local _viu = _vit and _vit:FindFirstChild(_dcoqb("MgMCGQgCDAoqCgQVKhcdDA=="))
local _viv = _vit and _vit:FindFirstChildOfClass(_dcoqb("MgMCGQgCDAo="))
if (_vis - lastEspScanTime) >= 0.18 then
lastEspScanTime = _vis
for _, _viw in ipairs(getAllHalloweenDoors()) do
updateDoorEspAndPrompts(_viw)
local _vix = getDoorExactTargetPos(_viw)
local cd = getDoorTimerSeconds(_viw)
local _viy = isDoorAlreadyOpenedRecently(_viw, _vix, cd)
local _viz = doorBillboards[_viw]
if _viz and _viz.Enabled then
local _vj0 = _viz:FindFirstChild(_dcoqb("MxgJFzIIHRo="))
if _vj0 and _vix then
local _vj1 = _viu and math.floor((_vix - _viu.Position).Magnitude) or 0
if _viy then
_vj0.Text = string.format(_dcoqb("MhcDFAkaAAsWIQQOCFY0NzYoKys8RRdBXxICJQ=="), _vj1)
_vj0.TextColor3 = Color3.fromRGB((245 - 115), (277 - 137), (245 - 90))
elseif cd <= 0.05 then
_vj0.Text = string.format(_dcoqb("MhcDFAkaAAsWIQQOCFY0KiMsITdYGUtEHhsy"), _vj1)
_vj0.TextColor3 = Color3.fromRGB((79 - 29), (387 - 147), (163 - 48))
else
_vj0.Text = string.format(_dcoqb("MhcDFAkaAAsWIQQOCFY0XUhcAx1YGUtEHhsy"), cd, _vj1)
_vj0.TextColor3 = (cd <= Config.startTimerThreshold)
and Color3.fromRGB((370 - 115), (275 - 70), (60 - 10))
or Color3.fromRGB((260 - 30), (431 - 201), (259 - 19))
end
end
end
if Config.autoOpenNearbyWhenReady and not Config.autoFarmEnabled and _viu and _vix and not _viy then
local _vj2 = (_vix - _viu.Position).Magnitude
if _vj2 <= 8.5 and cd <= 0.05 and not isTappingDoor then
task.spawn(function()
executeDoorOpenPulse(_viw)
end)
end
end
end
end
if not Config.autoFarmEnabled then
lastProgressPos = nil
return
end
if not _viu or not _viv or _viv.Health <= 0 then
lastProgressPos = nil
return
end
local _vj3, _vj4, _vj5, _vj6 = selectBestDoorForFarm(_viu.Position)
if _vj3 then
cachedRetreatSpot = nil
local _vj7 = getDoorExactTargetPos(_vj3)
if not _vj7 then
return
end
_vj4 = getDoorTimerSeconds(_vj3)
local _vj8 = Vector3.new(_vj7.X - _viu.Position.X, 0, _vj7.Z - _viu.Position.Z).Magnitude
local _vj9 = math.abs(_vj7.Y - _viu.Position.Y)
local _vja = (_vj7 - _viu.Position).Magnitude

local _vjb = makeObstacleRayParams(_vj3)
local _vjc = raycastSolidOnly(
_viu.Position,
_vj7 - _viu.Position,
_vjb,
true
)
if ((_vj8 <= 4.5 and _vj9 <= 4.5) or _vja <= 4.6) and not _vjc then
lastProgressPos = _viu.Position
lastProgressTime = _vis
stuckStrikes = 0
cornerEscapeWp = nil
if Config.waitUntilDoorDisappears and lockedDoorInstance ~= _vj3 then
lockedDoorInstance = _vj3
lockedDoorInitialPos = _vj7
lockedDoorOpenedStart = _vis
lockedDoorHasBeenTapped = false
end
_viv:Move(Vector3.zero, false)
_viu.AssemblyLinearVelocity = Vector3.zero
_viu.AssemblyAngularVelocity = Vector3.zero
local _vjd = Vector3.new(_vj7.X, _viu.Position.Y, _vj7.Z)
if (_vjd - _viu.Position).Magnitude > 0.05 then
_viu.CFrame = CFrame.lookAt(_viu.Position, _vjd)
end
drawNeonPathSmooth(_viu.Position, {}, 1, _vj7)
if _vj4 <= 0.05 then
if lockedDoorHasBeenTapped and Config.waitUntilDoorDisappears then
statusTopLabel.Text = _dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWDEMDBoRCwxBPBkdWCkdAAAdAUslFRkdWDICRSoRFgoRChMOCkhDSw==")
else
statusTopLabel.Text = _dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWCkdAAARCwxBPhkACkZFMQcVABlBSlhfC09M")
end
if not isTappingDoor then
lockedDoorOpenedStart = (lockedDoorOpenedStart > 0) and lockedDoorOpenedStart or _vis
task.spawn(function()
executeDoorOpenPulse(_vj3)
end)
end
else
statusTopLabel.Text = string.format(_dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWDEMDBoRCwxBLh8CHRRNJBpYIQQOCFZHXUhcAx1R"), _vj4)
end
return
end
if lastPathTargetDoor ~= _vj3 or #activeWaypoints == 0 then
stuckStrikes = 0
requestPathRebuild(_vj7, _vj3, true)
end

if not lastProgressPos then
lastProgressPos = _viu.Position
lastProgressTime = _vis
else
local _vje = (_viu.Position - lastProgressPos).Magnitude
if _vje >= 2.0 then
lastProgressPos = _viu.Position
lastProgressTime = _vis
elseif (_vis - lastProgressTime) >= 0.42 then
lastProgressPos = _viu.Position
lastProgressTime = _vis
stuckStrikes = stuckStrikes + 1
local _vjf = findCornerEscapePoint(_viu.Position, _vj7, _vj3)
if _vjf then
cornerEscapeWp = _vjf
cornerEscapeUntil = _vis + 0.55
end
if Config.movementMode == _dcoqb("DRcDEw==") then
_viv.Jump = true
end
requestPathRebuild(_vj7, _vj3, true)
if stuckStrikes >= (16 - 7) then
unreachableDoorRecords[_vj3] = _vis + 6.0
if lockedDoorInstance == _vj3 then
lockedDoorInstance = nil
end
resetActiveNavigationState()
return
end
end
end

if cornerEscapeWp and _vis < cornerEscapeUntil then
if (cornerEscapeWp - _viu.Position).Magnitude > 1.8 then
drawNeonPathSmooth(_viu.Position, { cornerEscapeWp }, 1, _vj7)
statusTopLabel.Text = _dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWCQUFQ8LFgIPHVYsFxQDABxYSksuGAUbGQUBAEBWSw==")
stepCharacterAlongWaypoints(_viu, _viv, { cornerEscapeWp }, 1, _vj7, _vj3, _vir)
return
else
cornerEscapeWp = nil
end
end

local _vjg = (Config.movementMode == _dcoqb("DRcDEw=="))
while currentWpIndex < #activeWaypoints do
local _vjh = activeWaypoints[currentWpIndex]
local _vji = activeWaypoints[currentWpIndex + 1]
local _vjj = _vjg
and Vector3.new(_vjh.X - _viu.Position.X, 0, _vjh.Z - _viu.Position.Z).Magnitude
or (_vjh - _viu.Position).Magnitude
local _vjk = _vjg and 1.6 or 2.4
if _vjj <= _vjk then
currentWpIndex = currentWpIndex + 1
elseif _vji then
local _vjl = _vji - _vjh
local _vjm = _viu.Position - _vjh
if _vjl.Magnitude > 0.1
and _vjm:Dot(_vjl.Unit) > 0.2
and isBoxClear3D(_viu.Position, _vji, _vj3, 1.15, _vjg)
then
currentWpIndex = currentWpIndex + 1
else
break
end
else
break
end
end
statusTopLabel.Text = string.format(
_dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWEMeRUNGRS8OFQRPUEMJCE4ERU5PSxAcUQ=="),
string.upper(Config.movementMode),
math.floor(_vja),
_vj4
)
local _vjn = findBestDoorStandPoint(_vj3, _vj7, _viu.Position)
local _vjo = (#activeWaypoints > 0) and activeWaypoints or { _vjn }
local _vjp = (#activeWaypoints > 0) and currentWpIndex or 1
drawNeonPathSmooth(_viu.Position, _vjo, _vjp, _vj7)
local _vjq = false
currentWpIndex, hitWall = stepCharacterAlongWaypoints(
_viu,
_viv,
_vjo,
_vjp,
_vj7,
_vj3,
_vir
)
if _vjq and (_vis - lastPathComputeTime) >= 0.48 then
requestPathRebuild(_vj7, _vj3, true)
end
else
lastProgressPos = nil
local _vjr = getBoundedSafeRetreatSpot(_viu.Position)
if _vjr then
local _vjs = (_vjr - _viu.Position).Magnitude
if _vjs > 3.0 then
drawNeonPathSmooth(_viu.Position, { _vjr }, 1, _vjr)
stepCharacterAlongWaypoints(_viu, _viv, { _vjr }, 1, _vjr, nil, _vir)
statusTopLabel.Text = _dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWC4CCQoRCwxBKRcJHUYpDB0MBAUCH1hBVg==")
return
end
end
clearNeonPathPool()
_viv:Move(Vector3.zero, false)
if Config.movementMode == _dcoqb("HBoW") then
_viu.AssemblyLinearVelocity = Vector3.zero
_viu.AssemblyAngularVelocity = Vector3.zero
end
if _vj5 > 0 and _vj6 < math.huge then
statusTopLabel.Text = string.format(_dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWDEMDBoRCwxBLh8CHRRNWVNYQA8SWl4hFxFNQEBJAxhI"), Config.startTimerThreshold, _vj6)
else
statusTopLabel.Text = _dcoqb("IT0yWDICAgkUAEssHxgaWEYRRU4rEQoVDwVVWDUOBAAWDAUGWjAACkY/AA8cHEspGxoDFxEIAAA8CgQTCVhBVg==")
end
end
end)
UserInputService.InputBegan:Connect(function(_vjt, _vju)
if not _vju and _vjt.KeyCode == Enum.KeyCode.K then
Config.guiVisible = not Config.guiVisible
mainFrame.Visible = Config.guiVisible
end
end)
refreshThemeColors()
scanAllHalloweenDoors()
