-- ts so ai pls dont judge i cant make guis hehe
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local function checkToSConfirmed()
    local success = pcall(function()
        return readfile("nodex_confirm_tos.txt")
    end)
    return success
end

local function createToSFile()
    local success = pcall(function()
        writefile("nodex_confirm_tos.txt", "confirmed")
    end)
    return success
end

local function executeMain()
    local scriptSrc = [[
    loadstring(game:HttpGet("https://4x.wtf/main"))()
    ]]
    
    local success, func = pcall(loadstring, scriptSrc)
    if success and func then
        pcall(func)
    end
end

if checkToSConfirmed() then
    executeMain()
else
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NodeX_ToS"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local player = game:GetService("Players").LocalPlayer
    screenGui.Parent = player and player:FindFirstChild("PlayerGui") or game:GetService("CoreGui")
    
    local overlay = Instance.new("Frame")
    overlay.Name = "Overlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.5
    overlay.Parent = screenGui
    
    local popup = Instance.new("Frame")
    popup.Name = "Popup"
    popup.Size = UDim2.new(0, 380, 0, 240)
    popup.Position = UDim2.new(0.5, -190, 0.5, -120)
    popup.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    popup.BorderSizePixel = 0
    popup.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = popup
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Parent = popup
    
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = popup
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -45, 1, 0)
    title.Position = UDim2.new(0, 15, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "NodeX - Terms of Service"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar
    
    local closeBtn = Instance.new("ImageButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.new(0, 24, 0, 24)
    closeBtn.Position = UDim2.new(1, -32, 0.5, -12)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Image = "rbxassetid://10747383580"
    closeBtn.ImageColor3 = Color3.fromRGB(180, 180, 180)
    closeBtn.Parent = titleBar
    
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, -30, 1, -70)
    content.Position = UDim2.new(0, 15, 0, 50)
    content.BackgroundTransparency = 1
    content.Parent = popup
    
    local message = Instance.new("TextLabel")
    message.Name = "Message"
    message.Size = UDim2.new(1, 0, 0, 40)
    message.BackgroundTransparency = 1
    message.Text = "Dengan melanjutkan, Anda menyetujui Terms of Service NodeX"
    message.TextColor3 = Color3.fromRGB(220, 220, 220)
    message.Font = Enum.Font.Gotham
    message.TextSize = 14
    message.TextWrapped = true
    message.Parent = content
    
    local linkBox = Instance.new("Frame")
    linkBox.Name = "LinkBox"
    linkBox.Size = UDim2.new(1, 0, 0, 40)
    linkBox.Position = UDim2.new(0, 0, 0, 45)
    linkBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    linkBox.Parent = content
    
    local linkCorner = Instance.new("UICorner")
    linkCorner.CornerRadius = UDim.new(0, 6)
    linkCorner.Parent = linkBox
    
    local linkText = Instance.new("TextLabel")
    linkText.Name = "LinkText"
    linkText.Size = UDim2.new(1, -70, 1, 0)
    linkText.Position = UDim2.new(0, 12, 0, 0)
    linkText.BackgroundTransparency = 1
    linkText.Text = "https://4x.wtf/nodex-tos"
    linkText.TextColor3 = Color3.fromRGB(100, 180, 255)
    linkText.Font = Enum.Font.Gotham
    linkText.TextSize = 13
    linkText.TextXAlignment = Enum.TextXAlignment.Left
    linkText.Parent = linkBox
    
    local copyBtn = Instance.new("TextButton")
    copyBtn.Name = "CopyButton"
    copyBtn.Size = UDim2.new(0, 60, 0, 28)
    copyBtn.Position = UDim2.new(1, -66, 0.5, -14)
    copyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    copyBtn.Text = "Copy"
    copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    copyBtn.Font = Enum.Font.Gotham
    copyBtn.TextSize = 12
    copyBtn.Parent = linkBox
    
    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0, 4)
    copyCorner.Parent = copyBtn
    
    local continueBtn = Instance.new("TextButton")
    continueBtn.Name = "ContinueButton"
    continueBtn.Size = UDim2.new(0, 140, 0, 40)
    continueBtn.Position = UDim2.new(0, 0, 1, -45)
    continueBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    continueBtn.Text = "Continue"
    continueBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    continueBtn.Font = Enum.Font.GothamBold
    continueBtn.TextSize = 14
    continueBtn.Parent = content
    
    local continueCorner = Instance.new("UICorner")
    continueCorner.CornerRadius = UDim.new(0, 6)
    continueCorner.Parent = continueBtn
    
    local cancelBtn = Instance.new("TextButton")
    cancelBtn.Name = "CancelButton"
    cancelBtn.Size = UDim2.new(0, 100, 0, 40)
    cancelBtn.Position = UDim2.new(1, -100, 1, -45)
    cancelBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    cancelBtn.Text = "Cancel"
    cancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    cancelBtn.Font = Enum.Font.Gotham
    cancelBtn.TextSize = 14
    cancelBtn.Parent = content
    
    local cancelCorner = Instance.new("UICorner")
    cancelCorner.CornerRadius = UDim.new(0, 6)
    cancelCorner.Parent = cancelBtn
    
    local dragging = false
    local dragStart, startPos
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = popup.Position
        end
    end)
    
    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            popup.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    local function onHover(btn, color)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = btn.Name == "ContinueButton" and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(60, 60, 60)
            }):Play()
        end)
    end
    
    onHover(continueBtn, Color3.fromRGB(0, 140, 255))
    onHover(cancelBtn, Color3.fromRGB(200, 60, 60))
    onHover(copyBtn, Color3.fromRGB(80, 80, 80))
    
    -- Close hover
    closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(255, 80, 80)}):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(180, 180, 180)}):Play()
    end)
    
    copyBtn.MouseButton1Click:Connect(function()
        setclipboard("https://4x.wtf/nodex-tos")
        local oldText = copyBtn.Text
        copyBtn.Text = "Copied!"
        task.wait(1)
        copyBtn.Text = oldText
    end)
    
    continueBtn.MouseButton1Click:Connect(function()
        if createToSFile() then
            TweenService:Create(overlay, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TweenService:Create(popup, TweenInfo.new(0.3), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }):Play()
            
            task.wait(0.3)
            screenGui:Destroy()
            executeMain()
        end
    end)
    
    cancelBtn.MouseButton1Click:Connect(function()
        TweenService:Create(overlay, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        TweenService:Create(popup, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.3)
        screenGui:Destroy()
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        cancelBtn.MouseButton1Click:Fire()
    end)
    
    popup.Size = UDim2.new(0, 0, 0, 0)
    popup.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    TweenService:Create(popup, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 380, 0, 240),
        Position = UDim2.new(0.5, -190, 0.5, -120)
    }):Play()
end
