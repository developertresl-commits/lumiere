local EssenceLibrary = {}
local RootGui = nil
local TargetParent = nil

-- Notificação centralizada (eliminando a duplicação)
local function _Notif(Text, Duration)
    if not RootGui then return end
    local TweenService = game:GetService("TweenService")
    local TextService  = game:GetService("TextService")
    local Holder = RootGui:WaitForChild("NotificationHolder")

    Duration = Duration or 5
    local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local SemiFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    local BoldFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,     Enum.FontStyle.Normal)

    local Notif = Instance.new("CanvasGroup")
    Notif.Name = "Notification"; Notif.Size = UDim2.new(1,0,0,0)
    Notif.BackgroundColor3 = Color3.fromRGB(10,10,10)
    Notif.GroupTransparency = 1; Notif.BorderSizePixel = 0; Notif.Parent = Holder

    local ScaleObj = Instance.new("UIScale", Notif); ScaleObj.Scale = 0.8
    local UICorner  = Instance.new("UICorner",  Notif); UICorner.CornerRadius = UDim.new(0,10)
    local UIStroke  = Instance.new("UIStroke",  Notif)
    UIStroke.Color = Color3.fromRGB(35,35,35); UIStroke.Thickness = 1; UIStroke.Transparency = 1

    local TitleLabel = Instance.new("TextLabel", Notif)
    TitleLabel.Name = "Title"; TitleLabel.Size = UDim2.new(1,-30,0,20)
    TitleLabel.Position = UDim2.new(0,15,0,15); TitleLabel.BackgroundTransparency = 1
    TitleLabel.FontFace = BoldFont; TitleLabel.Text = "ESSENCE"
    TitleLabel.TextColor3 = Color3.fromRGB(113,82,255); TitleLabel.TextSize = 13
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local DescLabel = Instance.new("TextLabel", Notif)
    DescLabel.Name = "Description"; DescLabel.BackgroundTransparency = 1
    DescLabel.FontFace = SemiFont; DescLabel.Text = Text
    DescLabel.TextColor3 = Color3.fromRGB(125,125,125); DescLabel.TextSize = 14
    DescLabel.TextWrapped = true
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextYAlignment = Enum.TextYAlignment.Top

    local paddingX, topMargin, bottomPadding = 30, 35, 28
    local maxWidth  = Holder.AbsoluteSize.X - paddingX
    local textSize  = TextService:GetTextSize(Text, 14, Enum.Font.Gotham, Vector2.new(maxWidth, 1000))
    local targetH   = math.clamp(textSize.Y + topMargin + bottomPadding, 80, 300)

    DescLabel.Position = UDim2.new(0,15,0,topMargin)
    DescLabel.Size     = UDim2.new(1,-paddingX,0,textSize.Y)

    TweenService:Create(Notif,    tInfo, { Size = UDim2.new(1,0,0,targetH), GroupTransparency = 0 }):Play()
    TweenService:Create(ScaleObj, tInfo, { Scale = 1 }):Play()
    TweenService:Create(UIStroke, tInfo, { Transparency = 0 }):Play()

    local TimerBar = Instance.new("Frame", Notif)
    TimerBar.Name = "Timer"; TimerBar.Size = UDim2.new(1,-24,0,2)
    TimerBar.Position = UDim2.new(0,12,1,-8)
    TimerBar.BackgroundColor3 = Color3.fromRGB(113,82,255)
    TimerBar.BorderSizePixel = 0; TimerBar.ZIndex = 2
    TweenService:Create(TimerBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear), { Size = UDim2.new(0,0,0,2) }):Play()

    task.delay(Duration, function()
        local fadeOut = TweenService:Create(Notif, tInfo, { GroupTransparency = 1 })
        TweenService:Create(ScaleObj, tInfo, { Scale = 0.8 }):Play()
        TweenService:Create(UIStroke, tInfo, { Transparency = 1 }):Play()
        fadeOut:Play()
        fadeOut.Completed:Connect(function() Notif:Destroy() end)
    end)
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Window(params)
    local Window = {}
    Window.GameName = params.GameName
    Window.Version  = params.Version

    local Essence = {}

    -- ── STREAM PROOF ──────────────────────────────────────────
    local sg = Instance.new("ScreenGui")
    sg.IgnoreGuiInset  = true
    sg.ScreenInsets    = Enum.ScreenInsets.DeviceSafeInsets
    sg.Name            = "Essence"
    sg.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
    sg.ResetOnSpawn    = false

    if syn and syn.protect_gui then
        syn.protect_gui(sg)
        sg.Parent   = game:GetService("CoreGui")
        TargetParent = game:GetService("CoreGui")
    elseif gethui then
        sg.Parent    = gethui()
        TargetParent = gethui()
    else
        sg.Parent    = game:GetService("CoreGui")
        TargetParent = game:GetService("CoreGui")
    end

    Essence["1"] = sg
    RootGui = sg
    -- ──────────────────────────────────────────────────────────

    Essence["2"] = Instance.new("CanvasGroup", Essence["1"]);
    Essence["2"]["BorderSizePixel"] = 0;
    Essence["2"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["2"]["Size"] = UDim2.new(0, 611, 0, 459);
    Essence["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2"]["Name"] = [[Main]];
    Essence["2"]:SetAttribute([[Minimized]], false);

    Essence["3"] = Instance.new("UICorner", Essence["2"]);
    Essence["3"]["CornerRadius"] = UDim.new(0.05, 0);

    Essence["4"] = Instance.new("Frame", Essence["2"]);
    Essence["4"]["BorderSizePixel"] = 0;
    Essence["4"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["4"]["Size"] = UDim2.new(0, 611, 0, 75);
    Essence["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["4"]["Name"] = [[Top]];
    Essence["4"]["ZIndex"] = 2;

    Essence["5"] = Instance.new("Frame", Essence["4"]);
    Essence["5"]["ZIndex"] = 2;
    Essence["5"]["BorderSizePixel"] = 0;
    Essence["5"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
    Essence["5"]["Size"] = UDim2.new(0, 611, 0, 1);
    Essence["5"]["Position"] = UDim2.new(0, 0, 1, 0);
    Essence["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["5"]["Name"] = [[Bar]];

    Essence["6"] = Instance.new("ImageLabel", Essence["4"]);
    Essence["6"]["Active"] = true;
    Essence["6"]["BorderSizePixel"] = 0;
    Essence["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["6"]["ImageColor3"] = Color3.fromRGB(114, 83, 255);
    Essence["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["6"]["Image"] = [[rbxassetid://110653068142193]];
    Essence["6"]["Size"] = UDim2.new(0, 85, 0, 87);
    Essence["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["6"]["BackgroundTransparency"] = 1;
    Essence["6"]["Name"] = [[Logo]];
    Essence["6"]["Position"] = UDim2.new(0.05936, 0, 0.5, 0);

    Essence["7"] = Instance.new("UIAspectRatioConstraint", Essence["6"]);

    Essence["8"] = Instance.new("TextLabel", Essence["4"]);
    Essence["8"]["BorderSizePixel"] = 0;
    Essence["8"]["TextSize"] = 15;
    Essence["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Essence["8"]["TextYAlignment"] = Enum.TextYAlignment.Top;
    Essence["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    Essence["8"]["TextColor3"] = Color3.fromRGB(114, 83, 255);
    Essence["8"]["BackgroundTransparency"] = 1;
    Essence["8"]["Size"] = UDim2.new(0, 68, 0, 19);
    Essence["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["8"]["Text"] = [[ESSENCE]];
    Essence["8"]["Name"] = [[Title]];
    Essence["8"]["Position"] = UDim2.new(0.106, 0, 0.265, 0);

    Essence["9"] = Instance.new("TextLabel", Essence["4"]);
    Essence["9"]["BorderSizePixel"] = 0;
    Essence["9"]["TextSize"] = 15;
    Essence["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Essence["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    Essence["9"]["TextColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["9"]["BackgroundTransparency"] = 1;
    Essence["9"]["Size"] = UDim2.new(0, 315, 0, 19);
    Essence["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["9"]["Text"] = Window.GameName .. " - " .. Window.Version;
    Essence["9"]["Name"] = [[GameName]];
    Essence["9"]["Position"] = UDim2.new(0.106, 0, 0.463, 0);

    Essence["a"] = Instance.new("Frame", Essence["4"]);
    Essence["a"]["BorderSizePixel"] = 0;
    Essence["a"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["a"]["Size"] = UDim2.new(0, 133, 0, 38);
    Essence["a"]["Position"] = UDim2.new(0.853, 0, 0.5, 0);
    Essence["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["a"]["Name"] = [[Control]];

    Essence["b"] = Instance.new("UICorner", Essence["a"]);
    Essence["b"]["CornerRadius"] = UDim.new(0.22, 0);

    Essence["c"] = Instance.new("Frame", Essence["a"]);
    Essence["c"]["BorderSizePixel"] = 0;
    Essence["c"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
    Essence["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["c"]["Size"] = UDim2.new(0, 1, 0, 37);
    Essence["c"]["Position"] = UDim2.new(0.65789, 0, 0.5, 0);
    Essence["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["c"]["Name"] = [[SecondBar]];

    Essence["d"] = Instance.new("UIStroke", Essence["a"]);
    Essence["d"]["Color"] = Color3.fromRGB(41, 41, 41);

    Essence["e"] = Instance.new("Frame", Essence["a"]);
    Essence["e"]["BorderSizePixel"] = 0;
    Essence["e"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
    Essence["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["e"]["Size"] = UDim2.new(0, 1, 0, 37);
    Essence["e"]["Position"] = UDim2.new(0.34211, 0, 0.5, 0);
    Essence["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["e"]["Name"] = [[Bar]];

    -- X (destroy) button
    Essence["f"] = Instance.new("Frame", Essence["a"]);
    Essence["f"]["BorderSizePixel"] = 0;
    Essence["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["f"]["Size"] = UDim2.new(0, 45, 0, 38);
    Essence["f"]["Position"] = UDim2.new(0.66165, 0, 0, 0);
    Essence["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["f"]["Name"] = [[X]];
    Essence["f"]["BackgroundTransparency"] = 1;

    Essence["10"] = Instance.new("ImageLabel", Essence["f"]);
    Essence["10"]["BorderSizePixel"] = 0;
    Essence["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["10"]["ImageColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["10"]["Image"] = [[rbxassetid://10747384394]];
    Essence["10"]["Size"] = UDim2.new(0, 23, 0, 23);
    Essence["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["10"]["BackgroundTransparency"] = 1;
    Essence["10"]["Name"] = [[Image]];
    Essence["10"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Essence["11"] = Instance.new("UIAspectRatioConstraint", Essence["10"]);

    Essence["12"] = Instance.new("TextButton", Essence["f"]);
    Essence["12"]["BorderSizePixel"] = 0;
    Essence["12"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["12"]["TextSize"] = 14;
    Essence["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["12"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["12"]["BackgroundTransparency"] = 1;
    Essence["12"]["Name"] = [[Trigger]];
    Essence["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["12"]["Text"] = [[]];

    -- Minimize button
    Essence["14"] = Instance.new("Frame", Essence["a"]);
    Essence["14"]["BorderSizePixel"] = 0;
    Essence["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["14"]["Size"] = UDim2.new(0, 42, 0, 38);
    Essence["14"]["Position"] = UDim2.new(0.34586, 0, 0, 0);
    Essence["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["14"]["Name"] = [[Minimize]];
    Essence["14"]["BackgroundTransparency"] = 1;

    Essence["15"] = Instance.new("ImageLabel", Essence["14"]);
    Essence["15"]["BorderSizePixel"] = 0;
    Essence["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["15"]["ImageColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["15"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["15"]["Image"] = [[rbxassetid://10734896206]];
    Essence["15"]["Size"] = UDim2.new(0, 23, 0, 23);
    Essence["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["15"]["BackgroundTransparency"] = 1;
    Essence["15"]["Name"] = [[Image]];
    Essence["15"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Essence["16"] = Instance.new("UIAspectRatioConstraint", Essence["15"]);

    Essence["17"] = Instance.new("TextButton", Essence["14"]);
    Essence["17"]["BorderSizePixel"] = 0;
    Essence["17"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["17"]["TextSize"] = 14;
    Essence["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["17"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["17"]["BackgroundTransparency"] = 1;
    Essence["17"]["Name"] = [[Trigger]];
    Essence["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["17"]["Text"] = [[]];

    -- Extra (Discord) button
    Essence["19"] = Instance.new("Frame", Essence["a"]);
    Essence["19"]["BorderSizePixel"] = 0;
    Essence["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["19"]["Size"] = UDim2.new(0, 45, 0, 38);
    Essence["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["19"]["Name"] = [[Extra]];
    Essence["19"]["BackgroundTransparency"] = 1;

    Essence["1a"] = Instance.new("ImageLabel", Essence["19"]);
    Essence["1a"]["BorderSizePixel"] = 0;
    Essence["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["1a"]["ImageColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["1a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["1a"]["Image"] = [[rbxassetid://100831342781312]];
    Essence["1a"]["Size"] = UDim2.new(0, 23, 0, 23);
    Essence["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["1a"]["BackgroundTransparency"] = 1;
    Essence["1a"]["Name"] = [[Image]];
    Essence["1a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Essence["1b"] = Instance.new("UIAspectRatioConstraint", Essence["1a"]);

    Essence["1c"] = Instance.new("TextButton", Essence["19"]);
    Essence["1c"]["BorderSizePixel"] = 0;
    Essence["1c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["1c"]["TextSize"] = 14;
    Essence["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["1c"]["BackgroundTransparency"] = 1;
    Essence["1c"]["Name"] = [[Trigger]];
    Essence["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["1c"]["Text"] = [[]];

    Essence["1e"] = Instance.new("UIStroke", Essence["2"]);
    Essence["1e"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["1f"] = Instance.new("Frame", Essence["2"]);
    Essence["1f"]["BorderSizePixel"] = 0;
    Essence["1f"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["1f"]["Size"] = UDim2.new(0, 183, 0, 383);
    Essence["1f"]["Position"] = UDim2.new(0, 0, 0.16558, 0);
    Essence["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["1f"]["Name"] = [[Left]];

    Essence["20"] = Instance.new("Frame", Essence["1f"]);
    Essence["20"]["BorderSizePixel"] = 0;
    Essence["20"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
    Essence["20"]["Size"] = UDim2.new(0, 1, 0, 384);
    Essence["20"]["Position"] = UDim2.new(1, 0, 0, 0);
    Essence["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["20"]["Name"] = [[Bar]];

    Essence["21"] = Instance.new("ScrollingFrame", Essence["1f"]);
    Essence["21"]["Active"] = true;
    Essence["21"]["BorderSizePixel"] = 0;
    Essence["21"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
    Essence["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["21"]["Name"] = [[Layout]];
    Essence["21"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
    Essence["21"]["Size"] = UDim2.new(0, 183, 0, 363);
    Essence["21"]["ScrollBarImageColor3"] = Color3.fromRGB(114, 83, 255);
    Essence["21"]["Position"] = UDim2.new(0, 0, 0.026, 0);
    Essence["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["21"]["ScrollBarThickness"] = 0;
    Essence["21"]["BackgroundTransparency"] = 1;

    Essence["22"] = Instance.new("UIPadding", Essence["21"]);
    Essence["22"]["PaddingTop"] = UDim.new(0, 1);
    Essence["22"]["PaddingBottom"] = UDim.new(0, 1);

    Essence["23"] = Instance.new("UIListLayout", Essence["21"]);
    Essence["23"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
    Essence["23"]["Padding"] = UDim.new(0, 7);
    Essence["23"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    Essence["24"] = Instance.new("Folder", Essence["2"]);
    Essence["24"]["Name"] = [[Tabs]];

    Essence["26"] = Instance.new("Frame", Essence["1"]);
    Essence["26"]["Interactable"] = false;
    Essence["26"]["BorderSizePixel"] = 0;
    Essence["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["26"]["Size"] = UDim2.new(0, 280, 1, -40);
    Essence["26"]["Position"] = UDim2.new(1, -290, 0, 20);
    Essence["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["26"]["Name"] = [[NotificationHolder]];
    Essence["26"]["BackgroundTransparency"] = 1;

    Essence["27"] = Instance.new("UIListLayout", Essence["26"]);
    Essence["27"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
    Essence["27"]["Padding"] = UDim.new(0, 10);
    Essence["27"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
    Essence["27"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    Essence["28"] = Instance.new("Frame", Essence["1"]);
    Essence["28"]["Visible"] = false;
    Essence["28"]["Interactable"] = false;
    Essence["28"]["BorderSizePixel"] = 0;
    Essence["28"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["28"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["28"]["Size"] = UDim2.new(0, 60, 0, 60);
    Essence["28"]["Position"] = UDim2.new(0.1, 0, -0.25, 0);
    Essence["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["28"]["Name"] = [[MobileButton]];

    Essence["29"] = Instance.new("UICorner", Essence["28"]);
    Essence["29"]["CornerRadius"] = UDim.new(0.2, 0);

    Essence["2a"] = Instance.new("UIStroke", Essence["28"]);
    Essence["2a"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["2b"] = Instance.new("ImageLabel", Essence["28"]);
    Essence["2b"]["Active"] = true;
    Essence["2b"]["BorderSizePixel"] = 0;
    Essence["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["2b"]["ImageColor3"] = Color3.fromRGB(114, 83, 255);
    Essence["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["2b"]["Image"] = [[rbxassetid://110653068142193]];
    Essence["2b"]["Size"] = UDim2.new(0, 72, 0, 72);
    Essence["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2b"]["BackgroundTransparency"] = 1;
    Essence["2b"]["Name"] = [[Logo]];
    Essence["2b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Essence["2c"] = Instance.new("UIAspectRatioConstraint", Essence["2b"]);

    Essence["2d"] = Instance.new("TextButton", Essence["28"]);
    Essence["2d"]["BorderSizePixel"] = 0;
    Essence["2d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2d"]["TextSize"] = 14;
    Essence["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["2d"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["2d"]["BackgroundTransparency"] = 1;
    Essence["2d"]["Name"] = [[Trigger]];
    Essence["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2d"]["Text"] = [[]];

    -- ── Destroy (X) button logic ───────────────────────────────
    task.spawn(function()
        local TweenService = game:GetService("TweenService")
        local XFrame   = Essence["f"]
        local MainFrame = Essence["2"]

        XFrame.MouseEnter:Connect(function()
            TweenService:Create(XFrame.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(113,82,255) }):Play()
        end)
        XFrame.MouseLeave:Connect(function()
            TweenService:Create(XFrame.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(125,125,125) }):Play()
        end)
        XFrame.Trigger.MouseButton1Down:Connect(function()
            MainFrame.Visible = false
            _Notif("Successfully destroyed user interface.", 3)
            task.wait(4)
            RootGui:Destroy()
            RootGui = nil
        end)
    end)

    -- ── Minimize button logic ──────────────────────────────────
    task.spawn(function()
        local TweenService   = game:GetService("TweenService")
        local UIS            = game:GetService("UserInputService")
        local MinFrame       = Essence["14"]
        local MainFrame      = Essence["2"]
        local MobileButton   = Essence["28"]
        local isMobile       = not (UIS.KeyboardEnabled and UIS.MouseEnabled)
        local ToggleKey

        MinFrame.MouseEnter:Connect(function()
            TweenService:Create(MinFrame.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(113,82,255) }):Play()
        end)
        MinFrame.MouseLeave:Connect(function()
            TweenService:Create(MinFrame.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(125,125,125) }):Play()
        end)

        MinFrame.Trigger.MouseButton1Down:Connect(function()
            MainFrame.Visible = false

            if isMobile and MobileButton then
                MobileButton.Visible = true
                MobileButton.Interactable = true
                TweenService:Create(MobileButton,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                    { Position = UDim2.new(0.1, 0, 0.25, 0) }):Play()
            elseif not isMobile then
                if RootGui and RootGui.Main.Tabs:FindFirstChild("Settings") then
                    ToggleKey = tostring(
                        RootGui.Main.Tabs.Settings.Scroll.Layout["Toggle UI"].Keybind:GetAttribute("Key")
                    )
                else
                    ToggleKey = "NONE"
                end
                if MainFrame:GetAttribute("Minimized") == false then
                    _Notif("Press " .. ToggleKey .. " to show user interface again.", 3)
                    MainFrame:SetAttribute("Minimized", true)
                end
            end
        end)
    end)

    -- ── Discord (Extra) button logic ───────────────────────────
    task.spawn(function()
        local TweenService = game:GetService("TweenService")
        local ExtraFrame   = Essence["19"]

        ExtraFrame.MouseEnter:Connect(function()
            TweenService:Create(ExtraFrame.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(113,82,255) }):Play()
        end)
        ExtraFrame.MouseLeave:Connect(function()
            TweenService:Create(ExtraFrame.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(125,125,125) }):Play()
        end)
        ExtraFrame.Trigger.MouseButton1Down:Connect(function()
            if setclipboard then setclipboard("https://discord.com/invite/MDjNwamSS9") end
            _Notif("Successfully copied Discord link to the clipboard.", 3)
        end)
    end)

    -- ── Drag logic ─────────────────────────────────────────────
    task.spawn(function()
        local UIS       = game:GetService("UserInputService")
        local main      = Essence["2"]
        local tabsFolder = main:WaitForChild("Tabs")
        local dragging, dragStart, startPos = false, nil, nil

        local function isMainPart(obj)
            return obj == main or obj:IsDescendantOf(main)
        end
        local function shouldBlockDrag(obj)
            return obj:IsA("TextButton") or obj:IsA("ImageButton")
                or obj:IsDescendantOf(tabsFolder) or obj == tabsFolder
        end

        UIS.InputBegan:Connect(function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then return end

            -- Use TargetParent for GetGuiObjectsAtPosition (works with gethui too)
            local objects = TargetParent:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
            local validTarget, forbidden = false, false

            for _, obj in ipairs(objects) do
                if shouldBlockDrag(obj) then forbidden = true; break
                elseif isMainPart(obj) then validTarget = true end
            end

            if validTarget and not forbidden then
                dragging  = true
                dragStart = input.Position
                startPos  = main.Position
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(
                    startPos.X.Scale,  startPos.X.Offset + delta.X,
                    startPos.Y.Scale,  startPos.Y.Offset + delta.Y
                )
            end
        end)

        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end)

    -- ── Mobile button logic ────────────────────────────────────
    task.spawn(function()
        local TweenService = game:GetService("TweenService")
        local MobileButton = Essence["28"]
        local MainFrame    = Essence["2"]
        local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

        MobileButton.Trigger.MouseButton1Down:Connect(function()
            MobileButton.Interactable = false
            local hide = TweenService:Create(MobileButton, tInfo, { Position = UDim2.new(0.1,0,-0.25,0) })
            hide:Play()
            hide.Completed:Connect(function()
                MobileButton.Visible = false
                MainFrame.Visible = true
            end)
        end)
    end)

    return Window
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Tab(params)
    local Tab = {}
    Tab.Name     = params.Name
    Tab.Image    = params.Image
    Tab.Selected = params.Selected

    local Essence = {}

    -- Usa RootGui em vez de game.CoreGui.Essence
    Essence["2"] = Instance.new("Frame", RootGui.Main.Left.Layout);
    Essence["2"]["BorderSizePixel"] = 0;
    Essence["2"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["2"]["Size"] = UDim2.new(0, 157, 0, 35);
    Essence["2"]["Position"] = UDim2.new(0.07104, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2"]["Name"] = Tab.Name;
    Essence["2"]["BackgroundTransparency"] = 1;

    Essence["3"] = Instance.new("UICorner", Essence["2"]);
    Essence["3"]["CornerRadius"] = UDim.new(0.25, 0);

    Essence["4"] = Instance.new("UIStroke", Essence["2"]);
    Essence["4"]["Transparency"] = 1;
    Essence["4"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["5"] = Instance.new("TextLabel", Essence["2"]);
    Essence["5"]["BorderSizePixel"] = 0;
    Essence["5"]["TextSize"] = 14;
    Essence["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Essence["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["5"]["TextColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["5"]["BackgroundTransparency"] = 1;
    Essence["5"]["Size"] = UDim2.new(0.76535, 0, 1, 0);
    Essence["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["5"]["Text"] = Tab.Name;
    Essence["5"]["Name"] = [[TabName]];
    Essence["5"]["Position"] = UDim2.new(0.23465, 0, 0, 0);

    Essence["6"] = Instance.new("UIPadding", Essence["5"]);
    Essence["6"]["PaddingBottom"] = UDim.new(0, 2);

    Essence["7"] = Instance.new("ImageLabel", Essence["2"]);
    Essence["7"]["BorderSizePixel"] = 0;
    Essence["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["7"]["ImageColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["7"]["Image"] = Tab.Image;
    Essence["7"]["Size"] = UDim2.new(0, 20, 0, 20);
    Essence["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["7"]["BackgroundTransparency"] = 1;
    Essence["7"]["Name"] = [[Image]];
    Essence["7"]["Position"] = UDim2.new(0.13, 0, 0.5, 0);

    Essence["8"] = Instance.new("UIAspectRatioConstraint", Essence["7"]);

    Essence["9"] = Instance.new("Frame", Essence["2"]);
    Essence["9"]["BorderSizePixel"] = 0;
    Essence["9"]["BackgroundColor3"] = Color3.fromRGB(114, 83, 255);
    Essence["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["9"]["Size"] = UDim2.new(0, 4, 0, 18);
    Essence["9"]["Position"] = UDim2.new(0, 0, 0.5, 0);
    Essence["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["9"]["Name"] = [[Bar]];
    Essence["9"]["BackgroundTransparency"] = 1;

    Essence["a"] = Instance.new("UICorner", Essence["9"]);

    Essence["b"] = Instance.new("TextButton", Essence["2"]);
    Essence["b"]["BorderSizePixel"] = 0;
    Essence["b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["b"]["TextSize"] = 14;
    Essence["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["b"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["b"]["BackgroundTransparency"] = 1;
    Essence["b"]["Name"] = [[Trigger]];
    Essence["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["b"]["Text"] = [[]];

    Essence["d"] = Instance.new("Frame", RootGui.Main.Tabs);
    Essence["d"]["Visible"] = false;
    Essence["d"]["Interactable"] = false;
    Essence["d"]["BorderSizePixel"] = 0;
    Essence["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["d"]["Size"] = UDim2.new(0, 410, 0, 371);
    Essence["d"]["Position"] = UDim2.new(0.31751, 0, 0.17429, 0);
    Essence["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["d"]["Name"] = Tab.Name;
    Essence["d"]["BackgroundTransparency"] = 1;

    Essence["e"] = Instance.new("ScrollingFrame", Essence["d"]);
    Essence["e"]["Active"] = true;
    Essence["e"]["BorderSizePixel"] = 0;
    Essence["e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
    Essence["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["e"]["Name"] = [[Scroll]];
    Essence["e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
    Essence["e"]["Size"] = UDim2.new(1.00244, 0, 1.01078, 0);
    Essence["e"]["ScrollBarImageColor3"] = Color3.fromRGB(114, 83, 255);
    Essence["e"]["Position"] = UDim2.new(-0.00244, 0, -0.01078, 0);
    Essence["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["e"]["ScrollBarThickness"] = 0;
    Essence["e"]["BackgroundTransparency"] = 1;

    Essence["f"] = Instance.new("Frame", Essence["e"]);
    Essence["f"]["BorderSizePixel"] = 0;
    Essence["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["f"]["Size"] = UDim2.new(0.98783, 0, 1.0, 0);
    Essence["f"]["Position"] = UDim2.new(0.00243, 0, 0.01348, 0);
    Essence["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["f"]["Name"] = [[Layout]];
    Essence["f"]["BackgroundTransparency"] = 1;

    Essence["10"] = Instance.new("UIListLayout", Essence["f"]);
    Essence["10"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
    Essence["10"]["Padding"] = UDim.new(0, 10);
    Essence["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    Essence["11"] = Instance.new("UIPadding", Essence["f"]);
    Essence["11"]["PaddingTop"] = UDim.new(0, 5);
    Essence["11"]["PaddingBottom"] = UDim.new(0, 8);

    -- Tab button logic
    task.spawn(function()
        local TweenService     = game:GetService("TweenService")
        local CenterPos        = UDim2.new(0.318, 0, 0.174, 0)
        local RightPos         = UDim2.new(1.1,   0, 0.174, 0)
        local AnimDuration     = 0.25
        local TInfo            = TweenInfo.new(AnimDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local TabsFolder       = RootGui.Main.Tabs
        local TabButtonsFolder = RootGui.Main.Left.Layout
        local CurrentTabContent = TabsFolder[Tab.Name]
        local TabBtn           = Essence["2"]

        local IsTabActive  = false
        local IsAnimating  = false
        local Color_Active   = Color3.fromRGB(113, 82, 255)
        local Color_Inactive = Color3.fromRGB(125, 125, 125)

        if Tab.Selected then
            IsTabActive = true
            TabBtn.Bar.BackgroundTransparency  = 0
            TabBtn.BackgroundTransparency      = 0
            TabBtn.Image.ImageColor3           = Color_Active
            TabBtn.TabName.TextColor3          = Color_Active
            TabBtn.UIStroke.Transparency       = 0
            CurrentTabContent.Visible          = true
            CurrentTabContent.Interactable     = true
            CurrentTabContent.Position         = CenterPos
        else
            CurrentTabContent.Visible      = false
            CurrentTabContent.Interactable = false
            CurrentTabContent.Position     = RightPos
        end

        TabBtn.Trigger.MouseButton1Down:Connect(function()
            if IsTabActive or IsAnimating then return end
            IsAnimating = true; IsTabActive = true

            TweenService:Create(TabBtn.Bar,     TInfo, { BackgroundTransparency = 0 }):Play()
            TweenService:Create(TabBtn,         TInfo, { BackgroundTransparency = 0 }):Play()
            TweenService:Create(TabBtn.Image,   TInfo, { ImageColor3 = Color_Active }):Play()
            TweenService:Create(TabBtn.TabName, TInfo, { TextColor3  = Color_Active }):Play()
            TweenService:Create(TabBtn.UIStroke,TInfo, { Transparency = 0 }):Play()

            for _, Btn in pairs(TabButtonsFolder:GetChildren()) do
                if Btn:IsA("Frame") and Btn ~= TabBtn then
                    TweenService:Create(Btn.Bar,     TInfo, { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(Btn,         TInfo, { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(Btn.Image,   TInfo, { ImageColor3 = Color_Inactive }):Play()
                    TweenService:Create(Btn.TabName, TInfo, { TextColor3  = Color_Inactive }):Play()
                    TweenService:Create(Btn.UIStroke,TInfo, { Transparency = 1 }):Play()
                end
            end

            local OldTab = nil
            for _, TabLoop in pairs(TabsFolder:GetChildren()) do
                if TabLoop:IsA("GuiObject") and TabLoop.Visible and TabLoop.Name ~= Tab.Name then
                    OldTab = TabLoop; break
                end
            end

            if OldTab then
                OldTab.Interactable = false
                TweenService:Create(OldTab, TInfo, { Position = RightPos }):Play()
                task.wait(AnimDuration * 0.8)
                OldTab.Visible = false
            end

            CurrentTabContent.Position    = RightPos
            CurrentTabContent.Visible     = true
            CurrentTabContent.Interactable = true

            local SlideIn = TweenService:Create(CurrentTabContent, TInfo, { Position = CenterPos })
            SlideIn:Play()
            SlideIn.Completed:Connect(function() IsAnimating = false end)
        end)

        TabButtonsFolder.ChildAdded:Connect(function(child)
            if child:IsA("Frame") and child:FindFirstChild("Trigger") then
                child.Trigger.MouseButton1Down:Connect(function() IsTabActive = false end)
            end
        end)
        for _, OtherBtn in pairs(TabButtonsFolder:GetChildren()) do
            if OtherBtn:IsA("Frame") and OtherBtn ~= TabBtn then
                OtherBtn.Trigger.MouseButton1Down:Connect(function() IsTabActive = false end)
            end
        end
    end)

    return Tab
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Button(params)
    local Button = {}
    Button.Name     = params.Name
    Button.Parent   = params.Parent
    Button.Callback = params.Callback or function() end

    local Essence = {}
    local TabFrame = RootGui.Main.Tabs:FindFirstChild(Button.Parent)

    Essence["2"] = Instance.new("Frame", TabFrame.Scroll.Layout);
    Essence["2"]["BorderSizePixel"] = 0;
    Essence["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Essence["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2"]["Name"] = Button.Name;

    Essence["3"] = Instance.new("ImageLabel", Essence["2"]);
    Essence["3"]["BorderSizePixel"] = 0;
    Essence["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["3"]["ImageColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["3"]["Image"] = [[rbxassetid://10734898194]];
    Essence["3"]["Size"] = UDim2.new(0, 30, 0, 30);
    Essence["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["3"]["BackgroundTransparency"] = 1;
    Essence["3"]["Name"] = [[Image]];
    Essence["3"]["Position"] = UDim2.new(0.93175, 0, 0.483, 0);

    Essence["4"] = Instance.new("UIAspectRatioConstraint", Essence["3"]);

    Essence["5"] = Instance.new("TextLabel", Essence["2"]);
    Essence["5"]["TextWrapped"] = true;
    Essence["5"]["BorderSizePixel"] = 0;
    Essence["5"]["TextSize"] = 15;
    Essence["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Essence["5"]["TextScaled"] = true;
    Essence["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["5"]["TextColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["5"]["BackgroundTransparency"] = 1;
    Essence["5"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Essence["5"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Essence["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["5"]["Text"] = Button.Name;
    Essence["5"]["Name"] = [[ComponentName]];
    Essence["5"]["Position"] = UDim2.new(0, 15, 0, 24);

    Essence["6"] = Instance.new("UIPadding", Essence["5"]);
    Essence["6"]["PaddingBottom"] = UDim.new(0, 2);

    Essence["7"] = Instance.new("UITextSizeConstraint", Essence["5"]);
    Essence["7"]["MaxTextSize"] = 15;

    Essence["8"] = Instance.new("UIStroke", Essence["2"]);
    Essence["8"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Essence["8"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["9"] = Instance.new("UICorner", Essence["2"]);
    Essence["9"]["CornerRadius"] = UDim.new(0.12, 0);

    Essence["a"] = Instance.new("TextButton", Essence["2"]);
    Essence["a"]["BorderSizePixel"] = 0;
    Essence["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["a"]["TextSize"] = 14;
    Essence["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["a"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["a"]["BackgroundTransparency"] = 1;
    Essence["a"]["Name"] = [[Trigger]];
    Essence["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["a"]["Text"] = [[]];

    task.spawn(function()
        local TweenService    = game:GetService("TweenService")
        local Container       = Essence["2"]
        local Trigger         = Container:WaitForChild("Trigger")
        local ComponentName   = Container:WaitForChild("ComponentName")
        local Icon            = Container:WaitForChild("Image")
        local DefaultColor    = Color3.fromRGB(125, 125, 125)
        local ClickColor      = Color3.fromRGB(113, 82, 255)
        local tInfo           = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

        local function ResetColor()
            TweenService:Create(ComponentName, tInfo, { TextColor3  = DefaultColor }):Play()
            TweenService:Create(Icon,          tInfo, { ImageColor3 = DefaultColor }):Play()
        end

        Trigger.MouseButton1Down:Connect(function()
            TweenService:Create(ComponentName, tInfo, { TextColor3  = ClickColor }):Play()
            TweenService:Create(Icon,          tInfo, { ImageColor3 = ClickColor }):Play()
            Button.Callback()
        end)
        Trigger.MouseButton1Up:Connect(ResetColor)
        Trigger.MouseLeave:Connect(ResetColor)
    end)

    return Button
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Toggle(params)
    local Toggle = {}
    Toggle.Name       = params.Name
    Toggle.Parent     = params.Parent
    Toggle.Default    = params.Default    or false
    Toggle.UseKeybind = params.UseKeybind or false
    Toggle.DefaultKey = params.DefaultKey or Enum.KeyCode.Unknown
    Toggle.Callback   = params.Callback   or function() end

    local Essence  = {}
    local TabFrame = RootGui.Main.Tabs:FindFirstChild(Toggle.Parent)

    Essence["2"] = Instance.new("Frame", TabFrame.Scroll.Layout);
    Essence["2"]["BorderSizePixel"] = 0;
    Essence["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Essence["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2"]["Name"] = Toggle.Name;

    Essence["3"] = Instance.new("TextLabel", Essence["2"]);
    Essence["3"]["TextWrapped"] = true;
    Essence["3"]["BorderSizePixel"] = 0;
    Essence["3"]["TextSize"] = 15;
    Essence["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Essence["3"]["TextScaled"] = true;
    Essence["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["3"]["TextColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["3"]["BackgroundTransparency"] = 1;
    Essence["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Essence["3"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Essence["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["3"]["Text"] = Toggle.Name;
    Essence["3"]["Name"] = [[ComponentName]];
    Essence["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Essence["4"] = Instance.new("UIPadding", Essence["3"]);
    Essence["4"]["PaddingBottom"] = UDim.new(0, 2);

    Essence["5"] = Instance.new("UITextSizeConstraint", Essence["3"]);
    Essence["5"]["MaxTextSize"] = 15;

    Essence["6"] = Instance.new("UIStroke", Essence["2"]);
    Essence["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Essence["6"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["7"] = Instance.new("UICorner", Essence["2"]);
    Essence["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Essence["8"] = Instance.new("Frame", Essence["2"]);
    Essence["8"]["BorderSizePixel"] = 0;
    Essence["8"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["8"]["Size"] = UDim2.new(0, 51, 0, 25);
    Essence["8"]["Position"] = UDim2.new(0.89877, 0, 0.483, 0);
    Essence["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["8"]["Name"] = [[Toggle]];

    Essence["9"] = Instance.new("UIStroke", Essence["8"]);
    Essence["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Essence["9"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["a"] = Instance.new("UICorner", Essence["8"]);
    Essence["a"]["CornerRadius"] = UDim.new(1, 0);

    Essence["b"] = Instance.new("Frame", Essence["8"]);
    Essence["b"]["BorderSizePixel"] = 0;
    Essence["b"]["BackgroundColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["b"]["Size"] = UDim2.new(0, 20, 0, 20);
    Essence["b"]["Position"] = UDim2.new(0.8, 0, 0.5, 0);
    Essence["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["b"]["Name"] = [[Dot]];

    Essence["c"] = Instance.new("UICorner", Essence["b"]);
    Essence["c"]["CornerRadius"] = UDim.new(1, 0);

    Essence["d"] = Instance.new("TextButton", Essence["8"]);
    Essence["d"]["BorderSizePixel"] = 0;
    Essence["d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["d"]["TextSize"] = 14;
    Essence["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["d"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["d"]["BackgroundTransparency"] = 1;
    Essence["d"]["Name"] = [[Trigger]];
    Essence["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["d"]["Text"] = [[]];

    -- Keybind frame
    Essence["f"] = Instance.new("Frame", Essence["2"]);
    Essence["f"]["Visible"] = false;
    Essence["f"]["BorderSizePixel"] = 0;
    Essence["f"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["f"]["Size"] = UDim2.new(0, 30, 0, 30);
    Essence["f"]["Position"] = UDim2.new(0.77, 0, 0.483, 0);
    Essence["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["f"]["Name"] = [[Keybind]];
    Essence["f"]:SetAttribute([[Key]], [[nil]]);

    Essence["10"] = Instance.new("UIStroke", Essence["f"]);
    Essence["10"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Essence["10"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["11"] = Instance.new("UICorner", Essence["f"]);
    Essence["11"]["CornerRadius"] = UDim.new(0.25, 0);

    Essence["12"] = Instance.new("TextLabel", Essence["f"]);
    Essence["12"]["TextWrapped"] = true;
    Essence["12"]["BorderSizePixel"] = 0;
    Essence["12"]["TextSize"] = 14;
    Essence["12"]["TextScaled"] = true;
    Essence["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["12"]["TextColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["12"]["BackgroundTransparency"] = 1;
    Essence["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["12"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["12"]["Text"] = [[?]];
    Essence["12"]["Name"] = [[KeyText]];
    Essence["12"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Essence["13"] = Instance.new("UIPadding", Essence["12"]);
    Essence["13"]["PaddingBottom"] = UDim.new(0, 2);

    Essence["14"] = Instance.new("UITextSizeConstraint", Essence["12"]);
    Essence["14"]["MaxTextSize"] = 14;

    Essence["15"] = Instance.new("TextButton", Essence["f"]);
    Essence["15"]["BorderSizePixel"] = 0;
    Essence["15"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["15"]["TextSize"] = 14;
    Essence["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["15"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["15"]["BackgroundTransparency"] = 1;
    Essence["15"]["Name"] = [[Trigger]];
    Essence["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["15"]["Text"] = [[]];

    task.spawn(function()
        local UIS          = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local Container    = Essence["2"]
        local ToggleFrame  = Container:WaitForChild("Toggle")
        local Dot          = ToggleFrame:WaitForChild("Dot")
        local Trigger      = ToggleFrame:WaitForChild("Trigger")
        local KeybindFrame = Container:WaitForChild("Keybind")
        local KeyText      = KeybindFrame:WaitForChild("KeyText")
        local KeyTrigger   = KeybindFrame:WaitForChild("Trigger")

        local isOn         = Toggle.Default
        local currentKey   = Toggle.DefaultKey
        local isListening  = false
        local tInfo        = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        local isPC         = UIS.KeyboardEnabled and UIS.MouseEnabled
        local keybindEnabled = Toggle.UseKeybind and isPC

        KeybindFrame.Visible = keybindEnabled

        local function UpdateVisuals(instant)
            local t = instant and TweenInfo.new(0) or tInfo
            TweenService:Create(Dot, t, {
                Position         = isOn and UDim2.new(0.8,0,0.5,0) or UDim2.new(0.2,0,0.5,0),
                BackgroundColor3 = isOn and Color3.fromRGB(113,82,255) or Color3.fromRGB(150,150,150)
            }):Play()
        end

        local function ToggleFn()
            isOn = not isOn
            UpdateVisuals(false)
            Toggle.Callback(isOn)
        end

        Trigger.MouseButton1Click:Connect(ToggleFn)

        if keybindEnabled then
            KeyText.Text = "?"
            KeyTrigger.MouseButton1Click:Connect(function()
                if isListening then return end
                isListening = true; KeyText.Text = "..."
                local conn
                conn = UIS.InputBegan:Connect(function(input)
                    local keyPressed
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        keyPressed = (input.KeyCode == Enum.KeyCode.Escape) and Enum.KeyCode.Unknown or input.KeyCode
                    elseif input.UserInputType == Enum.UserInputType.MouseButton2
                        or input.UserInputType == Enum.UserInputType.MouseButton3 then
                        keyPressed = input.UserInputType
                    end
                    if keyPressed then
                        conn:Disconnect()
                        currentKey = keyPressed
                        KeyText.Text = (keyPressed == Enum.KeyCode.Unknown) and "NONE" or keyPressed.Name
                        KeybindFrame:SetAttribute("Key", KeyText.Text)
                        isListening = false
                    end
                end)
            end)

            UIS.InputBegan:Connect(function(input, gpe)
                if gpe or isListening then return end
                if currentKey ~= Enum.KeyCode.Unknown then
                    if input.KeyCode == currentKey or input.UserInputType == currentKey then
                        ToggleFn()
                    end
                end
            end)
        end

        UpdateVisuals(true)
    end)

    -- Key text truncation
    task.spawn(function()
        local KeyText = Essence["12"]
        KeyText:GetPropertyChangedSignal("Text"):Connect(function()
            if #KeyText.Text > 3 then
                KeyText.Text = string.sub(KeyText.Text, 1, 3)
            end
        end)
    end)

    return Toggle
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Slider(params)
    local Slider = {}
    Slider.Name     = params.Name
    Slider.Parent   = params.Parent
    Slider.Min      = params.Min     or 0
    Slider.Max      = params.Max     or 100
    Slider.Default  = params.Default or 50
    Slider.Callback = params.Callback or function() end

    local Essence  = {}
    local TabFrame = RootGui.Main.Tabs:FindFirstChild(Slider.Parent)

    Essence["2"] = Instance.new("Frame", TabFrame.Scroll.Layout);
    Essence["2"]["BorderSizePixel"] = 0;
    Essence["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Essence["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["2"]["Name"] = Slider.Name;

    Essence["3"] = Instance.new("TextLabel", Essence["2"]);
    Essence["3"]["TextWrapped"] = true; Essence["3"]["BorderSizePixel"] = 0;
    Essence["3"]["TextSize"] = 15; Essence["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Essence["3"]["TextScaled"] = true;
    Essence["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["3"]["TextColor3"] = Color3.fromRGB(126, 126, 126);
    Essence["3"]["BackgroundTransparency"] = 1;
    Essence["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Essence["3"]["Size"] = UDim2.new(0.42659, 0, 1, 0);
    Essence["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["3"]["Text"] = Slider.Name; Essence["3"]["Name"] = [[ComponentName]];
    Essence["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Essence["4"] = Instance.new("UIPadding", Essence["3"]); Essence["4"]["PaddingBottom"] = UDim.new(0, 2);
    Essence["5"] = Instance.new("UITextSizeConstraint", Essence["3"]); Essence["5"]["MaxTextSize"] = 15;

    Essence["6"] = Instance.new("UIStroke", Essence["2"]);
    Essence["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Essence["6"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["7"] = Instance.new("UICorner", Essence["2"]); Essence["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Essence["8"] = Instance.new("Frame", Essence["2"]);
    Essence["8"]["BorderSizePixel"] = 0; Essence["8"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["8"]["Size"] = UDim2.new(0, 145, 0, 16);
    Essence["8"]["Position"] = UDim2.new(0.78922, 0, 0.51361, 0);
    Essence["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["8"]["Name"] = [[Slider]];

    Essence["9"] = Instance.new("UIStroke", Essence["8"]);
    Essence["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["9"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["a"] = Instance.new("UICorner", Essence["8"]); Essence["a"]["CornerRadius"] = UDim.new(1, 0);

    Essence["b"] = Instance.new("TextButton", Essence["8"]);
    Essence["b"]["BorderSizePixel"] = 0; Essence["b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["b"]["TextSize"] = 14; Essence["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["b"]["Size"] = UDim2.new(1, 0, 1, 0); Essence["b"]["BackgroundTransparency"] = 1;
    Essence["b"]["Name"] = [[Trigger]]; Essence["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["b"]["Text"] = [[]];

    Essence["c"] = Instance.new("TextLabel", Essence["2"]);
    Essence["c"]["BorderSizePixel"] = 0; Essence["c"]["TextSize"] = 15;
    Essence["c"]["TextXAlignment"] = Enum.TextXAlignment.Right;
    Essence["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["c"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["c"]["BackgroundTransparency"] = 1;
    Essence["c"]["Size"] = UDim2.new(0.08687, 0, 1, 0); Essence["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["c"]["Text"] = [[0]]; Essence["c"]["Name"] = [[Value]];
    Essence["c"]["Position"] = UDim2.new(0.50123, 0, 0, 0);

    Essence["d"] = Instance.new("UIPadding", Essence["c"]); Essence["d"]["PaddingBottom"] = UDim.new(0, 2);

    task.spawn(function()
        local TweenService  = game:GetService("TweenService")
        local UIS           = game:GetService("UserInputService")
        local SliderFrame   = Essence["2"]:WaitForChild("Slider")
        local Trigger       = SliderFrame:WaitForChild("Trigger")
        local ValueLabel    = Essence["2"]:WaitForChild("Value")
        local ScrollFrame   = Essence["2"].Parent.Parent

        local Fill = Instance.new("Frame")
        Fill.Name = "Fill"; Fill.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
        Fill.BorderSizePixel = 0; Fill.ZIndex = 1
        local startPercent = math.clamp((Slider.Default - Slider.Min) / (Slider.Max - Slider.Min), 0, 1)
        Fill.Size = UDim2.new(startPercent, 0, 1, 0)
        Fill.Parent = SliderFrame
        local FillCorner = Instance.new("UICorner"); FillCorner.CornerRadius = UDim.new(1,0); FillCorner.Parent = Fill
        Trigger.ZIndex = 5

        local dragging = false
        local function ToggleScroll(en)
            if ScrollFrame and ScrollFrame:IsA("ScrollingFrame") then ScrollFrame.ScrollingEnabled = en end
        end
        local function UpdateSlider(input)
            local sliderSize = SliderFrame.AbsoluteSize.X
            local sliderPos  = SliderFrame.AbsolutePosition.X
            local percent    = math.clamp((input.Position.X - sliderPos) / sliderSize, 0, 1)
            local value      = math.round(Slider.Min + percent * (Slider.Max - Slider.Min))
            ValueLabel.Text  = tostring(value)
            TweenService:Create(Fill, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                { Size = UDim2.new(percent, 0, 1, 0) }):Play()
            Slider.Callback(value)
        end

        Trigger.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; ToggleScroll(false); UpdateSlider(input)
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then UpdateSlider(input) end
        end)
        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false; ToggleScroll(true)
            end
        end)
        ValueLabel.Text = tostring(Slider.Default)
    end)

    return Slider
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Textbox(params)
    local Textbox = {}
    Textbox.Name        = params.Name
    Textbox.Parent      = params.Parent
    Textbox.Placeholder = params.Placeholder
    Textbox.Callback    = params.Callback or function() end

    local Essence  = {}
    local TabFrame = RootGui.Main.Tabs:FindFirstChild(Textbox.Parent)

    Essence["2"] = Instance.new("Frame", TabFrame.Scroll.Layout);
    Essence["2"]["BorderSizePixel"] = 0; Essence["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["2"]["Size"] = UDim2.new(0, 405, 0, 49); Essence["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["2"]["Name"] = Textbox.Name;

    Essence["3"] = Instance.new("TextLabel", Essence["2"]);
    Essence["3"]["TextWrapped"] = true; Essence["3"]["BorderSizePixel"] = 0; Essence["3"]["TextSize"] = 15;
    Essence["3"]["TextXAlignment"] = Enum.TextXAlignment.Left; Essence["3"]["TextScaled"] = true;
    Essence["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["3"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["3"]["BackgroundTransparency"] = 1;
    Essence["3"]["AnchorPoint"] = Vector2.new(0, 0.5); Essence["3"]["Size"] = UDim2.new(0.51156, 0, 1, 0);
    Essence["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["3"]["Text"] = Textbox.Name;
    Essence["3"]["Name"] = [[ComponentName]]; Essence["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Essence["4"] = Instance.new("UIPadding", Essence["3"]); Essence["4"]["PaddingBottom"] = UDim.new(0, 2);
    Essence["5"] = Instance.new("UITextSizeConstraint", Essence["3"]); Essence["5"]["MaxTextSize"] = 15;

    Essence["6"] = Instance.new("UIStroke", Essence["2"]);
    Essence["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["6"]["Color"] = Color3.fromRGB(36, 36, 36);
    Essence["7"] = Instance.new("UICorner", Essence["2"]); Essence["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Essence["8"] = Instance.new("TextBox", Essence["2"]);
    Essence["8"]["Name"] = [[Box]]; Essence["8"]["PlaceholderColor3"] = Color3.fromRGB(71, 71, 71);
    Essence["8"]["BorderSizePixel"] = 0; Essence["8"]["TextSize"] = 14;
    Essence["8"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["8"]["TextScaled"] = false;
    Essence["8"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5); Essence["8"]["ClearTextOnFocus"] = false;
    Essence["8"]["Size"] = UDim2.new(0, 142, 0, 25); Essence["8"]["Position"] = UDim2.new(0.79349, 0, 0.483, 0);
    Essence["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["8"]["Text"] = [[]];

    Essence["9"] = Instance.new("UICorner", Essence["8"]); Essence["9"]["CornerRadius"] = UDim.new(0.25, 0);
    Essence["a"] = Instance.new("UIStroke", Essence["8"]);
    Essence["a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["a"]["Color"] = Color3.fromRGB(36, 36, 36);
    Essence["b"] = Instance.new("UITextSizeConstraint", Essence["8"]); Essence["b"]["MaxTextSize"] = 14;

    task.spawn(function()
        local Box = Essence["8"]
        Box.PlaceholderText = Textbox.Placeholder or "Placeholder..."
        Box.Text = ""
        Box.ClipsDescendants = true
        Box.FocusLost:Connect(function()
            Textbox.Callback(Box.Text)
        end)
    end)

    return Textbox
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Keybind(params)
    local Keybind = {}
    Keybind.Name       = params.Name
    Keybind.Parent     = params.Parent
    

    Keybind.DefaultKey = params.DefaultKey or Enum.KeyCode.F
    Keybind.Callback   = params.Callback   or function() end

    local Essence  = {}
    local TabFrame = RootGui.Main.Tabs:FindFirstChild(Keybind.Parent)

    Essence["2"] = Instance.new("Frame", TabFrame.Scroll.Layout);
    Essence["2"]["BorderSizePixel"] = 0; Essence["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["2"]["Size"] = UDim2.new(0, 405, 0, 49); Essence["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["2"]["Name"] = Keybind.Name;

    Essence["3"] = Instance.new("TextLabel", Essence["2"]);
    Essence["3"]["TextWrapped"] = true; Essence["3"]["BorderSizePixel"] = 0; Essence["3"]["TextSize"] = 15;
    Essence["3"]["TextXAlignment"] = Enum.TextXAlignment.Left; Essence["3"]["TextScaled"] = true;
    Essence["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["3"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["3"]["BackgroundTransparency"] = 1;
    Essence["3"]["AnchorPoint"] = Vector2.new(0, 0.5); Essence["3"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Essence["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["3"]["Text"] = Keybind.Name;
    Essence["3"]["Name"] = [[ComponentName]]; Essence["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Essence["4"] = Instance.new("UIPadding", Essence["3"]); Essence["4"]["PaddingBottom"] = UDim.new(0, 2);
    Essence["5"] = Instance.new("UITextSizeConstraint", Essence["3"]); Essence["5"]["MaxTextSize"] = 15;
    Essence["6"] = Instance.new("UIStroke", Essence["2"]);
    Essence["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["6"]["Color"] = Color3.fromRGB(36, 36, 36);
    Essence["7"] = Instance.new("UICorner", Essence["2"]); Essence["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Essence["8"] = Instance.new("Frame", Essence["2"]);
    Essence["8"]["BorderSizePixel"] = 0; Essence["8"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5); Essence["8"]["Size"] = UDim2.new(0, 30, 0, 30);
    Essence["8"]["Position"] = UDim2.new(0.93087, 0, 0.483, 0);
    Essence["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["8"]["Name"] = [[Keybind]];
    Essence["8"]:SetAttribute([[Key]], [[nil]]);

    Essence["9"] = Instance.new("UIStroke", Essence["8"]);
    Essence["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["9"]["Color"] = Color3.fromRGB(36, 36, 36);
    Essence["a"] = Instance.new("UICorner", Essence["8"]); Essence["a"]["CornerRadius"] = UDim.new(0.25, 0);

    Essence["b"] = Instance.new("TextLabel", Essence["8"]);
    Essence["b"]["TextWrapped"] = true; Essence["b"]["BorderSizePixel"] = 0; Essence["b"]["TextSize"] = 14;
    Essence["b"]["TextScaled"] = true; Essence["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["b"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["b"]["BackgroundTransparency"] = 1;
    Essence["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5); Essence["b"]["Size"] = UDim2.new(1, 0, 1, 0);
    Essence["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["b"]["Text"] = [[F]];
    Essence["b"]["Name"] = [[KeyText]]; Essence["b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Essence["c"] = Instance.new("UIPadding", Essence["b"]); Essence["c"]["PaddingBottom"] = UDim.new(0, 2);
    Essence["d"] = Instance.new("UITextSizeConstraint", Essence["b"]); Essence["d"]["MaxTextSize"] = 14;

    Essence["e"] = Instance.new("TextButton", Essence["8"]);
    Essence["e"]["BorderSizePixel"] = 0; Essence["e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["e"]["TextSize"] = 14; Essence["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["e"]["Size"] = UDim2.new(1, 0, 1, 0); Essence["e"]["BackgroundTransparency"] = 1;
    Essence["e"]["Name"] = [[Trigger]]; Essence["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["e"]["Text"] = [[]];

    -- Key text truncation
    task.spawn(function()
        local KeyText = Essence["b"]
        KeyText:GetPropertyChangedSignal("Text"):Connect(function()
            if #KeyText.Text > 3 then KeyText.Text = string.sub(KeyText.Text, 1, 3) end
        end)
    end)

    -- Keybind logic
    task.spawn(function()
        local UIS          = game:GetService("UserInputService")
        local KeybindFrame = Essence["8"]
        local Trigger      = KeybindFrame:WaitForChild("Trigger")
        local KeyText      = KeybindFrame:WaitForChild("KeyText")
        local currentKey   = Keybind.DefaultKey
        local isListening  = false

        KeyText.Text = currentKey.Name
        KeybindFrame:SetAttribute("Key", KeyText.Text)

        Trigger.MouseButton1Click:Connect(function()
            if isListening then return end
            isListening = true; KeyText.Text = "..."
            local conn
            conn = UIS.InputBegan:Connect(function(input)
                local keyPressed
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    keyPressed = (input.KeyCode == Enum.KeyCode.Escape) and Enum.KeyCode.Unknown or input.KeyCode
                elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                    keyPressed = Enum.UserInputType.MouseButton2
                elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
                    keyPressed = Enum.UserInputType.MouseButton3
                end
                if keyPressed then
                    conn:Disconnect()
                    currentKey = keyPressed
                    KeyText.Text = (keyPressed == Enum.KeyCode.Unknown) and "NONE" or keyPressed.Name
                    KeybindFrame:SetAttribute("Key", KeyText.Text)
                    isListening = false
                end
            end)
        end)

        UIS.InputBegan:Connect(function(input, gpe)
            if gpe or isListening then return end
            if currentKey ~= Enum.KeyCode.Unknown then
                if input.KeyCode == currentKey or input.UserInputType == currentKey then
                    Keybind.Callback()
                end
            end
        end)
    end)

    return Keybind
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Dropdown(params)
    local Dropdown = {}
    Dropdown.Name     = params.Name
    Dropdown.Parent   = params.Parent
    Dropdown.Options  = params.Options  or {}
    Dropdown.Default  = params.Default  or (Dropdown.Options[1] or "None")
    Dropdown.Callback = params.Callback or function() end

    local Essence  = {}
    local TabFrame = RootGui.Main.Tabs:FindFirstChild(Dropdown.Parent)

    Essence["2"] = Instance.new("Frame", TabFrame.Scroll.Layout);
    Essence["2"]["BorderSizePixel"] = 0; Essence["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["2"]["Size"] = UDim2.new(0, 405, 0, 49); Essence["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["2"]["Name"] = Dropdown.Name;

    Essence["3"] = Instance.new("TextLabel", Essence["2"]);
    Essence["3"]["TextWrapped"] = true; Essence["3"]["BorderSizePixel"] = 0; Essence["3"]["TextSize"] = 15;
    Essence["3"]["TextXAlignment"] = Enum.TextXAlignment.Left; Essence["3"]["TextScaled"] = true;
    Essence["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["3"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["3"]["BackgroundTransparency"] = 1;
    Essence["3"]["AnchorPoint"] = Vector2.new(0, 0.5); Essence["3"]["Size"] = UDim2.new(0.55847, 0, 1, 0);
    Essence["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["3"]["Text"] = Dropdown.Name;
    Essence["3"]["Name"] = [[ComponentName]]; Essence["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Essence["4"] = Instance.new("UIPadding", Essence["3"]); Essence["4"]["PaddingBottom"] = UDim.new(0, 2);
    Essence["5"] = Instance.new("UITextSizeConstraint", Essence["3"]); Essence["5"]["MaxTextSize"] = 15;
    Essence["6"] = Instance.new("UIStroke", Essence["2"]);
    Essence["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["6"]["Color"] = Color3.fromRGB(36, 36, 36);
    Essence["7"] = Instance.new("UICorner", Essence["2"]); Essence["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Essence["8"] = Instance.new("Frame", Essence["2"]);
    Essence["8"]["BorderSizePixel"] = 0; Essence["8"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
    Essence["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5); Essence["8"]["Size"] = UDim2.new(0, 119, 0, 30);
    Essence["8"]["Position"] = UDim2.new(0.82099, 0, 0.483, 0);
    Essence["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["8"]["Name"] = [[Dropdown]];

    Essence["9"] = Instance.new("UICorner", Essence["8"]); Essence["9"]["CornerRadius"] = UDim.new(0.25, 0);
    Essence["a"] = Instance.new("UIStroke", Essence["8"]);
    Essence["a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["a"]["Color"] = Color3.fromRGB(36, 36, 36);

    Essence["b"] = Instance.new("ImageLabel", Essence["8"]);
    Essence["b"]["BorderSizePixel"] = 0; Essence["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["b"]["ImageColor3"] = Color3.fromRGB(126, 126, 126); Essence["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Essence["b"]["Image"] = [[rbxassetid://10709790948]]; Essence["b"]["Size"] = UDim2.new(0, 25, 0, 25);
    Essence["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["b"]["BackgroundTransparency"] = 1;
    Essence["b"]["Name"] = [[Chevron]]; Essence["b"]["Position"] = UDim2.new(0.86, 0, 0.5, 0);

    Essence["c"] = Instance.new("UIAspectRatioConstraint", Essence["b"]);

    Essence["d"] = Instance.new("TextButton", Essence["b"]);
    Essence["d"]["BorderSizePixel"] = 0; Essence["d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["d"]["TextSize"] = 14; Essence["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["d"]["Size"] = UDim2.new(1, 0, 1, 0); Essence["d"]["BackgroundTransparency"] = 1;
    Essence["d"]["Name"] = [[Trigger]]; Essence["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["d"]["Text"] = [[]];

    Essence["e"] = Instance.new("TextLabel", Essence["8"]);
    Essence["e"]["TextWrapped"] = true; Essence["e"]["BorderSizePixel"] = 0; Essence["e"]["TextSize"] = 13;
    Essence["e"]["TextXAlignment"] = Enum.TextXAlignment.Left; Essence["e"]["TextScaled"] = true;
    Essence["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["e"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["e"]["BackgroundTransparency"] = 1;
    Essence["e"]["Size"] = UDim2.new(0.67625, 0, 1, 0); Essence["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["e"]["Text"] = Dropdown.Default; Essence["e"]["Name"] = [[Selected]];
    Essence["e"]["Position"] = UDim2.new(0.041, 0, 0, 0);

    Essence["f"] = Instance.new("UIPadding", Essence["e"]); Essence["f"]["PaddingBottom"] = UDim.new(0, 2);
    Essence["10"] = Instance.new("UITextSizeConstraint", Essence["e"]); Essence["10"]["MaxTextSize"] = 13;

    task.spawn(function()
        local TweenService    = game:GetService("TweenService")
        local Container       = Essence["2"]
        local DropdownFrame   = Container:WaitForChild("Dropdown")
        local Chevron         = DropdownFrame:WaitForChild("Chevron")
        local Trigger         = Chevron:WaitForChild("Trigger")
        local SelectedText    = DropdownFrame:WaitForChild("Selected")
        local MainCorner      = Container:WaitForChild("UICorner")

        local isOpen          = false
        local OptionHeight    = 28
        local DropdownYSize   = #Dropdown.Options * OptionHeight
        local originalSize    = UDim2.new(1, 0, 0, 49)
        local expandedSize    = UDim2.new(1, 0, 0, 49 + DropdownYSize + 10)
        local originalCorner  = MainCorner.CornerRadius
        local expandedCorner  = UDim.new(0, 5)

        local ListFrame = Instance.new("Frame")
        ListFrame.Name = "OptionList"; ListFrame.Size = UDim2.new(1,0,0,0)
        ListFrame.Position = UDim2.new(0,0,1,6); ListFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
        ListFrame.ClipsDescendants = true; ListFrame.ZIndex = 10; ListFrame.Visible = false
        ListFrame.Parent = DropdownFrame

        local ListCorner = Instance.new("UICorner", ListFrame); ListCorner.CornerRadius = UDim.new(0,4)
        local ListStroke = Instance.new("UIStroke", ListFrame)
        ListStroke.Color = Color3.fromRGB(35,35,35); ListStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        Instance.new("UIListLayout", ListFrame).SortOrder = Enum.SortOrder.LayoutOrder

        for _, option in ipairs(Dropdown.Options) do
            local OptionBtn = Instance.new("TextButton")
            OptionBtn.Name = option; OptionBtn.Size = UDim2.new(1,0,0,OptionHeight)
            OptionBtn.BackgroundTransparency = 1; OptionBtn.Text = "  " .. option
            OptionBtn.TextXAlignment = Enum.TextXAlignment.Left
            OptionBtn.TextColor3 = Color3.fromRGB(125,125,125)
            OptionBtn.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
            OptionBtn.TextSize = 13; OptionBtn.ZIndex = 11; OptionBtn.Parent = ListFrame

            OptionBtn.MouseEnter:Connect(function()
                TweenService:Create(OptionBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(175,175,175) }):Play()
            end)
            OptionBtn.MouseLeave:Connect(function()
                TweenService:Create(OptionBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(125,125,125) }):Play()
            end)
            OptionBtn.MouseButton1Click:Connect(function()
                SelectedText.Text = option; Dropdown.Callback(option)
                isOpen = false
                TweenService:Create(ListFrame,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = UDim2.new(1,0,0,0) }):Play()
                TweenService:Create(Container,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = originalSize }):Play()
                TweenService:Create(MainCorner,   TweenInfo.new(0.2), { CornerRadius = originalCorner }):Play()
                TweenService:Create(Chevron,      TweenInfo.new(0.2), { Rotation = 0 }):Play()
                task.wait(0.2); ListFrame.Visible = false
            end)
        end

        Trigger.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                ListFrame.Visible = true
                TweenService:Create(Container,  TweenInfo.new(0.25, Enum.EasingStyle.Quart), { Size = expandedSize }):Play()
                TweenService:Create(MainCorner, TweenInfo.new(0.25), { CornerRadius = expandedCorner }):Play()
                TweenService:Create(ListFrame,  TweenInfo.new(0.25, Enum.EasingStyle.Quart), { Size = UDim2.new(1,0,0,DropdownYSize) }):Play()
                TweenService:Create(Chevron,    TweenInfo.new(0.2), { Rotation = 180 }):Play()
            else
                TweenService:Create(ListFrame,  TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = UDim2.new(1,0,0,0) }):Play()
                TweenService:Create(Container,  TweenInfo.new(0.2, Enum.EasingStyle.Quart), { Size = originalSize }):Play()
                TweenService:Create(MainCorner, TweenInfo.new(0.2), { CornerRadius = originalCorner }):Play()
                TweenService:Create(Chevron,    TweenInfo.new(0.2), { Rotation = 0 }):Play()
                task.wait(0.2); ListFrame.Visible = false
            end
        end)
    end)

    return Dropdown
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Colorpicker(params)
    local Colorpicker = {}
    Colorpicker.Name     = params.Name
    Colorpicker.Parent   = params.Parent
    Colorpicker.Default  = params.Default  or Color3.fromRGB(114, 83, 255)
    Colorpicker.Callback = params.Callback or function() end

    local Essence  = {}
    local TabFrame = RootGui.Main.Tabs:FindFirstChild(Colorpicker.Parent)

    Essence["2"] = Instance.new("Frame", TabFrame.Scroll.Layout);
    Essence["2"]["BorderSizePixel"] = 0; Essence["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
    Essence["2"]["Size"] = UDim2.new(0, 405, 0, 49); Essence["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Essence["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["2"]["Name"] = Colorpicker.Name;

    Essence["3"] = Instance.new("TextLabel", Essence["2"]);
    Essence["3"]["TextWrapped"] = true; Essence["3"]["BorderSizePixel"] = 0; Essence["3"]["TextSize"] = 15;
    Essence["3"]["TextXAlignment"] = Enum.TextXAlignment.Left; Essence["3"]["TextScaled"] = true;
    Essence["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    Essence["3"]["TextColor3"] = Color3.fromRGB(126, 126, 126); Essence["3"]["BackgroundTransparency"] = 1;
    Essence["3"]["AnchorPoint"] = Vector2.new(0, 0.5); Essence["3"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Essence["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["3"]["Text"] = Colorpicker.Name;
    Essence["3"]["Name"] = [[ComponentName]]; Essence["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Essence["4"] = Instance.new("UIPadding", Essence["3"]); Essence["4"]["PaddingBottom"] = UDim.new(0, 2);
    Essence["5"] = Instance.new("UITextSizeConstraint", Essence["3"]); Essence["5"]["MaxTextSize"] = 15;
    Essence["6"] = Instance.new("UIStroke", Essence["2"]);
    Essence["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border; Essence["6"]["Color"] = Color3.fromRGB(36, 36, 36);
    Essence["7"] = Instance.new("UICorner", Essence["2"]); Essence["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Essence["8"] = Instance.new("Frame", Essence["2"]);
    Essence["8"]["BorderSizePixel"] = 0; Essence["8"]["BackgroundColor3"] = Color3.fromRGB(114, 83, 255);
    Essence["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5); Essence["8"]["Size"] = UDim2.new(0, 30, 0, 30);
    Essence["8"]["Position"] = UDim2.new(0.93087, 0, 0.483, 0);
    Essence["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["8"]["Name"] = [[Color]];

    Essence["9"] = Instance.new("UICorner", Essence["8"]); Essence["9"]["CornerRadius"] = UDim.new(0.25, 0);

    Essence["a"] = Instance.new("TextButton", Essence["8"]);
    Essence["a"]["BorderSizePixel"] = 0; Essence["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Essence["a"]["TextSize"] = 14; Essence["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Essence["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    Essence["a"]["Size"] = UDim2.new(1, 0, 1, 0); Essence["a"]["BackgroundTransparency"] = 1;
    Essence["a"]["Name"] = [[Trigger]]; Essence["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); Essence["a"]["Text"] = [[]];

    task.spawn(function()
        local TweenService  = game:GetService("TweenService")
        local UIS           = game:GetService("UserInputService")
        local Container     = Essence["2"]
        local ColorPreview  = Container:WaitForChild("Color")
        local Trigger       = ColorPreview:WaitForChild("Trigger")
        local MainCorner    = Container:WaitForChild("UICorner")
        local ScrollFrame   = Container.Parent.Parent

        local isOpen = false
        local currentHue, currentSat, currentVal = Colorpicker.Default:ToHSV()
        local originalSize   = UDim2.new(1,0,0,49)
        local expandedSize   = UDim2.new(1,0,0,215)
        local originalCorner = MainCorner.CornerRadius
        local expandedCorner = UDim.new(0,6)

        local ColorPanel = Instance.new("Frame")
        ColorPanel.Name = "ColorPanel"; ColorPanel.Size = UDim2.new(1,-24,0,0)
        ColorPanel.Position = UDim2.new(0,12,0,52); ColorPanel.BackgroundColor3 = Color3.fromRGB(15,15,15)
        ColorPanel.ClipsDescendants = true; ColorPanel.Visible = false; ColorPanel.BackgroundTransparency = 1
        ColorPanel.Parent = Container
        Instance.new("UICorner", ColorPanel).CornerRadius = UDim.new(0,10)
        local PanelStroke = Instance.new("UIStroke", ColorPanel)
        PanelStroke.Color = Color3.fromRGB(35,35,35); PanelStroke.Transparency = 1

        local SatValPicker = Instance.new("ImageLabel")
        SatValPicker.Name = "SaturationValuePicker"; SatValPicker.Size = UDim2.new(1,-20,0,110)
        SatValPicker.Position = UDim2.new(0,10,0,10); SatValPicker.Image = "rbxassetid://4155801252"
        SatValPicker.ImageTransparency = 1; SatValPicker.BackgroundColor3 = Color3.fromHSV(currentHue,1,1)
        SatValPicker.Parent = ColorPanel
        Instance.new("UICorner", SatValPicker).CornerRadius = UDim.new(0,6)

        local SatValCursor = Instance.new("Frame")
        SatValCursor.Size = UDim2.new(0,10,0,10); SatValCursor.AnchorPoint = Vector2.new(0.5,0.5)
        SatValCursor.BackgroundTransparency = 1; SatValCursor.Parent = SatValPicker
        local SCursorStroke = Instance.new("UIStroke", SatValCursor)
        SCursorStroke.Color = Color3.fromRGB(175,175,175); SCursorStroke.Thickness = 2
        Instance.new("UICorner", SatValCursor).CornerRadius = UDim.new(1,0)

        local HueSlider = Instance.new("Frame")
        HueSlider.Name = "HueSlider"; HueSlider.Size = UDim2.new(1,-20,0,14)
        HueSlider.Position = UDim2.new(0,10,0,130); HueSlider.BackgroundTransparency = 1
        HueSlider.Parent = ColorPanel
        Instance.new("UICorner", HueSlider).CornerRadius = UDim.new(1,0)
        local HueGradient = Instance.new("UIGradient", HueSlider)
        HueGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,     Color3.fromRGB(255,0,0)),
            ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255,255,0)),
            ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0,255,0)),
            ColorSequenceKeypoint.new(0.5,   Color3.fromRGB(0,255,255)),
            ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0,0,255)),
            ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255,0,255)),
            ColorSequenceKeypoint.new(1,     Color3.fromRGB(255,0,0)),
        })

        local HueCursor = Instance.new("Frame")
        HueCursor.Size = UDim2.new(0,7,0,7); HueCursor.AnchorPoint = Vector2.new(0.5,0.5)
        HueCursor.BackgroundTransparency = 1; HueCursor.Parent = HueSlider
        local HCursorStroke = Instance.new("UIStroke", HueCursor)
        HCursorStroke.Color = Color3.fromRGB(175,175,175); HCursorStroke.Thickness = 2
        Instance.new("UICorner", HueCursor).CornerRadius = UDim.new(1,0)

        local function UpdateUI(instant, fireCallback)
            local pickedColor = Color3.fromHSV(currentHue, currentSat, currentVal)
            local t = instant and TweenInfo.new(0) or TweenInfo.new(0.1)
            TweenService:Create(ColorPreview, t, { BackgroundColor3 = pickedColor }):Play()
            TweenService:Create(SatValPicker, t, { BackgroundColor3 = Color3.fromHSV(currentHue,1,1) }):Play()
            TweenService:Create(SatValCursor, t, { Position = UDim2.new(currentSat,0,1-currentVal,0) }):Play()
            TweenService:Create(HueCursor,    t, { Position = UDim2.new(currentHue,0,0.5,0) }):Play()
            if fireCallback then Colorpicker.Callback(pickedColor) end
        end

        local draggingSV, draggingH = false, false
        local function ToggleScroll(en)
            if ScrollFrame and ScrollFrame:IsA("ScrollingFrame") then ScrollFrame.ScrollingEnabled = en end
        end
        local function ProcessInput(input, obj, t)
            local relX = math.clamp((input.Position.X - obj.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, 1)
            local relY = math.clamp((input.Position.Y - obj.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0, 1)
            if t == "SatVal" then currentSat, currentVal = relX, 1 - relY
            elseif t == "Hue" then currentHue = relX end
            UpdateUI(false, true)
        end

        SatValPicker.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                draggingSV = true; ToggleScroll(false); ProcessInput(i, SatValPicker, "SatVal")
            end
        end)
        HueSlider.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                draggingH = true; ToggleScroll(false); ProcessInput(i, HueSlider, "Hue")
            end
        end)
        UIS.InputChanged:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
                if draggingSV then ProcessInput(i, SatValPicker, "SatVal")
                elseif draggingH then ProcessInput(i, HueSlider, "Hue") end
            end
        end)
        UIS.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                draggingSV, draggingH = false, false; ToggleScroll(true)
            end
        end)

        local t = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        Trigger.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                Container.ZIndex = 2; ColorPanel.Visible = true; task.wait()
                TweenService:Create(Container,   t, { Size = expandedSize }):Play()
                TweenService:Create(MainCorner,  t, { CornerRadius = expandedCorner }):Play()
                TweenService:Create(ColorPanel,  t, { Size = UDim2.new(1,-24,0,150), BackgroundTransparency = 0 }):Play()
                TweenService:Create(PanelStroke, t, { Transparency = 0 }):Play()
                TweenService:Create(SatValPicker,t, { ImageTransparency = 0 }):Play()
                TweenService:Create(HueSlider,   t, { BackgroundTransparency = 0 }):Play()
            else
                Container.ZIndex = 1
                TweenService:Create(ColorPanel,  t, { Size = UDim2.new(1,-24,0,0), BackgroundTransparency = 1 }):Play()
                TweenService:Create(PanelStroke, t, { Transparency = 1 }):Play()
                TweenService:Create(SatValPicker,t, { ImageTransparency = 1 }):Play()
                TweenService:Create(HueSlider,   t, { BackgroundTransparency = 1 }):Play()
                TweenService:Create(Container,   t, { Size = originalSize }):Play()
                TweenService:Create(MainCorner,  t, { CornerRadius = originalCorner }):Play()
                task.delay(0.3, function() if not isOpen then ColorPanel.Visible = false end end)
            end
        end)

        UpdateUI(true, false)
    end)

    return Colorpicker
end

-- ──────────────────────────────────────────────────────────────
function EssenceLibrary:Notification(Description, Duration)
    _Notif(Description, Duration)
end

return EssenceLibrary
