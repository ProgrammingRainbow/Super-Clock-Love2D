local Clock = require("clock")

function love.load()
    Clock:load()
end

function love.update(dt)
    Clock:update(dt)
end

function love.draw()
    Clock:draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "space" then
        Clock:showTime()
    end
end
