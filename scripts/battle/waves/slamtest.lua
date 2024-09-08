local Bonetest, super = Class(Wave)

function Bonetest:onStart()
    -- Every 0.33 seconds...
    self.time = 18
    self.amount = 17
    Game.battle.timer:every(1, function()
        if self.amount == 0 then
            do return end 
        else
            self.amount = self.amount - 1
        end
        rand = math.random(4)
        if rand == 1 then
            local bullet = self:spawnBullet("slam_warn", Game.battle.arena.left + 3, Game.battle.arena.top + 3, Game.battle.arena.width/2 - 13, Game.battle.arena.height - 5, 1/2)
            Game.battle.timer:after(1/2, function()
                Assets.stopAndPlaySound("spearrise", 1, 1)
                for i = 0,15 do
                    local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.left - 60, Game.battle.arena.bottom - i*12 + 5, 6, 43, nil, nil, 0, 0, math.rad(90), true, 120, 0, 16, 2, 1, 6) -- left
                    Game.battle.timer:after(1, function()
                        bullet:remove()
                    end)
                end
            end)
        elseif rand == 2 then       
            local bullet = self:spawnBullet("slam_warn", Game.battle.arena.left + 3, Game.battle.arena.top + 3, Game.battle.arena.width - 5, Game.battle.arena.height/2 - 13, 1/2)
            Game.battle.timer:after(1/2, function()
                Assets.stopAndPlaySound("spearrise", 1, 1)
                for i = 0,15 do
                    local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.right - i*12 + 5, Game.battle.arena.top - 60, 6, 43, nil, nil, 0, 0, math.rad(180), true, 120, 0, 16, 2, 1, 6) -- top
                    Game.battle.timer:after(1, function()
                        bullet:remove()
                    end)
                end
            end)
        elseif rand == 3 then        
            local bullet = self:spawnBullet("slam_warn", Game.battle.arena.right - 2, Game.battle.arena.bottom - 2, -(Game.battle.arena.width/2 - 13), -(Game.battle.arena.height - 5), 1/2)
            Game.battle.timer:after(1/2, function()
                Assets.stopAndPlaySound("spearrise", 1, 1)
                for i = 0,15 do
                    local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.right + 60, Game.battle.arena.bottom - i*12 + 5, 6, 43, nil, nil, 0, 0, math.rad(270), true, 120, 0, 16, 2, 1, 6) -- right
                    Game.battle.timer:after(1, function()
                        bullet:remove()
                    end)
                end
            end)
        elseif rand == 4 then
            local bullet = self:spawnBullet("slam_warn", Game.battle.arena.right - 2, Game.battle.arena.bottom - 2, -(Game.battle.arena.width - 5), -(Game.battle.arena.height/2 - 13), 1/2)
            Game.battle.timer:after(1/2, function()
                Assets.stopAndPlaySound("spearrise", 1, 1)
                for i = 0,15 do              
                    local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.right - i*12 + 5, Game.battle.arena.bottom + 60, 6, 43, nil, nil, 0, 0, nil, true, 120, 0, 16, 2, 1, 6) -- floor
                    Game.battle.timer:after(1, function()
                        bullet:remove()
                    end)
                end
            end)
        end
    end)
end

function Bonetest:update()
    -- Code here gets called every frame

    super.update(self)
end

return Bonetest