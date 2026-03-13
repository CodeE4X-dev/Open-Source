local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local UI_PARENT = RunService:IsStudio() and Player:WaitForChild("PlayerGui") or CoreGui

local Theme = {
    Background = Color3.fromRGB(15,15,22),
    Shadow = Color3.fromRGB(0,0,0),
    TextTitle = Color3.fromRGB(255,255,255),
    TextSub = Color3.fromRGB(170,170,190),
    Accent1 = Color3.fromRGB(0,212,255),
    Accent2 = Color3.fromRGB(0,85,255)
}

local function ShortError(err)
    err = tostring(err)
    if #err > 70 then
        err = string.sub(err,1,70).."..."
    end
    return err
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ts_so_skidded"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = UI_PARENT

local Loader = Instance.new("CanvasGroup")
Loader.Name = "Loader"
Loader.Size = UDim2.fromOffset(340,160)
Loader.Position = UDim2.fromScale(0.5,0.5)
Loader.AnchorPoint = Vector2.new(0.5,0.5)
Loader.BackgroundColor3 = Theme.Background
Loader.BackgroundTransparency = 0.05
Loader.BorderSizePixel = 0
Loader.GroupTransparency = 1
Loader.Parent = ScreenGui

local LoaderCorner = Instance.new("UICorner")
LoaderCorner.CornerRadius = UDim.new(0,14)
LoaderCorner.Parent = Loader

local Stroke = Instance.new("UIStroke")
Stroke.Color = Theme.Accent1
Stroke.Thickness = 1.5
Stroke.Transparency = 0.5
Stroke.Parent = Loader

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5,0.5)
Shadow.Position = UDim2.fromScale(0.5,0.5)
Shadow.Size = UDim2.fromScale(1.15,1.3)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Theme.Shadow
Shadow.ImageTransparency = 0.4
Shadow.ZIndex = -1
Shadow.Parent = Loader

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,40)
TopBar.BackgroundTransparency = 1
TopBar.Parent = Loader

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.fromOffset(22,22)
Icon.Position = UDim2.fromOffset(15,10)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://10709818626"
Icon.Parent = TopBar

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1,-50,1,0)
TitleText.Position = UDim2.fromOffset(45,0)
TitleText.BackgroundTransparency = 1
TitleText.Text = 'Starting <font color="#00D4FF">NodeX</font>'
TitleText.RichText = true
TitleText.TextColor3 = Theme.TextTitle
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TopBar

local CenterImage = Instance.new("ImageLabel")
CenterImage.Size = UDim2.fromOffset(50,50)
CenterImage.Position = UDim2.fromScale(0.5,0.48)
CenterImage.AnchorPoint = Vector2.new(0.5,0.5)
CenterImage.BackgroundTransparency = 1
CenterImage.Image = "rbxassetid://10709818626"
CenterImage.ImageColor3 = Theme.Accent1
CenterImage.Parent = Loader

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0.85,0,0,6)
BarBg.Position = UDim2.fromScale(0.5,0.82)
BarBg.AnchorPoint = Vector2.new(0.5,0.5)
BarBg.BackgroundColor3 = Color3.fromRGB(30,30,40)
BarBg.BorderSizePixel = 0
BarBg.ClipsDescendants = true
BarBg.Parent = Loader

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1,0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.fromScale(0,1)
BarFill.BackgroundColor3 = Color3.fromRGB(255,255,255)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1,0)
BarFillCorner.Parent = BarFill

local BarGradient = Instance.new("UIGradient")
BarGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Theme.Accent2),
    ColorSequenceKeypoint.new(1,Theme.Accent1)
}
BarGradient.Parent = BarFill

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0.85,0,0,20)
Status.Position = UDim2.fromScale(0.5,0.92)
Status.AnchorPoint = Vector2.new(0.5,0.5)
Status.BackgroundTransparency = 1
Status.Text = "Initializing..."
Status.TextColor3 = Theme.TextSub
Status.Font = Enum.Font.GothamMedium
Status.TextSize = 11
Status.TextXAlignment = Enum.TextXAlignment.Center
Status.Parent = Loader

local function ExecuteLoader()
    local loaderScale = Instance.new("UIScale")
    loaderScale.Parent = Loader
    loaderScale.Scale = 0.85

    TweenService:Create(loaderScale,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1}):Play()
    TweenService:Create(Loader,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{GroupTransparency=0}):Play()

    local spinTween = TweenService:Create(CenterImage,TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,-1),{Rotation=360})
    spinTween:Play()

    local function SetProgress(p,t)
        TweenService:Create(BarFill,TweenInfo.new(t,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size=UDim2.fromScale(p,1)}):Play()
        task.wait(t)
    end

    Status.Text = "Loading core modules..."
    SetProgress(0.25,0.8)

    Status.Text = "Setting FPS cap..."
    pcall(function()
        if setfpscap then setfpscap(math.huge) end
    end)
    SetProgress(0.40,0.5)

    Status.Text = "Loading Node.lua..."
    local success1,err1 = pcall(function()
        if setfpscap then setfpscap(math.huge) end
        loadstring(game:HttpGet("http://194.13.80.145:7000/raw/Node.lua"))()
        task.wait(0.5)
    end)

    if not success1 then
        Status.TextColor3 = Color3.fromRGB(255,80,80)
        Status.Text = "Script1: "..ShortError(err1)
        warn(err1)
    end

    SetProgress(0.70,0.8)

    Status.TextColor3 = Theme.TextSub
    Status.Text = "Loading Optimizer.lua..."

    local success2,err2 = pcall(function()
        if setfpscap then setfpscap(math.huge) end
        loadstring(game:HttpGet("http://194.13.80.145:7000/raw/Optimizer.lua"))()
        task.wait(0.5)
    end)

    if not success2 then
        Status.TextColor3 = Color3.fromRGB(255,80,80)
        Status.Text = "Script2: "..ShortError(err2)
        warn(err2)
    end

    SetProgress(0.90,0.8)

    if success1 and success2 then
        Status.Text = "Successfully Loaded!"
        Status.TextColor3 = Theme.Accent1
        SetProgress(1,0.5)
    else
        Status.Text = "Loaded with errors"
        SetProgress(1,0.5)
        task.wait(1.5)
    end

    task.wait(0.5)

    spinTween:Cancel()

    TweenService:Create(loaderScale,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Scale=0.8}):Play()

    local fadeOut = TweenService:Create(Loader,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{GroupTransparency=1})
    fadeOut:Play()

    fadeOut.Completed:Wait()
    ScreenGui:Destroy()
end

task.spawn(ExecuteLoader)
