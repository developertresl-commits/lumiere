-- EssenceLibrary v1.0 (Patched & Optimized)
local EssenceLibrary = {}

-- ==================== UTILITY FUNCTIONS ====================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")

local function CreateNotification(Text, Duration)
    Duration = Duration or 5
    local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local Holder = game.CoreGui.Essence:WaitForChild("NotificationHolder")

    local GothamSemiFont = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    local GothamBoldFont = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

    local Notif = Instance.new("CanvasGroup")
    Notif.Name = "Notification"
    Notif.Size = UDim2.new(1, 0, 0, 0)
    Notif.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Notif.GroupTransparency = 1
    Notif.BorderSizePixel = 0
    Notif.Parent = Holder

    local ScaleObj = Instance.new("UIScale", Notif)
    ScaleObj.Scale = 0.8

    local UICorner = Instance.new("UICorner", Notif)
    UICorner.CornerRadius = UDim.new(0, 10)

    local UIStroke = Instance.new("UIStroke", Notif)
    UIStroke.Color = Color3.fromRGB(35, 35, 35)
    UIStroke.Thickness = 1
    UIStroke.Transparency = 1

    local TitleLabel = Instance.new("TextLabel", Notif)
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(1, -30, 0, 20)
    TitleLabel.Position = UDim2.new(0, 15, 0, 15)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.FontFace = GothamBoldFont
    TitleLabel.Text = "ESSENCE"
    TitleLabel.TextColor3 = Color3.fromRGB(113, 82, 255)
    TitleLabel.TextSize = 13
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local DescLabel = Instance.new("TextLabel", Notif)
    DescLabel.Name = "Description"
    DescLabel.BackgroundTransparency = 1
    DescLabel.FontFace = GothamSemiFont
    DescLabel.Text = Text
    DescLabel.TextColor3 = Color3.fromRGB(125, 125, 125)
    DescLabel.TextSize = 14
    DescLabel.TextWrapped = true
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextYAlignment = Enum.TextYAlignment.Top

    local paddingX = 30
    local topMargin = 35
    local bottomPadding = 28

    local maxWidth = Holder.AbsoluteSize.X - paddingX
    local textSize = TextService:GetTextSize(Text, 14, Enum.Font.Gotham, Vector2.new(maxWidth, 1000))
    local targetHeight = math.clamp(textSize.Y + topMargin + bottomPadding, 80, 300)

    DescLabel.Position = UDim2.new(0, 15, 0, topMargin)
    DescLabel.Size = UDim2.new(1, -paddingX, 0, textSize.Y)

    TweenService:Create(Notif, tInfo, { Size = UDim2.new(1, 0, 0, targetHeight), GroupTransparency = 0 }):Play()
    TweenService:Create(ScaleObj, tInfo, { Scale = 1 }):Play()
    TweenService:Create(UIStroke, tInfo, { Transparency = 0 }):Play()

    local TimerBar = Instance.new("Frame", Notif)
    TimerBar.Name = "Timer"
    TimerBar.Size = UDim2.new(1, -24, 0, 2)
    TimerBar.Position = UDim2.new(0, 12, 1, -8)
    TimerBar.BackgroundColor3 = Color3.fromRGB(113, 82, 255)
    TimerBar.BorderSizePixel = 0
    TimerBar.ZIndex = 2

    TweenService:Create(TimerBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 0, 2) }):Play()

    task.delay(Duration, function()
        local fadeOut = TweenService:Create(Notif, tInfo, { GroupTransparency = 1 })
        TweenService:Create(ScaleObj, tInfo, { Scale = 0.8 }):Play()
        TweenService:Create(UIStroke, tInfo, { Transparency = 1 }):Play()
        fadeOut:Play()
        fadeOut.Completed:Connect(function()
            Notif:Destroy()
        end)
    end)
end

-- ==================== WINDOW CONSTRUCTION ====================
function EssenceLibrary:Window(params)
    local Window = {}
    Window.GameName = params.GameName
    Window.Version = params.Version

    local Essence = {}
    local CoreGui = game:GetService("CoreGui")

    -- Create ScreenGui
    Essence["1"] = Instance.new("ScreenGui", CoreGui)
    Essence["1"].IgnoreGuiInset = true
    Essence["1"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    Essence["1"].Name = "Essence"
    Essence["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Essence["1"].ResetOnSpawn = false

    -- Main CanvasGroup
    Essence["2"] = Instance.new("CanvasGroup", Essence["1"])
    Essence["2"].BorderSizePixel = 0
    Essence["2"].BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    Essence["2"].AnchorPoint = Vector2.new(0.5, 0.5)
    Essence["2"].Size = UDim2.new(0, 611, 0, 459)
    Essence["2"].Position = UDim2.new(0.5, 0, 0.5, 0)
    Essence["2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Essence["2"].Name = "Main"
    Essence["2"]:SetAttribute("Minimized", false)

    local mainCorner = Instance.new("UICorner", Essence["2"])
    mainCorner.CornerRadius = UDim.new(0.05, 0)

    -- Top bar
    local topBar = Instance.new("Frame", Essence["2"])
    topBar.BorderSizePixel = 0
    topBar.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    topBar.Size = UDim2.new(0, 611, 0, 75)
    topBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    topBar.Name = "Top"
    topBar.ZIndex = 2

    local barLine = Instance.new("Frame", topBar)
    barLine.ZIndex = 2
    barLine.BorderSizePixel = 0
    barLine.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
    barLine.Size = UDim2.new(0, 611, 0, 1)
    barLine.Position = UDim2.new(0, 0, 1, 0)
    barLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
    barLine.Name = "Bar"

    -- Logo
    local logo = Instance.new("ImageLabel", topBar)
    logo.Active = true
    logo.BorderSizePixel = 0
    logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    logo.ImageColor3 = Color3.fromRGB(114, 83, 255)
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.Image = "rbxassetid://110653068142193"
    logo.Size = UDim2.new(0, 85, 0, 87)
    logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    logo.BackgroundTransparency = 1
    logo.Name = "Logo"
    logo.Position = UDim2.new(0.05936, 0, 0.5, 0)
    Instance.new("UIAspectRatioConstraint", logo)

    local titleLabel = Instance.new("TextLabel", topBar)
    titleLabel.BorderSizePixel = 0
    titleLabel.TextSize = 15
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Top
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    titleLabel.TextColor3 = Color3.fromRGB(114, 83, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(0, 68, 0, 19)
    titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Text = "ESSENCE"
    titleLabel.Name = "Title"
    titleLabel.Position = UDim2.new(0.106, 0, 0.265, 0)

    local gameNameLabel = Instance.new("TextLabel", topBar)
    gameNameLabel.BorderSizePixel = 0
    gameNameLabel.TextSize = 15
    gameNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    gameNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    gameNameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    gameNameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    gameNameLabel.BackgroundTransparency = 1
    gameNameLabel.Size = UDim2.new(0, 315, 0, 19)
    gameNameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    gameNameLabel.Text = Window.GameName .. " - " .. Window.Version
    gameNameLabel.Name = "GameName"
    gameNameLabel.Position = UDim2.new(0.106, 0, 0.463, 0)

    -- Control buttons container
    local controlFrame = Instance.new("Frame", topBar)
    controlFrame.BorderSizePixel = 0
    controlFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    controlFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    controlFrame.Size = UDim2.new(0, 133, 0, 38)
    controlFrame.Position = UDim2.new(0.853, 0, 0.5, 0)
    controlFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    controlFrame.Name = "Control"
    Instance.new("UICorner", controlFrame).CornerRadius = UDim.new(0.22, 0)
    local controlStroke = Instance.new("UIStroke", controlFrame)
    controlStroke.Color = Color3.fromRGB(41, 41, 41)

    local secondBar = Instance.new("Frame", controlFrame)
    secondBar.BorderSizePixel = 0
    secondBar.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
    secondBar.AnchorPoint = Vector2.new(0.5, 0.5)
    secondBar.Size = UDim2.new(0, 1, 0, 37)
    secondBar.Position = UDim2.new(0.65789, 0, 0.5, 0)
    secondBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    secondBar.Name = "SecondBar"

    local firstBar = Instance.new("Frame", controlFrame)
    firstBar.BorderSizePixel = 0
    firstBar.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
    firstBar.AnchorPoint = Vector2.new(0.5, 0.5)
    firstBar.Size = UDim2.new(0, 1, 0, 37)
    firstBar.Position = UDim2.new(0.34211, 0, 0.5, 0)
    firstBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    firstBar.Name = "Bar"

    -- Close button
    local closeFrame = Instance.new("Frame", controlFrame)
    closeFrame.BorderSizePixel = 0
    closeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeFrame.Size = UDim2.new(0, 45, 0, 38)
    closeFrame.Position = UDim2.new(0.66165, 0, 0, 0)
    closeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    closeFrame.Name = "X"
    closeFrame.BackgroundTransparency = 1

    local closeImg = Instance.new("ImageLabel", closeFrame)
    closeImg.BorderSizePixel = 0
    closeImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeImg.ImageColor3 = Color3.fromRGB(126, 126, 126)
    closeImg.AnchorPoint = Vector2.new(0.5, 0.5)
    closeImg.Image = "rbxassetid://10747384394"
    closeImg.Size = UDim2.new(0, 23, 0, 23)
    closeImg.BorderColor3 = Color3.fromRGB(0, 0, 0)
    closeImg.BackgroundTransparency = 1
    closeImg.Name = "Image"
    closeImg.Position = UDim2.new(0.5, 0, 0.5, 0)
    Instance.new("UIAspectRatioConstraint", closeImg)

    local closeTrigger = Instance.new("TextButton", closeFrame)
    closeTrigger.BorderSizePixel = 0
    closeTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    closeTrigger.TextSize = 14
    closeTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    closeTrigger.Size = UDim2.new(1, 0, 1, 0)
    closeTrigger.BackgroundTransparency = 1
    closeTrigger.Name = "Trigger"
    closeTrigger.Text = ""

    -- Minimize button
    local minFrame = Instance.new("Frame", controlFrame)
    minFrame.BorderSizePixel = 0
    minFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    minFrame.Size = UDim2.new(0, 42, 0, 38)
    minFrame.Position = UDim2.new(0.34586, 0, 0, 0)
    minFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    minFrame.Name = "Minimize"
    minFrame.BackgroundTransparency = 1

    local minImg = Instance.new("ImageLabel", minFrame)
    minImg.BorderSizePixel = 0
    minImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    minImg.ImageColor3 = Color3.fromRGB(126, 126, 126)
    minImg.AnchorPoint = Vector2.new(0.5, 0.5)
    minImg.Image = "rbxassetid://10734896206"
    minImg.Size = UDim2.new(0, 23, 0, 23)
    minImg.BorderColor3 = Color3.fromRGB(0, 0, 0)
    minImg.BackgroundTransparency = 1
    minImg.Name = "Image"
    minImg.Position = UDim2.new(0.5, 0, 0.5, 0)
    Instance.new("UIAspectRatioConstraint", minImg)

    local minTrigger = Instance.new("TextButton", minFrame)
    minTrigger.BorderSizePixel = 0
    minTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    minTrigger.TextSize = 14
    minTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    minTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    minTrigger.Size = UDim2.new(1, 0, 1, 0)
    minTrigger.BackgroundTransparency = 1
    minTrigger.Name = "Trigger"
    minTrigger.Text = ""

    -- Discord invite button
    local extraFrame = Instance.new("Frame", controlFrame)
    extraFrame.BorderSizePixel = 0
    extraFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    extraFrame.Size = UDim2.new(0, 45, 0, 38)
    extraFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    extraFrame.Name = "Extra"
    extraFrame.BackgroundTransparency = 1

    local extraImg = Instance.new("ImageLabel", extraFrame)
    extraImg.BorderSizePixel = 0
    extraImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    extraImg.ImageColor3 = Color3.fromRGB(126, 126, 126)
    extraImg.AnchorPoint = Vector2.new(0.5, 0.5)
    extraImg.Image = "rbxassetid://100831342781312"
    extraImg.Size = UDim2.new(0, 23, 0, 23)
    extraImg.BorderColor3 = Color3.fromRGB(0, 0, 0)
    extraImg.BackgroundTransparency = 1
    extraImg.Name = "Image"
    extraImg.Position = UDim2.new(0.5, 0, 0.5, 0)
    Instance.new("UIAspectRatioConstraint", extraImg)

    local extraTrigger = Instance.new("TextButton", extraFrame)
    extraTrigger.BorderSizePixel = 0
    extraTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    extraTrigger.TextSize = 14
    extraTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    extraTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    extraTrigger.Size = UDim2.new(1, 0, 1, 0)
    extraTrigger.BackgroundTransparency = 1
    extraTrigger.Name = "Trigger"
    extraTrigger.Text = ""

    -- Main window stroke
    local mainStroke = Instance.new("UIStroke", Essence["2"])
    mainStroke.Color = Color3.fromRGB(36, 36, 36)

    -- Left side (tab bar)
    local leftFrame = Instance.new("Frame", Essence["2"])
    leftFrame.BorderSizePixel = 0
    leftFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    leftFrame.Size = UDim2.new(0, 183, 0, 383)
    leftFrame.Position = UDim2.new(0, 0, 0.16558, 0)
    leftFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    leftFrame.Name = "Left"

    local leftBar = Instance.new("Frame", leftFrame)
    leftBar.BorderSizePixel = 0
    leftBar.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
    leftBar.Size = UDim2.new(0, 1, 0, 384)
    leftBar.Position = UDim2.new(1, 0, 0, 0)
    leftBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    leftBar.Name = "Bar"

    -- Tab scrolling layout
    local tabScrolling = Instance.new("ScrollingFrame", leftFrame)
    tabScrolling.Active = true
    tabScrolling.BorderSizePixel = 0
    tabScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabScrolling.Name = "Layout"
    tabScrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabScrolling.Size = UDim2.new(0, 183, 0, 363)
    tabScrolling.ScrollBarImageColor3 = Color3.fromRGB(114, 83, 255)
    tabScrolling.Position = UDim2.new(0, 0, 0.026, 0)
    tabScrolling.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tabScrolling.ScrollBarThickness = 0
    tabScrolling.BackgroundTransparency = 1

    local tabPadding = Instance.new("UIPadding", tabScrolling)
    tabPadding.PaddingTop = UDim.new(0, 1)
    tabPadding.PaddingBottom = UDim.new(0, 1)

    local tabLayout = Instance.new("UIListLayout", tabScrolling)
    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabLayout.Padding = UDim.new(0, 7)
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Tabs container
    local tabsFolder = Instance.new("Folder", Essence["2"])
    tabsFolder.Name = "Tabs"

    -- Notification holder
    local notifHolder = Instance.new("Frame", Essence["1"])
    notifHolder.Interactable = false
    notifHolder.BorderSizePixel = 0
    notifHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    notifHolder.Size = UDim2.new(0, 280, 1, -40)
    notifHolder.Position = UDim2.new(1, -290, 0, 20)
    notifHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    notifHolder.Name = "NotificationHolder"
    notifHolder.BackgroundTransparency = 1

    local notifLayout = Instance.new("UIListLayout", notifHolder)
    notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    notifLayout.Padding = UDim.new(0, 10)
    notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    notifLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Mobile toggle button
    local mobileButton = Instance.new("Frame", Essence["1"])
    mobileButton.Visible = false
    mobileButton.Interactable = false
    mobileButton.BorderSizePixel = 0
    mobileButton.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    mobileButton.AnchorPoint = Vector2.new(0.5, 0.5)
    mobileButton.Size = UDim2.new(0, 60, 0, 60)
    mobileButton.Position = UDim2.new(0.1, 0, -0.25, 0)
    mobileButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    mobileButton.Name = "MobileButton"

    Instance.new("UICorner", mobileButton).CornerRadius = UDim.new(0.2, 0)
    local mobStroke = Instance.new("UIStroke", mobileButton)
    mobStroke.Color = Color3.fromRGB(36, 36, 36)

    local mobLogo = Instance.new("ImageLabel", mobileButton)
    mobLogo.Active = true
    mobLogo.BorderSizePixel = 0
    mobLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mobLogo.ImageColor3 = Color3.fromRGB(114, 83, 255)
    mobLogo.AnchorPoint = Vector2.new(0.5, 0.5)
    mobLogo.Image = "rbxassetid://110653068142193"
    mobLogo.Size = UDim2.new(0, 72, 0, 72)
    mobLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    mobLogo.BackgroundTransparency = 1
    mobLogo.Name = "Logo"
    mobLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
    Instance.new("UIAspectRatioConstraint", mobLogo)

    local mobTrigger = Instance.new("TextButton", mobileButton)
    mobTrigger.BorderSizePixel = 0
    mobTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    mobTrigger.TextSize = 14
    mobTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mobTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    mobTrigger.Size = UDim2.new(1, 0, 1, 0)
    mobTrigger.BackgroundTransparency = 1
    mobTrigger.Name = "Trigger"
    mobTrigger.Text = ""

    -- ==================== SCRIPTS ====================
    -- Close button functionality
    task.spawn(function()
        local function onCloseHoverEnter()
            TweenService:Create(closeImg, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(113, 82, 255) }):Play()
        end
        local function onCloseHoverLeave()
            TweenService:Create(closeImg, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(125, 125, 125) }):Play()
        end
        closeImg.MouseEnter:Connect(onCloseHoverEnter)
        closeImg.MouseLeave:Connect(onCloseHoverLeave)
        closeTrigger.MouseButton1Down:Connect(function()
            Essence["1"]:Destroy()
        end)
    end)

    -- Minimize button functionality
    local isMobile = not (UserInputService.KeyboardEnabled and UserInputService.MouseEnabled)
    task.spawn(function()
        local function onMinHoverEnter()
            TweenService:Create(minImg, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(113, 82, 255) }):Play()
        end
        local function onMinHoverLeave()
            TweenService:Create(minImg, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(125, 125, 125) }):Play()
        end
        minImg.MouseEnter:Connect(onMinHoverEnter)
        minImg.MouseLeave:Connect(onMinHoverLeave)
        minTrigger.MouseButton1Down:Connect(function()
            if Essence["2"].Visible then
                Essence["2"].Visible = false
                if isMobile then
                    mobileButton.Visible = true
                    mobileButton.Interactable = true
                    TweenService:Create(mobileButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        Position = UDim2.new(0.1, 0, 0.25, 0)
                    }):Play()
                else
                    local toggleKey = tostring(tabsFolder:WaitForChild("Settings").Scroll.Layout["Toggle UI"].Keybind:GetAttribute("Key"))
                    CreateNotification("Press " .. toggleKey .. " to show user interface again.", 3)
                    Essence["2"]:SetAttribute("Minimized", true)
                end
            end
        end)
    end)

    -- Discord button functionality
    task.spawn(function()
        local function onExtraHoverEnter()
            TweenService:Create(extraImg, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(113, 82, 255) }):Play()
        end
        local function onExtraHoverLeave()
            TweenService:Create(extraImg, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(125, 125, 125) }):Play()
        end
        extraImg.MouseEnter:Connect(onExtraHoverEnter)
        extraImg.MouseLeave:Connect(onExtraHoverLeave)
        extraTrigger.MouseButton1Down:Connect(function()
            if setclipboard then
                setclipboard("https://discord.com/invite/MDjNwamSS9")
            end
            CreateNotification("Successfully copied Discord link to the clipboard.", 3)
        end)
    end)

    -- Drag functionality
    task.spawn(function()
        local dragging = false
        local dragStart
        local startPos
        local function isMainPart(obj)
            return obj and (obj == Essence["2"] or obj:IsDescendantOf(Essence["2"]))
        end
        local function shouldBlockDrag(obj)
            return obj and (obj:IsA("TextButton") or obj:IsA("ImageButton") or obj:IsDescendantOf(tabsFolder) or obj == tabsFolder)
        end
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                local objects = CoreGui:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
                local valid, forbidden = false, false
                for _, obj in ipairs(objects) do
                    if shouldBlockDrag(obj) then forbidden = true; break
                    elseif isMainPart(obj) then valid = true end
                end
                if valid and not forbidden then
                    dragging = true
                    dragStart = input.Position
                    startPos = Essence["2"].Position
                end
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                Essence["2"].Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end)

    -- Mobile button functionality
    task.spawn(function()
        mobTrigger.MouseButton1Down:Connect(function()
            mobileButton.Interactable = false
            local hideTween = TweenService:Create(mobileButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(0.1, 0, -0.25, 0)
            })
            hideTween:Play()
            hideTween.Completed:Connect(function()
                mobileButton.Visible = false
                Essence["2"].Visible = true
            end)
        end)
    end)

    return Window
end

-- ==================== TAB CONSTRUCTION ====================
function EssenceLibrary:Tab(params)
    local Tab = {}
    Tab.Name = params.Name
    Tab.Image = params.Image
    Tab.Selected = params.Selected

    local main = game.CoreGui.Essence.Main
    local leftLayout = main.Left.Layout

    local tabBtn = Instance.new("Frame", leftLayout)
    tabBtn.BorderSizePixel = 0
    tabBtn.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    tabBtn.Size = UDim2.new(0, 157, 0, 35)
    tabBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tabBtn.Name = Tab.Name
    tabBtn.BackgroundTransparency = 1

    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0.25, 0)
    local btnStroke = Instance.new("UIStroke", tabBtn)
    btnStroke.Transparency = 1
    btnStroke.Color = Color3.fromRGB(36, 36, 36)

    local tabNameLabel = Instance.new("TextLabel", tabBtn)
    tabNameLabel.BorderSizePixel = 0
    tabNameLabel.TextSize = 14
    tabNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    tabNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabNameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    tabNameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    tabNameLabel.BackgroundTransparency = 1
    tabNameLabel.Size = UDim2.new(0.76535, 0, 1, 0)
    tabNameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tabNameLabel.Text = Tab.Name
    tabNameLabel.Name = "TabName"
    tabNameLabel.Position = UDim2.new(0.23465, 0, 0, 0)

    local tabPadding = Instance.new("UIPadding", tabNameLabel)
    tabPadding.PaddingBottom = UDim.new(0, 2)

    local tabImg = Instance.new("ImageLabel", tabBtn)
    tabImg.BorderSizePixel = 0
    tabImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabImg.ImageColor3 = Color3.fromRGB(126, 126, 126)
    tabImg.AnchorPoint = Vector2.new(0.5, 0.5)
    tabImg.Image = Tab.Image
    tabImg.Size = UDim2.new(0, 20, 0, 20)
    tabImg.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tabImg.BackgroundTransparency = 1
    tabImg.Name = "Image"
    tabImg.Position = UDim2.new(0.13, 0, 0.5, 0)
    Instance.new("UIAspectRatioConstraint", tabImg)

    local activeBar = Instance.new("Frame", tabBtn)
    activeBar.BorderSizePixel = 0
    activeBar.BackgroundColor3 = Color3.fromRGB(114, 83, 255)
    activeBar.AnchorPoint = Vector2.new(0.5, 0.5)
    activeBar.Size = UDim2.new(0, 4, 0, 18)
    activeBar.Position = UDim2.new(0, 0, 0.5, 0)
    activeBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    activeBar.Name = "Bar"
    activeBar.BackgroundTransparency = 1
    Instance.new("UICorner", activeBar)

    local trigger = Instance.new("TextButton", tabBtn)
    trigger.BorderSizePixel = 0
    trigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    trigger.TextSize = 14
    trigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    trigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    trigger.Size = UDim2.new(1, 0, 1, 0)
    trigger.BackgroundTransparency = 1
    trigger.Name = "Trigger"
    trigger.Text = ""

    -- Tab content frame
    local tabContent = Instance.new("Frame", main.Tabs)
    tabContent.Visible = false
    tabContent.Interactable = false
    tabContent.BorderSizePixel = 0
    tabContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabContent.Size = UDim2.new(0, 410, 0, 371)
    tabContent.Position = UDim2.new(0.31751, 0, 0.17429, 0)
    tabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tabContent.Name = Tab.Name
    tabContent.BackgroundTransparency = 1

    local scroll = Instance.new("ScrollingFrame", tabContent)
    scroll.Active = true
    scroll.BorderSizePixel = 0
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    scroll.Name = "Scroll"
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.Size = UDim2.new(1.00244, 0, 1.01078, 0)
    scroll.ScrollBarImageColor3 = Color3.fromRGB(114, 83, 255)
    scroll.Position = UDim2.new(-0.00244, 0, -0.01078, 0)
    scroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
    scroll.ScrollBarThickness = 0
    scroll.BackgroundTransparency = 1

    local scrollLayout = Instance.new("Frame", scroll)
    scrollLayout.BorderSizePixel = 0
    scrollLayout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    scrollLayout.Size = UDim2.new(0.98783, 0, 15.22455, 0)
    scrollLayout.Position = UDim2.new(0.00243, 0, 0.01348, 0)
    scrollLayout.BorderColor3 = Color3.fromRGB(0, 0, 0)
    scrollLayout.Name = "Layout"
    scrollLayout.BackgroundTransparency = 1

    local listLayout = Instance.new("UIListLayout", scrollLayout)
    listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    listLayout.Padding = UDim.new(0, 10)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local scrollPadding = Instance.new("UIPadding", scrollLayout)
    scrollPadding.PaddingTop = UDim.new(0, 5)
    scrollPadding.PaddingBottom = UDim.new(0, 8)

    -- Tab switching logic
    task.spawn(function()
        local CenterPos = UDim2.new(0.318, 0, 0.174, 0)
        local RightPos = UDim2.new(1.1, 0, 0.174, 0)
        local AnimDuration = 0.25
        local TInfo = TweenInfo.new(AnimDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local TabsFolder = main.Tabs
        local TabButtonsFolder = leftLayout

        local IsTabActive = Tab.Selected
        local IsAnimating = false
        local Color_Active = Color3.fromRGB(113, 82, 255)
        local Color_Inactive = Color3.fromRGB(125, 125, 125)

        if Tab.Selected then
            activeBar.BackgroundTransparency = 0
            tabBtn.BackgroundTransparency = 0
            tabImg.ImageColor3 = Color_Active
            tabNameLabel.TextColor3 = Color_Active
            btnStroke.Transparency = 0
            tabContent.Visible = true
            tabContent.Interactable = true
            tabContent.Position = CenterPos
        else
            tabContent.Visible = false
            tabContent.Interactable = false
            tabContent.Position = RightPos
        end

        trigger.MouseButton1Down:Connect(function()
            if IsTabActive or IsAnimating then return end
            IsAnimating = true
            IsTabActive = true

            TweenService:Create(activeBar, TInfo, { BackgroundTransparency = 0 }):Play()
            TweenService:Create(tabBtn, TInfo, { BackgroundTransparency = 0 }):Play()
            TweenService:Create(tabImg, TInfo, { ImageColor3 = Color_Active }):Play()
            TweenService:Create(tabNameLabel, TInfo, { TextColor3 = Color_Active }):Play()
            TweenService:Create(btnStroke, TInfo, { Transparency = 0 }):Play()

            for _, btn in pairs(TabButtonsFolder:GetChildren()) do
                if btn:IsA("Frame") and btn ~= tabBtn then
                    TweenService:Create(btn.Bar, TInfo, { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(btn, TInfo, { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(btn.Image, TInfo, { ImageColor3 = Color_Inactive }):Play()
                    TweenService:Create(btn.TabName, TInfo, { TextColor3 = Color_Inactive }):Play()
                    TweenService:Create(btn.UIStroke, TInfo, { Transparency = 1 }):Play()
                end
            end

            local oldTab = nil
            for _, tab in pairs(TabsFolder:GetChildren()) do
                if tab:IsA("GuiObject") and tab.Visible and tab.Name ~= Tab.Name then
                    oldTab = tab
                    break
                end
            end

            if oldTab then
                oldTab.Interactable = false
                local slideOut = TweenService:Create(oldTab, TInfo, { Position = RightPos })
                slideOut:Play()
                task.wait(AnimDuration * 0.8)
                oldTab.Visible = false
            end

            tabContent.Position = RightPos
            tabContent.Visible = true
            tabContent.Interactable = true
            local slideIn = TweenService:Create(tabContent, TInfo, { Position = CenterPos })
            slideIn:Play()
            slideIn.Completed:Connect(function()
                IsAnimating = false
            end)
        end)
    end)

    return Tab
end

-- ==================== COMPONENTS ====================
function EssenceLibrary:Button(params)
    local Button = {}
    Button.Name = params.Name
    Button.Parent = params.Parent
    Button.Callback = params.Callback or function() end

    local tabContent = game.CoreGui.Essence.Main.Tabs[Button.Parent]
    local layout = tabContent.Scroll.Layout

    local btnFrame = Instance.new("Frame", layout)
    btnFrame.BorderSizePixel = 0
    btnFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    btnFrame.Size = UDim2.new(0, 405, 0, 49)
    btnFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btnFrame.Name = Button.Name

    local btnImg = Instance.new("ImageLabel", btnFrame)
    btnImg.BorderSizePixel = 0
    btnImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btnImg.ImageColor3 = Color3.fromRGB(126, 126, 126)
    btnImg.AnchorPoint = Vector2.new(0.5, 0.5)
    btnImg.Image = "rbxassetid://10734898194"
    btnImg.Size = UDim2.new(0, 30, 0, 30)
    btnImg.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btnImg.BackgroundTransparency = 1
    btnImg.Name = "Image"
    btnImg.Position = UDim2.new(0.93175, 0, 0.483, 0)
    Instance.new("UIAspectRatioConstraint", btnImg)

    local btnLabel = Instance.new("TextLabel", btnFrame)
    btnLabel.TextWrapped = true
    btnLabel.BorderSizePixel = 0
    btnLabel.TextSize = 15
    btnLabel.TextXAlignment = Enum.TextXAlignment.Left
    btnLabel.TextScaled = true
    btnLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btnLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    btnLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    btnLabel.BackgroundTransparency = 1
    btnLabel.AnchorPoint = Vector2.new(0, 0.5)
    btnLabel.Size = UDim2.new(0.74366, 0, 1, 0)
    btnLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btnLabel.Text = Button.Name
    btnLabel.Name = "ComponentName"
    btnLabel.Position = UDim2.new(0, 15, 0, 24)

    local labelPadding = Instance.new("UIPadding", btnLabel)
    labelPadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", btnLabel).MaxTextSize = 15

    local btnStroke = Instance.new("UIStroke", btnFrame)
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Color = Color3.fromRGB(36, 36, 36)

    Instance.new("UICorner", btnFrame).CornerRadius = UDim.new(0.12, 0)

    local trigger = Instance.new("TextButton", btnFrame)
    trigger.BorderSizePixel = 0
    trigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    trigger.TextSize = 14
    trigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    trigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    trigger.Size = UDim2.new(1, 0, 1, 0)
    trigger.BackgroundTransparency = 1
    trigger.Name = "Trigger"
    trigger.Text = ""

    task.spawn(function()
        local DefaultColor = Color3.fromRGB(125, 125, 125)
        local ClickColor = Color3.fromRGB(113, 82, 255)
        local tInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

        trigger.MouseButton1Down:Connect(function()
            TweenService:Create(btnLabel, tInfo, { TextColor3 = ClickColor }):Play()
            TweenService:Create(btnImg, tInfo, { ImageColor3 = ClickColor }):Play()
            Button.Callback()
        end)

        local function resetColor()
            TweenService:Create(btnLabel, tInfo, { TextColor3 = DefaultColor }):Play()
            TweenService:Create(btnImg, tInfo, { ImageColor3 = DefaultColor }):Play()
        end
        trigger.MouseButton1Up:Connect(resetColor)
        trigger.MouseLeave:Connect(resetColor)
    end)

    return Button
end

function EssenceLibrary:Toggle(params)
    local Toggle = {}
    Toggle.Name = params.Name
    Toggle.Parent = params.Parent
    Toggle.Default = params.Default or false
    Toggle.UseKeybind = params.UseKeybind or false
    Toggle.DefaultKey = params.DefaultKey or Enum.KeyCode.Unknown
    Toggle.Callback = params.Callback or function() end

    local tabContent = game.CoreGui.Essence.Main.Tabs[Toggle.Parent]
    local layout = tabContent.Scroll.Layout

    local toggleFrame = Instance.new("Frame", layout)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    toggleFrame.Size = UDim2.new(0, 405, 0, 49)
    toggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggleFrame.Name = Toggle.Name

    local nameLabel = Instance.new("TextLabel", toggleFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextScaled = true
    nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    nameLabel.BackgroundTransparency = 1
    nameLabel.AnchorPoint = Vector2.new(0, 0.5)
    nameLabel.Size = UDim2.new(0.74366, 0, 1, 0)
    nameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Text = Toggle.Name
    nameLabel.Name = "ComponentName"
    nameLabel.Position = UDim2.new(0, 15, 0, 24)

    local namePadding = Instance.new("UIPadding", nameLabel)
    namePadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", nameLabel).MaxTextSize = 15

    Instance.new("UIStroke", toggleFrame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke", toggleFrame).Color = Color3.fromRGB(36, 36, 36)
    Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(0.12, 0)

    local toggleSwitch = Instance.new("Frame", toggleFrame)
    toggleSwitch.BorderSizePixel = 0
    toggleSwitch.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    toggleSwitch.AnchorPoint = Vector2.new(0.5, 0.5)
    toggleSwitch.Size = UDim2.new(0, 51, 0, 25)
    toggleSwitch.Position = UDim2.new(0.89877, 0, 0.483, 0)
    toggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggleSwitch.Name = "Toggle"

    local switchStroke = Instance.new("UIStroke", toggleSwitch)
    switchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    switchStroke.Color = Color3.fromRGB(36, 36, 36)

    Instance.new("UICorner", toggleSwitch).CornerRadius = UDim.new(1, 0)

    local dot = Instance.new("Frame", toggleSwitch)
    dot.BorderSizePixel = 0
    dot.BackgroundColor3 = Color3.fromRGB(126, 126, 126)
    dot.AnchorPoint = Vector2.new(0.5, 0.5)
    dot.Size = UDim2.new(0, 20, 0, 20)
    dot.Position = UDim2.new(0.8, 0, 0.5, 0)
    dot.BorderColor3 = Color3.fromRGB(0, 0, 0)
    dot.Name = "Dot"
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local switchTrigger = Instance.new("TextButton", toggleSwitch)
    switchTrigger.BorderSizePixel = 0
    switchTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    switchTrigger.TextSize = 14
    switchTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    switchTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    switchTrigger.Size = UDim2.new(1, 0, 1, 0)
    switchTrigger.BackgroundTransparency = 1
    switchTrigger.Name = "Trigger"
    switchTrigger.Text = ""

    local keybindFrame = Instance.new("Frame", toggleFrame)
    keybindFrame.Visible = Toggle.UseKeybind and UserInputService.KeyboardEnabled
    keybindFrame.BorderSizePixel = 0
    keybindFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    keybindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    keybindFrame.Size = UDim2.new(0, 30, 0, 30)
    keybindFrame.Position = UDim2.new(0.77, 0, 0.483, 0)
    keybindFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    keybindFrame.Name = "Keybind"
    keybindFrame:SetAttribute("Key", "nil")

    local keyStroke = Instance.new("UIStroke", keybindFrame)
    keyStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    keyStroke.Color = Color3.fromRGB(36, 36, 36)

    Instance.new("UICorner", keybindFrame).CornerRadius = UDim.new(0.25, 0)

    local keyText = Instance.new("TextLabel", keybindFrame)
    keyText.TextWrapped = true
    keyText.BorderSizePixel = 0
    keyText.TextSize = 14
    keyText.TextScaled = true
    keyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    keyText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    keyText.TextColor3 = Color3.fromRGB(126, 126, 126)
    keyText.BackgroundTransparency = 1
    keyText.AnchorPoint = Vector2.new(0.5, 0.5)
    keyText.Size = UDim2.new(1, 0, 1, 0)
    keyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    keyText.Text = "?"
    keyText.Name = "KeyText"
    keyText.Position = UDim2.new(0.5, 0, 0.5, 0)

    local keyPadding = Instance.new("UIPadding", keyText)
    keyPadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", keyText).MaxTextSize = 14

    local keyTrigger = Instance.new("TextButton", keybindFrame)
    keyTrigger.BorderSizePixel = 0
    keyTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    keyTrigger.TextSize = 14
    keyTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    keyTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    keyTrigger.Size = UDim2.new(1, 0, 1, 0)
    keyTrigger.BackgroundTransparency = 1
    keyTrigger.Name = "Trigger"
    keyTrigger.Text = ""

    task.spawn(function()
        local isOn = Toggle.Default
        local currentKey = Toggle.DefaultKey
        local isListening = false
        local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

        local function updateVisuals(instant)
            local curTInfo = instant and TweenInfo.new(0) or tInfo
            local targetPos = isOn and UDim2.new(0.8, 0, 0.5, 0) or UDim2.new(0.2, 0, 0.5, 0)
            local targetColor = isOn and Color3.fromRGB(113, 82, 255) or Color3.fromRGB(150, 150, 150)
            TweenService:Create(dot, curTInfo, { Position = targetPos, BackgroundColor3 = targetColor }):Play()
        end

        local function toggle()
            isOn = not isOn
            updateVisuals(false)
            Toggle.Callback(isOn)
        end

        switchTrigger.MouseButton1Click:Connect(toggle)

        if Toggle.UseKeybind and UserInputService.KeyboardEnabled then
            keyText.Text = (currentKey == Enum.KeyCode.Unknown and "NONE") or currentKey.Name
            keyTrigger.MouseButton1Click:Connect(function()
                if isListening then return end
                isListening = true
                keyText.Text = "..."
                local conn
                conn = UserInputService.InputBegan:Connect(function(input)
                    local keyPressed = nil
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        keyPressed = (input.KeyCode == Enum.KeyCode.Escape) and Enum.KeyCode.Unknown or input.KeyCode
                    elseif input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 then
                        keyPressed = input.UserInputType
                    end
                    if keyPressed then
                        conn:Disconnect()
                        currentKey = keyPressed
                        keyText.Text = (keyPressed == Enum.KeyCode.Unknown) and "NONE" or keyPressed.Name
                        keybindFrame:SetAttribute("Key", keyText.Text)
                        isListening = false
                    end
                end)
            end)

            UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe or isListening then return end
                if currentKey ~= Enum.KeyCode.Unknown and (input.KeyCode == currentKey or input.UserInputType == currentKey) then
                    toggle()
                end
            end)
        end

        updateVisuals(true)

        -- Limit key text length
        keyText:GetPropertyChangedSignal("Text"):Connect(function()
            if #keyText.Text > 3 then
                keyText.Text = keyText.Text:sub(1, 3)
            end
        end)
    end)

    return Toggle
end

function EssenceLibrary:Slider(params)
    local Slider = {}
    Slider.Name = params.Name
    Slider.Parent = params.Parent
    Slider.Min = params.Min or 0
    Slider.Max = params.Max or 100
    Slider.Default = params.Default or 50
    Slider.Callback = params.Callback or function() end

    local tabContent = game.CoreGui.Essence.Main.Tabs[Slider.Parent]
    local layout = tabContent.Scroll.Layout

    local sliderFrame = Instance.new("Frame", layout)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    sliderFrame.Size = UDim2.new(0, 405, 0, 49)
    sliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sliderFrame.Name = Slider.Name

    local nameLabel = Instance.new("TextLabel", sliderFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextScaled = true
    nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    nameLabel.BackgroundTransparency = 1
    nameLabel.AnchorPoint = Vector2.new(0, 0.5)
    nameLabel.Size = UDim2.new(0.42659, 0, 1, 0)
    nameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Text = Slider.Name
    nameLabel.Name = "ComponentName"
    nameLabel.Position = UDim2.new(0, 15, 0, 24)

    local namePadding = Instance.new("UIPadding", nameLabel)
    namePadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", nameLabel).MaxTextSize = 15

    Instance.new("UIStroke", sliderFrame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke", sliderFrame).Color = Color3.fromRGB(36, 36, 36)
    Instance.new("UICorner", sliderFrame).CornerRadius = UDim.new(0.12, 0)

    local sliderBar = Instance.new("Frame", sliderFrame)
    sliderBar.BorderSizePixel = 0
    sliderBar.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    sliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
    sliderBar.Size = UDim2.new(0, 145, 0, 16)
    sliderBar.Position = UDim2.new(0.78922, 0, 0.51361, 0)
    sliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sliderBar.Name = "Slider"

    local barStroke = Instance.new("UIStroke", sliderBar)
    barStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    barStroke.Color = Color3.fromRGB(36, 36, 36)

    Instance.new("UICorner", sliderBar).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame", sliderBar)
    fill.Name = "Fill"
    fill.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
    fill.BorderSizePixel = 0
    fill.ZIndex = 1
    local startPercent = math.clamp((Slider.Default - Slider.Min) / (Slider.Max - Slider.Min), 0, 1)
    fill.Size = UDim2.new(startPercent, 0, 1, 0)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local sliderTrigger = Instance.new("TextButton", sliderBar)
    sliderTrigger.BorderSizePixel = 0
    sliderTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    sliderTrigger.TextSize = 14
    sliderTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    sliderTrigger.Size = UDim2.new(1, 0, 1, 0)
    sliderTrigger.BackgroundTransparency = 1
    sliderTrigger.Name = "Trigger"
    sliderTrigger.Text = ""
    sliderTrigger.ZIndex = 5

    local valueLabel = Instance.new("TextLabel", sliderFrame)
    valueLabel.BorderSizePixel = 0
    valueLabel.TextSize = 15
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    valueLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Size = UDim2.new(0.08687, 0, 1, 0)
    valueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    valueLabel.Text = tostring(Slider.Default)
    valueLabel.Name = "Value"
    valueLabel.Position = UDim2.new(0.50123, 0, 0, 0)

    local valuePadding = Instance.new("UIPadding", valueLabel)
    valuePadding.PaddingBottom = UDim.new(0, 2)

    task.spawn(function()
        local dragging = false
        local function toggleScroll(enabled)
            if layout.Parent and layout.Parent:IsA("ScrollingFrame") then
                layout.Parent.ScrollingEnabled = enabled
            end
        end

        local function updateSlider(input)
            local percent = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            local currentValue = math.floor(Slider.Min + (percent * (Slider.Max - Slider.Min)))
            valueLabel.Text = tostring(currentValue)
            TweenService:Create(fill, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(percent, 0, 1, 0) }):Play()
            Slider.Callback(currentValue)
        end

        sliderTrigger.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                toggleScroll(false)
                updateSlider(input)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateSlider(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
                toggleScroll(true)
            end
        end)
    end)

    return Slider
end

function EssenceLibrary:Textbox(params)
    local Textbox = {}
    Textbox.Name = params.Name
    Textbox.Parent = params.Parent
    Textbox.Placeholder = params.Placeholder
    Textbox.Callback = params.Callback or function() end

    local tabContent = game.CoreGui.Essence.Main.Tabs[Textbox.Parent]
    local layout = tabContent.Scroll.Layout

    local textboxFrame = Instance.new("Frame", layout)
    textboxFrame.BorderSizePixel = 0
    textboxFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    textboxFrame.Size = UDim2.new(0, 405, 0, 49)
    textboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    textboxFrame.Name = Textbox.Name

    local nameLabel = Instance.new("TextLabel", textboxFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextScaled = true
    nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    nameLabel.BackgroundTransparency = 1
    nameLabel.AnchorPoint = Vector2.new(0, 0.5)
    nameLabel.Size = UDim2.new(0.51156, 0, 1, 0)
    nameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Text = Textbox.Name
    nameLabel.Name = "ComponentName"
    nameLabel.Position = UDim2.new(0, 15, 0, 24)

    local namePadding = Instance.new("UIPadding", nameLabel)
    namePadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", nameLabel).MaxTextSize = 15

    Instance.new("UIStroke", textboxFrame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke", textboxFrame).Color = Color3.fromRGB(36, 36, 36)
    Instance.new("UICorner", textboxFrame).CornerRadius = UDim.new(0.12, 0)

    local box = Instance.new("TextBox", textboxFrame)
    box.Name = "Box"
    box.PlaceholderColor3 = Color3.fromRGB(71, 71, 71)
    box.BorderSizePixel = 0
    box.TextWrapped = true
    box.TextSize = 14
    box.TextColor3 = Color3.fromRGB(126, 126, 126)
    box.TextScaled = true
    box.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    box.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.ClearTextOnFocus = false
    box.Size = UDim2.new(0, 142, 0, 25)
    box.Position = UDim2.new(0.79349, 0, 0.483, 0)
    box.BorderColor3 = Color3.fromRGB(0, 0, 0)
    box.Text = ""

    Instance.new("UICorner", box).CornerRadius = UDim.new(0.25, 0)

    local boxStroke = Instance.new("UIStroke", box)
    boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    boxStroke.Color = Color3.fromRGB(36, 36, 36)

    Instance.new("UITextSizeConstraint", box).MaxTextSize = 14

    box.PlaceholderText = Textbox.Placeholder or "Placeholder..."
    box.FocusLost:Connect(function(enterPressed)
        Textbox.Callback(box.Text)
    end)

    return Textbox
end

function EssenceLibrary:Keybind(params)
    local Keybind = {}
    Keybind.Name = params.Name
    Keybind.Parent = params.Parent
    Keybind.DefaultKey = params.DefaultKey or Enum.KeyCode.F
    Keybind.Callback = params.Callback or function() end

    local tabContent = game.CoreGui.Essence.Main.Tabs[Keybind.Parent]
    local layout = tabContent.Scroll.Layout

    local keybindFrame = Instance.new("Frame", layout)
    keybindFrame.BorderSizePixel = 0
    keybindFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    keybindFrame.Size = UDim2.new(0, 405, 0, 49)
    keybindFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    keybindFrame.Name = Keybind.Name

    local nameLabel = Instance.new("TextLabel", keybindFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextScaled = true
    nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    nameLabel.BackgroundTransparency = 1
    nameLabel.AnchorPoint = Vector2.new(0, 0.5)
    nameLabel.Size = UDim2.new(0.74366, 0, 1, 0)
    nameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Text = Keybind.Name
    nameLabel.Name = "ComponentName"
    nameLabel.Position = UDim2.new(0, 15, 0, 24)

    local namePadding = Instance.new("UIPadding", nameLabel)
    namePadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", nameLabel).MaxTextSize = 15

    Instance.new("UIStroke", keybindFrame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke", keybindFrame).Color = Color3.fromRGB(36, 36, 36)
    Instance.new("UICorner", keybindFrame).CornerRadius = UDim.new(0.12, 0)

    local keybindBox = Instance.new("Frame", keybindFrame)
    keybindBox.BorderSizePixel = 0
    keybindBox.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    keybindBox.AnchorPoint = Vector2.new(0.5, 0.5)
    keybindBox.Size = UDim2.new(0, 30, 0, 30)
    keybindBox.Position = UDim2.new(0.93087, 0, 0.483, 0)
    keybindBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    keybindBox.Name = "Keybind"
    keybindBox:SetAttribute("Key", "nil")

    local boxStroke = Instance.new("UIStroke", keybindBox)
    boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    boxStroke.Color = Color3.fromRGB(36, 36, 36)

    Instance.new("UICorner", keybindBox).CornerRadius = UDim.new(0.25, 0)

    local keyText = Instance.new("TextLabel", keybindBox)
    keyText.TextWrapped = true
    keyText.BorderSizePixel = 0
    keyText.TextSize = 14
    keyText.TextScaled = true
    keyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    keyText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    keyText.TextColor3 = Color3.fromRGB(126, 126, 126)
    keyText.BackgroundTransparency = 1
    keyText.AnchorPoint = Vector2.new(0.5, 0.5)
    keyText.Size = UDim2.new(1, 0, 1, 0)
    keyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    keyText.Text = "F"
    keyText.Name = "KeyText"
    keyText.Position = UDim2.new(0.5, 0, 0.5, 0)

    local keyPadding = Instance.new("UIPadding", keyText)
    keyPadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", keyText).MaxTextSize = 14

    local trigger = Instance.new("TextButton", keybindBox)
    trigger.BorderSizePixel = 0
    trigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    trigger.TextSize = 14
    trigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    trigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    trigger.Size = UDim2.new(1, 0, 1, 0)
    trigger.BackgroundTransparency = 1
    trigger.Name = "Trigger"
    trigger.Text = ""

    task.spawn(function()
        local currentKey = Keybind.DefaultKey
        local isListening = false
        keyText.Text = currentKey.Name

        trigger.MouseButton1Click:Connect(function()
            if isListening then return end
            isListening = true
            keyText.Text = "..."
            local conn
            conn = UserInputService.InputBegan:Connect(function(input)
                local keyPressed = nil
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    keyPressed = (input.KeyCode == Enum.KeyCode.Escape) and Enum.KeyCode.Unknown or input.KeyCode
                elseif input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 then
                    keyPressed = input.UserInputType
                end
                if keyPressed then
                    conn:Disconnect()
                    currentKey = keyPressed
                    keyText.Text = (keyPressed == Enum.KeyCode.Unknown) and "NONE" or keyPressed.Name
                    keybindBox:SetAttribute("Key", keyText.Text)
                    isListening = false
                end
            end)
        end)

        UserInputService.InputBegan:Connect(function(input, gpe)
            if gpe or isListening then return end
            if currentKey ~= Enum.KeyCode.Unknown and (input.KeyCode == currentKey or input.UserInputType == currentKey) then
                Keybind.Callback()
            end
        end)

        keyText:GetPropertyChangedSignal("Text"):Connect(function()
            if #keyText.Text > 3 then
                keyText.Text = keyText.Text:sub(1, 3)
            end
        end)
    end)

    return Keybind
end

function EssenceLibrary:Dropdown(params)
    local Dropdown = {}
    Dropdown.Name = params.Name
    Dropdown.Parent = params.Parent
    Dropdown.Options = params.Options or {}
    Dropdown.Default = params.Default or (Dropdown.Options[1] or "None")
    Dropdown.Callback = params.Callback or function() end

    local tabContent = game.CoreGui.Essence.Main.Tabs[Dropdown.Parent]
    local layout = tabContent.Scroll.Layout

    local dropdownFrame = Instance.new("Frame", layout)
    dropdownFrame.BorderSizePixel = 0
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    dropdownFrame.Size = UDim2.new(0, 405, 0, 49)
    dropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    dropdownFrame.Name = Dropdown.Name

    local nameLabel = Instance.new("TextLabel", dropdownFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextScaled = true
    nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    nameLabel.BackgroundTransparency = 1
    nameLabel.AnchorPoint = Vector2.new(0, 0.5)
    nameLabel.Size = UDim2.new(0.55847, 0, 1, 0)
    nameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Text = Dropdown.Name
    nameLabel.Name = "ComponentName"
    nameLabel.Position = UDim2.new(0, 15, 0, 24)

    local namePadding = Instance.new("UIPadding", nameLabel)
    namePadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", nameLabel).MaxTextSize = 15

    Instance.new("UIStroke", dropdownFrame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke", dropdownFrame).Color = Color3.fromRGB(36, 36, 36)

    local mainCorner = Instance.new("UICorner", dropdownFrame)
    mainCorner.CornerRadius = UDim.new(0.12, 0)

    local dropdownBox = Instance.new("Frame", dropdownFrame)
    dropdownBox.BorderSizePixel = 0
    dropdownBox.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    dropdownBox.AnchorPoint = Vector2.new(0.5, 0.5)
    dropdownBox.Size = UDim2.new(0, 119, 0, 30)
    dropdownBox.Position = UDim2.new(0.82099, 0, 0.483, 0)
    dropdownBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    dropdownBox.Name = "Dropdown"

    Instance.new("UICorner", dropdownBox).CornerRadius = UDim.new(0.25, 0)

    local boxStroke = Instance.new("UIStroke", dropdownBox)
    boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    boxStroke.Color = Color3.fromRGB(36, 36, 36)

    local chevron = Instance.new("ImageLabel", dropdownBox)
    chevron.BorderSizePixel = 0
    chevron.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    chevron.ImageColor3 = Color3.fromRGB(126, 126, 126)
    chevron.AnchorPoint = Vector2.new(0.5, 0.5)
    chevron.Image = "rbxassetid://10709790948"
    chevron.Size = UDim2.new(0, 25, 0, 25)
    chevron.BorderColor3 = Color3.fromRGB(0, 0, 0)
    chevron.BackgroundTransparency = 1
    chevron.Name = "Chevron"
    chevron.Position = UDim2.new(0.86, 0, 0.5, 0)
    Instance.new("UIAspectRatioConstraint", chevron)

    local chevTrigger = Instance.new("TextButton", chevron)
    chevTrigger.BorderSizePixel = 0
    chevTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    chevTrigger.TextSize = 14
    chevTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    chevTrigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    chevTrigger.Size = UDim2.new(1, 0, 1, 0)
    chevTrigger.BackgroundTransparency = 1
    chevTrigger.Name = "Trigger"
    chevTrigger.Text = ""

    local selectedText = Instance.new("TextLabel", dropdownBox)
    selectedText.TextWrapped = true
    selectedText.BorderSizePixel = 0
    selectedText.TextSize = 13
    selectedText.TextXAlignment = Enum.TextXAlignment.Left
    selectedText.TextScaled = true
    selectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    selectedText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    selectedText.TextColor3 = Color3.fromRGB(126, 126, 126)
    selectedText.BackgroundTransparency = 1
    selectedText.Size = UDim2.new(0.67625, 0, 1, 0)
    selectedText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    selectedText.Text = Dropdown.Default
    selectedText.Name = "Selected"
    selectedText.Position = UDim2.new(0.041, 0, 0, 0)

    local selectedPadding = Instance.new("UIPadding", selectedText)
    selectedPadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", selectedText).MaxTextSize = 13

    local optionHeight = 28
    local dropdownYSize = #Dropdown.Options * optionHeight

    local originalSize = UDim2.new(1, 0, 0, 49)
    local expandedSize = UDim2.new(1, 0, 0, 49 + dropdownYSize + 10)
    local originalCorner = mainCorner.CornerRadius
    local expandedCorner = UDim.new(0, 5)

    local listFrame = Instance.new("Frame", dropdownBox)
    listFrame.Name = "OptionList"
    listFrame.Size = UDim2.new(1, 0, 0, 0)
    listFrame.Position = UDim2.new(0, 0, 1, 6)
    listFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    listFrame.ClipsDescendants = true
    listFrame.ZIndex = 10
    listFrame.Visible = false

    Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 4)

    local listStroke = Instance.new("UIStroke", listFrame)
    listStroke.Color = Color3.fromRGB(35, 35, 35)
    listStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local listLayout = Instance.new("UIListLayout", listFrame)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local isOpen = false

    for _, option in ipairs(Dropdown.Options) do
        local optionBtn = Instance.new("TextButton", listFrame)
        optionBtn.Name = option
        optionBtn.Size = UDim2.new(1, 0, 0, optionHeight)
        optionBtn.BackgroundTransparency = 1
        optionBtn.Text = "  " .. option
        optionBtn.TextXAlignment = Enum.TextXAlignment.Left
        optionBtn.TextColor3 = Color3.fromRGB(125, 125, 125)
        optionBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        optionBtn.TextSize = 13
        optionBtn.ZIndex = 11

        optionBtn.MouseEnter:Connect(function()
            TweenService:Create(optionBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(175, 175, 175) }):Play()
        end)
        optionBtn.MouseLeave:Connect(function()
            TweenService:Create(optionBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(125, 125, 125) }):Play()
        end)
        optionBtn.MouseButton1Click:Connect(function()
            selectedText.Text = option
            Dropdown.Callback(option)

            isOpen = false
            TweenService:Create(listFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = UDim2.new(1, 0, 0, 0) }):Play()
            TweenService:Create(dropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = originalSize }):Play()
            TweenService:Create(mainCorner, TweenInfo.new(0.2), { CornerRadius = originalCorner }):Play()
            TweenService:Create(chevron, TweenInfo.new(0.2), { Rotation = 0 }):Play()
            task.wait(0.2)
            listFrame.Visible = false
        end)
    end

    chevTrigger.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            listFrame.Visible = true
            TweenService:Create(dropdownFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), { Size = expandedSize }):Play()
            TweenService:Create(mainCorner, TweenInfo.new(0.25), { CornerRadius = expandedCorner }):Play()
            TweenService:Create(listFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), { Size = UDim2.new(1, 0, 0, dropdownYSize) }):Play()
            TweenService:Create(chevron, TweenInfo.new(0.2), { Rotation = 180 }):Play()
        else
            TweenService:Create(listFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = UDim2.new(1, 0, 0, 0) }):Play()
            TweenService:Create(dropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = originalSize }):Play()
            TweenService:Create(mainCorner, TweenInfo.new(0.2), { CornerRadius = originalCorner }):Play()
            TweenService:Create(chevron, TweenInfo.new(0.2), { Rotation = 0 }):Play()
            task.wait(0.2)
            listFrame.Visible = false
        end
    end)

    return Dropdown
end

function EssenceLibrary:Colorpicker(params)
    local Colorpicker = {}
    Colorpicker.Name = params.Name
    Colorpicker.Parent = params.Parent
    Colorpicker.Default = params.Default or Color3.fromRGB(114, 83, 255)
    Colorpicker.Callback = params.Callback or function() end

    local tabContent = game.CoreGui.Essence.Main.Tabs[Colorpicker.Parent]
    local layout = tabContent.Scroll.Layout

    local cpFrame = Instance.new("Frame", layout)
    cpFrame.BorderSizePixel = 0
    cpFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    cpFrame.Size = UDim2.new(0, 405, 0, 49)
    cpFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    cpFrame.Name = Colorpicker.Name

    local nameLabel = Instance.new("TextLabel", cpFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextSize = 15
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextScaled = true
    nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(126, 126, 126)
    nameLabel.BackgroundTransparency = 1
    nameLabel.AnchorPoint = Vector2.new(0, 0.5)
    nameLabel.Size = UDim2.new(0.74366, 0, 1, 0)
    nameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Text = Colorpicker.Name
    nameLabel.Name = "ComponentName"
    nameLabel.Position = UDim2.new(0, 15, 0, 24)

    local namePadding = Instance.new("UIPadding", nameLabel)
    namePadding.PaddingBottom = UDim.new(0, 2)
    Instance.new("UITextSizeConstraint", nameLabel).MaxTextSize = 15

    Instance.new("UIStroke", cpFrame).ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Instance.new("UIStroke", cpFrame).Color = Color3.fromRGB(36, 36, 36)

    local mainCorner = Instance.new("UICorner", cpFrame)
    mainCorner.CornerRadius = UDim.new(0.12, 0)

    local colorPreview = Instance.new("Frame", cpFrame)
    colorPreview.BorderSizePixel = 0
    colorPreview.BackgroundColor3 = Colorpicker.Default
    colorPreview.AnchorPoint = Vector2.new(0.5, 0.5)
    colorPreview.Size = UDim2.new(0, 30, 0, 30)
    colorPreview.Position = UDim2.new(0.93087, 0, 0.483, 0)
    colorPreview.BorderColor3 = Color3.fromRGB(0, 0, 0)
    colorPreview.Name = "Color"

    Instance.new("UICorner", colorPreview).CornerRadius = UDim.new(0.25, 0)

    local trigger = Instance.new("TextButton", colorPreview)
    trigger.BorderSizePixel = 0
    trigger.TextColor3 = Color3.fromRGB(0, 0, 0)
    trigger.TextSize = 14
    trigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    trigger.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    trigger.Size = UDim2.new(1, 0, 1, 0)
    trigger.BackgroundTransparency = 1
    trigger.Name = "Trigger"
    trigger.Text = ""

    local isOpen = false
    local currentHue, currentSat, currentVal = Colorpicker.Default:ToHSV()

    local originalSize = UDim2.new(1, 0, 0, 49)
    local expandedSize = UDim2.new(1, 0, 0, 215)
    local originalCorner = mainCorner.CornerRadius
    local expandedCorner = UDim.new(0, 6)

    local colorPanel = Instance.new("Frame", cpFrame)
    colorPanel.Name = "ColorPanel"
    colorPanel.Size = UDim2.new(1, -24, 0, 0)
    colorPanel.Position = UDim2.new(0, 12, 0, 52)
    colorPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    colorPanel.ClipsDescendants = true
    colorPanel.Visible = false
    colorPanel.BackgroundTransparency = 1

    Instance.new("UICorner", colorPanel).CornerRadius = UDim.new(0, 10)

    local panelStroke = Instance.new("UIStroke", colorPanel)
    panelStroke.Color = Color3.fromRGB(35, 35, 35)
    panelStroke.Transparency = 1

    local satValPicker = Instance.new("ImageLabel", colorPanel)
    satValPicker.Name = "SaturationValuePicker"
    satValPicker.Size = UDim2.new(1, -20, 0, 110)
    satValPicker.Position = UDim2.new(0, 10, 0, 10)
    satValPicker.Image = "rbxassetid://4155801252"
    satValPicker.ImageTransparency = 1
    satValPicker.BackgroundColor3 = Color3.fromHSV(currentHue, 1, 1)
    Instance.new("UICorner", satValPicker).CornerRadius = UDim.new(0, 6)

    local svCursor = Instance.new("Frame", satValPicker)
    svCursor.Name = "SaturationValueCursor"
    svCursor.Size = UDim2.new(0, 10, 0, 10)
    svCursor.AnchorPoint = Vector2.new(0.5, 0.5)
    svCursor.BackgroundTransparency = 1
    local svStroke = Instance.new("UIStroke", svCursor)
    svStroke.Color = Color3.fromRGB(175, 175, 175)
    svStroke.Thickness = 2
    Instance.new("UICorner", svCursor).CornerRadius = UDim.new(1, 0)

    local hueSlider = Instance.new("Frame", colorPanel)
    hueSlider.Name = "HueSlider"
    hueSlider.Size = UDim2.new(1, -20, 0, 14)
    hueSlider.Position = UDim2.new(0, 10, 0, 130)
    hueSlider.BackgroundTransparency = 1
    Instance.new("UICorner", hueSlider).CornerRadius = UDim.new(1, 0)

    local hueGradient = Instance.new("UIGradient", hueSlider)
    hueGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    })

    local hueCursor = Instance.new("Frame", hueSlider)
    hueCursor.Name = "HueCursor"
    hueCursor.Size = UDim2.new(0, 7, 0, 7)
    hueCursor.AnchorPoint = Vector2.new(0.5, 0.5)
    hueCursor.BackgroundTransparency = 1
    local hStroke = Instance.new("UIStroke", hueCursor)
    hStroke.Color = Color3.fromRGB(175, 175, 175)
    hStroke.Thickness = 2
    Instance.new("UICorner", hueCursor).CornerRadius = UDim.new(1, 0)

    local function updateUI(instant, fireCallback)
        local pickedColor = Color3.fromHSV(currentHue, currentSat, currentVal)
        local tInfo = instant and TweenInfo.new(0) or TweenInfo.new(0.1)
        TweenService:Create(colorPreview, tInfo, { BackgroundColor3 = pickedColor }):Play()
        TweenService:Create(satValPicker, tInfo, { BackgroundColor3 = Color3.fromHSV(currentHue, 1, 1) }):Play()
        TweenService:Create(svCursor, tInfo, { Position = UDim2.new(currentSat, 0, 1 - currentVal, 0) }):Play()
        TweenService:Create(hueCursor, tInfo, { Position = UDim2.new(currentHue, 0, 0.5, 0) }):Play()
        if fireCallback then Colorpicker.Callback(pickedColor) end
    end

    local draggingSV, draggingH = false, false
    local function toggleScroll(enabled)
        if layout.Parent and layout.Parent:IsA("ScrollingFrame") then
            layout.Parent.ScrollingEnabled = enabled
        end
    end

    local function processInput(input, obj, mode)
        local relX = math.clamp((input.Position.X - obj.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, 1)
        local relY = math.clamp((input.Position.Y - obj.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0, 1)
        if mode == "SatVal" then
            currentSat, currentVal = relX, 1 - relY
        elseif mode == "Hue" then
            currentHue = relX
        end
        updateUI(false, true)
    end

    satValPicker.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSV = true
            toggleScroll(false)
            processInput(input, satValPicker, "SatVal")
        end
    end)
    hueSlider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingH = true
            toggleScroll(false)
            processInput(input, hueSlider, "Hue")
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if draggingSV then processInput(input, satValPicker, "SatVal")
            elseif draggingH then processInput(input, hueSlider, "Hue") end
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSV, draggingH = false, false
            toggleScroll(true)
        end
    end)

    trigger.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        local t = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        if isOpen then
            cpFrame.ZIndex = 2
            colorPanel.Visible = true
            task.wait()
            TweenService:Create(cpFrame, t, { Size = expandedSize }):Play()
            TweenService:Create(mainCorner, t, { CornerRadius = expandedCorner }):Play()
            TweenService:Create(colorPanel, t, { Size = UDim2.new(1, -24, 0, 150), BackgroundTransparency = 0 }):Play()
            TweenService:Create(panelStroke, t, { Transparency = 0 }):Play()
            TweenService:Create(satValPicker, t, { ImageTransparency = 0 }):Play()
            TweenService:Create(hueSlider, t, { BackgroundTransparency = 0 }):Play()
        else
            cpFrame.ZIndex = 1
            TweenService:Create(colorPanel, t, { Size = UDim2.new(1, -24, 0, 0), BackgroundTransparency = 1 }):Play()
            TweenService:Create(panelStroke, t, { Transparency = 1 }):Play()
            TweenService:Create(satValPicker, t, { ImageTransparency = 1 }):Play()
            TweenService:Create(hueSlider, t, { BackgroundTransparency = 1 }):Play()
            TweenService:Create(cpFrame, t, { Size = originalSize }):Play()
            TweenService:Create(mainCorner, t, { CornerRadius = originalCorner }):Play()
            task.delay(0.3, function() if not isOpen then colorPanel.Visible = false end end)
        end
    end)

    updateUI(true, false)
    return Colorpicker
end

function EssenceLibrary:Notification(desc, duration)
    CreateNotification(desc, duration)
end

return EssenceLibrary
