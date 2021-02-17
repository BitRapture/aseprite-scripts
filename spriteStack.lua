-- Sprite Stacking
-- Public use, v1.0
-- 2021 BitRapture


if not app.isUIAvailable then
	return 
end

-- Error message
function onError(_s)
	app.alert{ title="Error!", text=_s }
end

-- Create sprite stack
function createStack()
	local sprite = app.activeSprite
	local stack = Sprite(sprite.width, sprite.height + #sprite.frames)
	local stackCtx = stack:newCel(stack.layers[1], stack.frames[1])
	if sprite == nil then 
		onError("No active sprite selected!")
		return
	end
	
	for i = 1, #sprite.frames do
	
	
	
	end
	
end


-- Create UI dialog
local dlg = Dialog("bitrapture::spriteStack")
dlg:button{ id="createStack", text="Create Sprite Stack", selected=true, focus=false, onclick=createStack }
dlg:show{ wait=false, bounds=Rectangle(0, 0, 200, 150) }