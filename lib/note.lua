-- A circle that displays the note we are inspecting as a circle

Note = Entity:extend()

function Note:new(x, y, text)
    -- circle settings
    self.x = x
    self.y = y
    self.orig_x = x
    self.orig_y = y
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
    if self.activeTonic then  -- if this is the active tonic note then we just move it to the center of the screen for ease of generating menu options
        x, y = love.graphics.getWidth()/2, love.graphics.getHeight()/2
        self.x, self.y = x, y
    else
        self.x, self.y = self.orig_x, self.orig_y
    end

    love.graphics.circle("fill", x, y, self.radius)
    love.graphics.draw(self.text, x, y, 0, 1, 1, textWidth / 2, textHeight / 2)
end

function Note:mousereleased(value)
    self.activeTonic = value
end

function Note:getWidth()
    return self.radius * 2
end

function Note:getHeight()
    return self.radius * 2
end
