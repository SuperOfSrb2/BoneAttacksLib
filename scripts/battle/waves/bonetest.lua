local Bonetest, super = Class(Wave)

function Bonetest:onStart()
    -- Every 0.33 seconds...
        --for i = 0,3 do
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.right, Game.battle.arena.bottom - 6, 6, 136, nil, nil, -5, 0) -- floor
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.left + 6, Game.battle.arena.top - 10, 6, 136, nil, nil, 0, 5, math.rad(90)) -- left wall
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.left - 10, Game.battle.arena.top + 6, 6, 60, nil, nil, 5, 0, math.rad(180)) -- ceil
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.right - 6, Game.battle.arena.bottom - 6, 6, 60, nil, nil, 0, -5, math.rad(270)) -- right wall
        --end
end

function Bonetest:update()
    -- Code here gets called every frame

    super.update(self)
end

return Bonetest