require("/scripts/vec2.lua")
--This is a copy-paste of gprconsoleobject.lua, changes are marked with EDIT_HERE
function init()
  debugMode = false
  GPRregion = 5
  GPRrect = {entity.position()[1]-GPRregion, entity.position()[2]-GPRregion, entity.position()[1]+GPRregion, entity.position()[2]+GPRregion}
  
  -- id, position
  stationInfo = { -2323 --[[entity.id()--]], entity.position() } --EDIT_HERE
  
  self.senderEntityPosition = entity.position()
	self.scanMatrix = {}
	self.bounds = {-195, -105, 195, 105}
  
  retryScan = false
  
  script.setUpdateDelta(15)
  
	liquidIndex = {
		[6] = 4, ["healingliquid"] = 4, [10] = 4,
		[2] = 5, ["lava"] = 5, [8] = 5, ["corelava"] = 5,
		[3] = 6, ["poison"] = 6,
		[11] = 7, ["fuel"] = 7, [5] = 7, ["liquidoil"] = 7
	}

  if world.getProperty("GPR station") == nil then
    world.setProperty("GPR station", stationInfo)
  end --EDIT_HERE moved from update()
end

function uninit() --EDIT_HERE making sure nil actually gets set, and since it does, make sure this dies
 sb.logInfo("GPR stagehand uninit")
 die()
 stagehand.die()
end

function update(dt)
  --sb.logInfo("GPRrect: %s", GPRrect)
  if debugMode then
    world.debugLine(entity.position(), { entity.position()[1]-GPRregion, entity.position()[2] }, "green")
    world.debugLine(entity.position(), { entity.position()[1], entity.position()[2]-GPRregion }, "green")
    world.debugLine(entity.position(), { entity.position()[1]+GPRregion, entity.position()[2] }, "green")
    world.debugLine(entity.position(), { entity.position()[1], entity.position()[2]+GPRregion }, "green")
  end

  --EDIT_HERE world.loadRegion(GPRrect)
  
  if world.getProperty("GPR station") == nil then
    uninit() --EDIT_HERE world.setProperty("GPR station", stationInfo)
  end
  
  local instruction = world.getProperty(tostring("GPR station %s instruction", stationInfo[1]))
  if instruction ~= nil then
    if instruction[1] == "doScan" then
      doScan(instruction[2], instruction[3])
    elseif instruction[1] == "purgeGlobalStorage" then
      purgeGlobalStorage(instruction[2])
    elseif instruction[1] == "loadWithinBounds" then
      loadWithinBounds(instruction[2], instruction[3])
    end
    
    world.setProperty(tostring("GPR station %s instruction", stationInfo[1]), nil)
  end
  
	if retryScan then
		doScan(self.senderEntityPosition, self.bounds)
	end
end

function doScan(senderEntityPosition, bounds)
  --sb.logInfo("senderEntityPosition: %s, self.senderEntityPosition: %s", senderEntityPosition, self.senderEntityPosition)
  if senderEntityPosition ~= self.senderEntityPosition then 
    purgeGlobalStorage(self.senderEntityPosition)
    self.senderEntityPosition = senderEntityPosition
  end
	if debugMode then sb.logInfo("Beginning Scan") end
	if bounds ~= nil then self.bounds = bounds end
	if loadWithinBounds(senderEntityPosition, self.bounds) then
		purgeGlobalStorage(senderEntityPosition)
		populateMatrix()
		if debugMode then sb.logInfo("%s:%s of %s:%s", self.scanMatrix[1][1], self.scanMatrix[#self.scanMatrix][#self.scanMatrix[1]], #self.scanMatrix, #self.scanMatrix[1]) end
    world.setProperty(tostring("GPR station %s scan list", self.senderEntityPosition), self.scanMatrix)
		retryScan = false
	else
		retryScan = true
	end
end

function loadWithinBounds(senderEntityPosition, bounds)
	local realBounds = {bounds[1]+senderEntityPosition[1], bounds[2]+senderEntityPosition[2], bounds[3] +senderEntityPosition[1], bounds[4]+senderEntityPosition[2]}
	return world.loadRegion(realBounds)
end

function purgeGlobalStorage(senderEntityPosition)
	world.setProperty(tostring("GPR station %s scan list", senderEntityPosition), nil)
end

function populateMatrix()
	if debugMode then sb.logInfo("Populating Matrix") end
	local adjustedBounds = {self.bounds[3] - self.bounds[1], self.bounds[4] - self.bounds[2]}
	for x=1, adjustedBounds[1] do
		self.scanMatrix[x] = {}
		for y=1, adjustedBounds[2] do
			self.scanMatrix[x][y] = getTile({self.bounds[1] + x,self.bounds[2] + y})
		end
	end
end

function getTile(inPos)
	local position = vec2.add(self.senderEntityPosition, inPos)
	local isMod = world.mod(position, "foreground")
	local isBackMod = world.mod(position, "background")
	local isTile = world.material(position, "foreground")
	local isBack = world.material(position, "background")
	local isLiquid = world.liquidAt(position)
	if isMod ~= nil then 
		return {isMod, true, 1}
	elseif isBackMod ~= nil and isTile then
		return {isBackMod, true, 1}
	elseif isBackMod ~= nil then
		return {isBackMod, true, 2}
	elseif isLiquid ~= nil then
		return {liquidIndex[isLiquid[1]] or 3, false, 3}
	elseif isTile ~= nil and isTile ~= false then
		return {2, false, 1}
	elseif isBack ~= nil and isBack ~= false then
		return {1, false, 2}
	else
		return {0, false, 0}
	end
end

function die()
  world.setProperty("GPR station", nil)
	world.setProperty(tostring("GPR station %s scan list", self.senderEntityPosition), nil)
end