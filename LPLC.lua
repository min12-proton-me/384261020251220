local Players = game:GetService("Players")

local function addLight(character)
	-- 重複防止
	if character:FindFirstChild("PlayerLight") then
		return
	end

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	local light = Instance.new("PointLight")
	light.Name = "PlayerLight"
	light.Brightness = 2        -- 明るさ
	light.Range = 15            -- 照射範囲
	light.Shadows = true        -- 影を有効化
	light.Parent = humanoidRootPart
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(character)
		addLight(character)
	end)
end

-- 既にいるプレイヤー
for _, player in ipairs(Players:GetPlayers()) do
	onPlayerAdded(player)
	if player.Character then
		addLight(player.Character)
	end
end

-- 新規プレイヤー
Players.PlayerAdded:Connect(onPlayerAdded)
