local FONT_SIZE = 36
local FONT_OFFSET = 8
local DIGIT = 36
local BORDER = 4
local SEPERATOR = 18
local TITLE = "Super Clock"

local Clock = {
    _timer = 0,
    _duration = 5,
    _show_time = false,
    _color = false,
    _layout = 1,
    _theme = 1,
}

function Clock:load()
    self:toggleScale()
    self:toggleColor()

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

function Clock:toggleScale()
    local scale = 1

    if self._small then
        scale = 2
        self._small = false
    else
        self._small = true
    end

    self._fsize = FONT_SIZE * scale
    self._osize = FONT_OFFSET * scale
    self._dsize = DIGIT * scale
    self._bsize = BORDER * scale
    self._size = self._dsize + self._bsize
    self._ssize = SEPERATOR * scale

    local font = love.graphics.newFont("fonts/freesansbold.ttf", self._fsize)
    love.graphics.setFont(font)

    self:setLayout(self._layout)
end

Clock.setLayout = require("layouts")

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
