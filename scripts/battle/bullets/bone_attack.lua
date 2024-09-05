local BoneAttack, super = Class(Bullet)

function BoneAttack:init(x, y, width, height, ending, destroy, xspeed, yspeed, rot, stretching, stheight1, stheight2, stspeed, stwait)
    --Width and Height are for the inner bone
    --Ending is the bone ending sprite used
    --Destroy is destroy_on_hit
    --Stretching is whether or not the bone is shifting vertically
    --Stheight1 is the height the bone will begin to shift down at
    --Stheight2 is the height the bone will begin to shift up at
    --Stspeed is the speed the bone shifts
    --(NOT CURRENTLY IMPLEMENTED) Stwait is the time the bone will pause before changing direction at stheight

    self.sprite = Sprite(ending or "battle/bullets/sansboneending")
    self.sprite2 = Sprite(ending or "battle/bullets/sansboneending")
    --"battle/bullets/sansboneending"

    --Width is 6 for sans, 5 for pyrus
    Object.init(self, x or 0, y or 0, width, height)
    self.origin_x = 0
    self.origin_y = 0

    self.rheight = height
    self.rwidth = width

    self.layer = BATTLE_LAYERS["bullets"]
    
    self:addChild(self.sprite)
    self.boneend2 = self:addChild(self.sprite2)
    self.boneend2.y = self.boneend2.y - (self.rheight - self.sprite2.height)
    self.boneend2.rotation = math.rad(180)
    self.boneend2.x = self.boneend2.x + self.sprite2.width
    
    self.xspeed = (xspeed or 0)/5
    self.yspeed = (yspeed or 0)/5

    self.grazed = false
    self.tp = 1.6
    self.time_bonus = 0
    self.damage = 1
    self.inv_timer = 0.01
    self.destroy_on_hit = destroy or false
    self.remove_offscreen = false

    self.rotation = rot or 0
    if self.rotation > math.rad(90) and self.rotation < math.rad(360) then
        if (self.sprite.width % 2 == 0) then
            self.offsetbug = -1
        else
            self.offsetbug = 0
        end
    else
        self.offsetbug = 0
    end
    
    self.stretching = stretching or false
    self.stheight1  = stheight1  or height
    self.stheight2  = stheight2  or self.sprite.height + 1
    self.stspeed    = stspeed    or 1
    --self.stwait     = stwait     or 0

    self.mask = MaskFX(function()
        love.graphics.rectangle("fill", Game.battle.arena.left, Game.battle.arena.top, Game.battle.arena.width, Game.battle.arena.height)
    end)
    self:addFX(self.mask)
end


function BoneAttack:update()
    Object.update(self)
    self.x = self.x + (self.xspeed or 0)
    self.y = self.y + (self.yspeed or 0)
    
    if self.stretching == true then
        if stdir == nil then
            stdir = -1
        end
        if self.rheight > self.stheight1 then
            stdir = -1
        end
        if self.rheight < self.stheight2 then
            stdir = 1
        end
        self.rheight = self.rheight + stdir*self.stspeed
        self.boneend2.y = self.boneend2.y - stdir*self.stspeed
        --buffer = buffer - 1
    end

    --Future Update Stwait; spaghetti code
        --if buffer > 0 then
        --else
        --  waittime = self.stwait
        --end
        --if waittime == nil then
        --  waittime = 0
        --end
        --if buffer == nil then
        --    buffer = 0
        --end

        --if waittime > 0 then
        --    waittime = waittime - 1
        --    buffer = 2
        --else

    local xo = self.sprite.width/4 + 1
    if (self.sprite.width % 2 == 0) then
        xo = self.sprite.width/4
    end
    

    self:setHitbox(xo, -(self.rheight - (self.sprite.height/2)), self.rwidth - 1, self.rheight + 1)
end

function BoneAttack:draw()
    Draw.setColor(1, 1, 1, self.fade)

    local xo = math.ceil(self.sprite.width/4)
    if (self.sprite.width % 2 == 0) then
        xo = self.sprite.width/4
    end

    love.graphics.rectangle("fill", xo + self.offsetbug, 3, self.rwidth, -(self.rheight))

    
    Draw.setColor()

    super.draw(self)
end

return BoneAttack