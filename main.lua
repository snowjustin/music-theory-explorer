function love.load()
    Object = require "lib.classic"
    require "lib.note"
    
    
    -- Place 8 notes on the screen with random sizes
    MAX_WIDTH = love.graphics.getWidth() - 100
    MAX_HEIGHT = love.graphics.getHeight() - 100
    NOTE_OFFSET = 50
    ROW_OFFSET = 100

    notes = {
        Note(MAX_WIDTH / 4, MAX_HEIGHT / 4, NOTE_A),
        Note(MAX_WIDTH / 4 * 2, (MAX_HEIGHT / 4) + NOTE_OFFSET, NOTE_A .. NOTE_SHARP),
        Note(MAX_WIDTH / 4 * 3, (MAX_HEIGHT / 4), NOTE_B),
        Note(MAX_WIDTH, (MAX_HEIGHT / 4) + NOTE_OFFSET, NOTE_C),
        Note(MAX_WIDTH / 4, MAX_HEIGHT / 4 + ROW_OFFSET, NOTE_C .. NOTE_SHARP),
        Note(MAX_WIDTH / 4 * 2, (MAX_HEIGHT / 4) + ROW_OFFSET + NOTE_OFFSET, NOTE_D),
        Note(MAX_WIDTH / 4 * 3, (MAX_HEIGHT / 4) + ROW_OFFSET, NOTE_D .. NOTE_SHARP),
        Note(MAX_WIDTH, (MAX_HEIGHT / 4) + ROW_OFFSET + NOTE_OFFSET, NOTE_E),
        Note(MAX_WIDTH / 4, MAX_HEIGHT / 4 + (ROW_OFFSET*2), NOTE_F),
        Note(MAX_WIDTH / 4 * 2, (MAX_HEIGHT / 4) + (ROW_OFFSET*2) + NOTE_OFFSET, NOTE_F .. NOTE_SHARP),
        Note(MAX_WIDTH / 4 * 3, (MAX_HEIGHT / 4) + (ROW_OFFSET*2), NOTE_G),
        Note(MAX_WIDTH, (MAX_HEIGHT / 4) + (ROW_OFFSET*2) + NOTE_OFFSET, NOTE_G .. NOTE_SHARP)
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
