local LumiereLibrary = {}

function LumiereLibrary:Window(params)
    local Window = {}

    Window.GameName = params.GameName
    Window.Version = params.Version

    local Lumiere.CC = {}

    Lumiere.CC["1"] = Instance.new("ScreenGui", game.CoreGui);
    Lumiere.CC["1"]["IgnoreGuiInset"] = true;
    Lumiere.CC["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
    Lumiere.CC["1"]["Name"] = [[Lumiere.CC]];
    Lumiere.CC["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
    Lumiere.CC["1"]["ResetOnSpawn"] = false;

    Lumiere.CC["2"] = Instance.new("CanvasGroup", Lumiere.CC["1"]);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 611, 0, 459);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = [[Main]];

    Lumiere.CC["2"]:SetAttribute([[Minimized]], false);

    Lumiere.CC["3"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["3"]["CornerRadius"] = UDim.new(0.05, 0);

    Lumiere.CC["4"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["4"]["BorderSizePixel"] = 0;
    Lumiere.CC["4"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["4"]["Size"] = UDim2.new(0, 611, 0, 75);
    Lumiere.CC["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["4"]["Name"] = [[Top]];
    Lumiere.CC["4"]["ZIndex"] = 2;

    Lumiere.CC["5"] = Instance.new("Frame", Lumiere.CC["4"]);
    Lumiere.CC["5"]["ZIndex"] = 2;
    Lumiere.CC["5"]["BorderSizePixel"] = 0;
    Lumiere.CC["5"]["BackgroundColor3"] = Color3.fromRGB(28, 36, 56);
    Lumiere.CC["5"]["Size"] = UDim2.new(0, 611, 0, 1);
    Lumiere.CC["5"]["Position"] = UDim2.new(0, 0, 1, 0);
    Lumiere.CC["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["5"]["Name"] = [[Bar]];

    Lumiere.CC["6"] = Instance.new("ImageLabel", Lumiere.CC["4"]);
    Lumiere.CC["6"]["Active"] = true;
    Lumiere.CC["6"]["BorderSizePixel"] = 0;
    Lumiere.CC["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["6"]["ImageColor3"] = Color3.fromRGB(32, 84, 201);
    Lumiere.CC["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["6"]["Image"] = [[rbxassetid://110653068142193]];
    Lumiere.CC["6"]["Size"] = UDim2.new(0, 85, 0, 87);
    Lumiere.CC["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["6"]["BackgroundTransparency"] = 1;
    Lumiere.CC["6"]["Name"] = [[Logo]];
    Lumiere.CC["6"]["Position"] = UDim2.new(0.05936, 0, 0.5, 0);

    Lumiere.CC["7"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["6"]);

    Lumiere.CC["8"] = Instance.new("TextLabel", Lumiere.CC["4"]);
    Lumiere.CC["8"]["BorderSizePixel"] = 0;
    Lumiere.CC["8"]["TextSize"] = 15;
    Lumiere.CC["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["8"]["TextYAlignment"] = Enum.TextYAlignment.Top;
    Lumiere.CC["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
        Enum.FontStyle.Normal);
    Lumiere.CC["8"]["TextColor3"] = Color3.fromRGB(32, 84, 201);
    Lumiere.CC["8"]["BackgroundTransparency"] = 1;
    Lumiere.CC["8"]["Size"] = UDim2.new(0, 68, 0, 19);
    Lumiere.CC["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["8"]["Text"] = [[LUMIERE.CC]];
    Lumiere.CC["8"]["Name"] = [[Title]];
    Lumiere.CC["8"]["Position"] = UDim2.new(0.106, 0, 0.265, 0);

    Lumiere.CC["9"] = Instance.new("TextLabel", Lumiere.CC["4"]);
    Lumiere.CC["9"]["BorderSizePixel"] = 0;
    Lumiere.CC["9"]["TextSize"] = 15;
    Lumiere.CC["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
        Enum.FontStyle.Normal);
    Lumiere.CC["9"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["9"]["BackgroundTransparency"] = 1;
    Lumiere.CC["9"]["Size"] = UDim2.new(0, 315, 0, 19);
    Lumiere.CC["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["9"]["Text"] = Window.GameName .. " - " .. Window.Version;
    Lumiere.CC["9"]["Name"] = [[GameName]];
    Lumiere.CC["9"]["Position"] = UDim2.new(0.106, 0, 0.463, 0);

    Lumiere.CC["a"] = Instance.new("Frame", Lumiere.CC["4"]);
    Lumiere.CC["a"]["BorderSizePixel"] = 0;
    Lumiere.CC["a"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["a"]["Size"] = UDim2.new(0, 133, 0, 38);
    Lumiere.CC["a"]["Position"] = UDim2.new(0.853, 0, 0.5, 0);
    Lumiere.CC["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["a"]["Name"] = [[Control]];

    Lumiere.CC["b"] = Instance.new("UICorner", Lumiere.CC["a"]);
    Lumiere.CC["b"]["CornerRadius"] = UDim.new(0.22, 0);

    Lumiere.CC["c"] = Instance.new("Frame", Lumiere.CC["a"]);
    Lumiere.CC["c"]["BorderSizePixel"] = 0;
    Lumiere.CC["c"]["BackgroundColor3"] = Color3.fromRGB(28, 36, 56);
    Lumiere.CC["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["c"]["Size"] = UDim2.new(0, 1, 0, 37);
    Lumiere.CC["c"]["Position"] = UDim2.new(0.65789, 0, 0.5, 0);
    Lumiere.CC["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["c"]["Name"] = [[SecondBar]];

    Lumiere.CC["d"] = Instance.new("UIStroke", Lumiere.CC["a"]);
    Lumiere.CC["d"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["e"] = Instance.new("Frame", Lumiere.CC["a"]);
    Lumiere.CC["e"]["BorderSizePixel"] = 0;
    Lumiere.CC["e"]["BackgroundColor3"] = Color3.fromRGB(28, 36, 56);
    Lumiere.CC["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["e"]["Size"] = UDim2.new(0, 1, 0, 37);
    Lumiere.CC["e"]["Position"] = UDim2.new(0.34211, 0, 0.5, 0);
    Lumiere.CC["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["e"]["Name"] = [[Bar]];

    Lumiere.CC["f"] = Instance.new("Frame", Lumiere.CC["a"]);
    Lumiere.CC["f"]["BorderSizePixel"] = 0;
    Lumiere.CC["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["f"]["Size"] = UDim2.new(0, 45, 0, 38);
    Lumiere.CC["f"]["Position"] = UDim2.new(0.66165, 0, 0, 0);
    Lumiere.CC["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["f"]["Name"] = [[X]];
    Lumiere.CC["f"]["BackgroundTransparency"] = 1;

    Lumiere.CC["10"] = Instance.new("ImageLabel", Lumiere.CC["f"]);
    Lumiere.CC["10"]["BorderSizePixel"] = 0;
    Lumiere.CC["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["10"]["ImageColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["10"]["Image"] = [[rbxassetid://10747384394]];
    Lumiere.CC["10"]["Size"] = UDim2.new(0, 23, 0, 23);
    Lumiere.CC["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["10"]["BackgroundTransparency"] = 1;
    Lumiere.CC["10"]["Name"] = [[Image]];
    Lumiere.CC["10"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Lumiere.CC["11"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["10"]);

    Lumiere.CC["12"] = Instance.new("TextButton", Lumiere.CC["f"]);
    Lumiere.CC["12"]["BorderSizePixel"] = 0;
    Lumiere.CC["12"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["12"]["TextSize"] = 14;
    Lumiere.CC["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["12"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["12"]["BackgroundTransparency"] = 1;
    Lumiere.CC["12"]["Name"] = [[Trigger]];
    Lumiere.CC["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["12"]["Text"] = [[]];

    Lumiere.CC["13"] = Instance.new("LocalScript", Lumiere.CC["f"]);
    Lumiere.CC["13"]["Name"] = [[Script]];

    Lumiere.CC["14"] = Instance.new("Frame", Lumiere.CC["a"]);
    Lumiere.CC["14"]["BorderSizePixel"] = 0;
    Lumiere.CC["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["14"]["Size"] = UDim2.new(0, 42, 0, 38);
    Lumiere.CC["14"]["Position"] = UDim2.new(0.34586, 0, 0, 0);
    Lumiere.CC["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["14"]["Name"] = [[Minimize]];
    Lumiere.CC["14"]["BackgroundTransparency"] = 1;

    Lumiere.CC["15"] = Instance.new("ImageLabel", Lumiere.CC["14"]);
    Lumiere.CC["15"]["BorderSizePixel"] = 0;
    Lumiere.CC["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["15"]["ImageColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["15"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["15"]["Image"] = [[rbxassetid://10734896206]];
    Lumiere.CC["15"]["Size"] = UDim2.new(0, 23, 0, 23);
    Lumiere.CC["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["15"]["BackgroundTransparency"] = 1;
    Lumiere.CC["15"]["Name"] = [[Image]];
    Lumiere.CC["15"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Lumiere.CC["16"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["15"]);

    Lumiere.CC["17"] = Instance.new("TextButton", Lumiere.CC["14"]);
    Lumiere.CC["17"]["BorderSizePixel"] = 0;
    Lumiere.CC["17"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["17"]["TextSize"] = 14;
    Lumiere.CC["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["17"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["17"]["BackgroundTransparency"] = 1;
    Lumiere.CC["17"]["Name"] = [[Trigger]];
    Lumiere.CC["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["17"]["Text"] = [[]];

    Lumiere.CC["18"] = Instance.new("LocalScript", Lumiere.CC["14"]);
    Lumiere.CC["18"]["Name"] = [[Script]];

    Lumiere.CC["19"] = Instance.new("Frame", Lumiere.CC["a"]);
    Lumiere.CC["19"]["BorderSizePixel"] = 0;
    Lumiere.CC["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["19"]["Size"] = UDim2.new(0, 45, 0, 38);
    Lumiere.CC["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["19"]["Name"] = [[Extra]];
    Lumiere.CC["19"]["BackgroundTransparency"] = 1;

    Lumiere.CC["1a"] = Instance.new("ImageLabel", Lumiere.CC["19"]);
    Lumiere.CC["1a"]["BorderSizePixel"] = 0;
    Lumiere.CC["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["1a"]["ImageColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["1a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["1a"]["Image"] = [[rbxassetid://100831342781312]];
    Lumiere.CC["1a"]["Size"] = UDim2.new(0, 23, 0, 23);
    Lumiere.CC["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["1a"]["BackgroundTransparency"] = 1;
    Lumiere.CC["1a"]["Name"] = [[Image]];
    Lumiere.CC["1a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Lumiere.CC["1b"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["1a"]);

    Lumiere.CC["1c"] = Instance.new("TextButton", Lumiere.CC["19"]);
    Lumiere.CC["1c"]["BorderSizePixel"] = 0;
    Lumiere.CC["1c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["1c"]["TextSize"] = 14;
    Lumiere.CC["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["1c"]["BackgroundTransparency"] = 1;
    Lumiere.CC["1c"]["Name"] = [[Trigger]];
    Lumiere.CC["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["1c"]["Text"] = [[]];

    Lumiere.CC["1d"] = Instance.new("LocalScript", Lumiere.CC["19"]);
    Lumiere.CC["1d"]["Name"] = [[Script]];

    Lumiere.CC["1e"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["1e"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["1f"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["1f"]["BorderSizePixel"] = 0;
    Lumiere.CC["1f"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["1f"]["Size"] = UDim2.new(0, 183, 0, 383);
    Lumiere.CC["1f"]["Position"] = UDim2.new(0, 0, 0.16558, 0);
    Lumiere.CC["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["1f"]["Name"] = [[Left]];

    Lumiere.CC["20"] = Instance.new("Frame", Lumiere.CC["1f"]);
    Lumiere.CC["20"]["BorderSizePixel"] = 0;
    Lumiere.CC["20"]["BackgroundColor3"] = Color3.fromRGB(28, 36, 56);
    Lumiere.CC["20"]["Size"] = UDim2.new(0, 1, 0, 384);
    Lumiere.CC["20"]["Position"] = UDim2.new(1, 0, 0, 0);
    Lumiere.CC["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["20"]["Name"] = [[Bar]];

    Lumiere.CC["21"] = Instance.new("ScrollingFrame", Lumiere.CC["1f"]);
    Lumiere.CC["21"]["Active"] = true;
    Lumiere.CC["21"]["BorderSizePixel"] = 0;
    Lumiere.CC["21"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
    Lumiere.CC["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["21"]["Name"] = [[Layout]];
    Lumiere.CC["21"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
    Lumiere.CC["21"]["Size"] = UDim2.new(0, 183, 0, 363);
    Lumiere.CC["21"]["ScrollBarImageColor3"] = Color3.fromRGB(32, 84, 201);
    Lumiere.CC["21"]["Position"] = UDim2.new(0, 0, 0.026, 0);
    Lumiere.CC["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["21"]["ScrollBarThickness"] = 0;
    Lumiere.CC["21"]["BackgroundTransparency"] = 1;

    Lumiere.CC["22"] = Instance.new("UIPadding", Lumiere.CC["21"]);
    Lumiere.CC["22"]["PaddingTop"] = UDim.new(0, 1);
    Lumiere.CC["22"]["PaddingBottom"] = UDim.new(0, 1);

    Lumiere.CC["23"] = Instance.new("UIListLayout", Lumiere.CC["21"]);
    Lumiere.CC["23"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
    Lumiere.CC["23"]["Padding"] = UDim.new(0, 7);
    Lumiere.CC["23"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    Lumiere.CC["24"] = Instance.new("Folder", Lumiere.CC["2"]);
    Lumiere.CC["24"]["Name"] = [[Tabs]];

    Lumiere.CC["25"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["25"]["Name"] = [[Script]];

    Lumiere.CC["26"] = Instance.new("Frame", Lumiere.CC["1"]);
    Lumiere.CC["26"]["Interactable"] = false;
    Lumiere.CC["26"]["BorderSizePixel"] = 0;
    Lumiere.CC["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["26"]["Size"] = UDim2.new(0, 280, 1, -40);
    Lumiere.CC["26"]["Position"] = UDim2.new(1, -290, 0, 20);
    Lumiere.CC["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["26"]["Name"] = [[NotificationHolder]];
    Lumiere.CC["26"]["BackgroundTransparency"] = 1;

    Lumiere.CC["27"] = Instance.new("UIListLayout", Lumiere.CC["26"]);
    Lumiere.CC["27"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
    Lumiere.CC["27"]["Padding"] = UDim.new(0, 10);
    Lumiere.CC["27"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
    Lumiere.CC["27"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    Lumiere.CC["28"] = Instance.new("Frame", Lumiere.CC["1"]);
    Lumiere.CC["28"]["Visible"] = false;
    Lumiere.CC["28"]["Interactable"] = false;
    Lumiere.CC["28"]["BorderSizePixel"] = 0;
    Lumiere.CC["28"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["28"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["28"]["Size"] = UDim2.new(0, 60, 0, 60);
    Lumiere.CC["28"]["Position"] = UDim2.new(0.1, 0, -0.25, 0);
    Lumiere.CC["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["28"]["Name"] = [[MobileButton]];

    Lumiere.CC["29"] = Instance.new("UICorner", Lumiere.CC["28"]);
    Lumiere.CC["29"]["CornerRadius"] = UDim.new(0.2, 0);

    Lumiere.CC["2a"] = Instance.new("UIStroke", Lumiere.CC["28"]);
    Lumiere.CC["2a"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["2b"] = Instance.new("ImageLabel", Lumiere.CC["28"]);
    Lumiere.CC["2b"]["Active"] = true;
    Lumiere.CC["2b"]["BorderSizePixel"] = 0;
    Lumiere.CC["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["2b"]["ImageColor3"] = Color3.fromRGB(32, 84, 201);
    Lumiere.CC["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["2b"]["Image"] = [[rbxassetid://110653068142193]];
    Lumiere.CC["2b"]["Size"] = UDim2.new(0, 72, 0, 72);
    Lumiere.CC["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2b"]["BackgroundTransparency"] = 1;
    Lumiere.CC["2b"]["Name"] = [[Logo]];
    Lumiere.CC["2b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Lumiere.CC["2c"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["2b"]);

    Lumiere.CC["2d"] = Instance.new("TextButton", Lumiere.CC["28"]);
    Lumiere.CC["2d"]["BorderSizePixel"] = 0;
    Lumiere.CC["2d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2d"]["TextSize"] = 14;
    Lumiere.CC["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["2d"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["2d"]["BackgroundTransparency"] = 1;
    Lumiere.CC["2d"]["Name"] = [[Trigger]];
    Lumiere.CC["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2d"]["Text"] = [[]];

    Lumiere.CC["2e"] = Instance.new("LocalScript", Lumiere.CC["28"]);
    Lumiere.CC["2e"]["Name"] = [[Script]];

    local function C_13()
        local script = Lumiere.CC["13"];
        local TweenService = game:GetService("TweenService")
        local TextService = game:GetService("TextService")

        local Holder = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("NotificationHolder")

        function CreateNotification(Text, Duration)
            local Duration = Duration or 5
            local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            local GothamSemiFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
                Enum.FontStyle.Normal)
            local GothamBoldFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
                Enum.FontStyle.Normal)

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
            TitleLabel.Text = "LUMIERE.CC"
            TitleLabel.TextColor3 = Color3.fromRGB(32, 84, 201)
            TitleLabel.TextSize = 13
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

            local DescLabel = Instance.new("TextLabel", Notif)
            DescLabel.Name = "Description"
            DescLabel.BackgroundTransparency = 1
            DescLabel.FontFace = GothamSemiFont
            DescLabel.Text = Text
            DescLabel.TextColor3 = Color3.fromRGB(132, 146, 176)
            DescLabel.TextSize = 14
            DescLabel.TextWrapped = true
            DescLabel.TextXAlignment = Enum.TextXAlignment.Left
            DescLabel.TextYAlignment = Enum.TextYAlignment.Top

            local paddingX = 30
            local topMargin = 35
            local bottomPadding = 28

            local maxWidth = Holder.AbsoluteSize.X - paddingX
            local textSize = TextService:GetTextSize(Text, 14, Enum.Font.Gotham, Vector2.new(maxWidth, 1000))

            local targetHeight = textSize.Y + topMargin + bottomPadding
            targetHeight = math.clamp(targetHeight, 80, 300)

            DescLabel.Position = UDim2.new(0, 15, 0, topMargin)
            DescLabel.Size = UDim2.new(1, -paddingX, 0, textSize.Y)

            TweenService:Create(Notif, tInfo, { Size = UDim2.new(1, 0, 0, targetHeight), GroupTransparency = 0 }):Play()
            TweenService:Create(ScaleObj, tInfo, { Scale = 1 }):Play()
            TweenService:Create(UIStroke, tInfo, { Transparency = 0 }):Play()

            local TimerBar = Instance.new("Frame", Notif)
            TimerBar.Name = "Timer"
            TimerBar.Size = UDim2.new(1, -24, 0, 2)
            TimerBar.Position = UDim2.new(0, 12, 1, -8)
            TimerBar.BackgroundColor3 = Color3.fromRGB(32, 84, 201)
            TimerBar.BorderSizePixel = 0
            TimerBar.ZIndex = 2

            TweenService:Create(TimerBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear),
                { Size = UDim2.new(0, 0, 0, 2) }):Play()

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

        script.Parent.MouseEnter:Connect(function()
            TweenService:Create(script.Parent.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(32, 84, 201) })
                :Play()
        end)

        script.Parent.MouseLeave:Connect(function()
            TweenService:Create(script.Parent.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(132, 146, 176) })
                :Play()
        end)

        script.Parent.Trigger.MouseButton1Down:Connect(function()
            script.Parent.Parent.Parent.Parent.Visible = false
            CreateNotification("Successfully destroyed user interface.", 3)
            task.wait(4)
            script.Parent.Parent.Parent.Parent.Parent:Destroy()
        end)
    end;
    task.spawn(C_13);

    local function C_18()
        local script = Lumiere.CC["18"];
        local TweenService = game:GetService("TweenService")
        local UserInputService = game:GetService("UserInputService")
        local TextService = game:GetService("TextService")

        local CloseButton = script.Parent
        local MainFrame = CloseButton.Parent.Parent.Parent.Parent:WaitForChild("Main")
        local MobileButton = MainFrame.Parent:FindFirstChild("MobileButton")

        local Holder = MainFrame.Parent:WaitForChild("NotificationHolder")

        local isMobile = not (UserInputService.KeyboardEnabled and UserInputService.MouseEnabled)

        local ToggleKey

        function CreateNotification(Text, Duration)
            local Duration = Duration or 5
            local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            local GothamSemiFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
                Enum.FontStyle.Normal)
            local GothamBoldFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
                Enum.FontStyle.Normal)

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
            TitleLabel.Text = "LUMIERE.CC"
            TitleLabel.TextColor3 = Color3.fromRGB(32, 84, 201)
            TitleLabel.TextSize = 13
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

            local DescLabel = Instance.new("TextLabel", Notif)
            DescLabel.Name = "Description"
            DescLabel.BackgroundTransparency = 1
            DescLabel.FontFace = GothamSemiFont
            DescLabel.Text = Text
            DescLabel.TextColor3 = Color3.fromRGB(132, 146, 176)
            DescLabel.TextSize = 14
            DescLabel.TextWrapped = true
            DescLabel.TextXAlignment = Enum.TextXAlignment.Left
            DescLabel.TextYAlignment = Enum.TextYAlignment.Top

            local paddingX = 30
            local topMargin = 35
            local bottomPadding = 28

            local maxWidth = Holder.AbsoluteSize.X - paddingX
            local textSize = TextService:GetTextSize(Text, 14, Enum.Font.Gotham, Vector2.new(maxWidth, 1000))

            local targetHeight = textSize.Y + topMargin + bottomPadding
            targetHeight = math.clamp(targetHeight, 80, 300)

            DescLabel.Position = UDim2.new(0, 15, 0, topMargin)
            DescLabel.Size = UDim2.new(1, -paddingX, 0, textSize.Y)

            TweenService:Create(Notif, tInfo, { Size = UDim2.new(1, 0, 0, targetHeight), GroupTransparency = 0 }):Play()
            TweenService:Create(ScaleObj, tInfo, { Scale = 1 }):Play()
            TweenService:Create(UIStroke, tInfo, { Transparency = 0 }):Play()

            local TimerBar = Instance.new("Frame", Notif)
            TimerBar.Name = "Timer"
            TimerBar.Size = UDim2.new(1, -24, 0, 2)
            TimerBar.Position = UDim2.new(0, 12, 1, -8)
            TimerBar.BackgroundColor3 = Color3.fromRGB(32, 84, 201)
            TimerBar.BorderSizePixel = 0
            TimerBar.ZIndex = 2

            TweenService:Create(TimerBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear),
                { Size = UDim2.new(0, 0, 0, 2) }):Play()

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

        CloseButton.MouseEnter:Connect(function()
            TweenService:Create(CloseButton.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(32, 84, 201) })
                :Play()
        end)

        CloseButton.MouseLeave:Connect(function()
            TweenService:Create(CloseButton.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(132, 146, 176) })
                :Play()
        end)

        CloseButton.Trigger.MouseButton1Down:Connect(function()
            if MainFrame then
                MainFrame.Visible = false
            end

            if isMobile and MobileButton then
                MobileButton.Visible = true
                MobileButton.Interactable = true
                TweenService:Create(MobileButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0.1, 0, 0.25, 0)
                }):Play()
            elseif not isMobile then
                ToggleKey = tostring(game.CoreGui["Lumiere.CC"].Main.Tabs:WaitForChild("Settings").Scroll.Layout["Toggle UI"]
                .Keybind:GetAttribute("Key"))
                if script.Parent.Parent.Parent.Parent:GetAttribute("Minimized") == false then
                    CreateNotification("Press " .. ToggleKey .. " to show user interface again.", 3)
                    script.Parent.Parent.Parent.Parent:SetAttribute("Minimized", true)
                end
            end
        end)
    end;
    task.spawn(C_18);

    local function C_1d()
        local script = Lumiere.CC["1d"];
        local TweenService = game:GetService("TweenService")
        local TextService = game:GetService("TextService")

        local Holder = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("NotificationHolder")

        function CreateNotification(Text, Duration)
            local Duration = Duration or 5
            local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            local GothamSemiFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
                Enum.FontStyle.Normal)
            local GothamBoldFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
                Enum.FontStyle.Normal)

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
            TitleLabel.Text = "LUMIERE.CC"
            TitleLabel.TextColor3 = Color3.fromRGB(32, 84, 201)
            TitleLabel.TextSize = 13
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

            local DescLabel = Instance.new("TextLabel", Notif)
            DescLabel.Name = "Description"
            DescLabel.BackgroundTransparency = 1
            DescLabel.FontFace = GothamSemiFont
            DescLabel.Text = Text
            DescLabel.TextColor3 = Color3.fromRGB(132, 146, 176)
            DescLabel.TextSize = 14
            DescLabel.TextWrapped = true
            DescLabel.TextXAlignment = Enum.TextXAlignment.Left
            DescLabel.TextYAlignment = Enum.TextYAlignment.Top

            local paddingX = 30
            local topMargin = 35
            local bottomPadding = 28

            local maxWidth = Holder.AbsoluteSize.X - paddingX
            local textSize = TextService:GetTextSize(Text, 14, Enum.Font.Gotham, Vector2.new(maxWidth, 1000))

            local targetHeight = textSize.Y + topMargin + bottomPadding
            targetHeight = math.clamp(targetHeight, 80, 300)

            DescLabel.Position = UDim2.new(0, 15, 0, topMargin)
            DescLabel.Size = UDim2.new(1, -paddingX, 0, textSize.Y)

            TweenService:Create(Notif, tInfo, { Size = UDim2.new(1, 0, 0, targetHeight), GroupTransparency = 0 }):Play()
            TweenService:Create(ScaleObj, tInfo, { Scale = 1 }):Play()
            TweenService:Create(UIStroke, tInfo, { Transparency = 0 }):Play()

            local TimerBar = Instance.new("Frame", Notif)
            TimerBar.Name = "Timer"
            TimerBar.Size = UDim2.new(1, -24, 0, 2)
            TimerBar.Position = UDim2.new(0, 12, 1, -8)
            TimerBar.BackgroundColor3 = Color3.fromRGB(32, 84, 201)
            TimerBar.BorderSizePixel = 0
            TimerBar.ZIndex = 2

            TweenService:Create(TimerBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear),
                { Size = UDim2.new(0, 0, 0, 2) }):Play()

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

        script.Parent.MouseEnter:Connect(function()
            TweenService:Create(script.Parent.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(32, 84, 201) })
                :Play()
        end)

        script.Parent.MouseLeave:Connect(function()
            TweenService:Create(script.Parent.Image, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(132, 146, 176) })
                :Play()
        end)

        script.Parent.Trigger.MouseButton1Down:Connect(function()
            if setclipboard then
                setclipboard("https://discord.com/invite/MDjNwamSS9")
            end
            CreateNotification("Successfully copied Discord link to the clipboard.", 3)
        end)
    end;
    task.spawn(C_1d);

    local function C_25()
        local script = Lumiere.CC["25"];
        local UserInputService = game:GetService("UserInputService")
        local Players = game:GetService("Players")

        local main = script.Parent
        local tabsFolder = main:WaitForChild("Tabs")

        local dragging = false
        local dragStart
        local startPos

        local function isMainPart(obj)
            if not obj then return false end
            return obj == main or obj:IsDescendantOf(main)
        end

        local function shouldBlockDrag(obj)
            if not obj then return false end
            return obj:IsA("TextButton") or obj:IsA("ImageButton") or obj:IsDescendantOf(tabsFolder) or obj == tabsFolder
        end

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                local playerGui = game:WaitForChild("CoreGui") or Players.LocalPlayer:WaitForChild("PlayerGui")
                local objects = playerGui:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)

                local validTarget = false
                local forbidden = false

                for _, obj in ipairs(objects) do
                    if shouldBlockDrag(obj) then
                        forbidden = true
                        break
                    elseif isMainPart(obj) then
                        validTarget = true
                    end
                end

                if validTarget and not forbidden then
                    dragging = true
                    dragStart = input.Position
                    startPos = main.Position
                end
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end;
    task.spawn(C_25);

    local function C_2e()
        local script = Lumiere.CC["2e"];
        local TweenService = game:GetService("TweenService")

        local MobileButton = script.Parent
        local Trigger = MobileButton:WaitForChild("Trigger")
        local MainFrame = MobileButton.Parent:WaitForChild("Main")

        local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

        Trigger.MouseButton1Down:Connect(function()
            MobileButton.Interactable = false

            local hideTween = TweenService:Create(MobileButton, tInfo, {
                Position = UDim2.new(0.1, 0, -0.25, 0)
            })

            hideTween:Play()

            hideTween.Completed:Connect(function()
                MobileButton.Visible = false
                if MainFrame then
                    MainFrame.Visible = true
                end
            end)
        end)
    end;
    task.spawn(C_2e);

    return Window
end

function LumiereLibrary:Tab(params)
    local Tab = {}

    Tab.Name = params.Name
    Tab.Image = params.Image
    Tab.Selected = params.Selected

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Left.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 157, 0, 35);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.07104, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Tab.Name;
    Lumiere.CC["2"]["BackgroundTransparency"] = 1;

    Lumiere.CC["3"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["3"]["CornerRadius"] = UDim.new(0.25, 0);

    Lumiere.CC["4"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["4"]["Transparency"] = 1;
    Lumiere.CC["4"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["5"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["5"]["BorderSizePixel"] = 0;
    Lumiere.CC["5"]["TextSize"] = 14;
    Lumiere.CC["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["5"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["5"]["BackgroundTransparency"] = 1;
    Lumiere.CC["5"]["Size"] = UDim2.new(0.76535, 0, 1, 0);
    Lumiere.CC["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["5"]["Text"] = Tab.Name;
    Lumiere.CC["5"]["Name"] = [[TabName]];
    Lumiere.CC["5"]["Position"] = UDim2.new(0.23465, 0, 0, 0);

    Lumiere.CC["6"] = Instance.new("UIPadding", Lumiere.CC["5"]);
    Lumiere.CC["6"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["7"] = Instance.new("ImageLabel", Lumiere.CC["2"]);
    Lumiere.CC["7"]["BorderSizePixel"] = 0;
    Lumiere.CC["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["7"]["ImageColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["7"]["Image"] = Tab.Image;
    Lumiere.CC["7"]["Size"] = UDim2.new(0, 20, 0, 20);
    Lumiere.CC["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["7"]["BackgroundTransparency"] = 1;
    Lumiere.CC["7"]["Name"] = [[Image]];
    Lumiere.CC["7"]["Position"] = UDim2.new(0.13, 0, 0.5, 0);

    Lumiere.CC["8"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["7"]);

    Lumiere.CC["9"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["9"]["BorderSizePixel"] = 0;
    Lumiere.CC["9"]["BackgroundColor3"] = Color3.fromRGB(32, 84, 201);
    Lumiere.CC["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["9"]["Size"] = UDim2.new(0, 4, 0, 18);
    Lumiere.CC["9"]["Position"] = UDim2.new(0, 0, 0.5, 0);
    Lumiere.CC["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["9"]["Name"] = [[Bar]];
    Lumiere.CC["9"]["BackgroundTransparency"] = 1;

    Lumiere.CC["a"] = Instance.new("UICorner", Lumiere.CC["9"]);

    Lumiere.CC["b"] = Instance.new("TextButton", Lumiere.CC["2"]);
    Lumiere.CC["b"]["BorderSizePixel"] = 0;
    Lumiere.CC["b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["b"]["TextSize"] = 14;
    Lumiere.CC["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["b"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["b"]["BackgroundTransparency"] = 1;
    Lumiere.CC["b"]["Name"] = [[Trigger]];
    Lumiere.CC["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["b"]["Text"] = [[]];

    Lumiere.CC["c"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["c"]["Name"] = [[Script]];

    Lumiere.CC["d"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs);
    Lumiere.CC["d"]["Visible"] = false;
    Lumiere.CC["d"]["Interactable"] = false;
    Lumiere.CC["d"]["BorderSizePixel"] = 0;
    Lumiere.CC["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["d"]["Size"] = UDim2.new(0, 410, 0, 371);
    Lumiere.CC["d"]["Position"] = UDim2.new(0.31751, 0, 0.17429, 0);
    Lumiere.CC["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["d"]["Name"] = Tab.Name;
    Lumiere.CC["d"]["BackgroundTransparency"] = 1;

    Lumiere.CC["e"] = Instance.new("ScrollingFrame", Lumiere.CC["d"]);
    Lumiere.CC["e"]["Active"] = true;
    Lumiere.CC["e"]["BorderSizePixel"] = 0;
    Lumiere.CC["e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
    Lumiere.CC["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["e"]["Name"] = [[Scroll]];
    Lumiere.CC["e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
    Lumiere.CC["e"]["Size"] = UDim2.new(1.00244, 0, 1.01078, 0);
    Lumiere.CC["e"]["ScrollBarImageColor3"] = Color3.fromRGB(32, 84, 201);
    Lumiere.CC["e"]["Position"] = UDim2.new(-0.00244, 0, -0.01078, 0);
    Lumiere.CC["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["e"]["ScrollBarThickness"] = 0;
    Lumiere.CC["e"]["BackgroundTransparency"] = 1;

    Lumiere.CC["f"] = Instance.new("Frame", Lumiere.CC["e"]);
    Lumiere.CC["f"]["BorderSizePixel"] = 0;
    Lumiere.CC["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["f"]["Size"] = UDim2.new(0.98783, 0, 15.22455, 0);
    Lumiere.CC["f"]["Position"] = UDim2.new(0.00243, 0, 0.01348, 0);
    Lumiere.CC["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["f"]["Name"] = [[Layout]];
    Lumiere.CC["f"]["BackgroundTransparency"] = 1;

    Lumiere.CC["10"] = Instance.new("UIListLayout", Lumiere.CC["f"]);
    Lumiere.CC["10"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
    Lumiere.CC["10"]["Padding"] = UDim.new(0, 10);
    Lumiere.CC["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    Lumiere.CC["11"] = Instance.new("UIPadding", Lumiere.CC["f"]);
    Lumiere.CC["11"]["PaddingTop"] = UDim.new(0, 5);
    Lumiere.CC["11"]["PaddingBottom"] = UDim.new(0, 8);

    local function C_c()
        local script = Lumiere.CC["c"];
        local TweenService = game:GetService("TweenService")

        local CenterPos = UDim2.new(0.318, 0, 0.174, 0)
        local RightPos = UDim2.new(1.1, 0, 0.174, 0)
        local AnimDuration = 0.25
        local TInfo = TweenInfo.new(AnimDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

        local TabsFolder = script.Parent.Parent.Parent.Parent.Tabs
        local TabButtonsFolder = script.Parent.Parent
        local CurrentTabContent = TabsFolder[script.Parent.Name]

        local IsTabActive = false
        local IsAnimating = false

        local Color_Active = Color3.fromRGB(32, 84, 201)
        local Color_Inactive = Color3.fromRGB(132, 146, 176)

        local Active = Tab.Selected
        if Active then
            IsTabActive = true
            script.Parent.Bar.BackgroundTransparency = 0
            script.Parent.BackgroundTransparency = 0
            script.Parent.Image.ImageColor3 = Color_Active
            script.Parent.TabName.TextColor3 = Color_Active
            script.Parent.UIStroke.Transparency = 0

            CurrentTabContent.Visible = true
            CurrentTabContent.Interactable = true
            CurrentTabContent.Position = CenterPos
        else
            CurrentTabContent.Visible = false
            CurrentTabContent.Interactable = false
            CurrentTabContent.Position = RightPos
        end

        script.Parent.Trigger.MouseButton1Down:Connect(function()
            if IsTabActive or IsAnimating then return end

            IsAnimating = true
            IsTabActive = true

            TweenService:Create(script.Parent.Bar, TInfo, { BackgroundTransparency = 0 }):Play()
            TweenService:Create(script.Parent, TInfo, { BackgroundTransparency = 0 }):Play()
            TweenService:Create(script.Parent.Image, TInfo, { ImageColor3 = Color_Active }):Play()
            TweenService:Create(script.Parent.TabName, TInfo, { TextColor3 = Color_Active }):Play()
            TweenService:Create(script.Parent.UIStroke, TInfo, { Transparency = 0 }):Play()

            for _, Btn in pairs(TabButtonsFolder:GetChildren()) do
                if Btn:IsA("Frame") and Btn ~= script.Parent then
                    TweenService:Create(Btn.Bar, TInfo, { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(Btn, TInfo, { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(Btn.Image, TInfo, { ImageColor3 = Color_Inactive }):Play()
                    TweenService:Create(Btn.TabName, TInfo, { TextColor3 = Color_Inactive }):Play()
                    TweenService:Create(Btn.UIStroke, TInfo, { Transparency = 1 }):Play()
                end
            end

            local OldTab = nil
            for _, TabLoop in pairs(TabsFolder:GetChildren()) do
                if TabLoop:IsA("GuiObject") and TabLoop.Visible and TabLoop.Name ~= script.Parent.Name then
                    OldTab = TabLoop
                    break
                end
            end

            if OldTab then
                OldTab.Interactable = false
                local SlideOut = TweenService:Create(OldTab, TInfo, { Position = RightPos })
                SlideOut:Play()

                task.wait(AnimDuration * 0.8)
                OldTab.Visible = false
            end

            CurrentTabContent.Position = RightPos
            CurrentTabContent.Visible = true
            CurrentTabContent.Interactable = true

            local SlideIn = TweenService:Create(CurrentTabContent, TInfo, { Position = CenterPos })
            SlideIn:Play()

            SlideIn.Completed:Connect(function()
                IsAnimating = false
            end)
        end)

        TabButtonsFolder.ChildAdded:Connect(function(child)
            if child:IsA("Frame") and child:FindFirstChild("Trigger") then
                child.Trigger.MouseButton1Down:Connect(function()
                    IsTabActive = false
                end)
            end
        end)

        for _, OtherBtn in pairs(TabButtonsFolder:GetChildren()) do
            if OtherBtn:IsA("Frame") and OtherBtn ~= script.Parent then
                OtherBtn.Trigger.MouseButton1Down:Connect(function()
                    IsTabActive = false
                end)
            end
        end
    end;
    task.spawn(C_c);

    return Tab
end

function LumiereLibrary:Button(params)
    local Button = {}

    Button.Name = params.Name
    Button.Parent = params.Parent
    Button.Callback = params.Callback or function() end

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs[Button.Parent].Scroll.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Button.Name;

    Lumiere.CC["3"] = Instance.new("ImageLabel", Lumiere.CC["2"]);
    Lumiere.CC["3"]["BorderSizePixel"] = 0;
    Lumiere.CC["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["3"]["ImageColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["3"]["Image"] = [[rbxassetid://10734898194]];
    Lumiere.CC["3"]["Size"] = UDim2.new(0, 30, 0, 30);
    Lumiere.CC["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["3"]["BackgroundTransparency"] = 1;
    Lumiere.CC["3"]["Name"] = [[Image]];
    Lumiere.CC["3"]["Position"] = UDim2.new(0.93175, 0, 0.483, 0);

    Lumiere.CC["4"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["3"]);

    Lumiere.CC["5"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["5"]["TextWrapped"] = true;
    Lumiere.CC["5"]["BorderSizePixel"] = 0;
    Lumiere.CC["5"]["TextSize"] = 15;
    Lumiere.CC["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["5"]["TextScaled"] = true;
    Lumiere.CC["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["5"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["5"]["BackgroundTransparency"] = 1;
    Lumiere.CC["5"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Lumiere.CC["5"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Lumiere.CC["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["5"]["Text"] = Button.Name;
    Lumiere.CC["5"]["Name"] = [[ComponentName]];
    Lumiere.CC["5"]["Position"] = UDim2.new(0, 15, 0, 24);

    Lumiere.CC["6"] = Instance.new("UIPadding", Lumiere.CC["5"]);
    Lumiere.CC["6"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["7"] = Instance.new("UITextSizeConstraint", Lumiere.CC["5"]);
    Lumiere.CC["7"]["MaxTextSize"] = 15;

    Lumiere.CC["8"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["8"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["8"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["9"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["9"]["CornerRadius"] = UDim.new(0.12, 0);

    Lumiere.CC["a"] = Instance.new("TextButton", Lumiere.CC["2"]);
    Lumiere.CC["a"]["BorderSizePixel"] = 0;
    Lumiere.CC["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["a"]["TextSize"] = 14;
    Lumiere.CC["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["a"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["a"]["BackgroundTransparency"] = 1;
    Lumiere.CC["a"]["Name"] = [[Trigger]];
    Lumiere.CC["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["a"]["Text"] = [[]];

    Lumiere.CC["b"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["b"]["Name"] = [[Script]];

    local function C_b()
        local script = Lumiere.CC["b"];
        local TweenService = game:GetService("TweenService")

        local function CreateButton(ButtonContainer, Callback)
            local Trigger = ButtonContainer:WaitForChild("Trigger")
            local ComponentName = ButtonContainer:WaitForChild("ComponentName")
            local Icon = ButtonContainer:WaitForChild("Image")

            local DefaultColor = Color3.fromRGB(132, 146, 176)
            local ClickColor = Color3.fromRGB(32, 84, 201)

            local tInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            Trigger.MouseButton1Down:Connect(function()
                TweenService:Create(ComponentName, tInfo, { TextColor3 = ClickColor }):Play()
                TweenService:Create(Icon, tInfo, { ImageColor3 = ClickColor }):Play()

                if Callback then
                    Callback()
                end
            end)

            local function ResetColor()
                TweenService:Create(ComponentName, tInfo, { TextColor3 = DefaultColor }):Play()
                TweenService:Create(Icon, tInfo, { ImageColor3 = DefaultColor }):Play()
            end

            Trigger.MouseButton1Up:Connect(ResetColor)
            Trigger.MouseLeave:Connect(ResetColor)
        end

        CreateButton(script.Parent, function()
            Button.Callback()
        end)
    end;
    task.spawn(C_b);

    return Button
end

function LumiereLibrary:Toggle(params)
    local Toggle = {}

    Toggle.Name = params.Name
    Toggle.Parent = params.Parent
    Toggle.Default = params.Default or false
    Toggle.UseKeybind = params.UseKeybind or false
    Toggle.DefaultKey = params.DefaultKey or Enum.KeyCode.Unknown
    Toggle.Callback = params.Callback or function() end

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs[Toggle.Parent].Scroll.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Toggle.Name;

    Lumiere.CC["3"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["3"]["TextWrapped"] = true;
    Lumiere.CC["3"]["BorderSizePixel"] = 0;
    Lumiere.CC["3"]["TextSize"] = 15;
    Lumiere.CC["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["3"]["TextScaled"] = true;
    Lumiere.CC["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["3"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["3"]["BackgroundTransparency"] = 1;
    Lumiere.CC["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Lumiere.CC["3"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Lumiere.CC["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["3"]["Text"] = Toggle.Name;
    Lumiere.CC["3"]["Name"] = [[ComponentName]];
    Lumiere.CC["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Lumiere.CC["4"] = Instance.new("UIPadding", Lumiere.CC["3"]);
    Lumiere.CC["4"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["5"] = Instance.new("UITextSizeConstraint", Lumiere.CC["3"]);
    Lumiere.CC["5"]["MaxTextSize"] = 15;

    Lumiere.CC["6"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["6"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["7"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Lumiere.CC["8"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["8"]["BorderSizePixel"] = 0;
    Lumiere.CC["8"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["8"]["Size"] = UDim2.new(0, 51, 0, 25);
    Lumiere.CC["8"]["Position"] = UDim2.new(0.89877, 0, 0.483, 0);
    Lumiere.CC["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["8"]["Name"] = [[Toggle]];

    Lumiere.CC["9"] = Instance.new("UIStroke", Lumiere.CC["8"]);
    Lumiere.CC["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["9"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["a"] = Instance.new("UICorner", Lumiere.CC["8"]);
    Lumiere.CC["a"]["CornerRadius"] = UDim.new(1, 0);

    Lumiere.CC["b"] = Instance.new("Frame", Lumiere.CC["8"]);
    Lumiere.CC["b"]["BorderSizePixel"] = 0;
    Lumiere.CC["b"]["BackgroundColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["b"]["Size"] = UDim2.new(0, 20, 0, 20);
    Lumiere.CC["b"]["Position"] = UDim2.new(0.8, 0, 0.5, 0);
    Lumiere.CC["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["b"]["Name"] = [[Dot]];

    Lumiere.CC["c"] = Instance.new("UICorner", Lumiere.CC["b"]);
    Lumiere.CC["c"]["CornerRadius"] = UDim.new(1, 0);

    Lumiere.CC["d"] = Instance.new("TextButton", Lumiere.CC["8"]);
    Lumiere.CC["d"]["BorderSizePixel"] = 0;
    Lumiere.CC["d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["d"]["TextSize"] = 14;
    Lumiere.CC["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["d"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["d"]["BackgroundTransparency"] = 1;
    Lumiere.CC["d"]["Name"] = [[Trigger]];
    Lumiere.CC["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["d"]["Text"] = [[]];

    Lumiere.CC["e"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["e"]["Name"] = [[Script]];

    Lumiere.CC["f"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["f"]["Visible"] = false;
    Lumiere.CC["f"]["BorderSizePixel"] = 0;
    Lumiere.CC["f"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["f"]["Size"] = UDim2.new(0, 30, 0, 30);
    Lumiere.CC["f"]["Position"] = UDim2.new(0.77, 0, 0.483, 0);
    Lumiere.CC["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["f"]["Name"] = [[Keybind]];

    Lumiere.CC["f"]:SetAttribute([[Key]], [[nil]]);

    Lumiere.CC["10"] = Instance.new("UIStroke", Lumiere.CC["f"]);
    Lumiere.CC["10"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["10"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["11"] = Instance.new("UICorner", Lumiere.CC["f"]);
    Lumiere.CC["11"]["CornerRadius"] = UDim.new(0.25, 0);

    Lumiere.CC["12"] = Instance.new("TextLabel", Lumiere.CC["f"]);
    Lumiere.CC["12"]["TextWrapped"] = true;
    Lumiere.CC["12"]["BorderSizePixel"] = 0;
    Lumiere.CC["12"]["TextSize"] = 14;
    Lumiere.CC["12"]["TextScaled"] = true;
    Lumiere.CC["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["12"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["12"]["BackgroundTransparency"] = 1;
    Lumiere.CC["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["12"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["12"]["Text"] = [[?]];
    Lumiere.CC["12"]["Name"] = [[KeyText]];
    Lumiere.CC["12"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Lumiere.CC["13"] = Instance.new("UIPadding", Lumiere.CC["12"]);
    Lumiere.CC["13"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["14"] = Instance.new("UITextSizeConstraint", Lumiere.CC["12"]);
    Lumiere.CC["14"]["MaxTextSize"] = 14;

    Lumiere.CC["15"] = Instance.new("TextButton", Lumiere.CC["f"]);
    Lumiere.CC["15"]["BorderSizePixel"] = 0;
    Lumiere.CC["15"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["15"]["TextSize"] = 14;
    Lumiere.CC["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["15"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["15"]["BackgroundTransparency"] = 1;
    Lumiere.CC["15"]["Name"] = [[Trigger]];
    Lumiere.CC["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["15"]["Text"] = [[]];

    Lumiere.CC["16"] = Instance.new("LocalScript", Lumiere.CC["f"]);
    Lumiere.CC["16"]["Name"] = [[Script]];

    local function C_e()
        local script = Lumiere.CC["e"];
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")

        local function CreateToggle(Container, DefaultState, UseKeybind, DefaultKey, Callback)
            local ToggleFrame = Container:WaitForChild("Toggle")
            local Dot = ToggleFrame:WaitForChild("Dot")
            local Trigger = ToggleFrame:WaitForChild("Trigger")
            local KeybindFrame = Container:WaitForChild("Keybind")
            local KeyText = KeybindFrame:WaitForChild("KeyText")
            local KeyTrigger = KeybindFrame:WaitForChild("Trigger")

            local isOn = DefaultState or false
            local currentKey = DefaultKey or Enum.KeyCode.Unknown
            local isListening = false
            local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            local isPC = UserInputService.KeyboardEnabled and UserInputService.MouseEnabled
            local keybindEnabled = UseKeybind and isPC

            KeybindFrame.Visible = keybindEnabled

            local function UpdateVisuals(instant)
                local currentTInfo = instant and TweenInfo.new(0) or tInfo
                local targetPos = isOn and UDim2.new(0.8, 0, 0.5, 0) or UDim2.new(0.2, 0, 0.5, 0)
                local targetColor = isOn and Color3.fromRGB(32, 84, 201) or Color3.fromRGB(150, 150, 150)

                TweenService:Create(Dot, currentTInfo, {
                    Position = targetPos,
                    BackgroundColor3 = targetColor
                }):Play()
            end

            local function Toggle()
                isOn = not isOn
                UpdateVisuals(false)
                if Callback then Callback(isOn) end
            end

            Trigger.MouseButton1Click:Connect(Toggle)

            if keybindEnabled then
                KeyText.Text = "?"

                KeyTrigger.MouseButton1Click:Connect(function()
                    if isListening then return end
                    isListening = true
                    KeyText.Text = "..."

                    local connection
                    connection = UserInputService.InputBegan:Connect(function(input)
                        local keyPressed = nil
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            keyPressed = (input.KeyCode == Enum.KeyCode.Escape) and Enum.KeyCode.Unknown or input
                            .KeyCode
                        elseif input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 then
                            keyPressed = input.UserInputType
                        end

                        if keyPressed then
                            connection:Disconnect()
                            currentKey = keyPressed
                            KeyText.Text = (keyPressed == Enum.KeyCode.Unknown) and "NONE" or keyPressed.Name
                            script.Parent.Keybind:SetAttribute("Key", KeyText.Text)
                            isListening = false
                        end
                    end)
                end)

                UserInputService.InputBegan:Connect(function(input, gpe)
                    if gpe or isListening then return end
                    if currentKey ~= Enum.KeyCode.Unknown then
                        if input.KeyCode == currentKey or input.UserInputType == currentKey then
                            Toggle()
                        end
                    end
                end)
            end

            UpdateVisuals(true)
        end

        CreateToggle(script.Parent, Toggle.Default, Toggle.UseKeybind, Toggle.DefaultKey, function(state)
            Toggle.Callback(state)
        end)
    end;
    task.spawn(C_e);

    local function C_16()
        local script = Lumiere.CC["16"];
        local keyText = script.Parent.KeyText

        keyText:GetPropertyChangedSignal("Text"):Connect(function()
            local currentText = keyText.Text

            if #currentText > 3 then
                keyText.Text = string.sub(currentText, 1, 3)
            end
        end)
    end;
    task.spawn(C_16);

    return Toggle
end

function LumiereLibrary:Slider(params)
    local Slider = {}

    Slider.Name = params.Name
    Slider.Parent = params.Parent
    Slider.Min = params.Min or 0
    Slider.Max = params.Max or 100
    Slider.Default = params.Default or 50
    Slider.Callback = params.Callback or function() end

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs[Slider.Parent].Scroll.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Slider.Name;

    Lumiere.CC["3"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["3"]["TextWrapped"] = true;
    Lumiere.CC["3"]["BorderSizePixel"] = 0;
    Lumiere.CC["3"]["TextSize"] = 15;
    Lumiere.CC["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["3"]["TextScaled"] = true;
    Lumiere.CC["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["3"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["3"]["BackgroundTransparency"] = 1;
    Lumiere.CC["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Lumiere.CC["3"]["Size"] = UDim2.new(0.42659, 0, 1, 0);
    Lumiere.CC["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["3"]["Text"] = Slider.Name;
    Lumiere.CC["3"]["Name"] = [[ComponentName]];
    Lumiere.CC["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Lumiere.CC["4"] = Instance.new("UIPadding", Lumiere.CC["3"]);
    Lumiere.CC["4"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["5"] = Instance.new("UITextSizeConstraint", Lumiere.CC["3"]);
    Lumiere.CC["5"]["MaxTextSize"] = 15;

    Lumiere.CC["6"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["6"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["7"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Lumiere.CC["8"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["8"]["BorderSizePixel"] = 0;
    Lumiere.CC["8"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["8"]["Size"] = UDim2.new(0, 145, 0, 16);
    Lumiere.CC["8"]["Position"] = UDim2.new(0.78922, 0, 0.51361, 0);
    Lumiere.CC["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["8"]["Name"] = [[Slider]];

    Lumiere.CC["9"] = Instance.new("UIStroke", Lumiere.CC["8"]);
    Lumiere.CC["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["9"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["a"] = Instance.new("UICorner", Lumiere.CC["8"]);
    Lumiere.CC["a"]["CornerRadius"] = UDim.new(1, 0);

    Lumiere.CC["b"] = Instance.new("TextButton", Lumiere.CC["8"]);
    Lumiere.CC["b"]["BorderSizePixel"] = 0;
    Lumiere.CC["b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["b"]["TextSize"] = 14;
    Lumiere.CC["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["b"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["b"]["BackgroundTransparency"] = 1;
    Lumiere.CC["b"]["Name"] = [[Trigger]];
    Lumiere.CC["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["b"]["Text"] = [[]];

    Lumiere.CC["c"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["c"]["BorderSizePixel"] = 0;
    Lumiere.CC["c"]["TextSize"] = 15;
    Lumiere.CC["c"]["TextXAlignment"] = Enum.TextXAlignment.Right;
    Lumiere.CC["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["c"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["c"]["BackgroundTransparency"] = 1;
    Lumiere.CC["c"]["Size"] = UDim2.new(0.08687, 0, 1, 0);
    Lumiere.CC["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["c"]["Text"] = [[0]];
    Lumiere.CC["c"]["Name"] = [[Value]];
    Lumiere.CC["c"]["Position"] = UDim2.new(0.50123, 0, 0, 0);

    Lumiere.CC["d"] = Instance.new("UIPadding", Lumiere.CC["c"]);
    Lumiere.CC["d"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["e"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["e"]["Name"] = [[Script]];

    local function C_e()
        local script = Lumiere.CC["e"];
        local TweenService = game:GetService("TweenService")
        local UserInputService = game:GetService("UserInputService")

        local function CreateSlider(SliderContainer, Min, Max, Default, Callback)
            local SliderFrame = SliderContainer:WaitForChild("Slider")
            local Trigger = SliderFrame:WaitForChild("Trigger")
            local ValueLabel = SliderContainer:WaitForChild("Value")
            local ScrollFrame = SliderContainer.Parent.Parent

            local fillColor = Color3.fromRGB(132, 146, 176)

            local Fill = Instance.new("Frame")
            Fill.Name = "Fill"
            Fill.BackgroundColor3 = fillColor
            Fill.BorderSizePixel = 0
            Fill.ZIndex = 1
            local startPercent = math.clamp((Default - Min) / (Max - Min), 0, 1)
            Fill.Size = UDim2.new(startPercent, 0, 1, 0)
            Fill.Parent = SliderFrame

            local FillCorner = Instance.new("UICorner")
            FillCorner.CornerRadius = SliderFrame:WaitForChild("UICorner").CornerRadius
            FillCorner.Parent = Fill

            Trigger.ZIndex = 5

            local dragging = false

            local function ToggleScroll(enabled)
                if ScrollFrame and ScrollFrame:IsA("ScrollingFrame") then
                    ScrollFrame.ScrollingEnabled = enabled
                end
            end

            local function UpdateSlider(input)
                local sliderSize = SliderFrame.AbsoluteSize.X
                local sliderPos = SliderFrame.AbsolutePosition.X
                local inputPos = input.Position.X

                local percent = math.clamp((inputPos - sliderPos) / sliderSize, 0, 1)
                local currentValue = math.round(Min + (percent * (Max - Min)))

                ValueLabel.Text = tostring(currentValue)

                local tInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                TweenService:Create(Fill, tInfo, { Size = UDim2.new(percent, 0, 1, 0) }):Play()

                if Callback then Callback(currentValue) end
            end

            Trigger.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    ToggleScroll(false)
                    UpdateSlider(input)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    UpdateSlider(input)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                    ToggleScroll(true)
                end
            end)

            ValueLabel.Text = tostring(Default)
        end

        CreateSlider(script.Parent, Slider.Min, Slider.Max, Slider.Default, function(val) Slider.Callback(val) end)
    end;
    task.spawn(C_e);

    return Slider
end

function LumiereLibrary:Textbox(params)
    local Textbox = {}

    Textbox.Name = params.Name
    Textbox.Parent = params.Parent
    Textbox.Placeholder = params.Placeholder
    Textbox.Callback = params.Callback or function() end

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs[Textbox.Parent].Scroll.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Textbox.Name;

    Lumiere.CC["3"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["3"]["TextWrapped"] = true;
    Lumiere.CC["3"]["BorderSizePixel"] = 0;
    Lumiere.CC["3"]["TextSize"] = 15;
    Lumiere.CC["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["3"]["TextScaled"] = true;
    Lumiere.CC["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["3"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["3"]["BackgroundTransparency"] = 1;
    Lumiere.CC["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Lumiere.CC["3"]["Size"] = UDim2.new(0.51156, 0, 1, 0);
    Lumiere.CC["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["3"]["Text"] = Textbox.Name;
    Lumiere.CC["3"]["Name"] = [[ComponentName]];
    Lumiere.CC["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Lumiere.CC["4"] = Instance.new("UIPadding", Lumiere.CC["3"]);
    Lumiere.CC["4"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["5"] = Instance.new("UITextSizeConstraint", Lumiere.CC["3"]);
    Lumiere.CC["5"]["MaxTextSize"] = 15;

    Lumiere.CC["6"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["6"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["7"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Lumiere.CC["8"] = Instance.new("TextBox", Lumiere.CC["2"]);
    Lumiere.CC["8"]["Name"] = [[Box]];
    Lumiere.CC["8"]["PlaceholderColor3"] = Color3.fromRGB(71, 71, 71);
    Lumiere.CC["8"]["BorderSizePixel"] = 0;
    Lumiere.CC["8"]["TextWrapped"] = true;
    Lumiere.CC["8"]["TextSize"] = 14;
    Lumiere.CC["8"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["8"]["TextScaled"] = true;
    Lumiere.CC["8"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["8"]["ClearTextOnFocus"] = false;
    Lumiere.CC["8"]["Size"] = UDim2.new(0, 142, 0, 25);
    Lumiere.CC["8"]["Position"] = UDim2.new(0.79349, 0, 0.483, 0);
    Lumiere.CC["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["8"]["Text"] = [[]];

    Lumiere.CC["9"] = Instance.new("UICorner", Lumiere.CC["8"]);
    Lumiere.CC["9"]["CornerRadius"] = UDim.new(0.25, 0);

    Lumiere.CC["a"] = Instance.new("UIStroke", Lumiere.CC["8"]);
    Lumiere.CC["a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["a"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["b"] = Instance.new("UITextSizeConstraint", Lumiere.CC["8"]);
    Lumiere.CC["b"]["MaxTextSize"] = 14;

    Lumiere.CC["c"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["c"]["Name"] = [[Script]];

    local function C_c()
        local script = Lumiere.CC["c"];
        local TweenService = game:GetService("TweenService")

        local function CreateTextbox(TextboxContainer, Placeholder, Callback)
            local Box = TextboxContainer:WaitForChild("Box")
            local InputField = Box
            local BoxStroke = Box:WaitForChild("UIStroke")

            local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            InputField.PlaceholderText = Placeholder or "Placeholder..."
            InputField.Text = ""
            InputField.ClipsDescendants = true

            InputField.FocusLost:Connect(function(enterPressed)
                if Callback then
                    Callback(InputField.Text)
                end
            end)
        end

        CreateTextbox(script.Parent, Textbox.Placeholder, function(text)
            Textbox.Callback(text)
        end)
    end;
    task.spawn(C_c);

    return Textbox
end

function LumiereLibrary:Keybind(params)
    local Keybind = {}

    Keybind.Name = params.Name
    Keybind.Parent = params.Parent
    Keybind.DefaultKey = params.DefaultKey or Enum.KeyCode.F
    Keybind.Callback = params.Callback or function() end

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs[Keybind.Parent].Scroll.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Keybind.Name;

    Lumiere.CC["3"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["3"]["TextWrapped"] = true;
    Lumiere.CC["3"]["BorderSizePixel"] = 0;
    Lumiere.CC["3"]["TextSize"] = 15;
    Lumiere.CC["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["3"]["TextScaled"] = true;
    Lumiere.CC["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["3"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["3"]["BackgroundTransparency"] = 1;
    Lumiere.CC["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Lumiere.CC["3"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Lumiere.CC["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["3"]["Text"] = Keybind.Name;
    Lumiere.CC["3"]["Name"] = [[ComponentName]];
    Lumiere.CC["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Lumiere.CC["4"] = Instance.new("UIPadding", Lumiere.CC["3"]);
    Lumiere.CC["4"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["5"] = Instance.new("UITextSizeConstraint", Lumiere.CC["3"]);
    Lumiere.CC["5"]["MaxTextSize"] = 15;

    Lumiere.CC["6"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["6"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["7"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Lumiere.CC["8"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["8"]["BorderSizePixel"] = 0;
    Lumiere.CC["8"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["8"]["Size"] = UDim2.new(0, 30, 0, 30);
    Lumiere.CC["8"]["Position"] = UDim2.new(0.93087, 0, 0.483, 0);
    Lumiere.CC["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["8"]["Name"] = [[Keybind]];

    Lumiere.CC["8"]:SetAttribute([[Key]], [[nil]]);

    Lumiere.CC["9"] = Instance.new("UIStroke", Lumiere.CC["8"]);
    Lumiere.CC["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["9"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["a"] = Instance.new("UICorner", Lumiere.CC["8"]);
    Lumiere.CC["a"]["CornerRadius"] = UDim.new(0.25, 0);

    Lumiere.CC["b"] = Instance.new("TextLabel", Lumiere.CC["8"]);
    Lumiere.CC["b"]["TextWrapped"] = true;
    Lumiere.CC["b"]["BorderSizePixel"] = 0;
    Lumiere.CC["b"]["TextSize"] = 14;
    Lumiere.CC["b"]["TextScaled"] = true;
    Lumiere.CC["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["b"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["b"]["BackgroundTransparency"] = 1;
    Lumiere.CC["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["b"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["b"]["Text"] = [[F]];
    Lumiere.CC["b"]["Name"] = [[KeyText]];
    Lumiere.CC["b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    Lumiere.CC["c"] = Instance.new("UIPadding", Lumiere.CC["b"]);
    Lumiere.CC["c"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["d"] = Instance.new("UITextSizeConstraint", Lumiere.CC["b"]);
    Lumiere.CC["d"]["MaxTextSize"] = 14;

    Lumiere.CC["e"] = Instance.new("TextButton", Lumiere.CC["8"]);
    Lumiere.CC["e"]["BorderSizePixel"] = 0;
    Lumiere.CC["e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["e"]["TextSize"] = 14;
    Lumiere.CC["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["e"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["e"]["BackgroundTransparency"] = 1;
    Lumiere.CC["e"]["Name"] = [[Trigger]];
    Lumiere.CC["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["e"]["Text"] = [[]];

    Lumiere.CC["f"] = Instance.new("LocalScript", Lumiere.CC["8"]);
    Lumiere.CC["f"]["Name"] = [[Script]];

    Lumiere.CC["10"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["10"]["Name"] = [[Script]];

    local function C_f()
        local script = Lumiere.CC["f"];
        local keyText = script.Parent.KeyText

        keyText:GetPropertyChangedSignal("Text"):Connect(function()
            local currentText = keyText.Text

            if #currentText > 3 then
                keyText.Text = string.sub(currentText, 1, 3)
            end
        end)
    end;
    task.spawn(C_f);

    local function C_10()
        local script = Lumiere.CC["10"];
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")

        local function CreateKeybind(KeybindContainer, DefaultKey, Callback)
            local KeybindFrame = KeybindContainer:WaitForChild("Keybind")
            local Trigger = KeybindFrame:WaitForChild("Trigger")
            local KeyText = KeybindFrame:WaitForChild("KeyText")

            local currentKey = DefaultKey or Enum.KeyCode.F
            local isListening = false

            KeyText.Text = currentKey.Name
            script.Parent.Keybind:SetAttribute("Key", KeyText.Text)

            Trigger.MouseButton1Click:Connect(function()
                if isListening then return end

                isListening = true
                KeyText.Text = "..."

                local connection
                connection = UserInputService.InputBegan:Connect(function(input)
                    local keyPressed = nil

                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        if input.KeyCode == Enum.KeyCode.Escape then
                            keyPressed = Enum.KeyCode.Unknown
                        else
                            keyPressed = input.KeyCode
                        end
                    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                        keyPressed = Enum.UserInputType.MouseButton2
                    elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
                        keyPressed = Enum.UserInputType.MouseButton3
                    end

                    if keyPressed then
                        connection:Disconnect()
                        currentKey = keyPressed
                        KeyText.Text = (keyPressed == Enum.KeyCode.Unknown) and "NONE" or keyPressed.Name
                        script.Parent.Keybind:SetAttribute("Key", KeyText.Text)
                        isListening = false
                    end
                end)
            end)

            UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if isListening then return end

                if currentKey ~= Enum.KeyCode.Unknown then
                    if input.KeyCode == currentKey or input.UserInputType == currentKey then
                        if Callback then
                            Callback()
                        end
                    end
                end
            end)
        end

        CreateKeybind(script.Parent, Keybind.DefaultKey, function()
            Keybind.Callback()
        end)
    end;
    task.spawn(C_10);

    return Keybind
end

function LumiereLibrary:Dropdown(params)
    local Dropdown = {}

    Dropdown.Name = params.Name
    Dropdown.Parent = params.Parent
    Dropdown.Options = params.Options or {}
    Dropdown.Default = params.Default or (Dropdown.Options[1] or "None")
    Dropdown.Callback = params.Callback or function() end

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs[Dropdown.Parent].Scroll.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Dropdown.Name;

    Lumiere.CC["3"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["3"]["TextWrapped"] = true;
    Lumiere.CC["3"]["BorderSizePixel"] = 0;
    Lumiere.CC["3"]["TextSize"] = 15;
    Lumiere.CC["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["3"]["TextScaled"] = true;
    Lumiere.CC["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["3"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["3"]["BackgroundTransparency"] = 1;
    Lumiere.CC["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Lumiere.CC["3"]["Size"] = UDim2.new(0.55847, 0, 1, 0);
    Lumiere.CC["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["3"]["Text"] = Dropdown.Name;
    Lumiere.CC["3"]["Name"] = [[ComponentName]];
    Lumiere.CC["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Lumiere.CC["4"] = Instance.new("UIPadding", Lumiere.CC["3"]);
    Lumiere.CC["4"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["5"] = Instance.new("UITextSizeConstraint", Lumiere.CC["3"]);
    Lumiere.CC["5"]["MaxTextSize"] = 15;

    Lumiere.CC["6"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["6"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["7"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Lumiere.CC["8"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["8"]["BorderSizePixel"] = 0;
    Lumiere.CC["8"]["BackgroundColor3"] = Color3.fromRGB(6, 8, 12);
    Lumiere.CC["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["8"]["Size"] = UDim2.new(0, 119, 0, 30);
    Lumiere.CC["8"]["Position"] = UDim2.new(0.82099, 0, 0.483, 0);
    Lumiere.CC["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["8"]["Name"] = [[Dropdown]];

    Lumiere.CC["9"] = Instance.new("UICorner", Lumiere.CC["8"]);
    Lumiere.CC["9"]["CornerRadius"] = UDim.new(0.25, 0);

    Lumiere.CC["a"] = Instance.new("UIStroke", Lumiere.CC["8"]);
    Lumiere.CC["a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["a"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["b"] = Instance.new("ImageLabel", Lumiere.CC["8"]);
    Lumiere.CC["b"]["BorderSizePixel"] = 0;
    Lumiere.CC["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["b"]["ImageColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["b"]["Image"] = [[rbxassetid://10709790948]];
    Lumiere.CC["b"]["Size"] = UDim2.new(0, 25, 0, 25);
    Lumiere.CC["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["b"]["BackgroundTransparency"] = 1;
    Lumiere.CC["b"]["Name"] = [[Chevron]];
    Lumiere.CC["b"]["Position"] = UDim2.new(0.86, 0, 0.5, 0);

    Lumiere.CC["c"] = Instance.new("UIAspectRatioConstraint", Lumiere.CC["b"]);

    Lumiere.CC["d"] = Instance.new("TextButton", Lumiere.CC["b"]);
    Lumiere.CC["d"]["BorderSizePixel"] = 0;
    Lumiere.CC["d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["d"]["TextSize"] = 14;
    Lumiere.CC["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["d"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["d"]["BackgroundTransparency"] = 1;
    Lumiere.CC["d"]["Name"] = [[Trigger]];
    Lumiere.CC["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["d"]["Text"] = [[]];

    Lumiere.CC["e"] = Instance.new("TextLabel", Lumiere.CC["8"]);
    Lumiere.CC["e"]["TextWrapped"] = true;
    Lumiere.CC["e"]["BorderSizePixel"] = 0;
    Lumiere.CC["e"]["TextSize"] = 13;
    Lumiere.CC["e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["e"]["TextScaled"] = true;
    Lumiere.CC["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["e"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["e"]["BackgroundTransparency"] = 1;
    Lumiere.CC["e"]["Size"] = UDim2.new(0.67625, 0, 1, 0);
    Lumiere.CC["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["e"]["Text"] = Dropdown.Default;
    Lumiere.CC["e"]["Name"] = [[Selected]];
    Lumiere.CC["e"]["Position"] = UDim2.new(0.041, 0, 0, 0);

    Lumiere.CC["f"] = Instance.new("UIPadding", Lumiere.CC["e"]);
    Lumiere.CC["f"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["10"] = Instance.new("UITextSizeConstraint", Lumiere.CC["e"]);
    Lumiere.CC["10"]["MaxTextSize"] = 13;

    Lumiere.CC["11"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["11"]["Name"] = [[Script]];

    local function C_11()
        local script = Lumiere.CC["11"];
        local TweenService = game:GetService("TweenService")

        local function CreateOptions(DropdownContainer, Options, Callback)
            local DropdownFrame = DropdownContainer:WaitForChild("Dropdown")
            local Chevron = DropdownFrame:WaitForChild("Chevron")
            local Trigger = Chevron:WaitForChild("Trigger")
            local SelectedText = DropdownFrame:WaitForChild("Selected")
            local ComponentName = DropdownContainer:WaitForChild("ComponentName")
            local MainCorner = DropdownContainer:WaitForChild("UICorner")

            ComponentName.AnchorPoint = Vector2.new(0, 0.5)
            ComponentName.Position = UDim2.new(0, 15, 0, 24)

            DropdownFrame.AnchorPoint = Vector2.new(1, 0.5)
            DropdownFrame.Position = UDim2.new(1, -12, 0, 24)

            local isOpen = false
            local OptionHeight = 28
            local DropdownYSize = #Options * OptionHeight

            local originalSize = UDim2.new(1, 0, 0, 49)
            local expandedSize = UDim2.new(1, 0, 0, 49 + DropdownYSize + 10)

            local originalCorner = script.Parent.UICorner.CornerRadius
            local expandedCorner = UDim.new(0, 5)

            local ListFrame = Instance.new("Frame")
            ListFrame.Name = "OptionList"
            ListFrame.Size = UDim2.new(1, 0, 0, 0)
            ListFrame.Position = UDim2.new(0, 0, 1, 6)
            ListFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            ListFrame.ClipsDescendants = true
            ListFrame.ZIndex = 10
            ListFrame.Visible = false
            ListFrame.Parent = DropdownFrame

            local ListCorner = Instance.new("UICorner")
            ListCorner.CornerRadius = UDim.new(0, 4)
            ListCorner.Parent = ListFrame

            local ListStroke = Instance.new("UIStroke")
            ListStroke.Color = Color3.fromRGB(35, 35, 35)
            ListStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ListStroke.Parent = ListFrame

            local ListLayout = Instance.new("UIListLayout")
            ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ListLayout.Parent = ListFrame

            for _, option in ipairs(Options) do
                local OptionBtn = Instance.new("TextButton")
                OptionBtn.Name = option
                OptionBtn.Size = UDim2.new(1, 0, 0, OptionHeight)
                OptionBtn.BackgroundTransparency = 1
                OptionBtn.Text = "  " .. option
                OptionBtn.TextXAlignment = Enum.TextXAlignment.Left
                OptionBtn.TextColor3 = Color3.fromRGB(132, 146, 176)
                OptionBtn.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
                    Enum.FontStyle.Normal)
                OptionBtn.TextSize = 13
                OptionBtn.ZIndex = 11
                OptionBtn.Parent = ListFrame

                OptionBtn.MouseEnter:Connect(function()
                    TweenService:Create(OptionBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(175, 175, 175) })
                        :Play()
                end)

                OptionBtn.MouseLeave:Connect(function()
                    TweenService:Create(OptionBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(132, 146, 176) })
                        :Play()
                end)

                OptionBtn.MouseButton1Click:Connect(function()
                    SelectedText.Text = option
                    if Callback then Callback(option) end

                    isOpen = false
                    TweenService:Create(ListFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart),
                        { Size = UDim2.new(1, 0, 0, 0) }):Play()
                    TweenService:Create(DropdownContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quart),
                        { Size = originalSize }):Play()
                    TweenService:Create(MainCorner, TweenInfo.new(0.2), { CornerRadius = originalCorner }):Play()
                    TweenService:Create(Chevron, TweenInfo.new(0.2), { Rotation = 0 }):Play()
                    task.wait(0.2)
                    ListFrame.Visible = false
                end)
            end

            Trigger.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    ListFrame.Visible = true
                    TweenService:Create(DropdownContainer, TweenInfo.new(0.25, Enum.EasingStyle.Quart),
                        { Size = expandedSize }):Play()
                    TweenService:Create(MainCorner, TweenInfo.new(0.25), { CornerRadius = expandedCorner }):Play()

                    TweenService:Create(ListFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart),
                        { Size = UDim2.new(1, 0, 0, DropdownYSize) }):Play()
                    TweenService:Create(Chevron, TweenInfo.new(0.2), { Rotation = 180 }):Play()
                else
                    TweenService:Create(ListFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart),
                        { Size = UDim2.new(1, 0, 0, 0) }):Play()
                    TweenService:Create(DropdownContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quart),
                        { Size = originalSize }):Play()
                    TweenService:Create(MainCorner, TweenInfo.new(0.2), { CornerRadius = originalCorner }):Play()
                    TweenService:Create(Chevron, TweenInfo.new(0.2), { Rotation = 0 }):Play()
                    task.wait(0.2)
                    ListFrame.Visible = false
                end
            end)
        end

        CreateOptions(script.Parent, Dropdown.Options, function(val)
            Dropdown.Callback(val)
        end)
    end;
    task.spawn(C_11);

    return Dropdown
end

function LumiereLibrary:Colorpicker(params)
    local Colorpicker = {}

    Colorpicker.Name = params.Name
    Colorpicker.Parent = params.Parent
    Colorpicker.Default = params.Default or Color3.fromRGB(32, 84, 201)
    Colorpicker.Callback = params.Callback or function() end

    local Lumiere.CC = {}

    Lumiere.CC["2"] = Instance.new("Frame", game.CoreGui["Lumiere.CC"].Main.Tabs[Colorpicker.Parent].Scroll.Layout);
    Lumiere.CC["2"]["BorderSizePixel"] = 0;
    Lumiere.CC["2"]["BackgroundColor3"] = Color3.fromRGB(10, 13, 20);
    Lumiere.CC["2"]["Size"] = UDim2.new(0, 405, 0, 49);
    Lumiere.CC["2"]["Position"] = UDim2.new(0.00246, 0, 0, 0);
    Lumiere.CC["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["2"]["Name"] = Colorpicker.Name;

    Lumiere.CC["3"] = Instance.new("TextLabel", Lumiere.CC["2"]);
    Lumiere.CC["3"]["TextWrapped"] = true;
    Lumiere.CC["3"]["BorderSizePixel"] = 0;
    Lumiere.CC["3"]["TextSize"] = 15;
    Lumiere.CC["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    Lumiere.CC["3"]["TextScaled"] = true;
    Lumiere.CC["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal);
    Lumiere.CC["3"]["TextColor3"] = Color3.fromRGB(132, 146, 176);
    Lumiere.CC["3"]["BackgroundTransparency"] = 1;
    Lumiere.CC["3"]["AnchorPoint"] = Vector2.new(0, 0.5);
    Lumiere.CC["3"]["Size"] = UDim2.new(0.74366, 0, 1, 0);
    Lumiere.CC["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["3"]["Text"] = Colorpicker.Name;
    Lumiere.CC["3"]["Name"] = [[ComponentName]];
    Lumiere.CC["3"]["Position"] = UDim2.new(0, 15, 0, 24);

    Lumiere.CC["4"] = Instance.new("UIPadding", Lumiere.CC["3"]);
    Lumiere.CC["4"]["PaddingBottom"] = UDim.new(0, 2);

    Lumiere.CC["5"] = Instance.new("UITextSizeConstraint", Lumiere.CC["3"]);
    Lumiere.CC["5"]["MaxTextSize"] = 15;

    Lumiere.CC["6"] = Instance.new("UIStroke", Lumiere.CC["2"]);
    Lumiere.CC["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
    Lumiere.CC["6"]["Color"] = Color3.fromRGB(28, 36, 56);

    Lumiere.CC["7"] = Instance.new("UICorner", Lumiere.CC["2"]);
    Lumiere.CC["7"]["CornerRadius"] = UDim.new(0.12, 0);

    Lumiere.CC["8"] = Instance.new("Frame", Lumiere.CC["2"]);
    Lumiere.CC["8"]["BorderSizePixel"] = 0;
    Lumiere.CC["8"]["BackgroundColor3"] = Color3.fromRGB(32, 84, 201);
    Lumiere.CC["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    Lumiere.CC["8"]["Size"] = UDim2.new(0, 30, 0, 30);
    Lumiere.CC["8"]["Position"] = UDim2.new(0.93087, 0, 0.483, 0);
    Lumiere.CC["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["8"]["Name"] = [[Color]];

    Lumiere.CC["9"] = Instance.new("UICorner", Lumiere.CC["8"]);
    Lumiere.CC["9"]["CornerRadius"] = UDim.new(0.25, 0);

    Lumiere.CC["a"] = Instance.new("TextButton", Lumiere.CC["8"]);
    Lumiere.CC["a"]["BorderSizePixel"] = 0;
    Lumiere.CC["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["a"]["TextSize"] = 14;
    Lumiere.CC["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    Lumiere.CC["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    Lumiere.CC["a"]["Size"] = UDim2.new(1, 0, 1, 0);
    Lumiere.CC["a"]["BackgroundTransparency"] = 1;
    Lumiere.CC["a"]["Name"] = [[Trigger]];
    Lumiere.CC["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    Lumiere.CC["a"]["Text"] = [[]];

    Lumiere.CC["b"] = Instance.new("LocalScript", Lumiere.CC["2"]);
    Lumiere.CC["b"]["Name"] = [[Script]];

    local function C_b()
        local script = Lumiere.CC["b"];
        local TweenService = game:GetService("TweenService")
        local UserInputService = game:GetService("UserInputService")

        local function CreateColorpicker(ColorpickerContainer, DefaultColor, Callback)
            local ColorPreview = ColorpickerContainer:WaitForChild("Color")
            local Trigger = ColorPreview:WaitForChild("Trigger")
            local ComponentName = ColorpickerContainer:WaitForChild("ComponentName")
            local MainCorner = ColorpickerContainer:WaitForChild("UICorner")
            local ScrollFrame = ColorpickerContainer.Parent.Parent

            ComponentName.AnchorPoint = Vector2.new(0, 0.5)
            ComponentName.Position = UDim2.new(0, 15, 0, 24)
            ColorPreview.AnchorPoint = Vector2.new(1, 0.5)
            ColorPreview.Position = UDim2.new(1, -12, 0, 24)

            local isOpen = false
            local currentHue, currentSat, currentVal = DefaultColor:ToHSV()

            local originalSize = UDim2.new(1, 0, 0, 49)
            local expandedSize = UDim2.new(1, 0, 0, 215)
            local originalCorner = MainCorner.CornerRadius
            local expandedCorner = UDim.new(0, 6)

            local ColorPanel = Instance.new("Frame")
            ColorPanel.Name = "ColorPanel"
            ColorPanel.Size = UDim2.new(1, -24, 0, 0)
            ColorPanel.Position = UDim2.new(0, 12, 0, 52)
            ColorPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            ColorPanel.ClipsDescendants = true
            ColorPanel.Visible = false
            ColorPanel.BackgroundTransparency = 1
            ColorPanel.Parent = ColorpickerContainer

            local PanelCorner = Instance.new("UICorner", ColorPanel)
            PanelCorner.CornerRadius = UDim.new(0, 10)

            local PanelStroke = Instance.new("UIStroke", ColorPanel)
            PanelStroke.Color = Color3.fromRGB(35, 35, 35)
            PanelStroke.Transparency = 1

            local SatValPicker = Instance.new("ImageLabel")
            SatValPicker.Name = "SaturationValuePicker"
            SatValPicker.Size = UDim2.new(1, -20, 0, 110)
            SatValPicker.Position = UDim2.new(0, 10, 0, 10)
            SatValPicker.Image = "rbxassetid://4155801252"
            SatValPicker.ImageTransparency = 1
            SatValPicker.BackgroundColor3 = Color3.fromHSV(currentHue, 1, 1)
            SatValPicker.Parent = ColorPanel
            Instance.new("UICorner", SatValPicker).CornerRadius = UDim.new(0, 6)

            local SatValCursor = Instance.new("Frame")
            SatValCursor.Name = "SaturationValueCursor"
            SatValCursor.Size = UDim2.new(0, 10, 0, 10)
            SatValCursor.AnchorPoint = Vector2.new(0.5, 0.5)
            SatValCursor.BackgroundTransparency = 1
            SatValCursor.Parent = SatValPicker
            local SCursorStroke = Instance.new("UIStroke", SatValCursor)
            SCursorStroke.Color = Color3.fromRGB(175, 175, 175)
            SCursorStroke.Thickness = 2
            Instance.new("UICorner", SatValCursor).CornerRadius = UDim.new(1, 0)

            local HueSlider = Instance.new("Frame")
            HueSlider.Name = "HueSlider"
            HueSlider.Size = UDim2.new(1, -20, 0, 14)
            HueSlider.Position = UDim2.new(0, 10, 0, 130)
            HueSlider.BackgroundTransparency = 1
            HueSlider.Parent = ColorPanel
            Instance.new("UICorner", HueSlider).CornerRadius = UDim.new(1, 0)

            local HueGradient = Instance.new("UIGradient", HueSlider)
            HueGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
            })

            local HueCursor = Instance.new("Frame")
            HueCursor.Name = "HueCursor"
            HueCursor.Size = UDim2.new(0, 7, 0, 7)
            HueCursor.AnchorPoint = Vector2.new(0.5, 0.5)
            HueCursor.BackgroundTransparency = 1
            HueCursor.Parent = HueSlider
            local HCursorStroke = Instance.new("UIStroke", HueCursor)
            HCursorStroke.Color = Color3.fromRGB(175, 175, 175)
            HCursorStroke.Thickness = 2
            Instance.new("UICorner", HueCursor).CornerRadius = UDim.new(1, 0)

            local function UpdateUI(instant, fireCallback)
                local pickedColor = Color3.fromHSV(currentHue, currentSat, currentVal)
                local tInfo = instant and TweenInfo.new(0) or TweenInfo.new(0.1)

                TweenService:Create(ColorPreview, tInfo, { BackgroundColor3 = pickedColor }):Play()
                TweenService:Create(SatValPicker, tInfo, { BackgroundColor3 = Color3.fromHSV(currentHue, 1, 1) }):Play()
                TweenService:Create(SatValCursor, tInfo, { Position = UDim2.new(currentSat, 0, 1 - currentVal, 0) })
                    :Play()
                TweenService:Create(HueCursor, tInfo, { Position = UDim2.new(currentHue, 0, 0.5, 0) }):Play()

                if Callback and fireCallback then
                    Callback(pickedColor)
                end
            end

            local draggingSV, draggingH = false, false
            local function ToggleScroll(enabled)
                if ScrollFrame and ScrollFrame:IsA("ScrollingFrame") then ScrollFrame.ScrollingEnabled = enabled end
            end

            local function ProcessInput(input, obj, type)
                local relX = math.clamp((input.Position.X - obj.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, 1)
                local relY = math.clamp((input.Position.Y - obj.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0, 1)
                if type == "SatVal" then
                    currentSat, currentVal = relX, 1 - relY
                elseif type == "Hue" then
                    currentHue = relX
                end
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

            UserInputService.InputChanged:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
                    if draggingSV then
                        ProcessInput(i, SatValPicker, "SatVal")
                    elseif draggingH then
                        ProcessInput(i, HueSlider, "Hue")
                    end
                end
            end)

            UserInputService.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                    draggingSV, draggingH = false, false; ToggleScroll(true)
                end
            end)

            Trigger.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                local t = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

                if isOpen then
                    ColorpickerContainer.ZIndex = 2
                    ColorPanel.Visible = true
                    task.wait()

                    TweenService:Create(ColorpickerContainer, t, { Size = expandedSize }):Play()
                    TweenService:Create(MainCorner, t, { CornerRadius = expandedCorner }):Play()

                    TweenService:Create(ColorPanel, t, { Size = UDim2.new(1, -24, 0, 150), BackgroundTransparency = 0 })
                        :Play()
                    TweenService:Create(PanelStroke, t, { Transparency = 0 }):Play()
                    TweenService:Create(SatValPicker, t, { ImageTransparency = 0 }):Play()
                    TweenService:Create(HueSlider, t, { BackgroundTransparency = 0 }):Play()
                else
                    ColorpickerContainer.ZIndex = 1
                    TweenService:Create(ColorPanel, t, { Size = UDim2.new(1, -24, 0, 0), BackgroundTransparency = 1 })
                        :Play()
                    TweenService:Create(PanelStroke, t, { Transparency = 1 }):Play()
                    TweenService:Create(SatValPicker, t, { ImageTransparency = 1 }):Play()
                    TweenService:Create(HueSlider, t, { BackgroundTransparency = 1 }):Play()

                    TweenService:Create(ColorpickerContainer, t, { Size = originalSize }):Play()
                    TweenService:Create(MainCorner, t, { CornerRadius = originalCorner }):Play()

                    task.delay(0.3, function()
                        if not isOpen then ColorPanel.Visible = false end
                    end)
                end
            end)

            UpdateUI(true, false)
        end

        CreateColorpicker(script.Parent, Colorpicker.Default, function(color)
            Colorpicker.Callback(color)
        end)
    end;
    task.spawn(C_b);

    return Colorpicker
end

function LumiereLibrary:Notification(Description, Duration)
    local TweenService = game:GetService("TweenService")
    local TextService = game:GetService("TextService")

    local Holder = game.CoreGui["Lumiere.CC"]:WaitForChild("NotificationHolder")

    local Duration = Duration or 5
    local tInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

    local GothamSemiFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold,
        Enum.FontStyle.Normal)
    local GothamBoldFont = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
        Enum.FontStyle.Normal)

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
    TitleLabel.Text = "LUMIERE.CC"
    TitleLabel.TextColor3 = Color3.fromRGB(32, 84, 201)
    TitleLabel.TextSize = 13
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local DescLabel = Instance.new("TextLabel", Notif)
    DescLabel.Name = "Description"
    DescLabel.BackgroundTransparency = 1
    DescLabel.FontFace = GothamSemiFont
    DescLabel.Text = Description
    DescLabel.TextColor3 = Color3.fromRGB(132, 146, 176)
    DescLabel.TextSize = 14
    DescLabel.TextWrapped = true
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextYAlignment = Enum.TextYAlignment.Top

    local paddingX = 30
    local topMargin = 35
    local bottomPadding = 28

    local maxWidth = Holder.AbsoluteSize.X - paddingX
    local textSize = TextService:GetTextSize(Description, 14, Enum.Font.Gotham, Vector2.new(maxWidth, 1000))

    local targetHeight = textSize.Y + topMargin + bottomPadding
    targetHeight = math.clamp(targetHeight, 80, 300)

    DescLabel.Position = UDim2.new(0, 15, 0, topMargin)
    DescLabel.Size = UDim2.new(1, -paddingX, 0, textSize.Y)

    TweenService:Create(Notif, tInfo, { Size = UDim2.new(1, 0, 0, targetHeight), GroupTransparency = 0 }):Play()
    TweenService:Create(ScaleObj, tInfo, { Scale = 1 }):Play()
    TweenService:Create(UIStroke, tInfo, { Transparency = 0 }):Play()

    local TimerBar = Instance.new("Frame", Notif)
    TimerBar.Name = "Timer"
    TimerBar.Size = UDim2.new(1, -24, 0, 2)
    TimerBar.Position = UDim2.new(0, 12, 1, -8)
    TimerBar.BackgroundColor3 = Color3.fromRGB(32, 84, 201)
    TimerBar.BorderSizePixel = 0
    TimerBar.ZIndex = 2

    TweenService:Create(TimerBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 0, 2) })
        :Play()

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

return LumiereLibrary
