function init()
  self.multiJumpCount = config.getParameter("multiJumpCount")
  self.multiJumpModifier = config.getParameter("multiJumpModifier")
  refreshJumps()

  self.trampleEffect = config.getParameter("trampleEffect")
  self.movementSettings = config.getParameter("movementSettings")
end

function update(args)
  if not status.uniqueStatusEffectActive(self.trampleEffect) then
    status.addEphemeralEffect(self.trampleEffect, 10)
  end
  if not status.uniqueStatusEffectActive("defaultbodysize") then
    status.addEphemeralEffect("defaultbodysize", 10)
  end

  mcontroller.controlParameters(self.movementSettings)

  local jumpActivated = args.moves["jump"] and not self.lastJump
  self.lastJump = args.moves["jump"]
  updateJumpModifier()
  if jumpActivated and canMultiJump() then
    doMultiJump()
  else
    if mcontroller.groundMovement() or mcontroller.liquidMovement() then
      refreshJumps()
    end
  end
end

function uninit()
  status.removeEphemeralEffect(self.trampleEffect)
  status.removeEphemeralEffect("defaultbodysize")
end

-- after the original ground jump has finished, start applying the new jump modifier
function updateJumpModifier()
  if self.multiJumpModifier then
    if not self.applyJumpModifier
        and not mcontroller.jumping()
        and not mcontroller.groundMovement() then

      self.applyJumpModifier = true
    end

    if self.applyJumpModifier then mcontroller.controlModifiers({airJumpModifier = self.multiJumpModifier}) end
  end
end

function canMultiJump()
  return self.multiJumps > 0
      and not mcontroller.jumping()
      and not mcontroller.canJump()
      and not mcontroller.liquidMovement()
      and not status.statPositive("activeMovementAbilities")
      and math.abs(world.gravity(mcontroller.position())) > 0
end

function doMultiJump()
  mcontroller.controlJump(true)
  mcontroller.setYVelocity(math.max(0, mcontroller.yVelocity()))
  --self.multiJumps = self.multiJumps - 1
  --animator.burstParticleEmitter("multiJumpParticles")
  --animator.playSound("multiJumpSound")
  animator.playSound("boost")
end

function refreshJumps()
  self.multiJumps = self.multiJumpCount
  self.applyJumpModifier = false
end
