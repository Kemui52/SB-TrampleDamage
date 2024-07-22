require("/scripts/vec2.lua")

--CORE--

function init()
  portable = false --EDIT_HERE config.getParameter("portable", false)

	dir = {}
	dir.cWise = {["up"] = "right", ["right"] = "down", ["down"] = "left", ["left"] = "up"}
	dir.cCWise = {["up"] = "left", ["right"] = "up", ["down"] = "right", ["left"] = "down"}
	dir.vecs = {["up"] = {0,1}, ["right"] = {1,0}, ["down"] = {0,-1}, ["left"] = {-1,0}}
	dir.back = {["up"] = "down", ["right"] = "left", ["down"] = "up", ["left"] = "right"}
  
  -- stuff colors
	self.colorScheme = {
  [1] = {32, 32, 32, 255}, -- background
  [2] = {255, 255, 255, 255}, -- foreground
  [3] = {0, 38, 255, 255}, -- liquid
	[4] = {0, 240, 240, 255}, -- healingliquid
	[5] = {89, 26, 0, 255}, -- lava
	[6] = {79, 175, 41, 255}, -- poison, poison gas(FU)
	[7] = {240, 0, 240, 255}, -- erchius fuel, oil, alien juice, black tar(FU)
  [8] = {155, 223, 177, 255}, -- slime, jelly
  
  -- FU liquids
  [9] = {204, 13, 0, 255}, -- blood
  [10] = {232, 244, 102, 255}, -- protocite
  [11] = {102, 179, 244, 255}, -- irradium
  [12] = {147, 255, 51, 255}, -- bio-ooze
  [13] = {5, 225, 161, 255}, -- elder fluid
  
  [14] = {89, 64, 103, 255}, -- aether
  [15] = {197, 197, 197, 255}, -- quicksand
  [16] = {174, 91, 218, 255}, -- dark water
  [17] = {225, 221, 176, 255}, -- pus
  [18] = {253, 180, 77, 255}, -- honey
  [19] = {253, 180, 77, 255}, -- liquid nitrogen
  
  -- grass
	["grass"] = {40,240,40,255},
	["alpinegrass"] = {40,240,40,255},
	["aliengrass"] = {40,240,40,255},
	["flowerygrass"] = {40,240,40,255},
	["charredgrass"] = {40,240,40,255},
	["colourfulgrass"] = {40,240,40,255},
	["snowygrass"] = {40,240,40,255},
	["heckgrass"] = {40,240,40,255},
	["hivegrass"] = {40,240,40,255},
	["hiveceilinggrass"] = {40,240,40,255},
	["junglegrass"] = {40,240,40,255},
	["tentaclegrass"] = {40,240,40,255},
	["thickgrass"] = {40,240,40,255},
	["toxicgrass"] = {40,240,40,255},
  ["ceilingslimegrass"] = {40, 240, 40, 255},
  
  -- stuff
  ["tar"] = {259, 45, 34, 255},
	["tarceiling"] = {259, 45, 34, 255},
	["tilled"] = {117, 76, 35, 255},
	["tilleddry"] = {117, 76, 35, 255},
  
  -- other stuff
  ["coal"] = {12, 23, 39, 255},
  ["corefragment"] = {255, 89, 0, 255},
  ["erchius"] = {206, 207, 219, 255},
  ["crystal"] = {56, 145, 183, 255},
  ["snow"] = {206, 207, 219, 255},
  ["ceilingsnow"] = {206, 207, 219, 255},
	["diamond"] = {58, 207, 254,255},
  
  -- ores
  -- WANILLA ORES
	["copper"] = {201,118,72, 255},
  ["iron"] = {109, 75, 64, 255},
  ["tungsten"] = {189, 217, 178, 255},
  ["silver"] = {206, 207, 219, 255},
	["gold"] = {204, 162, 46, 255},
	["titanium"]={201, 177, 211, 255},
  ["durasteel"] = {75, 77, 140, 255},
  ["aegisalt"] = {44, 125, 23, 255},
	["rubium"] = {196, 37, 58, 255},
  ["violium"] = {91, 1, 155, 255},
	["solarium"] = {237, 223, 30, 255},
	["uranium"]= {9, 186, 9, 255},
	
  -- FU ores
  ["moonstone"] = {232, 232, 76, 255},
  ["platinum"]= {211,211,207,255},
	["prislite"]= {120,252,179,255},
  ["trianglium"] = {249, 242, 34, 255},
  ["plutonium"] = {206, 14, 190, 255},
  
  -- other
	["player"] ={ 0, 255, 33, 255},
	["monster"] ={255, 0, 0, 255},
	["npc"] = {255, 216, 0, 255},
	["chest"] = {255, 255, 255, 255},
  ["pod"] = {255, 255, 255, 255},
  ["gprconsole"] = {255, 255, 255, 255},
  ["flag"] = {255, 255, 255, 255},
  ["teleport"] = {255, 255, 255, 255},
	["challengedoor"] = {255, 255, 255, 255},
	["trap"] = {255, 0, 0, 255},
  ["dungeonradar"] = {255, 255, 255, 255}
	}
  
  -- mods names
	self.modNames = {
  -- grass
	["aliengrass"] = "Freaky Alien Grass",
	["adridgrass"] = "Arid Grass",
	["alpinegrass"] = "Alpine Grass",
	["colourfulgrass"] = "Colourful Grass",
	["flowerygrass"] = "Flowery Grass",
	["ash"] = "Ash",
	["blackash"] = "Black Ash",
	["bone"] = "Bone",
	["ceilingslimegrass"] = "Slime",
	["ceilingsnow"] = "Snow",
	["charredgrass"] = "Charred Grass",
  ["crystalgrass"] = "Shiny Crystal Grass",
  ["fleshgrass"] = "Eew, Flesh Grass",
  ["grass"] = "Grass",
	["heckgrass"] = "Dammned Grass",
	["hivegrass"] = "Hive Grass",
	["hiveceilinggrass"] = "Hive Grass",
  ["junglegrass"] = "Jungle Grass",
  ["savannahgrass"] = "Savannah Grass",
  ["tentaclegrass"] = "Tentacle Grass",
	["toxicgrass"] = "Toxic Grass",
  ["snowygrass"] = "Snowy Grass",
  ["thickgrass"] = "Thick Grass",
  
  -- stuff
  ["metal"] = "Metal",
  ["sand"] = "Sand",
	["snow"] = "Snow",
	["fossil"] = "A Fossil",
  ["tilled"] = "Tilled Dirt",
	["tilleddry"] = "Tilled Dirt",
	["tar"] = "Tar",
	["tarceiling"] = "Tar",
	["roots"] = "Roots",
  ["undergrowth"] = "Undergrowth",
	["veingrowth"] = "Vein Growth",
  
  -- other stuff
  ["coal"] = "Coal",
  ["corefragment"] = "Core Fragments",
	["crystal"] = "Crystal",
  ["sulphur"] = "Sulphur",
  ["erchius"] = "Erchius Crystal",
  ["diamond"] = "Diamonds!",
  
  -- other
  
  ["player"] = "A Player",
	["monster"] = "A Monster",
	["npc"] = "An NPC",
	["chest"] = "A Chest",
  ["pod"] = "A Pod",
  ["gprconsole"] = "GPR Console",
  ["flag"] = "A Flag",
  ["teleport"] = "A Teleporter",
	["challengedoor"] = "A Challenge Door",
  ["trap"] = "A trap",
  ["dungeonradar"] = "???"
	}
  
	inputKeys = {
    left = 90,
    right = 89,
    up = 87,
    down = 88,
    w = 65,
    a = 43,
    s = 61,
    d = 46,
    space = 5
  }
	
  self.canvas = widget.bindCanvas("consoleScreenCanvas")
  self.scanMatrix = nil
	self.polyList = nil
	self.baseBounds = {-120, -105, 120, 105}
	self.bounds = self.baseBounds
	self.baseCenter = {120, 169}
	self.center = self.baseCenter
	self.currentPans = {0, 0}
	self.panDistance = {90, 70}
	self.maxPans = 25
	adjustedBounds = {self.bounds[3] - self.bounds[1], self.bounds[4] - self.bounds[2]}
	self.modPositions = {}
	self.entityPositions = {}
	self.lockInput = true
	self.entityScanCooldown = 0
	self.toolTip = {"coal", {120,105}, 0}
  self.stationFind = false
  self.instructionsQueue = {}
  
  if portable then 
    self.gprconsoleId = nil
    self.gprconsolePos = nil
    self.centralEntityPos = world.entityPosition(player.id())
    --sb.logInfo("Central Entity Pos: %s", self.centralEntityPos)
    
    script.setUpdateDelta(60)
  else
    self.gprconsoleId = -2323 --player.id() --EDIT_HERE
    self.gprconsolePos = world.entityPosition(player.id()) --EDIT_HERE
    self.centralEntityPos = self.gprconsolePos
    
    AddInstructionToQueue("doScan", self.centralEntityPos, self.bounds)
    
    script.setUpdateDelta(15)
  end
end

function update(dt)
--sb.logInfo("The world property is: "..tostring(world.getProperty("GPR station")))
  if world.getProperty("GPR station") == nil then
sb.logInfo("I spawned the stagehand")
	world.spawnStagehand(self.centralEntityPos, "gprstagehand")
  end --EDIT_HERE only stagehands and objects can use world.loadRegion  fuck knows why.


  if portable then
    FindGPR(false)
    if self.stationFind == false then return end
  end
  
  TrySetWorldPropertyFromInstructionsQueue()
  
	if self.polyList == nil then
		self.scanMatrix = world.getProperty(tostring("GPR station %s scan list", self.centralEntityPos))
    --sb.logInfo("Scan Matrix: %s", self.scanMatrix)
		if self.scanMatrix ~= nil then
      world.setProperty(tostring("GPR station %s scan list", self.centralEntityPos), nil)
			self.polyList = {}
			makePolyList()
			--sb.logInfo("%s", #self.polyList)
			self.scanMatrix = nil
			self.lockInput = false
		end
  else
    entityScan()
	end
  
	drawCanvas(true)
end

function uninit()
  world.setProperty(tostring("GPR station %s scan list", self.centralEntityPos), nil)
  world.setProperty("GPR station", nil) --EDIT_HERE
  sb.logInfo("GUI uninit")
end

function FindGPR(updateStation)
  if updateStation == true or self.stationFind == false then
    local gprStation = world.getProperty("GPR station", nil)
    --sb.logInfo("GPR station: %s", gprStation)
    if gprStation ~= nil then
      --sb.logInfo("self.stationFind = %s", self.stationFind)
      if self.stationFind == false then
        self.gprconsoleId = gprStation[1]
        self.gprconsolePos = gprStation[2]
        self.lockInput = false
        self.stationFind = true
        
        AddInstructionToQueue("doScan", self.centralEntityPos, self.bounds)
        --sb.logInfo("self.gprconsoleId: %s, self.centralEntityPos: %s, self.bounds: %s", self.gprconsoleId, self.centralEntityPos, self.bounds)
        script.setUpdateDelta(15)
      end
      
    else
      if self.stationFind == true then
        self.lockInput = true
        self.stationFind = false
        script.setUpdateDelta(60)
      end
      
      self.canvas:drawText("NO SIGNAL", {position={60, 185}, centered=true}, 25, {255,255,255,255})
      self.canvas:drawText("GPR Station not detected on planet.", {position={55, 52}}, 8, {0, 255, 0, 255})
    end
  end
end

function AddInstructionToQueue(instruction, position, bounds)
  for _,instr in ipairs(self.instructionsQueue) do
    if instruction == instr[1] then
      instr = { instruction, position, bounds }
      return
    end
  end
  
  table.insert(self.instructionsQueue, { instruction, position, bounds })
end

function TrySetWorldPropertyFromInstructionsQueue()
  --sb.logInfo("Instructions Queue: %s", self.instructionsQueue)
  if #self.instructionsQueue > 0 then
    if world.getProperty(tostring("GPR station %s instruction", self.gprconsoleId)) == nil then
      local instr = self.instructionsQueue[1]
      world.setProperty(tostring("GPR station %s instruction", self.gprconsoleId), { instr[1], instr[2], instr[3] })
      table.remove(self.instructionsQueue, 1)
    end
    
    --for i,instr in ipairs(self.instructionsQueue) do
      --world.setProperty(tostring("GPR station %s instruction", self.gprconsoleId), { instr[1], instr[2], instr[3] })
      --table.remove(self.instructionsQueue, i)
      --return
    --end
  end
end

--CALLBACKS

function PanUp()
  if not self.lockInput then
    if self.bounds[4] < self.baseBounds[4] + self.maxPans * self.panDistance[2] and self.polyList ~= {} then
			panView("up")
    end
  end
end

function PanDown()
  if not self.lockInput then
    if self.bounds[2] > self.baseBounds[2] - self.maxPans * self.panDistance[2] and self.gprconsolePos[2] + self.bounds[2] > 0 then
			panView("down")
    end
  end
end

function PanLeft()
  if not self.lockInput then
    if self.bounds[1] > self.baseBounds[1] - self.maxPans * self.panDistance[1] then
			panView("left")
    end
  end
end

function PanRight()
  if not self.lockInput then
    if self.bounds[3] < self.baseBounds[3] + self.maxPans * self.panDistance[1] then
			panView("right")
    end
  end
end

function PanCenter()
  --if not self.lockInput then
    --if self.currentPans[1] ~= 0 or self.currentPans[2] ~= 0 then
    --end
  --end
  
  panView("center")
end

--CANVAS

function canvasClickEvent(position, button, isButtonDown)
	if not isButtonDown then
		--sb.logInfo("click")
    
    -- entities
		for i,j in ipairs(self.entityPositions) do
			if vec2.mag(vec2.sub(position, j[2])) < 4 then
        --sb.logInfo("i, j: %s, %s", i, j)
				--sb.logInfo(j[1])
				self.toolTip = {j[1], position, 2, j[3]}
        --sb.logInfo("self.toolTip: %s", self.toolTip)
				drawTip()
				return nil
			end
		end
    
    -- mods
		for i,j in ipairs(self.modPositions) do
			if vec2.mag(vec2.sub(position, {j[1],j[2]})) < 4 then
				--sb.logInfo(j[3])
				self.toolTip = {j[3], position, 2} 
				drawTip()
				return nil
			end
		end
	end
end

function canvasKeyEvent(key, isKeyDown)
	if not isKeyDown and not self.lockInput then
		if (key == inputKeys.down or key == inputKeys.s) and self.bounds[2] > self.baseBounds[2] - self.maxPans * self.panDistance[2] and self.gprconsolePos[2] + self.bounds[2] > 0 then
			panView("down")
		elseif (key == inputKeys.left or key == inputKeys.a) and self.bounds[1] > self.baseBounds[1] - self.maxPans * self.panDistance[1] then
			panView("left")
		elseif (key == inputKeys.up or key == inputKeys.w) and self.bounds[4] < self.baseBounds[4] + self.maxPans * self.panDistance[2] and self.polyList ~= {} then
			panView("up")
		elseif (key == inputKeys.right or key == inputKeys.d) and self.bounds[3] < self.baseBounds[3] + self.maxPans * self.panDistance[1] then
			panView("right")
		elseif key == inputKeys.space then
			panView("center")
		end
	end
end

function panView(direction)
	self.scanMatrix = nil
	self.polyList = nil
	self.lockInput = true
	self.modPositions = {}
	self.entityPositions = {}
	self.toolTip = {"coal", {195,105}, 0}
	if direction == "left" then
		self.bounds = {self.bounds[1] - self.panDistance[1], self.bounds[2], self.bounds[3] - self.panDistance[1], self.bounds[4]}
		self.center = {self.center[1] + self.panDistance[1], self.center[2]}
		self.currentPans = {self.currentPans[1] - 1, self.currentPans[2]}
	elseif direction == "right" then
		self.bounds = {self.bounds[1] + self.panDistance[1], self.bounds[2], self.bounds[3] + self.panDistance[1], self.bounds[4]}
		self.center = {self.center[1] - self.panDistance[1], self.center[2]}
		self.currentPans = {self.currentPans[1] + 1, self.currentPans[2]}
	elseif direction == "up" then
		self.bounds = {self.bounds[1], self.bounds[2] + self.panDistance[2], self.bounds[3], self.bounds[4] + self.panDistance[2]}
		self.center = {self.center[1], self.center[2] - self.panDistance[2]}
		self.currentPans = {self.currentPans[1], self.currentPans[2] + 1}
	elseif direction == "down" then
		self.bounds = {self.bounds[1], self.bounds[2] - self.panDistance[2], self.bounds[3], self.bounds[4] - self.panDistance[2]}
		self.center = {self.center[1], self.center[2] + self.panDistance[2]}
		self.currentPans = {self.currentPans[1], self.currentPans[2] - 1}
	else
		self.bounds = tablecopy(self.baseBounds)
		self.center = tablecopy(self.baseCenter)
		self.currentPans = {0,0}
	end
  
  --if portable then
    --FindGPR(true)
  --else
    AddInstructionToQueue("doScan", self.centralEntityPos, self.bounds)
  --end
  
  drawCanvas(false)
end

function drawCanvas(doLabel)
	if self.polyList ~= nil then
    self.canvas:clear()
    
    -- draw polys
    for i,j in ipairs(self.polyList) do
			self.canvas:drawPoly(j[1], j[2], 1)
		end
    
    -- draw portable gpr position
    --if portable and self.currentPans[2] < 2 then
      --self.canvas:drawImage('/interface/entities/portablegprconsole.png', {self.center[1], self.center[2] + 3}, 0.5, {255, 255, 255}, true)
    --end
    
    -- draw entitys
    if self.entityPositions ~= {} then
			for i,j in pairs(self.entityPositions) do
        -- i: 1
        -- j: {1: player, 2: {1: 120.45, 2: 120.5}}
        --sb.logInfo("i, j: %s, %s", i, j)
        
        local entityPos = j[2]
        
        if j[1] == "chest" then
          self.canvas:drawImage('/interface/entities/chest.png', {entityPos[1], entityPos[2] + 1}, 0.5, self.colorScheme[j[1]], true)
        elseif j[1] == "pod" then
          self.canvas:drawImage('/interface/entities/pod.png', {entityPos[1], entityPos[2] + 2}, 0.5, self.colorScheme[j[1]], true)
        elseif j[1] == "gprconsole" then
          self.canvas:drawImage('/interface/entities/gprconsole.png', {entityPos[1], entityPos[2] + 3}, 0.5, self.colorScheme[j[1]], true)
        elseif j[1] == "flag" then
          self.canvas:drawImage('/interface/entities/flag.png', {entityPos[1], entityPos[2] + 3}, 0.5, self.colorScheme[j[1]], true)
        elseif j[1] == "teleport" then
          self.canvas:drawImage('/interface/entities/teleport.png', {entityPos[1], entityPos[2] + 2}, 0.5, self.colorScheme[j[1]], true)
        elseif j[1] == "challengedoor" then
          self.canvas:drawImage('/interface/entities/challengedoor.png', {entityPos[1], entityPos[2] + 3}, 0.5, self.colorScheme[j[1]], true)
        elseif j[1] == "trap" then
          self.canvas:drawImage('/interface/entities/trap.png', {entityPos[1], entityPos[2] + 0}, 0.5, self.colorScheme[j[1]], true)
        elseif j[1] == "dungeonradar" then
          self.canvas:drawImage('/interface/entities/dungeonradar.png', {entityPos[1], entityPos[2] + 3}, 0.5, self.colorScheme[j[1]], true)
        else
          self.canvas:drawImage('/interface/entities/entity.png', entityPos, 0.3, self.colorScheme[j[1]], true)
        end
			end
		end
    
    -- draw mods
		if self.modPositions ~= {} then
			for i,j in ipairs(self.modPositions) do
				self.canvas:drawRect({j[1], j[2], j[1]+1, j[2]+1}, colorFromString(j[3]) or {150,255,150,255})
			end
		end
    
    -- draw toolTip
		if self.toolTip ~= nil and self.toolTip[3] > 0 then
			self.toolTip[3] = self.toolTip[3] - 1
			--self.canvas:drawImage("/tiles/mods/"..self.toolTip[1]..".png", vec2.sub(self.toolTip[2], {64, 16}), 1)
			drawTip()
		end
    
    if doLabel == true then
      --local sectorText = {"Scanning Sector "..tostring(self.currentPans[1])..","..tostring(self.currentPans[2]),
      --  "Offset: "..tostring(self.baseCenter[1] - self.center[1]).." (X) "..tostring(self.baseCenter[2] - self.center[2]).." (Y)"}
      self.canvas:drawText("Scanning Sector "..tostring(self.currentPans[1])..","..tostring(self.currentPans[2]), {position={55, 52}}, 8, {0, 255, 0, 255})
      self.canvas:drawText("X offset: "..tostring(self.baseCenter[1] - self.center[1]), {position={55, 42}}, 8, {0, 255, 0, 255})
      self.canvas:drawText("Y offset: "..tostring(self.baseCenter[2] - self.center[2]), {position={55, 32}}, 8, {0, 255, 0, 255})
    end
	else
    self.canvas:drawText("Processing map...", {position={55, 14}}, 8, {0, 255, 0, 255} )
		--self.canvas:drawRect({0, 13, adjustedBounds[1]+1, adjustedBounds[2]+14}, {0,0,0,255})
		--self.canvas:drawText("PLEASE HOLD", {position=vec2.add(self.baseCenter,{-70,5}), centered=true}, 25, {255,255,255,255})
		--self.canvas:drawText("PROCESSING MAP", {position=vec2.add(self.baseCenter,{-100,25}), centered=true}, 25, {255,255,255,255})
	end
end

function drawTip()
	local toolText = self.modNames[self.toolTip[1]]
	local toolColor = colorFromString(self.toolTip[1])
	local toolConfig = {}
	--if type(root.itemConfig) == "function" then
		-- if toolText == nil then
			-- toolConfig = root.itemType(self.toolTip[1].."ore") 
			-- toolConfig = root.itemConfig(self.toolTip[1].."ore") or {}
			-- toolText = toolConfig.shortdescription
		-- end
		-- if toolText == nil then
			-- toolConfig = root.itemConfig(self.toolTip[1]) or {}
			-- toolText = toolConfig.shortdescription
		-- end
	--end
  if toolText then
    --sb.logInfo("Race: %s", self.toolTip[4])
    if self.toolTip[4] then -- if specimen
      local race = string.format("%s%s", string.upper(string.sub(self.toolTip[4], 0, 1)), string.sub(self.toolTip[4], 2))
      toolText = string.format("%s (%s)", toolText, race)
    end
  else
    toolText = self.toolTip[1]
    toolText = string.format("%s%s", string.upper(string.sub(toolText, 0, 1)), string.sub(toolText, 2)) -- make "tooltip" like "Tooltip"
  end
  
	if toolColor == nil then toolColor = colorFromString(toolText) or {255,255,255,255} end 
	local backTipBorder = {230,230,230,255}
	local backTipColor = {0,0,0,255}
	if toolColor[1] + toolColor[2] + toolColor[3] < 220 then 
		backTipBorder = {90,90,90,255}
		backTipColor = {200,200,200,255}
	end
	self.canvas:drawRect({1, 253, 122, 274}, backTipBorder)
	self.canvas:drawRect({3, 255, 120, 272}, backTipColor)
	self.canvas:drawText(toolText, {position = {8, 268}, centered = true}, 10, toolColor)
end

function colorFromString(text)
	local outColor = self.colorScheme[text]
	if outColor == nil then
		local tempByte = 0
		outColor = {0,0,0,255}
		for i=1,3 do
			tempByte = math.max(math.min(string.byte(text, i) or 110, 122), 97) - 97
			tempByte = tempByte + math.max(math.min(string.byte(text, i+1) or 110, 122), 97) - 97
			outColor[i] = math.floor(math.max(math.min(tempByte*5, 255), 0))
		end
		for x = 1, 14 do
			if outColor[1] + outColor[2] + outColor[3] > 70 then break end
			local index = math.random(3)
			outColor[index] = outColor[index] + 5
		end
		self.colorScheme[text] = outColor
	end
	return outColor
end

--POLY MANIPULATION

function makePolyList()
	for x = 1, adjustedBounds[1] do
		for y=1, adjustedBounds[2] do
			if type(self.scanMatrix[x][y][1]) == "string" then 
				table.insert(self.modPositions, {x+self.baseBounds[1]+self.baseCenter[1], y+self.baseBounds[2]+self.baseCenter[2], self.scanMatrix[x][y][1]})
			elseif type(self.scanMatrix[x][y][1]) == "number" and self.scanMatrix[x][y][1] ~= 0 and not self.scanMatrix[x][y][2] then craftPoly(x,y,self.scanMatrix[x][y][1])
			end
		end
	end
end

function craftPoly(x, y, iType)
	local timeout = 0
	local pos = {x, y}
	local outPoly = {vec2.add(vec2.add(pos, {self.baseBounds[1], self.baseBounds[2]}), self.baseCenter)}
	local loopComplete = false
	local direction = traceEdge(pos, self.scanMatrix[pos[1]][pos[2]][3], nil)
	local newDirection = nil
	if direction ~= nil then
		while timeout < 20000 do
			self.scanMatrix[pos[1]][pos[2]][2] = true
			pos = vec2.add(pos, dir.vecs[direction])
			if vec2.mag(vec2.sub({x, y}, pos)) == 0 then 
				break 
			end
			newDirection = traceEdge(pos, self.scanMatrix[pos[1]][pos[2]][3], direction)
			if newDirection ~= direction then 
				table.insert(outPoly, vec2.add(vec2.add(pos, {self.baseBounds[1], self.baseBounds[2]}),self.baseCenter)) 
			end
			direction = newDirection
			timeout = timeout + 1 
		end
		outPoly = {outPoly, self.colorScheme[iType]}
		--sb.logInfo("outPoly: %s", outPoly)
		table.insert(self.polyList, outPoly)
	end
end

function traceEdge(pos, iLayer, inVec)
	local left = true
	local up = true
	local right = true
	local down = true
	if pos[1] > 1 then
		left = tryBoundary(iLayer, self.scanMatrix[pos[1]-1][pos[2]][3])
	end
	if pos[2] < adjustedBounds[2] then
		up = tryBoundary(iLayer, self.scanMatrix[pos[1]][pos[2]+1][3])
	end
	if pos[1] < adjustedBounds[1] then
		right = tryBoundary(iLayer, self.scanMatrix[pos[1]+1][pos[2]][3])
	end
	if pos[2] > 1 then
		down = tryBoundary(iLayer, self.scanMatrix[pos[1]][pos[2]-1][3])
	end
	if inVec == nil then 
		if not up and left then return "up" elseif not right and up then return "right" elseif not down and right then return "down" elseif not left and down then return "left" else return nil end
	elseif inVec == "up" then
		if not left then return "left" elseif not up then return "up" elseif not right then return "right" else return "down" end 
	elseif inVec == "right" then
		if not up then return "up" elseif not right then return "right" elseif not down then return "down" else return "left" end 
	elseif inVec == "down" then
		if not right then return "right" elseif not down then return "down" elseif not left then return "left" else return "up" end 
	elseif inVec == "left" then
		if not down then return "down" elseif not left then return "left" elseif not up then return "up" else return "right" end 
	end
end

function tryBoundary(a, b)
	if a == b then return false
	elseif type(a) == "string" and type(b) == "string" then return false
	elseif type(a) == "string" and b == 2 then return false
	elseif a == 2 and type(b) == "string" then return false
	else return true
	end
end

--OTHER

function entityScan()
  AddInstructionToQueue("loadWithinBounds", self.centralEntityPos, self.bounds)
	self.entityPositions = {}
	local entityList = world.entityQuery({self.bounds[1]+self.centralEntityPos[1], 
		self.bounds[2]+self.centralEntityPos[2]}, 
		{self.bounds[3]+self.centralEntityPos[1],
		self.bounds[4]+self.centralEntityPos[2]})
	
  --sb.logInfo("GPR Entity ID's List: %s", entityList)
  
  local entityType = nil
  local entityListObjects = {}
  local entityListNonObjects = {}
  for _,j in pairs(entityList) do
    entityType = world.entityType(j)
    if self.colorScheme[entityType] ~= nil then
      table.insert(entityListNonObjects, j)
    elseif entityType == "object" and world.getObjectParameter(j, "objectName") ~= nil then
      table.insert(entityListObjects, j)
    end
  end
  
  --sb.logInfo("GPR Entity ID's List (Objects): %s", entityListObjects)
  --sb.logInfo("GPR Entity ID's List (Non Objects): %s", entityListNonObjects)
  
  for _,j in pairs(entityListObjects) do
    entityType = world.getObjectParameter(j, "objectName")
    
    if string.find(entityType, "chest") or string.find(entityType, "Chest") then
      table.insert(self.entityPositions, {"chest", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    elseif entityType == "statuspod" or string.find(entityType, "dungeonpod") then
      table.insert(self.entityPositions, {"pod", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    elseif entityType == "gprconsole" or string.find(entityType, "gprconsole") then
      table.insert(self.entityPositions, {"gprconsole", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    elseif string.find(entityType, "flag") or string.find(entityType, "Flag") then
      table.insert(self.entityPositions, {"flag", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    elseif string.find(entityType, "teleport") or string.find(entityType, "Teleport") then
      table.insert(self.entityPositions, {"teleport", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    elseif entityType == "challengedoor" or string.find(entityType, "challengedoor") then
      table.insert(self.entityPositions, {"challengedoor", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    elseif string.find(entityType, "trap") or string.find(entityType, "Trap") then
      table.insert(self.entityPositions, {"trap", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    elseif entityType == "extrateleportradar" or entityType == "extrateleportradarhome" or entityType == "extrateleportradarreturn" or entityType == "precursorescaperadar" then
      table.insert(self.entityPositions, {"dungeonradar", vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center)})
    end
  end
  
  for _,j in pairs(entityListNonObjects) do
    entityType = world.entityType(j)
    table.insert(self.entityPositions, {entityType, vec2.add(world.distance(world.entityPosition(j), self.centralEntityPos), self.center), world.entitySpecies(j) })
  end
end


--UTILITY

function tablecopy(input)
	if input == nil then return nil end
	if type(input) ~= "table" then 
		local newinput = input
		return newinput 
	end
	local newtab = {}
	for i,j in pairs(input) do
		newtab[i] = tablecopy(j)
	end
	return newtab
end