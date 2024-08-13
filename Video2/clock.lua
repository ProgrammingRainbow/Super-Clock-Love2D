local FONT_SIZE = 72
local DIGIT = 72
local BORDER = 8
local SIZE = DIGIT + BORDER
local SEPERATOR = 36
local TITLE = "Super Clock"

local Clock = {
    _timer = 0,
    _duration = 5,
    _show_time = false,
    _theme = 1,
}

function Clock:load()
    self:toggleColor()

    local font = love.graphics.newFont("fonts/freesansbold.ttf", FONT_SIZE)
    love.graphics.setFont(font)

    self._h_rects = {
        { BORDER, BORDER },
        { BORDER, SIZE + BORDER },
        { BORDER, SIZE * 2 + BORDER },
        { BORDER, SIZE * 3 + BORDER },
        { BORDER, SIZE * 4 + BORDER },
        { BORDER, SIZE * 5 + BORDER },
        { BORDER, SIZE * 6 + BORDER },
        { BORDER, SIZE * 7 + BORDER },
    }

    self._m_rects = {
        { SIZE + BORDER + SEPERATOR, BORDER },
        { SIZE + BORDER + SEPERATOR, SIZE + BORDER },
        { SIZE + BORDER + SEPERATOR, SIZE * 2 + BORDER },
        { SIZE + BORDER + SEPERATOR, SIZE * 3 + BORDER },
        { SIZE + BORDER + SEPERATOR, SIZE * 4 + BORDER },
        { SIZE + BORDER + SEPERATOR, SIZE * 5 + BORDER },
        { SIZE + BORDER + SEPERATOR, SIZE * 6 + BORDER },
        { SIZE + BORDER + SEPERATOR, SIZE * 7 + BORDER },
    }

    self._s_rects = {
        { SIZE * 2 + BORDER + SEPERATOR * 2, BORDER },
        { SIZE * 2 + BORDER + SEPERATOR * 2, SIZE + BORDER },
        { SIZE * 2 + BORDER + SEPERATOR * 2, SIZE * 2 + BORDER },
        { SIZE * 2 + BORDER + SEPERATOR * 2, SIZE * 3 + BORDER },
        { SIZE * 2 + BORDER + SEPERATOR * 2, SIZE * 4 + BORDER },
        { SIZE * 2 + BORDER + SEPERATOR * 2, SIZE * 5 + BORDER },
        { SIZE * 2 + BORDER + SEPERATOR * 2, SIZE * 6 + BORDER },
        { SIZE * 2 + BORDER + SEPERATOR * 2, SIZE * 7 + BORDER },
    }

    love.window.setMode(BORDER + SIZE * 3 + SEPERATOR * 2, SIZE * 8 + BORDER)

    self.seconds = { 0, 0, 0, 0, 0, 0, 0, 0 }
    self.minutes = { 0, 0, 0, 0, 0, 0, 0, 0 }
    self.hours = { 0, 0, 0, 0, 0, 0, 0, 0 }
end

function Clock:showTime()
    self._timer = 0
    self._show_time = true
end

function Clock:setTheme(theme)
    if theme == 1 then
        self._theme = 1
    elseif theme == 2 then
        self._theme = 2
    end
end

function Clock:toggleColor()
    if self._color then
        self._color = false
        self.colors = {
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(224, 224, 224) },
            { love.math.colorFromBytes(31, 31, 31) },
        }
    else
        self._color = true
        self.colors = {
            { love.math.colorFromBytes(245, 224, 220) },
            { love.math.colorFromBytes(243, 139, 168) },
            { love.math.colorFromBytes(250, 179, 135) },
            { love.math.colorFromBytes(249, 226, 175) },
            { love.math.colorFromBytes(166, 227, 161) },
            { love.math.colorFromBytes(148, 226, 213) },
            { love.math.colorFromBytes(137, 180, 250) },
            { love.math.colorFromBytes(203, 166, 247) },
            { love.math.colorFromBytes(30, 30, 46) },
        }
    end
end

function Clock:update(dt)
    local time = os.date("*t")

    local seconds = time.sec
    for i = 8, 1, -1 do
        self.seconds[i] = seconds % 2
        seconds = math.floor(seconds / 2)
    end

    local minutes = time.min
    for i = 8, 1, -1 do
        self.minutes[i] = minutes % 2
        minutes = math.floor(minutes / 2)
    end

    local hours = time.hour
    for i = 8, 1, -1 do
        self.hours[i] = hours % 2
        hours = math.floor(hours / 2)
    end

    if self._show_time then
        self._timer = self._timer + dt
        if self._timer > self._duration then
            self._show_time = false
            love.window.setTitle(TITLE)
        else
            love.window.setTitle(
                TITLE .. " " .. time.hour .. ":" .. time.min .. ":" .. time.sec
            )
        end
    end
end

Clock.draw = require("draw")

return Clock
