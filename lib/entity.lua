-- This file serves the purpose of providing the logic for displaying and placing
-- objects in the field of view in the application.
Entity = Object:extend()

function Entity:new(label, parent, x, y)
    -- setup label
    local font = love.graphics.getFont()
    self.color = {0, 0, 1}
    self.text = label
    self.label = love.graphics.newText(font, {self.color, label})

    -- setup shape
    self.width = NOTE_MAX_RADIUS * 2    -- default to note size
    self.height = NOTE_MAX_RADIUS * 2

    if self.width > self.height then
        self.rx = self.height * CORNER_SCALING
        self.ry = self.height * CORNER_SCALING
    else
        self.rx = self.width * CORNER_SCALING
        self.ry = self.width * CORNER_SCALING
    end

    -- setup links
    self.children = {}
    self.parent = parent
    if self.parent ~= nil then
        -- self.parent.addChild(self)
        self.parent:addChild(self)
        self:updatePosition()
    else
        self.x = x
        self.y = y
        self.position = nil
    end
end

function Entity:update(dt)
    self:updatePosition()
end

function Entity:draw()
    local label_x, label_y = (self.width / 2) + self.x, (self.height / 2) + self.y
    local textWidth = self.label:getWidth()
    local textHeight = self.label:getHeight()

    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.rx, self.ry)
    love.graphics.draw(self.label, label_x, label_y, 0, 1, 1, textWidth / 2, textHeight / 2)
    if self.children ~= {} then
        for position,child in ipairs(self.children) do
            child:updatePosition(position)
            child:draw()
        end
    end
end

function Entity:updatePosition(position)
    if position ~= nil then self.position = position end

    if self.parent ~= nil then
        if self.position == POSITION_TOP then
            self.x = self.parent.x
            self.y = self.parent.y - self.parent.height - MENU_BUFFER
        elseif self.position == POSITION_RIGHT then
            self.x = self.parent.x - self.parent.width - MENU_BUFFER
            self.y = self.parent.y
        elseif self.position == POSITION_LEFT then
            self.x = self.parent.x + self.parent.width + MENU_BUFFER
            self.y = self.parent.y
        else -- POSITION_BOTTOM
            self.x = self.parent.x
            self.y = self.parent.y + self.parent.height + MENU_BUFFER
        end
    end
end

function Entity:addChild(child)
    if #self.children < 4 then
        table.insert(self.children, child)
    else
        return false
    end
end