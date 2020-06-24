-- A circle that displays the note we are inspecting as a circle

Note = Object:extend()

function Note:new(x, y)
    -- circle settings
    self.x = x
    self.y = y
    self.radius = 10
    self.shrink = false
end

function Note:update(dt)
    local max_radius = 50
    local min_radius = 10

    if self.radius >= max_radius then
        self.shrink = true
    elseif self.radius <= min_radius then
        self.shrink = false
    end


    if self.shrink then
        self.radius = self.radius - 10 * dt
    else
        self.radius = self.radius + 10 * dt
    end
end

function Note:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end