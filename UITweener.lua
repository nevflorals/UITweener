-- UI Tweener v1.0
-- Made and developed by @Nevflorals
-- File Name: UITweener.lua
-- Github: https://github.com/nevflorals/UITweener

-- Services --

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

-- Settings --

local settings = script:GetAttributes()

-- Blur Object --

local blur = Instance.new("BlurEffect", game.Lighting)
blur.Name = "TweenModuleBlur"
blur.Size = 0

-- Local Varables --

local player = game.Players.LocalPlayer

local tweenModule = {}
local frames = {}

-- Private Functions --

local function getSoundsFolder()
	for _, object in ReplicatedStorage:GetDescendants() do
		if object:IsA("Folder") and object.Name == settings.SoundsFolder then
			return object
		end
	end
	
	return nil
end

-- Public Functions --

function tweenModule:AddButton(button: GuiButton, frame: Frame?, soundName: string?, turn: boolean?)
	local tweenFrame = button
	local originalSize = tweenFrame.Size

	if frame then
		frame.Visible = false
		frame.Position = UDim2.new(0.5, 0, -2, 0)
		table.insert(frames, frame)
	end

	button.MouseButton1Down:Connect(function()
		local downTween = TweenService:Create(tweenFrame, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = originalSize - UDim2.new(0, 5, 0, 5)})
		downTween:Play()
	end)

	button.MouseLeave:Connect(function()
		if turn then
			local leaveTween = TweenService:Create(tweenFrame, TweenInfo.new(settings.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = originalSize, Rotation = 0})
			leaveTween:Play()
		else
			local leaveTween = TweenService:Create(tweenFrame, TweenInfo.new(settings.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = originalSize})
			leaveTween:Play()
		end
	end)

	button.MouseEnter:Connect(function()
		if turn then
			local enterTween = TweenService:Create(tweenFrame, TweenInfo.new(settings.Time, Enum.EasingStyle[settings.ButtonStyle], Enum.EasingDirection.Out), {Size = originalSize + UDim2.new(0, 3, 0, 3), Rotation = 10})
			enterTween:Play()
		else
			local enterTween = TweenService:Create(tweenFrame, TweenInfo.new(settings.Time, Enum.EasingStyle[settings.ButtonStyle], Enum.EasingDirection.Out), {Size = originalSize + UDim2.new(0, 3, 0, 3)})
			enterTween:Play()
		end
	end)

	button.MouseButton1Up:Connect(function()
		local upTween = TweenService:Create(tweenFrame, TweenInfo.new(settings.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = originalSize})
		upTween:Play()
	end)

	button.MouseButton1Click:Connect(function()
		if settings.SoundsFolder then
			if type(settings.SoundsFolder) == "string" then
				settings.SoundsFolder = getSoundsFolder(settings.SoundsFolder)
			end
		else
			warn("UI Tweener: Can't find SoundsFolder, sounds will not function")
		end
		
		if settings.SoundsFolder and soundName and settings.SoundsFolder:FindFirstChild(soundName) then
			SoundService:PlayLocalSound(settings.SoundsFolder[soundName])
		end

		if frame then
			if not frame.Visible then
				for index, v in frames do
					if v.Visible == true then
						local s = pcall(function()
							v:TweenPosition(UDim2.new(0.5, 0, -2, 0), Enum.EasingDirection.Out, Enum.EasingStyle[settings.FrameStyle], settings.Time, true)
						end)

						if not s then
							table.remove(frames, index)
						else
							task.wait(0.3)
							v.Visible = false
						end
					end
				end

				frame.Visible = true
				frame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.2, false)
				task.wait(0.1)
				blur.Size = 24
			else
				blur.Size = 0
				frame:TweenPosition(UDim2.new(0.5, 0, -2, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.2, true)
				task.wait(0.3)
				frame.Visible = false
			end
		end
	end)
end

return tweenModule
