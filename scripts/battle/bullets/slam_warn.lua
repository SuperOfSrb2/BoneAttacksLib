local SlamWarn, super = Class(Bullet)

function SlamWarn:init(x, y, width, height, time)
    Object.init(self, x or 0, y or 0, width, height)
    self.origin_x = 0
    self.origin_y = 0

    self.rheight = height
    self.rwidth = width
    self.deathtime = time

    self.layer = BATTLE_LAYERS["bullets"]

    Assets.stopAndPlaySound("alert", 1, 1)
end


function SlamWarn:update()
    Object.update(self)
    Game.battle.timer:after(self.deathtime, function()
        self:remove()
    end)
end

function SlamWarn:draw()
    Draw.setColor(1, 0, 0, self.fade)

    love.graphics.setLineWidth(1)

    love.graphics.rectangle("line", 0, 0, self.rwidth, self.rheight)
    
    Draw.setColor()

    super.draw(self)
end

return SlamWarn