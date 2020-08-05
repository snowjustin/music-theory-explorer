-- A simple navigation system

MENU_HEIGHT = 100
MENU_WIDTH = 200
MENU_BUFFER = 20
DEFAULT_X = 10
DEFAULT_Y = 10
POSITION_TOP = 'top'
POSITION_BOTTOM = 'bottom'

Menu = Object:extend()

function Menu:new(label, parent, position)
    -- setup label
    local font = love.graphics.getFont()
    self.color = {0, 0, 1}
    self.label = love.graphics.newText(font, {self.color, label})

    -- configure size
    self.height = MENU_HEIGHT
    self.width = MENU_WIDTH
    
    -- set position of menu item
    self.position = position
    self:updateParent(parent)
    
end

function Menu:update(dt, new_parent)
    self:updateParent(new_parent)
end

function Menu:draw()
    local textWidth = self.label:getWidth()
    local textHeight = self.label:getHeight()
    local x, y = self.x, self.y
    local label_x, label_y = (self.width / 2) + x, (self.height / 2) + y
    -- because x and y for drawing rectangles indicates the top left corner we adjust the text to be placed
    -- in the center of our rectangle.
    love.graphics.rectangle("fill", x, y, self.width, self.height, self.rx, self.ry)
    love.graphics.draw(self.label, label_x, label_y, 0, 1, 1, textWidth / 2, textHeight / 2)
end

function Menu:updateParent(p)
    self.parent = p

    if p == nil then
        self.x = DEFAULT_X
        self.y = DEFAULT_Y
    else
        
        if self.position == POSITION_TOP then
            self.x = p.x - (self.width / 2)
            self.y = p.y - (p:getHeight()/2) - MENU_BUFFER - self.height -- subtracting height of menu here to not overlap
        else
            self.x = p.x - (self.width / 2)
            self.y = p.y + (p:getHeight() / 2) + MENU_BUFFER
        end
    end

    if self.width > self.height then
        self.rx = self.height * 0.325
        self.ry = self.height * 0.325
    else
        self.rx = self.width * 0.325
        self.ry = self.width * 0.325
    end
end