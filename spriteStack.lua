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
	stack:deleteLayer(stack.layers[1])
	if sprite == nil then 
		onError("No active sprite selected!")
		return
	end
	
	local stackC = 1
	for i = 1, #sprite.layers do
	
		if sprite.layers[i].isVisible and sprite.layers[i].isImage then
		
			for j = 1, #sprite.frames do 
				
				local cel = sprite.layers[i]:cel(j)
				if cel ~= nil then
					local ctx = stack:newLayer()
					ctx.name = "Stack " .. tostring(stackC)
					stack:newCel(ctx, 1, cel.image, Point(cel.position.x, cel.position.y + (#sprite.frames / 2) - j))
					stackC = stackC + 1
				end
			
			end
		
		end
	
	end
	
end


-- Create UI dialog
local dlg = Dialog("bitrapture::spriteStack")
dlg:button{ id="createStack", text="Create Sprite Stack", selected=true, focus=false, onclick=createStack }
dlg:show{ wait=false, bounds=Rectangle(0, 0, 200, 150) }