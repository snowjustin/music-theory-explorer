function love.load()
    Object = require "lib.classic"
    require "lib.note"
    
    
    -- Place 8 notes in random places on the screen
    MAX_WIDTH = love.graphics.getWidth() - 50
    MAX_HEIGHT = love.graphics.getHeight() - 50
    MIN_WIDTH = 50
    MIN_HEIGHT = 50

    notes = {
        Note(MAX_WIDTH / 4, MAX_HEIGHT / 4, NOTE_A),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
        -- Note(),
    }
end

function love.update(dt)
    for i=1, #notes do
        notes[i]:update(dt)
    end
end

function love.draw()
    for i=1, #notes do
        notes[i]:draw()
    end
end
