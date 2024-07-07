function init()
end

function activate(fireMode, shiftHeld)
  if fireMode == "primary" then
		activeItem.interact("ScriptPane", "/items/portablegprconsole/handheldgprconsolegui.config")
	elseif fireMode == "alt" then
		activeItem.interact("ScriptPane", "/items/portablegprconsole/handheldgprconsolegui.config")
	end
  
  animator.playSound("activate")
end

function update()
	if mcontroller.crouching() then
		activeItem.setArmAngle(-0.15)
	else
		activeItem.setArmAngle(-0.5)
	end
  
  if mcontroller.facingDirection() == 1 then
    if activeItem.hand() == "primary" then
      animator.setAnimationState("item", "front", false)
    else
      animator.setAnimationState("item", "back", false)
    end
  else
    if activeItem.hand() == "alt" then
      animator.setAnimationState("item", "front", false)
    else
      animator.setAnimationState("item", "back", false)
    end
  end
end