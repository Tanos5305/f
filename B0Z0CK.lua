-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Variables
local ESPEnabled = false
local TeleportEnabled = false
local NoclipEnabled = false
local MenuOpen = false
local LuaExecutorOpen = false

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DarkMenu"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame for the Main Menu (Initially Hidden)
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 200, 0, 150)
menuFrame.Position = UDim2.new(0.5, -100, 0.1, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Parent = screenGui

-- Create Lua Executor Button
local luaExecutorButton = Instance.new("TextButton")
luaExecutorButton.Size = UDim2.new(1, -20, 0, 40)
luaExecutorButton.Position = UDim2.new(0, 10, 0, 5)
luaExecutorButton.Text = "Lua Executor"
luaExecutorButton.TextColor3 = Color3.new(1, 1, 1)
luaExecutorButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
luaExecutorButton.BorderSizePixel = 0
luaExecutorButton.Font = Enum.Font.SourceSansBold
luaExecutorButton.TextSize = 16
luaExecutorButton.Parent = menuFrame

-- Create ESP Button
local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(1, -20, 0, 40)
espButton.Position = UDim2.new(0, 10, 0, 50)
espButton.Text = "ESP: OFF"
espButton.TextColor3 = Color3.new(1, 1, 1)
espButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espButton.BorderSizePixel = 0
espButton.Font = Enum.Font.SourceSansBold
espButton.TextSize = 16
espButton.Parent = menuFrame

-- Create Teleport Button
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(1, -20, 0, 40)
teleportButton.Position = UDim2.new(0, 10, 0, 95)
teleportButton.Text = "CTRL Click TP: OFF"
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportButton.BorderSizePixel = 0
teleportButton.Font = Enum.Font.SourceSansBold
teleportButton.TextSize = 16
teleportButton.Parent = menuFrame

-- Create Noclip Button
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(1, -20, 0, 40)
noclipButton.Position = UDim2.new(0, 10, 0, 140)
noclipButton.Text = "Noclip: OFF"
noclipButton.TextColor3 = Color3.new(1, 1, 1)
noclipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noclipButton.BorderSizePixel = 0
noclipButton.Font = Enum.Font.SourceSansBold
noclipButton.TextSize = 16
noclipButton.Parent = menuFrame

-- Create Lua Executor Menu (Initially Hidden)
local luaExecutorMenu = Instance.new("Frame")
luaExecutorMenu.Size = UDim2.new(0, 300, 0, 300)
luaExecutorMenu.Position = UDim2.new(0.5, -150, 0.5, -150)
luaExecutorMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
luaExecutorMenu.BorderSizePixel = 0
luaExecutorMenu.Visible = false
luaExecutorMenu.Parent = screenGui

-- Create Close Button for Lua Executor Menu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.Parent = luaExecutorMenu

-- Create TextBox for Lua Script input
local scriptInput = Instance.new("TextBox")
scriptInput.Size = UDim2.new(1, -20, 0, 200)
scriptInput.Position = UDim2.new(0, 10, 0, 10)
scriptInput.Text = ""
scriptInput.TextColor3 = Color3.new(1, 1, 1)
scriptInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scriptInput.BorderSizePixel = 0
scriptInput.Font = Enum.Font.SourceSansBold
scriptInput.TextSize = 16
scriptInput.MultiLine = true
scriptInput.Parent = luaExecutorMenu

-- Create Execute Button
local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(1, -20, 0, 40)
executeButton.Position = UDim2.new(0, 10, 0, 220)
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.new(1, 1, 1)
executeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
executeButton.BorderSizePixel = 0
executeButton.Font = Enum.Font.SourceSansBold
executeButton.TextSize = 16
executeButton.Parent = luaExecutorMenu

-- Create B0Z0CK Button to Toggle Menu Visibility
local b0z0ckButton = Instance.new("TextButton")
b0z0ckButton.Size = UDim2.new(0, 100, 0, 40)
b0z0ckButton.Position = UDim2.new(1, -110, 0, 10)
b0z0ckButton.Text = "B0Z0CK"
b0z0ckButton.TextColor3 = Color3.new(1, 1, 1)
b0z0ckButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
b0z0ckButton.BorderSizePixel = 0
b0z0ckButton.Font = Enum.Font.SourceSansBold
b0z0ckButton.TextSize = 16
b0z0ckButton.Parent = screenGui

-- Function to create ESP for players
local function createESP(player)
    if not player.Character or not player.Character:FindFirstChild("Head") then
        return
    end

    -- Highlight Setup
    if not player.Character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        highlight.Parent = player.Character
        highlight.FillColor = Color3.new(1, 0, 0)
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.new(1, 0, 0)
        highlight.OutlineTransparency = 0
    end

    -- BillboardGui for displaying information
    if not player.Character:FindFirstChild("PlayerInfo") then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "PlayerInfo"
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.Adornee = player.Character:FindFirstChild("Head")
        billboardGui.AlwaysOnTop = true
        billboardGui.Parent = player.Character

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextSize = 14
        textLabel.TextStrokeTransparency = 0.5
        textLabel.Parent = billboardGui

        -- Update TextLabel in real time
        local function update()
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local level = nil

            if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Level") then
                level = player.leaderstats.Level.Value
            end

            textLabel.Text = player.Name .. (level and " | Level " .. level or "")
        end

        -- Update the text continuously
        update()
        game:GetService("RunService").Heartbeat:Connect(update)
    end
end

-- Function to execute Lua script entered in the Lua Executor menu
local function executeLuaScript(script)
    local success, errorMessage = pcall(function()
        local func = loadstring(script)
        func()
    end)
    if not success then
        warn("Error executing script: " .. errorMessage)
    end
end

-- Button Click Events
luaExecutorButton.MouseButton1Click:Connect(function()
    LuaExecutorOpen = not LuaExecutorOpen
    luaExecutorMenu.Visible = LuaExecutorOpen
end)

closeButton.MouseButton1Click:Connect(function()
    LuaExecutorOpen = false
    luaExecutorMenu.Visible = false
end)

executeButton.MouseButton1Click:Connect(function()
    local script = scriptInput.Text
    executeLuaScript(script)
end)

b0z0ckButton.MouseButton1Click:Connect(function()
    MenuOpen = not MenuOpen
    menuFrame.Visible = MenuOpen
end)

-- Function to handle the character loading
local function onCharacterAdded(character)
    -- Enable noclip if it's enabled
    RunService.Heartbeat:Connect(function()
        if NoclipEnabled then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

-- Connect the player's character when they spawn
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

-- Detect players joining and leaving for ESP
Players.PlayerAdded:Connect(function(player)
    if ESPEnabled then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player.Character and player.Character:FindFirstChild("Highlight") then
        player.Character.Highlight:Destroy()
    end
end)

-- Additional Button Events for ESP, Teleport, and Noclip
espButton.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    espButton.Text = ESPEnabled and "ESP: ON" or "ESP: OFF"
    for _, player in pairs(Players:GetPlayers()) do
        if ESPEnabled then
            createESP(player)
        else
            if player.Character and player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
        end
    end
end)

teleportButton.MouseButton1Click:Connect(function()
    TeleportEnabled = not TeleportEnabled
    teleportButton.Text = TeleportEnabled and "CTRL Click TP: ON" or "CTRL Click TP: OFF"
end)

noclipButton.MouseButton1Click:Connect(function()
    NoclipEnabled = not NoclipEnabled
    noclipButton.Text = NoclipEnabled and "Noclip: ON" or "Noclip: OFF"
end)

-- Handle Ctrl Click Teleport
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if TeleportEnabled and input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mouse = LocalPlayer:GetMouse()
        local targetPosition = mouse.Hit.p
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    end
end)

-- Initialize character on spawn
if LocalPlayer.Character then
    onCharacterAdded(LocalPlayer.Character)
else
    LocalPlayer.CharacterAdded:Wait()
end