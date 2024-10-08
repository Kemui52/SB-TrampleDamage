require "/scripts/vec2.lua"

function init()
  --if config.getParameter("base") ~= 1.0 then
	self.scale = config.getParameter("base",0.75) + math.random()*config.getParameter("randomness", 0.5)
	self.scale = config.getParameter("list") and config.getParameter("list")[math.random(1,#config.getParameter("list"))] or self.scale
	
	--This one only applies while the effect is active, and will revert afterwards
	if config.getParameter("mode") == "modify" then --(Causes incorrect scaling and risks infinite growth glitch)
		effect.addStatModifierGroup({{stat = "bodysize", effectiveMultiplier = self.scale}})
	end
	
	--This one does not get reset when the effect expires, so it's meant to be used as a base-size
	if config.getParameter("mode") == "replace" then
		status.setPersistentEffects("bodysize",{{stat = "bodysize", amount = self.scale}})
	end
 -- end

  effect.addStatModifierGroup({ --Enable various damage immunities. Looks like it's fine to apply at init.
	{stat = "invulnerable", amount = 1},
	{stat = "fireStatusImmunity", amount = 1},
	{stat = "poisonStatusImmunity", amount = 1},
	{stat = "electricStatusImmunity", amount = 1},
	{stat = "iceStatusImmunity", amount = 1},
	{stat = "lavaImmunity", amount = 1},
	{stat = "fallDamageMultiplier", effectiveMultiplier = 0}
  })
  script.setUpdateDelta(8) --Supposed to set the update rate, but it seems to happen every frame anyway?
  self.noDamageLevel = config.getParameter("noDamageLevel")
  self.trampleProjectile = config.getParameter("trampleProjectile")
  self.waitForGrowth = config.getParameter("waitForGrowth")
  self.waitForGrowthInit = self.waitForGrowth
end

function update(dt)
  if effect.duration() < 5 then
	effect.modifyDuration(5) --Make effect permanent.
  end

  if self.waitForGrowth > 0 then
	self.waitForGrowth = self.waitForGrowth - dt
	if self.waitForGrowth < self.waitForGrowthInit - 1.38 then --Time: right after SizeOfLife smooth growth starts happening.
		effect.setParentDirectives("") --Return scale to normal.
		self.waitForGrowthInit = -1000 --Disables the directive from being set repeatedly.
	elseif self.waitForGrowth < self.waitForGrowthInit - 0.266 then --Time: right before SizeOfLife incorrectly applies end scale early.
		effect.setParentDirectives("scalenearest="..(1/self.scale)..";") --Shrink player to hotfix SizeOfLife applying the end size too soon.
	end
	return --Exit code so we don't destroy the blocks we're standing on while growing.
  end
--[[ Decided it's better to just let the projectile expire on its own. Keeping track of it manually was causing too many nil errors.
if self.trampleProjectile == nil then
  self.trampleProjectile = world.spawnProjectile("trampleprojectile", mcontroller.position(), entity.id(), {0,0}, true)
end
  if world.entityExists(self.trampleProjectile) == true then
    world.callScriptedEntity(self.trampleProjectile, "projectile.setTimeToLive", 3.0)
--	sb.logInfo("Projectile time reset")
  end
  if world.entityExists(self.trampleProjectile) == true and ((math.abs(mcontroller.xVelocity()) < 3 and math.abs(mcontroller.yVelocity()) < 3 and mcontroller.onGround()) or world.type() == "unknown") then
    world.callScriptedEntity(self.trampleProjectile, "projectile.die")
	--You can only call a scripted proj if it's actually SCRIPTED in some way.
--	sb.logInfo("Projectile die")
  elseif world.entityExists(self.trampleProjectile) == false and (math.abs(mcontroller.xVelocity()) >= 3 or math.abs(mcontroller.yVelocity()) >= 3) and not (world.type() == "unknown") then
    self.trampleProjectile = world.spawnProjectile("trampleprojectile", mcontroller.position(), entity.id(), {0,0}, true)
--	sb.logInfo("Projectile spawn")
  end
--sb.logInfo("Projectile exists: "..tostring(world.entityExists(self.trampleProjectile)))
--]]
  if self.noDamageLevel < 2
  and (mcontroller.walking() or mcontroller.running() or not mcontroller.onGround()) --If moving or in the air.
  and not (world.type() == "unknown") then --Disable on ship. (anywhere else use unknown?)
    world.spawnProjectile(self.trampleProjectile.kill, mcontroller.position(), entity.id(), {0,0}, true)

	if self.noDamageLevel == 0 then
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-1, 4}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 1, 4}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-3.3, 3.4}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 3.3, 3.4}), entity.id(), {0,0}, true)
--    world.spawnProjectile(self.trampleProjectile.four,vec2.add(mcontroller.position(),{ 0, 3}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-3.3, 2}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 3.3, 2}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-3.3, 0}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 3.3, 0}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-3.3,-2}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 3.3,-2}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-3.3,-4}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 3.3,-4}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.four,vec2.add(mcontroller.position(),{ 0,-5.4}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-3.3,-6}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 3.3,-6}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{-3.3,-7.5}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.two, vec2.add(mcontroller.position(),{ 3.3,-7.5}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.one, vec2.add(mcontroller.position(),{-4.5,-8.7}), entity.id(), {0,0}, true)
    world.spawnProjectile(self.trampleProjectile.one, vec2.add(mcontroller.position(),{ 4.5,-8.7}), entity.id(), {0,0}, true)
	end
  end
--sb.logInfo("World Type is: "..world.type())
end

function uninit()
  
end

