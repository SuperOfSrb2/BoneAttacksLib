local StretchBonetest, super = Class(Wave)

function StretchBonetest:onStart()
    -- Every 0.33 seconds...
        --for i = 0,3 do
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.right, Game.battle.arena.bottom - 6, 5, 133, "battle/bullets/papyrusboneending", true, -5, 0, nil, true, nil, nil, 3, 0)
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.left + 6, Game.battle.arena.top - 10, 5, 133, "battle/bullets/papyrusboneending", true, 0, 5, math.rad(90), true, nil, nil, 3, 0)
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.left - 10, Game.battle.arena.top + 6, 5, 20, "battle/bullets/papyrusboneending", true, 5, 0, math.rad(180)) -- ceil
        local bullet = self:spawnBullet("bone_attack", Game.battle.arena.right - 6, Game.battle.arena.bottom - 6, 5, 20, "battle/bullets/papyrusboneending", true, 0, -5, math.rad(270)) -- right wall
        --end
end

function StretchBonetest:update()
    -- Code here gets called every frame

    super.update(self)
end

return StretchBonetest