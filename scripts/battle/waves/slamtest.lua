local Bonetest, super = Class(Wave)

function Bonetest:onStart()
    -- Every 0.33 seconds...
    for i = 0,15 do
        local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.right - i*12 + 5, Game.battle.arena.bottom + 60, 6, 43, nil, nil, 0, 0, nil, true, 120, 0, 5, 2, 1, 6) -- floor
        local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.right - i*12 + 5, Game.battle.arena.top - 60, 6, 43, nil, nil, 0, 0, math.rad(180), true, 120, 0, 5, 2, 1, 6) -- top
        local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.right + 60, Game.battle.arena.bottom - i*12 + 5, 6, 43, nil, nil, 0, 0, math.rad(270), true, 120, 0, 5, 2, 1, 6) -- right
        local bullet = self:spawnBulletTo(Game.battle.mask, "bone_attack", Game.battle.arena.left - 60, Game.battle.arena.bottom - i*12 + 5, 6, 43, nil, nil, 0, 0, math.rad(90), true, 120, 0, 5, 2, 1, 6) -- left
    end
end

function Bonetest:update()
    -- Code here gets called every frame

    super.update(self)
end

return Bonetest