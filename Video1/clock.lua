local DIGIT = 36
local BORDER = 4
local SIZE = DIGIT + BORDER
local SEPERATOR = 18
local TITLE = "Super Clock"

local Clock = {
    _timer = 0,
    _duration = 5,
    _show_time = false,
}

function Clock:load()
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

    self.seconds = { 0, 0, 0, 0, 0, 0, 0, 0 }
    self.minutes = { 0, 0, 0, 0, 0, 0, 0, 0 }
    self.hours = { 0, 0, 0, 0, 0, 0, 0, 0 }

    love.window.setMode(SIZE * 3 + BORDER + SEPERATOR * 2, SIZE * 8 + BORDER)
end

function Clock:showTime()
    self._timer = 0
    self._show_time = true
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

function Clock:draw()
    love.graphics.clear()
    love.graphics.setColor(1, 1, 1)

    for i = 1, 8 do
        if self.hours[i] == 1 then
            love.graphics.rectangle(
                "fill",
                self._h_rects[i][1],
                self._h_rects[i][2],
                DIGIT,
                DIGIT
            )
        end

        if self.minutes[i] == 1 then
            love.graphics.rectangle(
                "fill",
                self._m_rects[i][1],
                self._m_rects[i][2],
                DIGIT,
                DIGIT
            )
        end

        if self.seconds[i] == 1 then
            love.graphics.rectangle(
                "fill",
                self._s_rects[i][1],
                self._s_rects[i][2],
                DIGIT,
                DIGIT
            )
        end
    end
end

return Clock
