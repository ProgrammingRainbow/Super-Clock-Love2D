local function draw(self)
    love.graphics.clear()

    for i = 1, 8 do
        if self.hours[i] == 1 then
            love.graphics.setColor(self.colors[i])

            if self._theme == 1 then
                love.graphics.rectangle(
                    "fill",
                    self._h_rects[i][1],
                    self._h_rects[i][2],
                    self._dsize,
                    self._dsize
                )
            else
                love.graphics.print(
                    "1",
                    self._h_rects[i][1] + self._osize,
                    self._h_rects[i][2]
                )
            end
        else
            love.graphics.setColor(self.colors[9])

            if self._theme == 1 then
                love.graphics.rectangle(
                    "fill",
                    self._h_rects[i][1],
                    self._h_rects[i][2],
                    self._dsize,
                    self._dsize
                )
            else
                love.graphics.print(
                    "0",
                    self._h_rects[i][1] + self._osize,
                    self._h_rects[i][2]
                )
            end
        end

        if self.minutes[i] == 1 then
            love.graphics.setColor(self.colors[i])

            if self._theme == 1 then
                love.graphics.rectangle(
                    "fill",
                    self._m_rects[i][1],
                    self._m_rects[i][2],
                    self._dsize,
                    self._dsize
                )
            else
                love.graphics.print(
                    "1",
                    self._m_rects[i][1] + self._osize,
                    self._m_rects[i][2]
                )
            end
        else
            love.graphics.setColor(self.colors[9])

            if self._theme == 1 then
                love.graphics.rectangle(
                    "fill",
                    self._m_rects[i][1],
                    self._m_rects[i][2],
                    self._dsize,
                    self._dsize
                )
            else
                love.graphics.print(
                    "0",
                    self._m_rects[i][1] + self._osize,
                    self._m_rects[i][2]
                )
            end
        end

        if self.seconds[i] == 1 then
            love.graphics.setColor(self.colors[i])

            if self._theme == 1 then
                love.graphics.rectangle(
                    "fill",
                    self._s_rects[i][1],
                    self._s_rects[i][2],
                    self._dsize,
                    self._dsize
                )
            else
                love.graphics.print(
                    "1",
                    self._s_rects[i][1] + self._osize,
                    self._s_rects[i][2]
                )
            end
        else
            love.graphics.setColor(self.colors[9])

            if self._theme == 1 then
                love.graphics.rectangle(
                    "fill",
                    self._s_rects[i][1],
                    self._s_rects[i][2],
                    self._dsize,
                    self._dsize
                )
            else
                love.graphics.print(
                    "0",
                    self._s_rects[i][1] + self._osize,
                    self._s_rects[i][2]
                )
            end
        end
    end
end

return draw
