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
    elseif key == "1" then
        Clock:setTheme(1)
        Clock:setLayout(1)
    elseif key == "2" then
        Clock:setTheme(1)
        Clock:setLayout(2)
    elseif key == "3" then
        Clock:setTheme(1)
        Clock:setLayout(3)
    elseif key == "4" then
        Clock:setTheme(2)
        Clock:setLayout(1)
    elseif key == "5" then
        Clock:setTheme(2)
        Clock:setLayout(2)
    elseif key == "6" then
        Clock:setTheme(2)
        Clock:setLayout(3)
    elseif key == "space" then
        Clock:showTime()
    elseif key == "c" then
        Clock:toggleColor()
    elseif key == "b" then
        Clock:toggleScale()
    end
end
