function love.load()
    Object = require "lib.classic"
    require "lib.constants"
    require "lib.entity"

    p = Entity("parent", nil, 200, 200)
    c1 = Entity("child1", p)
    c2 = Entity("child2", p)
    c3 = Entity("child3", p)
    c4 = Entity("child4", p)
end

function love.draw()
    p:draw()
end
