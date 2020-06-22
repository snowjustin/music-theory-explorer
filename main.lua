function love.load()
    Object = require "lib.classic"
    require "lib.note"

    note = Note()
end

function love.update(dt)
    note:update(dt)
end

function love.draw()
    note:draw()
end