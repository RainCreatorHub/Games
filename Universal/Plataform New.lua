local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local h = c:WaitForChild("HumanoidRootPart")
local ativo = false
local p2 = nil
local v = 0.1

local s = Instance.new("ScreenGui")
s.Name = "PlataformUI"
s.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
s.Parent = game.CoreGui

local f = Instance.new("Frame")
f.Size = UDim2.new(0, 180, 0, 90)
f.Position = UDim2.new(0.4, 0, 0.4, 0)
f.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
f.BorderSizePixel = 0
f.Active = true
f.Draggable = true
f.Parent = s

local uicf = Instance.new("UICorner")
uicf.CornerRadius = UDim.new(0, 12)
uicf.Parent = f

local titlebar = Instance.new("Frame")
titlebar.Size = UDim2.new(1, 0, 0, 30)
titlebar.Position = UDim2.new(0, 0, 0, 0)
titlebar.BackgroundColor3 = Color3.fromRGB(0, 0, 139)
titlebar.BorderSizePixel = 0
titlebar.Parent = f

local uictitle = Instance.new("UICorner")
uictitle.CornerRadius = UDim.new(0, 12)
uictitle.Parent = titlebar

local tb = Instance.new("TextLabel")
tb.Size = UDim2.new(1, -50, 0, 16)
tb.Position = UDim2.new(0, 10, 0, 2)
tb.BackgroundTransparency = 1
tb.Text = "Plataform | New"
tb.TextColor3 = Color3.fromRGB(255, 255, 255)
tb.Font = Enum.Font.GothamBold
tb.TextSize = 18
tb.TextXAlignment = Enum.TextXAlignment.Left
tb.Parent = titlebar

local st = Instance.new("TextLabel")
st.Size = UDim2.new(1, -20, 0, 14)
st.Position = UDim2.new(0, 10, 0, 18)
st.BackgroundTransparency = 1
st.Text = "By Rain"
st.TextColor3 = Color3.fromRGB(0, 255, 255)
st.Font = Enum.Font.Gotham
st.TextSize = 12
st.TextXAlignment = Enum.TextXAlignment.Left
st.Parent = titlebar

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -30, 0, 2)
close.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.Parent = titlebar

local uicclose = Instance.new("UICorner")
uicclose.CornerRadius = UDim.new(0, 6)
uicclose.Parent = close

close.MouseButton1Click:Connect(function()
    s:Destroy()
    if p2 then
        p2:Destroy()
    end
end)

local container = Instance.new("Frame")
container.Size = UDim2.new(1, -20, 0, 28)
container.Position = UDim2.new(0, 10, 0, 40)
container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
container.BorderSizePixel = 2
container.BorderColor3 = Color3.fromRGB(0, 191, 255)
container.Parent = f

local uicc = Instance.new("UICorner")
uicc.CornerRadius = UDim.new(0, 8)
uicc.Parent = container

local lbl = Instance.new("TextLabel")
lbl.Size = UDim2.new(0, 80, 1, 0)
lbl.BackgroundTransparency = 1
lbl.Text = "Plataform:"
lbl.TextColor3 = Color3.fromRGB(0, 255, 255)
lbl.Font = Enum.Font.GothamBold
lbl.TextSize = 16
lbl.TextXAlignment = Enum.TextXAlignment.Left
lbl.Parent = container

local sw = Instance.new("TextButton")
sw.Size = UDim2.new(0, 55, 0, 28)
sw.Position = UDim2.new(0, 90, 0, 0)
sw.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
sw.Text = " "
sw.BorderSizePixel = 0.5
sw.Parent = container

local uicsw = Instance.new("UICorner")
uicsw.CornerRadius = UDim.new(1, 0)
uicsw.Parent = sw

local knob = Instance.new("Frame")
knob.Size = UDim2.new(0, 24, 0, 24)
knob.Position = UDim2.new(0, 2, 0, 2)
knob.BackgroundColor3 = Color3.fromRGB(0, 191, 255)
knob.BorderSizePixel = 0.3
knob.Parent = sw

local uicknob = Instance.new("UICorner")
uicknob.CornerRadius = UDim.new(1, 0)
uicknob.Parent = knob

local function toggle()
    ativo = not ativo
    if ativo then
        sw.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
        knob:TweenPosition(UDim2.new(0, 29, 0, 2), "Out", "Sine", 0.15, true)
        p2 = Instance.new("Part")
        p2.Anchored = true
        p2.CanCollide = true
        p2.Transparency = 0.3
        p2.Size = Vector3.new(6, 1, 6)
        p2.Parent = workspace
        task.spawn(function()
            while ativo and p2.Parent do
                p2.CFrame = CFrame.new(h.Position - Vector3.new(0, 3, 0))
                p2.CFrame = p2.CFrame + Vector3.new(0, v * task.wait(), 0)
            end
        end)
    else
        sw.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        knob:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Sine", 0.15, true)
        if p2 then
            p2:Destroy()
            p2 = nil
        end
    end
end

sw.MouseButton1Click:Connect(function()
    toggle()
end)

container.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        toggle()
    end
end)

p.CharacterAdded:Connect(function(newCharacter)
    c = newCharacter
    h = c:WaitForChild("HumanoidRootPart")
    if p2 then
        p2:Destroy()
        p2 = nil
    end
    ativo = false
    sw.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    knob.Position = UDim2.new(0, 2, 0, 2)
end)
