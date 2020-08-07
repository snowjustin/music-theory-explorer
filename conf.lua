
function love.conf(t)
    require "lib.constants"
    t.window.width = 600
    t.window.height = 600
    t.window.minwidth = t.window.width
    t.window.minheight = t.window.height

    t.window.title = "Music Theory Visualisation"
end
