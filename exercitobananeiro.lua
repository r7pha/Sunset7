if _G.SUNSET_LOADED then
	warn("[SUNSET]: Sunset já foi carregado.");
	return;
end
if (not game.PlaceId == 13132367906) then
	game.Players.LocalPlayer:Kick("Jogo não suportado.");
end
local LiteVersion = false;
if (not getrawmetatable or not getnamecallmethod or not setreadonly or not newcclosure or not mousemoverel or not hookmetamethod) then
	LiteVersion = true;
	warn("[SUNSET]: Seu executor não suporta as funções necessárias para o funcionamento normal, portanto, desabilitamos algumas funções para que você possa utilizar o script.");
end
local repo = "https://raw.githubusercontent.com/r7pha/Sunset7/main/";
local Library = loadstring(game:HttpGet(repo .. "lib.lua"))();
local TManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))();
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))();
local Options = getgenv().Linoria.Options;
local Toggles = getgenv().Linoria.Toggles;
local p1 = game.Players.LocalPlayer;
local LocalPlayer = game.Players.LocalPlayer;
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 3);
local Mouse = LocalPlayer:GetMouse();
local Camera = game.Workspace.CurrentCamera;
local UserInputService = game:GetService("UserInputService");
local RunService = game:GetService("RunService");
local Device = nil;
local OverrideAimbotEnabled = false;
local Character = LocalPlayer.Character;
local Humanoid = Character:FindFirstChildOfClass("Humanoid");
local WalkSpeed = {false,16};
local JumpPower = {false,50};
local FOVNigga = {false,80};
local HitboxEnabled = false;
local HitboxSize = 15;
local HitboxTransparency = 0.5;
local TeamIgnoreHitbox = false;
local DesiredBodyPart = "Head";
local apply = function(part)
	part.CanCollide = false;
	part.Massless = true;
	part.Transparency = HitboxTransparency;
	part.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize);
end;
local setup = function(plr)
	if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
		if plr.Character then
			local char = plr.Character;
			local bodyPart = char:WaitForChild(DesiredBodyPart);
			if bodyPart then
				apply(bodyPart);
			end
		end
		plr.CharacterAdded:Connect(function(char)
			local bodyPart = char:WaitForChild(DesiredBodyPart);
			if bodyPart then
				apply(bodyPart);
			end
		end);
	end
end;
for _, plr in ipairs(game.Players:GetPlayers()) do
	if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
		if ((plr ~= p1) and HitboxEnabled) then
			setup(plr);
		end
	end
end
game.Players.PlayerAdded:Connect(function(plr)
	if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
		if ((plr ~= p1) and HitboxEnabled) then
			setup(plr);
		end
	end
end);
local mt;
if not LiteVersion then
	mt = getrawmetatable(game);
end
local oldNamecall;
if not LiteVersion then
	oldNamecall = mt.__namecall;
end
local NoAFK = false;
local BlockDeviceRemote = true;
local isAimbotActive = false;
local aimkey = Enum.KeyCode.G;
local currentTarget = nil;
local maxMoveDistance = 10;
local AimbotType = "Toggle";
local AimDistance = 150;
local CircleRadius = 150;
local CircleColor = Color3.fromRGB(1, 1, 1);
local CircleFilled = false;
local CircleTransparency = 0.5;
local CircleThickness = 2;
local CircleSides = 64;
local FOVCircle = Drawing.new("Circle");
local workspace = game:GetService("Workspace");
local player = game:GetService("Players").LocalPlayer;
local camera = workspace.CurrentCamera;
local IsBankVaultOpen = false;
local VaultExploded = false;
local dvc = "No Device";
local Time = 2.2;
local Comeco = 5;
local Fim = 15;
local Pular = false;
local EndPrefix = " !";
local AutoJJSEnabled = false;
local TextChatService = game:GetService("TextChatService");
getgenv().SilentAim = true;
getgenv().AimLock = true;
getgenv().Prediction = 0;
getgenv().AimLockKeybind = Enum.KeyCode.E;
local Aiming = loadstring(game:HttpGet("https://github.com/r7pha/Sunset7/raw/refs/heads/main/S_AimModule.lua"))();
Aiming.TeamCheck(false);
local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local LocalPlayer = Players.LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local CurrentCamera = Workspace.CurrentCamera;
local NiggerianSettings = {SilentAim=getgenv().SilentAim,AimLock=getgenv().AimLock,Prediction=getgenv().Prediction,AimLockKeybind=Enum.KeyCode.E};
getgenv().Aiming.FOVColour = Color3.fromRGB(0, 0, 0);
getgenv().Aiming.FOVSides = 64;
getgenv().Aiming.FOV = 40;
getgenv().NiggerianSettings = NiggerianSettings;
local DefaultGunAmmoValues = {};
local Players = {};
local Positions = {Pagamento=CFrame.new(-741.1854858398438, -6.600350379943848, -542.8767700195312),Comprar=CFrame.new(-765.9873046875, 19.52680206298828, -337.1181335449219),PortaRoubo=CFrame.new(-311.9356689453125, 2.408257484436035, -332.81463623046875),PortaGrande=CFrame.new(-277.7652282714844, -16.893672943115234, -280.2505798339844),CirculoDentro=CFrame.new(-275.4856872558594, -16.893672943115234, -265.1791076660156),CirculoFora=CFrame.new(-266.5813293457031, -16.893672943115234, -264.59002685546875)};
local PlayerGui = game.WaitForChild(LocalPlayer, "PlayerGui", 95);
local TypeChat = {[Enum.ChatVersion.LegacyChatService]=function(M)
	local ChatUI = game.WaitForChild(PlayerGui, "Chat", 95);
	local ChatFrame = game.WaitForChild(ChatUI, "Frame", 95);
	local CBPF = game.WaitForChild(ChatFrame, "ChatBarParentFrame", 95);
	local _FRAME = game.WaitForChild(CBPF, "Frame", 95);
	local BF = game.WaitForChild(_FRAME, "BoxFrame", 95);
	local Frame = game.WaitForChild(BF, "Frame", 95);
	local ChatBar = game.FindFirstChild(Frame, "ChatBar", 95);
	ChatBar:CaptureFocus();
	ChatBar.Text = M;
	ChatBar:ReleaseFocus(true);
end,[Enum.ChatVersion.TextChatService]=function(M)
	TextChatService.TextChannels.RBXGeneral:SendAsync(M);
end};
local Settings = {ESP_Enabled=false,Show_Team=false,Show_Names=true,Show_Team_Name=true,Box_Color=Color3.fromRGB(255, 0, 0),Tracer_Color=Color3.fromRGB(255, 0, 0),Tracer_Thickness=1,Box_Thickness=1,Tracer_Origin="Bottom",Tracer_FollowMouse=false,Tracers=true};
local player = game:GetService("Players").LocalPlayer;
local camera = game:GetService("Workspace").CurrentCamera;
local mouse = player:GetMouse();
local BodyParts = {Head=Vector3.new(2, 1, 1),Torso=Vector3.new(2, 2.5, 1),["Left Arm"]=Vector3.new(1, 2, 1),["Right Arm"]=Vector3.new(1, 2, 1),["Left Leg"]=Vector3.new(1, 2.5, 1),["Right Leg"]=Vector3.new(1, 2.5, 1)};
local BR_NumConfig = {Units={"ZERO","UM","DOIS","TRÊS","QUATRO","CINCO","SEIS","SETE","OITO","NOVE"},Special={[10]="DEZ",[11]="ONZE",[12]="DOZE",[13]="TREZE",[14]="QUATORZE",[15]="QUINZE",[16]="DEZESSEIS",[17]="DEZESSETE",[18]="DEZOITO",[19]="DEZENOVE"},Tens={[2]="VINTE",[3]="TRINTA",[4]="QUARENTA",[5]="CINQUENTA",[6]="SESSENTA",[7]="SETENTA",[8]="OITENTA",[9]="NOVENTA"},Hundred="CEM",Hundreds={[1]="CENTO",[2]="DUZENTOS",[3]="TREZENTOS",[4]="QUATROCENTOS",[5]="QUINHENTOS",[6]="SEISCENTOS",[7]="SETECENTOS",[8]="OITOCENTOS",[9]="NOVECENTOS"},Thousands={[1]="MIL",[2]="MILHÕES",[3]="BILHÕES"}};
local function GetNum(numero)
	local function de1a19(n)
		return BR_NumConfig.Units[n + 1];
	end
	local function de10a19(n)
		return BR_NumConfig.Special[n];
	end
	local function de20a99(n)
		local dezena = math.floor(n / 10);
		local unidade = n % 10;
		if (unidade == 0) then
			return BR_NumConfig.Tens[dezena];
		else
			return BR_NumConfig.Tens[dezena] .. " e " .. BR_NumConfig.Units[unidade + 1];
		end
	end
	local function de100a999(n)
		local centena = math.floor(n / 100);
		local resto = n % 100;
		if (resto == 0) then
			return BR_NumConfig.Hundreds[centena];
		else
			return BR_NumConfig.Hundreds[centena] .. " e " .. (((resto < 20) and de1a19(resto)) or de20a99(resto));
		end
	end
	local function de1000a999999(n)
		local milhar = math.floor(n / 1000);
		local resto = n % 1000;
		if (milhar == 1) then
			return BR_NumConfig.Thousands[1] .. (((resto > 0) and (" e " .. (((resto < 100) and de100a999999(resto)) or de100a999999(resto)))) or "");
		else
			return de100a999(milhar) .. " " .. BR_NumConfig.Thousands[1] .. (((resto > 0) and (" e " .. (((resto < 100) and de100a999999(resto)) or de100a999999(resto)))) or "");
		end
	end
	if ((numero > 9) and (numero < 19)) then
		return de10a19(numero);
	end
	if (numero < 19) then
		return de1a19(numero);
	elseif (numero < 100) then
		return de20a99(numero);
	elseif (numero < 1000) then
		return de100a999(numero);
	elseif (numero < 1000000) then
		return de1000a999999(numero);
	end
end
local function NewText(size, color)
	local text = Drawing.new("Text");
	text.Visible = false;
	text.Size = size;
	text.Color = color;
	text.Center = true;
	text.Outline = true;
	text.Transparency = 1;
	return text;
end
local function NewLine(thickness, color)
	local line = Drawing.new("Line");
	line.Visible = false;
	line.Thickness = thickness;
	line.Color = color;
	line.Transparency = 1;
	return line;
end
local function NewQuad(thickness, color)
	local quad = Drawing.new("Quad");
	quad.Visible = false;
	quad.Thickness = thickness;
	quad.Color = color;
	quad.Transparency = 1;
	quad.Filled = false;
	return quad;
end
local function Visibility(state, lib)
	for _, obj in pairs(lib) do
		obj.Visible = state;
	end
end
local function ClearAll(library)
	for _, obj in pairs(library) do
		obj.Visible = false;
	end
end
local function ESP(plr)
	local library = {tracer=NewLine(Settings.Tracer_Thickness, Settings.Tracer_Color),box=NewQuad(Settings.Box_Thickness, Settings.Box_Color),name=NewText(15, Color3.new(1, 1, 1)),team=NewText(13, Color3.new(1, 1, 1))};
	local function Updater()
		local connection;
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			if (Settings.ESP_Enabled and plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("HumanoidRootPart") and (plr.Character.Humanoid.Health > 0)) then
				if (not Settings.Show_Team and (plr.Team == player.Team)) then
					ClearAll(library);
					return;
				end
				local HumPos, OnScreen = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position);
				if OnScreen then
					local head = camera:WorldToViewportPoint(plr.Character.Head.Position);
					local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge);
					library.box.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - (DistanceY * 2));
					library.box.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - (DistanceY * 2));
					library.box.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + (DistanceY * 2));
					library.box.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + (DistanceY * 2));
					if Settings.Tracers then
						if Settings.Tracer_FollowMouse then
							library.tracer.From = Vector2.new(mouse.X, mouse.Y + 36);
						elseif (Settings.Tracer_Origin == "Middle") then
							library.tracer.From = Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y * 0.5);
						elseif (Settings.Tracer_Origin == "Bottom") then
							library.tracer.From = Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y);
						end
						library.tracer.To = Vector2.new(HumPos.X, HumPos.Y + (DistanceY * 2));
						library.tracer.Visible = true;
					else
						library.tracer.Visible = false;
					end
					if Settings.Show_Names then
						library.name.Position = Vector2.new(HumPos.X, (HumPos.Y - (DistanceY * 2)) - 15);
						library.name.Text = plr.Name;
						library.name.Visible = true;
					else
						library.name.Visible = false;
					end
					if Settings.Show_Team_Name then
						library.team.Position = Vector2.new(HumPos.X, (HumPos.Y - (DistanceY * 2)) - 30);
						library.team.Text = (plr.Team and plr.Team.Name) or "No Team";
						library.team.Visible = true;
					else
						library.team.Visible = false;
					end
					local teamColor = (plr.TeamColor and plr.TeamColor.Color) or Color3.fromRGB(255, 255, 255);
					library.box.Color = teamColor;
					library.tracer.Color = teamColor;
					library.name.Color = teamColor;
					library.team.Color = teamColor;
					library.box.Thickness = Settings.Box_Thickness;
					library.tracer.Thickness = Settings.Tracer_Thickness;
					Visibility(true, library);
				else
					ClearAll(library);
				end
			else
				ClearAll(library);
				if not game.Players:FindFirstChild(plr.Name) then
					connection:Disconnect();
				end
			end
		end);
	end
	coroutine.wrap(Updater)();
end
for _, v in pairs(game:GetService("Players"):GetPlayers()) do
	if (v ~= player) then
		ESP(v);
	end
end
game.Players.PlayerAdded:Connect(function(newplr)
	if (newplr ~= player) then
		ESP(newplr);
	end
end);
local function Bypass(n, d)
	setreadonly(mt, false);
	local oldindex = mt.__index;
	mt.__index = newcclosure(function(self, b)
		if (b == n) then
			return d;
		end
		return oldindex(self, b);
	end);
	setreadonly(mt, true);
end
local BlockRemoteEvent = function(Name, Variable)
	setreadonly(mt, false);
	mt.__namecall = function(self, ...)
		setreadonly(mt, false);
		local method = getnamecallmethod();
		if ((tostring(self) == Name) and (method == "FireServer")) then
			if Variable then
				return;
			end
		end
		setreadonly(mt, true);
		return oldNamecall(self, ...);
	end;
	setreadonly(mt, true);
end;
local ApplyPartSize = function(_character)
	if not HitboxEnabled then
		return;
	end
	if (_character and _character:FindFirstChild(DesiredBodyPart)) then
		local niggahead = _character:FindFirstChild(DesiredBodyPart);
		if niggahead then
			niggahead.CanCollide = false;
			niggahead.Massless = true;
			niggahead.Transparency = HitboxTransparency;
			niggahead.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize);
		end
	end
end;
local RestorePartSize = function(_character)
	if _character then
		for _, v in _character:GetDescendants() do
			if (v:IsA("Part") and (v.Name ~= "HumanoidRootPart")) then
				if BodyParts[v.Name] then
					v.Size = BodyParts[v.Name];
				end
				v.CanCollide = false;
				v.Massless = false;
				v.Transparency = 0;
			end
		end
	end
end;
if UserInputService.TouchEnabled then
	Device = "Mobile";
elseif UserInputService.KeyboardEnabled then
	Device = "PC";
else
	game.Players.LocalPlayer:Kick("Dispositivo não reconhecido/suportado.");
end
game:GetService("Players").LocalPlayer.PlayerGui.GameUI.MainUI.LocalPlayer.Hud.Stuffs.MainHUD.PlayerLogo.Visible = false;
if not LiteVersion then
	setreadonly(mt, false);
	mt.__namecall = function(self, ...)
		setreadonly(mt, false);
		local method = getnamecallmethod();
		if ((tostring(self) == "AFK") and (method == "FireServer")) then
			if NoAFK then
				return;
			end
		end
		if ((tostring(self) == "Device") and (method == "FireServer")) then
			if BlockDeviceRemote then
				return;
			end
		end
		return oldNamecall(self, ...);
	end;
	setreadonly(mt, true);
	Bypass("WalkSpeed", 16);
	Bypass("JumpPower", 50);
end
LocalPlayer.CharacterAdded:Connect(function(char)
	game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("GameUI").MainUI.LocalPlayer.Hud.Stuffs.MainHUD.PlayerLogo.Visible = false;
	Character = char;
	Humanoid = char:WaitForChild("Humanoid");
	if WalkSpeed[1] then
		Humanoid.WalkSpeed = WalkSpeed[2];
	end
	if JumpPower[1] then
		Humanoid.JumpPower = JumpPower[2];
	end
	task.wait(3);
	BlockDeviceRemote = false;
	game:GetService("ReplicatedStorage").Assets.Remotes.Device:FireServer(dvc);
	BlockDeviceRemote = true;
end);
for _, v in ipairs(game.Players:GetPlayers()) do
	if (not table.find(Players, v) and (v ~= game.Players.LocalPlayer)) then
		table.insert(Players, v);
	end
end
game.Players.PlayerAdded:Connect(function(_plr)
	if (not table.find(Players, _plr) and (_plr ~= game.Players.LocalPlayer)) then
		table.insert(Players, _plr);
		_plr.CharacterAdded:Connect(function()
			if HitboxEnabled then
				ApplyPartSize(_plr.Character);
			end
		end);
	end
end);
for _, v in pairs(Players) do
	ApplyPartSize(v.Character);
	v.CharacterAdded:Connect(function(_char)
		ApplyPartSize(_char);
	end);
end
workspace.Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
	if FOVNigga[1] then
		workspace.Camera.FieldOfView = FOVNigga[2];
	end
end);
Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
	if WalkSpeed[1] then
		Humanoid.WalkSpeed = WalkSpeed[2];
	end
end);
Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
	if JumpPower[1] then
		Humanoid.JumpPower = JumpPower[2];
	end
end);
local touchPos = Vector2.new(0, 0);
local activeTouch = nil;
UserInputService.TouchStarted:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		activeTouch = input;
	end
end);
UserInputService.TouchMoved:Connect(function(input, gameProcessedEvent)
	if (not gameProcessedEvent and (activeTouch == input)) then
		touchPos = input.Position;
	end
end);
UserInputService.TouchEnded:Connect(function(input, gameProcessedEvent)
	if (not gameProcessedEvent and (activeTouch == input)) then
		activeTouch = nil;
	end
end);
local function GetClosestPlayer()
	local closestPlayer = nil;
	local closestDistance = math.huge;
	for _, targetPlayer in pairs(game.Players:GetPlayers()) do
		if ((targetPlayer ~= LocalPlayer) and (targetPlayer.Team ~= LocalPlayer.Team) and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") and targetPlayer.Character:FindFirstChild("Humanoid") and (targetPlayer.Character.Humanoid.Health > 0)) then
			local targetCharacter = targetPlayer.Character;
			local targetHead = targetCharacter.Head;
			local distance = (targetHead.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude;
			if (currentTarget and (not currentTarget.Character or not currentTarget.Character:FindFirstChild("Humanoid") or (currentTarget.Character.Humanoid.Health <= 0))) then
				currentTarget = nil;
			end
			if ((distance < closestDistance) and (distance <= AimDistance)) then
				if (not currentTarget or (targetPlayer == currentTarget)) then
					closestPlayer = targetPlayer;
					closestDistance = distance;
				end
			end
		end
	end
	if closestPlayer then
		currentTarget = closestPlayer;
	end
	return currentTarget;
end
local function IsTargetInFOV(targetPlayer)
	local targetCharacter = targetPlayer.Character;
	if (targetCharacter and targetCharacter:FindFirstChild("Head")) then
		local head = targetCharacter.Head;
		local screenPoint, onScreen = Camera:WorldToScreenPoint(head.Position);
		local inputPos;
		if UserInputService.TouchEnabled then
			return true;
		else
			inputPos = Vector2.new(Mouse.X, Mouse.Y);
		end
		local distance = (inputPos - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude;
		return distance <= CircleRadius;
	end
	return false;
end
local function aimAtHead(targetPlayer)
	local targetCharacter = targetPlayer.Character;
	if (targetCharacter and targetCharacter:FindFirstChild("Head")) then
		local head = targetCharacter.Head;
		local screenPoint, onScreen = Camera:WorldToScreenPoint(head.Position);
		if onScreen then
			local deltaX, deltaY;
			if UserInputService.TouchEnabled then
				deltaX = touchPos.X - screenPoint.X;
				deltaY = touchPos.Y - screenPoint.Y;
			else
				deltaX = screenPoint.X - Mouse.X;
				deltaY = screenPoint.Y - Mouse.Y;
			end
			local maxMoveDistance = 10;
			deltaX = math.clamp(deltaX, -maxMoveDistance, maxMoveDistance);
			deltaY = math.clamp(deltaY, -maxMoveDistance, maxMoveDistance);
			mousemoverel(deltaX, deltaY);
		end
	end
end
game:GetService("RunService").RenderStepped:Connect(function()
	FOVCircle.Visible = isAimbotActive;
	if isAimbotActive then
		local inputPos;
		if UserInputService.TouchEnabled then
			inputPos = touchPos;
		else
			inputPos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y);
		end
		if not UserInputService.TouchEnabled then
			FOVCircle.Position = inputPos;
			FOVCircle.Radius = CircleRadius;
			FOVCircle.Filled = CircleFilled;
			FOVCircle.Color = CircleColor;
			FOVCircle.Visible = isAimbotActive;
			FOVCircle.Transparency = CircleTransparency;
			FOVCircle.NumSides = CircleSides;
			FOVCircle.Thickness = CircleThickness;
		end
		if (not currentTarget or not currentTarget.Character or not currentTarget.Character:FindFirstChild("Head") or (currentTarget.Character.Humanoid.Health <= 0)) then
			currentTarget = GetClosestPlayer();
		end
		if (currentTarget and IsTargetInFOV(currentTarget)) then
			aimAtHead(currentTarget);
		else
			currentTarget = nil;
		end
	end
end);
local SmoothTP = function(p, speed, cf)
	return game:GetService("TweenService"):Create(p, TweenInfo.new(speed), {CFrame=cf});
end;
workspace.Map.Robbery.Bank.BankVault:GetPropertyChangedSignal("WorldPivot"):Connect(function()
	if (workspace.Map.Robbery.Bank.BankVault.WorldPivot ~= CFrame.new(-276.689758, -12.633687, -276.994019, -1.1920929e-7)) then
		IsBankVaultOpen = true;
	elseif (workspace.Map.Robbery.Bank.BankVault.WorldPivot == CFrame.new(-276.689758, -12.633687, -276.994019, -1.1920929e-7)) then
		IsBankVaultOpen = false;
	end
end);
local function tocomascoisa()
	local inventory = LocalPlayer.Backpack:GetChildren();
	local hasKeycard = false;
	local hasC4 = false;
	for _, item in pairs(inventory) do
		if (item.Name == "C4") then
			hasC4 = true;
		end
	end
	return hasC4;
end
workspace.DescendantAdded:Connect(function(cock)
	if cock:IsA("Explosion") then
		VaultExploded = true;
		task.wait(1);
		VaultExploded = false;
	end
end);
workspace.Map.Robbery.Bank.BankVault.Vault.Behind:GetPropertyChangedSignal("CFrame"):Connect(function()
	if (workspace.Map.Robbery.Bank.BankVault.Vault.Behind.CFrame == CFrame.new(-273.349182, -12.6339998, -281.800323)) then
		IsBankVaultOpen = true;
	else
		IsBankVaultOpen = false;
	end
end);
local DoJJS = function()
	for i = Comeco, Fim do
		if (Comeco > Fim) then
			Library:Notify("O início das JJS não pode ser maior que o fim!");
			break;
		elseif not AutoJJSEnabled then
			break;
		end
		if (game.PlaceId == 13132367906) then
			game:GetService("ReplicatedStorage").Assets.Remotes.BubbleChat:FireServer(true);
		end
		task.wait(Time);
		if Pular then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
		end
		if (game.PlaceId == 13132367906) then
			game:GetService("ReplicatedStorage").Assets.Remotes.BubbleChat:FireServer(false);
		end
		pcall(TypeChat[TextChatService.ChatVersion], (GetNum(i) .. EndPrefix));
		task.wait(math.random(0.5, 1.5));
	end
end;
Library:Notify("Lite Version: " .. tostring(LiteVersion));
local Window = Library:CreateWindow({Title="Sunset | E.B Exército Bananeiro",Center=true,AutoShow=true,Resizable=true,ShowCustomCursor=false,TabPadding=8,MenuFadeTime=0.001});
local Tabs = {Jogador=Window:AddTab("Jogador"),Combate=Window:AddTab("Combate"),Visuals=Window:AddTab("Visual"),Farm=Window:AddTab("Farm"),AutoJJS=Window:AddTab("Auto JJS"),["UI Settings"]=Window:AddTab("UI Settings")};
local AutoJJSGBox = Tabs.AutoJJS:AddLeftGroupbox("Auto JJS");
AutoJJSGBox:AddInput("JJSInicio", {Default="",Numeric=true,Finished=false,ClearTextOnFocus=true,Text="Início",Tooltip="Determina de onde as JJ'S começam.",Placeholder="1",Callback=function(Value)
	Comeco = tonumber(Value);
end});
AutoJJSGBox:AddInput("JJSFim", {Default="",Numeric=true,Finished=false,ClearTextOnFocus=true,Text="Término",Tooltip="Determina de onde as JJ'S terminam.",Placeholder="10",Callback=function(Value)
	Fim = tonumber(Value);
end});
AutoJJSGBox:AddInput("JJSEPReifix", {Default=" !",Numeric=true,Finished=false,ClearTextOnFocus=true,Text="Prefixo",Tooltip="Ex: ' !' = 'UM !'",Placeholder=" !",Callback=function(Value)
	EndPrefix = Value;
end});
AutoJJSGBox:AddSlider("JJSWaitTime", {Text="Tempo",Default=2.5,Min=0.1,Max=4,Rounding=1,Compact=false,Callback=function(Value)
	Time = Value;
end});
AutoJJSGBox:AddToggle("JJSPular", {Text="Pular",Default=false,Tooltip="Determina se o boneco pula a cada JJ.",Callback=function(Value)
	Pular = Value;
end});
AutoJJSGBox:AddButton("Iniciar/Interromper", function()
	if not AutoJJSEnabled then
		AutoJJSEnabled = true;
		DoJJS();
	else
		AutoJJSEnabled = false;
	end
end);
local FarmGBox = Tabs.Farm:AddLeftGroupbox("Auto Farm");
FarmGBox:AddButton("Roubar Banco", function()
	LocalPlayer.Character.Humanoid:UnequipTools();
	if (not LocalPlayer.Backpack:FindFirstChild("C4") and (game:GetService("Players").LocalPlayer.leaderstats.Dinheiro.Value >= 1300) and not IsBankVaultOpen) then
		SmoothTP(LocalPlayer.Character.HumanoidRootPart, 6, Positions.Comprar):Play();
		task.wait(7);
		repeat
			game.ReplicatedStorage.Assets.Remotes['BuyShop']:FireServer("C4");
			task.wait(0.5);
		until tocomascoisa() 
	elseif ((game:GetService("Players").LocalPlayer.leaderstats.Dinheiro.Value < 1300) and not game.Players.LocalPlayer.Backpack:FindFirstChild("C4") and not IsBankVaultOpen) then
		Library:Notify("Você não tem dinheiro suficiente para comprar a C4.");
		return;
	end
	Library:Notify("Fique atento para plantar a bomba!");
	SmoothTP(LocalPlayer.Character.HumanoidRootPart, 5, Positions.PortaGrande):Play();
	task.wait(6);
	if not VaultExploded then
		Library:Notify("Plante a bomba! Aguardando...");
		repeat
			task.wait(0.5);
		until IsBankVaultOpen 
	end
	for i = 1, 25 do
		if ((i % 2) == 1) then
			LocalPlayer.Character.HumanoidRootPart.CFrame = Positions.CirculoDentro;
		else
			LocalPlayer.Character.HumanoidRootPart.CFrame = Positions.CirculoFora;
		end
		task.wait(0.5);
	end
	SmoothTP(LocalPlayer.Character.HumanoidRootPart, 6, Positions.Pagamento):Play();
	task.wait(7);
	game:GetService("ReplicatedStorage").Assets.Remotes.Robbery:FireServer();
end);
local ServerGBox = Tabs.Jogador:AddRightGroupbox("Info");
ServerGBox:AddLabel("Script desenvolvido por Sunrise\nDiscord: .sunrise7", true);
ServerGBox:AddButton("Rejoin", function()
	game.TeleportService:Teleport(game.PlaceId, LocalPlayer);
end);
local JogadorGBox = Tabs.Jogador:AddLeftGroupbox("Jogador");
if not LiteVersion then
	JogadorGBox:AddToggle("CustomWalkSpeed", {Text="WalkSpeed Personalizada",Default=false,Tooltip="Determina se a walkspeed será modificada.",Callback=function(Value)
		WalkSpeed[1] = Value;
		if not Value then
			Humanoid.WalkSpeed = 16;
			return;
		end
		Humanoid.WalkSpeed = WalkSpeed[2];
	end});
	JogadorGBox:AddSlider("WalkSpeedSlider", {Text="WalkSpeed",Default=16,Min=1,Max=690,Rounding=1,Compact=false,Callback=function(Value)
		if WalkSpeed[1] then
			WalkSpeed[2] = Value;
			Humanoid.WalkSpeed = Value;
		end
	end});
	JogadorGBox:AddToggle("CustomJP", {Text="JumpPower Personalizado",Default=false,Tooltip="Determina se o JumpPower será modificado.",Callback=function(Value)
		JumpPower[1] = Value;
		if not Value then
			Humanoid.JumpPower = 50;
			return;
		end
		Humanoid.JumpPower = WalkSpeed[2];
	end});
	JogadorGBox:AddSlider("JPSlider", {Text="JumpPower",Default=16,Min=1,Max=690,Rounding=1,Compact=false,Callback=function(Value)
		if JumpPower[1] then
			JumpPower[2] = Value;
			Humanoid.JumpPower = Value;
		end
	end});
	JogadorGBox:AddToggle("AntiAFK", {Text="Anti-AFK",Default=false,Tooltip="Não mostra que você está AFK no jogo.",Callback=function(Value)
		NoAFK = Value;
	end});
end
JogadorGBox:AddButton("Ficar Careca", function()
	game:GetService("ReplicatedStorage").Assets.Remotes[utf8.char(65, 114, 109, 225, 114, 105, 111)]:FireServer("RemoveHats");
end);
if not LiteVersion then
	JogadorGBox:AddDropdown("MyMultiDropdown", {Values={"No Device","Computer","Mobile"},Default=1,Multi=false,Text="Device Changer",Tooltip="Falsifica o dispositivo atual.",Callback=function(Value)
		dvc = Value;
		Library:Notify("Dê respawn para aplicar as mudanças.");
	end});
end
JogadorGBox:AddToggle("FOVToggzle", {Text="Campo de visão habilitado",Default=false,Callback=function(Value)
	if not Value then
		FOVNigga[2] = 80;
		Options.FOVSlidder:SetValue(80);
	end
	FOVNigga[1] = Value;
end});
JogadorGBox:AddSlider("FOVSlidder", {Text="Campo de visão (FOV)",Default=80,Min=10,Max=120,Rounding=1,Compact=false,Callback=function(Value)
	if FOVNigga[1] then
		FOVNigga[2] = Value;
		workspace.Camera.FieldOfView = FOVNigga[2];
	end
end});
local SilentAimGBox = Tabs.Combate:AddLeftGroupbox("Silent Aim");
SilentAimGBox:AddToggle("SilentAimTgl", {Text="Silent Aim Enabled",Default=false,Callback=function(Value)
	if Value then
		Toggles.CU255:SetValue(true);
		Toggles.AimbEnabled:SetValue(false);
	end
	getgenv().Aiming.Enabled = Value;
end});
if (Device == "Mobile") then
	SilentAimGBox:AddToggle("CU25315", {Text="Centralize FOV",Default=true,Callback=function(Value)
		getgenv().Aiming.CentralizeFOV = Value;
	end});
end
SilentAimGBox:AddToggle("CU255", {Text="FOV Visible",Default=true,Callback=function(Value)
	getgenv().Aiming.ShowFOV = Value;
end});
SilentAimGBox:AddToggle("CU2", {Text="Visible Check",Default=true,Callback=function(Value)
	getgenv().Aiming.VisibleCheck = Value;
end});
SilentAimGBox:AddSlider("MySlider", {Text="FOV",Default=60,Min=5,Max=360,Rounding=1,Compact=false,Callback=function(Value)
	getgenv().Aiming.FOV = Value;
end});
SilentAimGBox:AddSlider("MySzlider", {Text="Hit Chance",Default=100,Min=1,Max=100,Rounding=1,Compact=false,Callback=function(Value)
	getgenv().Aiming.HitChance = Value;
end});
if (Device == "PC") then
	local AimbotGBox = Tabs.Combate:AddLeftGroupbox("Aimbot");
	AimbotGBox:AddToggle("AimbEnabled", {Text="Aimbot Enabled",Default=false,Tooltip="Não mostra que você está AFK no jogo.",Callback=function(Value)
		if Value then
			Toggles.CU255:SetValue(false);
			Toggles.SilentAimTgl:SetValue(false);
		end
		isAimbotActive = Value;
		OverrideAimbotEnabled = Value;
	end});
	AimbotGBox:AddLabel("Aimbot Key"):AddKeyPicker("Aimbot Key", {Default="G",SyncToggleState=true,Mode=AimbotType,Text="Aimbot Key",NoUI=false,Callback=function(Value)
		if not Value then
			currentTarget = nil;
		end
		if OverrideAimbotEnabled then
			isAimbotActive = Value;
		end
	end,ChangedCallback=function(New)
		aimkey = New;
	end});
	AimbotGBox:AddSlider("SetAimMaxMov", {Text="Movimento máximo do mouse",Default=10,Min=5,Max=20,Rounding=1,Compact=false,Callback=function(Value)
		maxMoveDistance = Value;
	end});
	AimbotGBox:AddSlider("SetMaxAimActivationDistance", {Text="Distância de ativação",Default=200,Min=1,Max=800,Rounding=1,Compact=false,Callback=function(Value)
		AimDistance = Value;
	end});
	AimbotGBox:AddDivider();
	AimbotGBox:AddSlider("SetFOVRadius", {Text="Radius da FOV",Default=150,Min=5,Max=360,Rounding=1,Compact=false,Callback=function(Value)
		CircleRadius = Value;
	end});
	AimbotGBox:AddSlider("SetFOVThick", {Text="Espessura da FOV",Default=2,Min=0.1,Max=3,Rounding=1,Compact=false,Callback=function(Value)
		CircleThickness = Value;
	end});
	AimbotGBox:AddSlider("SetFOVTransparency", {Text="Transparência da FOV",Default=1,Min=0.1,Max=1,Rounding=1,Compact=false,Callback=function(Value)
		CircleTransparency = Value;
	end});
	AimbotGBox:AddSlider("SetFOVSides", {Text="Lados do polígono da FOV",Default=64,Min=8,Max=64,Rounding=1,Compact=false,Callback=function(Value)
		CircleSides = Value;
	end});
end
local HitboxGBox = Tabs.Combate:AddRightGroupbox("Hitbox");
HitboxGBox:AddToggle("HitboxToggle", {Text="Hitbox",Default=false,Tooltip="Determina se o Hitbox Extender está ativado.",Callback=function(Value)
	if (Value == false) then
		for _, v in ipairs(Players) do
			if v.Character then
				RestorePartSize(v.Character);
			end
		end
		return;
	else
		HitboxEnabled = true;
		for _, v in ipairs(Players) do
			if v.Character then
				RestorePartSize(v.Character);
				for _, plr in ipairs(game.Players:GetPlayers()) do
					if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
						if ((plr ~= p1) and HitboxEnabled) then
							setup(plr);
						end
					end
				end
			end
		end
	end
end});
HitboxGBox:AddToggle("IgnoreNiggerianTeam77", {Text="Ignore Team",Default=false,Tooltip="Ignora o seu time.",Callback=function(Value)
	TeamIgnoreHitbox = Value;
	for _, v in ipairs(Players) do
		if v.Character then
			RestorePartSize(v.Character);
		end
	end
	for _, v in ipairs(Players) do
		if v.Character then
			RestorePartSize(v.Character);
			for _, plr in ipairs(game.Players:GetPlayers()) do
				if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
					if ((plr ~= p1) and HitboxEnabled) then
						setup(plr);
					end
				end
			end
		end
	end
end});
HitboxGBox:AddDropdown("ParteDoCorpoHbox", {Values={"Head","Torso","Left Arm","Right Arm","Left Leg","Right leg"},Default=1,Multi=false,Text="Parte do corpo",Tooltip="Selecione a parte do corpo que deseja redimensionar.",Callback=function(Value)
	for _, v in ipairs(Players) do
		if v.Character then
			RestorePartSize(v.Character);
			for _, plr in ipairs(game.Players:GetPlayers()) do
				if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
					if ((plr ~= p1) and HitboxEnabled) then
						setup(plr);
					end
				end
			end
		end
	end
	DesiredBodyPart = Value;
end});
HitboxGBox:AddSlider("SetHBSize", {Text="Tamanho da Hitbox",Default=15,Min=1,Max=100,Rounding=1,Compact=false,Callback=function(Value)
	HitboxSize = Value;
	for _, v in ipairs(Players) do
		if v.Character then
			RestorePartSize(v.Character);
			for _, v in ipairs(Players) do
				if v.Character then
					RestorePartSize(v.Character);
					for _, plr in ipairs(game.Players:GetPlayers()) do
						if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
							if ((plr ~= p1) and HitboxEnabled) then
								setup(plr);
							end
						end
					end
				end
			end
		end
	end
end});
HitboxGBox:AddSlider("SetHBTrans", {Text="Transparência da Hitbox",Default=0.5,Min=0.1,Max=1,Rounding=1,Compact=false,Callback=function(Value)
	HitboxTransparency = Value;
	for _, v in ipairs(Players) do
		if v.Character then
			RestorePartSize(v.Character);
			for _, v in ipairs(Players) do
				if v.Character then
					RestorePartSize(v.Character);
					for _, plr in ipairs(game.Players:GetPlayers()) do
						if not (TeamIgnoreHitbox and (plr.Team == p1.Team)) then
							if ((plr ~= p1) and HitboxEnabled) then
								setup(plr);
							end
						end
					end
				end
			end
		end
	end
end});
local ESPGBox = Tabs.Visuals:AddLeftGroupbox("ESP");
ESPGBox:AddToggle("ESP3DEnabled", {Text="ESP",Default=false,Callback=function(Value)
	Settings.ESP_Enabled = Value;
end});
ESPGBox:AddToggle("ESP3DTracers", {Text="Ignorar Time",Default=true,Callback=function(Value)
	Settings.Show_Team = not Value;
end});
ESPGBox:AddToggle("zzz8914893x", {Text="Nome do jogador",Default=true,Callback=function(Value)
	Settings.Show_Names = Value;
end});
ESPGBox:AddToggle("zzz8914893x", {Text="Nome do time do jogador",Default=true,Callback=function(Value)
	Settings.Show_Team_Name = Value;
end});
ESPGBox:AddToggle("zzz8914893x", {Text="Linhas",Default=true,Callback=function(Value)
	Settings.Tracers = Value;
end});
if (Device == "PC") then
	ESPGBox:AddToggle("espniggerianass77", {Text="Linhas seguem o mouse",Default=false,Callback=function(Value)
		Settings.Tracer_FollowMouse = Value;
	end});
end
ESPGBox:AddSlider("ESP3DTracerzsThick", {Text="Espessura das caixas",Default=1,Min=0.1,Max=5,Rounding=1,Compact=false,Callback=function(Value)
	Settings.Box_Thickness = Value;
end});
ESPGBox:AddSlider("ESP3DTrfacerThick", {Text="Espessura das linhas",Default=1,Min=0.1,Max=5,Rounding=1,Compact=false,Callback=function(Value)
	Settings.Tracer_Thickness = Value;
end});
ESPGBox:AddDropdown("dropdowndenigger69", {Values={"Bottom","Middle"},Default=1,Multi=false,Text="Posição das linhas",Callback=function(Value)
	Settings.Tracer_Origin = Value;
end});
local DisfarceGBox = Tabs.Visuals:AddRightGroupbox("Disfarce");
DisfarceGBox:AddInput("Nomeinput", {Default="",Numeric=false,Finished=false,ClearTextOnFocus=true,Text="Nome (Visual)",Tooltip="Altera seu nome (apenas no cliente)",Placeholder=("@" .. LocalPlayer.Name),Callback=function(Value)
	LocalPlayer.Character.Head.Overhead.PlayerName.Text = Value;
	game:GetService("Players").LocalPlayer.PlayerGui.GameUI.MainUI.LocalPlayer.Hud.Stuffs.MainHUD.PlayerName.Text = Value;
end});
DisfarceGBox:AddInput("Nomeinput2", {Default="",Numeric=false,Finished=false,ClearTextOnFocus=true,Text="Patente (Visual)",Tooltip="Altera sua patente (apenas no cliente)",Placeholder="[HM] Homossexual",Callback=function(Value)
	LocalPlayer.Character.Head.Overhead.Patente.Text = Value;
end});
DisfarceGBox:AddInput("Nomeinput3", {Default="",Numeric=false,Finished=false,ClearTextOnFocus=true,Text="Divisão (Visual)",Tooltip="Altera sua divisão (apenas no cliente)",Placeholder="N/A",Callback=function(Value)
	LocalPlayer.Character.Head.Overhead["Divisão"].Text = Value;
end});
local ArmaTweak = Tabs.Combate:AddLeftGroupbox("Modificação de armas");
ArmaTweak:AddToggle("InfAmmo", {Text="Munição infinita",Default=false,Tooltip="Não preciso pôr uma descrição para isso, certo?",Callback=function(Value)
	if (not game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") and not game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) then
		Library:Notify("Você precisa ter uma arma!");
		return;
	end
	if not Value then
		for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
				local gunConfig = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name));
				gunConfig['MagSize'] = DefaultGunAmmoValues[v.Name];
			end
		end
		for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
				local gunConfig = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name));
				gunConfig['MagSize'] = DefaultGunAmmoValues[v.Name];
			end
		end
		return;
	end
	for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			if not DefaultGunAmmoValues[v.Name] then
				DefaultGunAmmoValues[v.Name] = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['MagSize'];
			end
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['MagSize'] = 99999999999;
		end
	end
	for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			if not DefaultGunAmmoValues[v.Name] then
				DefaultGunAmmoValues[v.Name] = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['MagSize'];
			end
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['MagSize'] = 99999999999;
		end
	end
end});
ArmaTweak:AddToggle("OneShotKill", {Text="One Shot",Default=false,Tooltip="Mata o oponente com um tiro.",Callback=function(Value)
	if (not game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") and not game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) then
		Library:Notify("Você precisa ter uma arma!");
		return;
	end
	if not Value then
		for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
				local gunConfig = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name));
				gunConfig['Bullets'] = 20;
			end
		end
		for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
				local gunConfig = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name));
				gunConfig['Bullets'] = DefaultGunAmmoValues[v.Name];
			end
		end
		return;
	end
	for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			if not DefaultGunAmmoValues[v.Name] then
				DefaultGunAmmoValues[v.Name] = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Bullets'];
			end
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Bullets'] = 20;
		end
	end
	for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			if not DefaultGunAmmoValues[v.Name] then
				DefaultGunAmmoValues[v.Name] = require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Bullets'];
			end
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Bullets'] = 20;
		end
	end
end});
ArmaTweak:AddSlider("RPMGunTweak", {Text="RPM (Velocidade das balas)",Default=30,Min=1,Max=2000,Rounding=1,Compact=false,Callback=function(Value)
	if (not game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") and not game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) then
		Library:Notify("Você precisa ter uma arma!");
		return;
	end
	for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['RPM'] = Value;
		end
	end
	for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['RPM'] = Value;
		end
	end
end});
ArmaTweak:AddSlider("BalasGunTweak", {Text="Quantidade de balas disparadas",Default=1,Min=1,Max=50,Rounding=1,Compact=false,Callback=function(Value)
	if (not game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") and not game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) then
		Library:Notify("Você precisa ter uma arma!");
		return;
	end
	for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Bullets'] = Value;
		end
	end
	for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Bullets'] = Value;
		end
	end
end});
ArmaTweak:AddSlider("RangeGunTweak", {Text="Alcance das balas",Default=150,Min=1,Max=1000,Rounding=1,Compact=false,Callback=function(Value)
	if (not game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") and not game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) then
		Library:Notify("Você precisa ter uma arma!");
		return;
	end
	for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Range'] = Value;
		end
	end
	for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if (v:IsA("Tool") and v:FindFirstChild("FirePart")) then
			require(game:GetService("ReplicatedStorage").GunSystem.GunsConfigurations:FindFirstChild(v.Name))['Range'] = Value;
		end
	end
end});
Aiming.Check = function()
	if not ((Aiming.Enabled == true) and (Aiming.Selected ~= LocalPlayer) and (Aiming.SelectedPart ~= nil)) then
		return false;
	end
	local Character = Aiming.Character(Aiming.Selected);
	return true;
end;
local __index;
__index = hookmetamethod(game, "__index", function(t, k)
	if (t:IsA("Mouse") and ((k == "Hit") or (k == "Target")) and Aiming.Check()) then
		local SelectedPart = Aiming.SelectedPart;
		if (NiggerianSettings.SilentAim and ((k == "Hit") or (k == "Target"))) then
			local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * NiggerianSettings.Prediction);
			return ((k == "Hit") and Hit) or SelectedPart;
		end
	end
	return __index(t, k);
end);
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu");
MenuGroup:AddButton("Unload", function()
	Library:Unload();
end);
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default="End",NoUI=true,Text="Menu keybind"});
Library.ToggleKeybind = Options.MenuKeybind;
TManager:SetLibrary(Library);
SaveManager:SetLibrary(Library);
SaveManager:IgnoreThemeSettings();
SaveManager:SetIgnoreIndexes({"MenuKeybind"});
TManager:SetFolder("MyScriptHub");
SaveManager:SetFolder("MyScriptHub/specific-game");
SaveManager:BuildConfigSection(Tabs["UI Settings"]);
TManager:ApplyToTab(Tabs["UI Settings"]);
SaveManager:LoadAutoloadConfig();
_G.SUNSET_LOADED = true;
