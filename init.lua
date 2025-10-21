local loadonscreen = not game:IsLoaded()
print(loadonscreen)
repeat
	task.wait()
until game:IsLoaded()

if loadonscreen then
	task.wait(5)
	if game.GameId == 2619619496 then
		local suc;

		repeat
			suc = pcall(function()
				return require(game.ReplicatedStorage['rbxts_include']['node_modules']['@flamework'].core.out).Flamework
			end)
			task.wait()
		until suc
	end
end

if shared.vape then
	shared.vape:Uninject()
end

local license = ({...})[1] or {}
local developer = getgenv().sunlightdev or license.Developer or false
local closet = getgenv().closet or license.Closet or false

getgenv().username = username or license.Username
getgenv().password = password or license.Password
getgenv().sunlightuser = getgenv().username

local cloneref = cloneref or function(ref) return ref end
local gethui = gethui or function() return game:GetService('Players').LocalPlayer.PlayerGui end
local tweenService = game:GetService('TweenService')

local gui : ScreenGui = Instance.new('ScreenGui', gethui())
gui.Enabled = not closet

local stages = {
	UDim2.new(0, 50, 1, 0),
	UDim2.new(0, 100, 1, 0),
	UDim2.new(0, 160, 1, 0),
	UDim2.new(0, 200, 1, 0),
	UDim2.new(0, 240, 1, 0)
}

local createinstance = function(class, properties)
	local res = Instance.new(class)
	
	for property, value in properties do
		res[property] = value
	end

	return res
end

local assetTable = {
	['sunlight/assets/loader/background.png'] = 'rbxassetid://93496634716737',
	['sunlight/assets/loader/exit.png'] = 'rbxassetid://110629770884920',
	['sunlight/assets/loader/exiticon.png'] = 'rbxassetid://128518278755224'
}

local function getAsset(v)
	return assetTable[v] or ''
end

if gui.Enabled then
	createinstance('ImageLabel', {
		Name = 'Main',
		Parent = gui,
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(685, 399),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ScaleType = Enum.ScaleType.Fit,
		Image = 'rbxassetid://93496634716737'
	})

	-- EXIT BUTTON --

	createinstance('ImageButton', {
		Name = 'Exit',
		Parent = gui.Main,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(624, 23),
		Size = UDim2.fromOffset(40, 30),
		AutoButtonColor = false,
		ImageColor3 = Color3.fromRGB(34, 33, 34),
		Image = 'rbxassetid://110629770884920',
		ScaleType = Enum.ScaleType.Fit
	})

	createinstance('ImageLabel', {
		Name = 'Icon',
		Parent = gui.Main.Exit,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		AnchorPoint = Vector2.new(0, 0.5),
		ImageTransparency = 0.4,
		ImageColor3 = Color3.new(1, 1, 1),
		Image = 'rbxassetid://128518278755224',
		ScaleType = Enum.ScaleType.Fit
	})

	-- MINIMIZE BUTTON --

	createinstance('ImageButton', {
		Name = 'Minimize',
		Parent = gui.Main,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(582, 23),
		Size = UDim2.fromOffset(40, 30),
		AutoButtonColor = false,
		ImageColor3 = Color3.fromRGB(34, 33, 34),
		Image = 'rbxassetid://133363055871405',
		ScaleType = Enum.ScaleType.Fit
	})

	createinstance('ImageLabel', {
		Name = 'Icon',
		Parent = gui.Main.Minimize,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 14, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		AnchorPoint = Vector2.new(0, 0.5),
		ImageTransparency = 0.4,
		ImageColor3 = Color3.new(1, 1, 1),
		Image = 'rbxassetid://83568668289707',
		ScaleType = Enum.ScaleType.Fit
	})

	-- VAPE LOGO --

	createinstance('ImageLabel', {
		Name = 'textvape',
		Parent = gui.Main,
		AnchorPoint = Vector2.new(0.48, 0.31),
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.48, 0.31),
		Size = UDim2.fromOffset(70, 70),
		Image = 'rbxassetid://84228868064393',
		ScaleType = Enum.ScaleType.Fit
	})

	createinstance('ImageLabel', {
		Name = 'version',
		Parent = gui.Main.textvape,
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(1, 0.3),
		Size = UDim2.fromOffset(29, 29),
		Image = 'rbxassetid://138794287840926',
		ImageColor3 = Color3.fromRGB(98, 198, 158),
		ScaleType = Enum.ScaleType.Fit
	})

	-- LOAD BAR --

	createinstance('Frame', {
		Name = 'loadbar',
		Parent = gui.Main,
		AnchorPoint = Vector2.new(0.5, 0.53),
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.53),
		Size = UDim2.fromOffset(240, 6)
	})

	createinstance('Frame', {
		Name = 'fullbar',
		Parent = gui.Main.loadbar,
		BackgroundColor3 = Color3.fromRGB(3, 102, 79),
		BorderSizePixel = 0,
		Size = UDim2.new(0, 0, 1, 0),
		ZIndex = 2
	})

	-- ACTION TEXT --

	createinstance('TextLabel', {
		Name = 'action',
		Parent = gui.Main,
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.353284657, 0.556391001),
		Size = UDim2.fromOffset(200, 15),
		Font = Enum.Font.Arial,
		Text = '',
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 12,
		TextTransparency = 0.3
	})

	Instance.new('UICorner', gui.Main.loadbar)
	Instance.new('UICorner', gui.Main.loadbar.fullbar)
	Instance.new('UIScale', gui.Main).Scale = math.max(gui.AbsoluteSize.X / 1920, 0.485)
end;

getgenv().makestage = function(stage, package)
	pcall(function()
		tweenService:Create(gui.Main.loadbar.fullbar, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
			Size = stages[stage]
		}):Play()
		gui.Main.action.Text = package or ''
	end)
end

local httpService = cloneref(game:GetService('HttpService'))

local success, commitdata = pcall(function()
    local commitinfo = httpService:JSONDecode(game:HttpGet('https://api.github.com/repos/4dsboy16/sunlightintents/commits'))[1]
    if commitinfo and type(commitinfo) == 'table' then
        local fullinfo = httpService:JSONDecode(game:HttpGet('https://api.github.com/repos/4dsboy16/sunlightintents/commits/'.. commitinfo.sha))
        fullinfo.hash = commitinfo.sha:sub(1, 7)
        return fullinfo
    end
end)

if not success or typeof(commitdata) ~= 'table' or commitdata.sha == nil then
	commitdata = {sha = 'main', files = {}}
end

writefile('sunlightreset', 'True')

local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end
local delfile = delfile or function(file)
	writefile(file, '')
end

local function downloadFile(path, func)
	if not isfile(path) then
		local suc, res = pcall(function()
			local subbed = path:gsub('sunlightintents/', '')
			subbed = subbed:gsub(' ', '%%20')
			return game:HttpGet('https://raw.githubusercontent.com/4dsboy16/sunlightintents/'..readfile('sunlight/profiles/commit.txt')..'/'..subbed, true)
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		if path:find('.lua') then
			res = '--This watermark is used to delete the file if its cached, remove it to make the file persist after sunlight intents updates.\n'..res
		end
		writefile(path, res)
	end
	return (func or readfile)(path)
end

local function wipeFolder(path)
	if not isfolder(path) then return end
	for _, file in listfiles(path) do
		if file:find('loader') then continue end
		if isfile(file) and select(1, readfile(file):find('--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.')) == 1 then
			delfile(file)
		end
	end
end 

makestage(1, 'Downloading packages')

for _, folder in {'sunlight', 'sunlight/communication', 'sunlight/games', 'sunlight/games/bedwars', 'sunlight/profiles', 'sunlight/assets', 'sunlight/libraries', 'sunlight/libraries/Enviroments', 'sunlight/guis', 'sunlight/libraries/Weather', 'sunlight/libraries/LightningLib', 'sunlight/libraries/LightningLib/Sparks'} do
	if not isfolder(folder) then
		makestage(1, `Downloading packages\n({folder:gsub('sunlight', '')})`)
		makefolder(folder)
	end
	task.wait()
end

makestage(2, 'Downloading required files')

if not isfolder('sunlight') or #listfiles('sunlight') <= 6 or not isfolder('sunlight/profiles') or not isfile('sunlight/profiles/commit.txt') then
    makefolder('sunlight/profiles')
    writefile('sunlight/profiles/commit.txt', commitdata.sha)
    local req = httpService:JSONDecode(game:HttpGet('https://api.github.com/repos/4dsboy16/sunlightintents/contents/profiles'))
    for _, v in req do
        if v.path ~= 'profiles/commit.txt' then
		        makestage(2, `Downloading required files\n({v.path})`)
            downloadFile(`sunlight/{v.path}`)
        end
    end
    task.spawn(function()
        local req = httpService:JSONDecode(game:HttpGet('https://api.github.com/repos/4dsboy16/sunlightintents/contents/translations'))
        for _, v in req do
            downloadFile(`sunlight/{v.path}`)
        end
    end)
end

shared.VapeDeveloper = developer
getgenv().used_init = true
getgenv().sunlightdev = developer
getgenv().closet = closet

if closet then
	task.spawn(function()
		repeat
			for _, v in getconnections(game:GetService('LogService').MessageOut) do
				v:Disable()
			end

			for _, v in getconnections(game:GetService('ScriptContext').Error) do
				v:Disable()
			end

			task.wait()
		until not getgenv().closet
	end)
end

if not shared.VapeDeveloper then
	local commit = commitdata.sha or 'main'
	if commit == 'main' or (isfile('sunlight/profiles/commit.txt') and readfile('sunlight/profiles/commit.txt') or '') ~= commit then
		wipeFolder('sunlight')
		wipeFolder('sunlight/games')
		wipeFolder('sunlight/guis')
		wipeFolder('sunlight/libraries')
	end
    writefile('sunlight/cheaters.json', '{}')
	writefile('sunlight/profiles/commit.txt', commit)
end

local success, err = pcall(function()
	loadstring(downloadFile('sunlight/main.lua'), 'main')()
end)

for _, v in gui:GetDescendants() do
	for __, prop in {'BackgroundTransparency', 'ImageTransparency', 'TextTransparency'} do
		task.spawn(pcall, function()
			tweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quad), {
				[prop] = 1
			}):Play()
		end)
	end
end

if not success then
	error('Failed to initalize sunlight intents: '.. err, 8)
end
