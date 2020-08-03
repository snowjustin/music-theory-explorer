-- A circle that displays the note we are inspecting as a circle


-- Some constants about notes
NOTE_MAX_RADIUS = 40
NOTE_MIN_RADIUS = 25
NOTE_SCALE_FACTOR = 8
NOTE_A = "A"
NOTE_B = "B"
NOTE_C = "C"
NOTE_D = "D"
NOTE_E = "E"
NOTE_F = "F"
NOTE_G = "G"
NOTE_SHARP = "#"
NOTE_FLAT = "b"

Note = Object:extend()

function Note:new(x, y, text)
    -- circle settings
    self.x = x
    self.y = y
    self.radius = math.random(NOTE_MIN_RADIUS, NOTE_MAX_RADIUS)
    self.shrink = false
    local font = love.graphics.getFont()
    self.color = {0, 0, 0}
    self.text = love.graphics.newText(font, {self.color, text})
    self.activeTonic = false
end

function Note:update(dt)
    if self.radius >= NOTE_MAX_RADIUS then
        self.shrink = true
    elseif self.radius <= NOTE_MIN_RADIUS then
        self.shrink = false
    end

    if self.activeTonic then
        self.radius = NOTE_MAX_RADIUS
    elseif self.shrink then
        self.radius = self.radius - NOTE_SCALE_FACTOR * dt
    else
        self.radius = self.radius + NOTE_SCALE_FACTOR * dt
    end
end

function Note:draw()
    local textWidth = self.text:getWidth()
    local textHeight = self.text:getHeight()
    local x, y = self.x, self.y
    if self.activeTonic then
        x, y = love.graphics.getWidth()/2, love.graphics.getHeight()/2
    end

    love.graphics.circle("fill", x, y, self.radius)
    love.graphics.draw(self.text, x, y, 0, 1, 1, textWidth / 2, textHeight / 2)
end

function Note:mousereleased(value)
    self.activeTonic = value
end
