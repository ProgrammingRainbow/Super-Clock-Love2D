local function setLayout(self, layout)
    if layout == 1 then
        self._layout = 1
        love.window.setMode(
            self._size * 6 + self._bsize + self._ssize * 2,
            self._bsize + self._size * 4
        )

        self._h_rects = {
            { self._bsize, self._bsize },
            { self._bsize, self._size + self._bsize },
            { self._bsize, self._size * 2 + self._bsize },
            { self._bsize, self._size * 3 + self._bsize },
            { self._bsize + self._size, self._bsize },
            { self._bsize + self._size, self._size + self._bsize },
            { self._bsize + self._size, self._size * 2 + self._bsize },
            { self._bsize + self._size, self._size * 3 + self._bsize },
        }

        self._m_rects = {
            { self._bsize + self._size * 2 + self._ssize, self._bsize },
            {
                self._bsize + self._size * 2 + self._ssize,
                self._size + self._bsize,
            },
            {
                self._bsize + self._size * 2 + self._ssize,
                self._size * 2 + self._bsize,
            },
            {
                self._bsize + self._size * 2 + self._ssize,
                self._size * 3 + self._bsize,
            },
            { self._bsize + self._size * 3 + self._ssize, self._bsize },
            {
                self._bsize + self._size * 3 + self._ssize,
                self._size + self._bsize,
            },
            {
                self._bsize + self._size * 3 + self._ssize,
                self._size * 2 + self._bsize,
            },
            {
                self._bsize + self._size * 3 + self._ssize,
                self._size * 3 + self._bsize,
            },
        }

        self._s_rects = {
            { self._bsize + self._size * 4 + self._ssize * 2, self._bsize },
            {
                self._bsize + self._size * 4 + self._ssize * 2,
                self._size + self._bsize,
            },
            {
                self._bsize + self._size * 4 + self._ssize * 2,
                self._size * 2 + self._bsize,
            },
            {
                self._bsize + self._size * 4 + self._ssize * 2,
                self._size * 3 + self._bsize,
            },
            { self._bsize + self._size * 5 + self._ssize * 2, self._bsize },
            {
                self._bsize + self._size * 5 + self._ssize * 2,
                self._size + self._bsize,
            },
            {
                self._bsize + self._size * 5 + self._ssize * 2,
                self._size * 2 + self._bsize,
            },
            {
                self._bsize + self._size * 5 + self._ssize * 2,
                self._size * 3 + self._bsize,
            },
        }
    elseif layout == 2 then
        self._layout = 2
        love.window.setMode(
            self._bsize + self._size * 3 + self._ssize * 2,
            self._size * 8 + self._bsize
        )
        self._h_rects = {
            { self._bsize, self._bsize },
            { self._bsize, self._size + self._bsize },
            { self._bsize, self._size * 2 + self._bsize },
            { self._bsize, self._size * 3 + self._bsize },
            { self._bsize, self._size * 4 + self._bsize },
            { self._bsize, self._size * 5 + self._bsize },
            { self._bsize, self._size * 6 + self._bsize },
            { self._bsize, self._size * 7 + self._bsize },
        }

        self._m_rects = {
            { self._size + self._bsize + self._ssize, self._bsize },
            {
                self._size + self._bsize + self._ssize,
                self._size + self._bsize,
            },
            {
                self._size + self._bsize + self._ssize,
                self._size * 2 + self._bsize,
            },
            {
                self._size + self._bsize + self._ssize,
                self._size * 3 + self._bsize,
            },
            {
                self._size + self._bsize + self._ssize,
                self._size * 4 + self._bsize,
            },
            {
                self._size + self._bsize + self._ssize,
                self._size * 5 + self._bsize,
            },
            {
                self._size + self._bsize + self._ssize,
                self._size * 6 + self._bsize,
            },
            {
                self._size + self._bsize + self._ssize,
                self._size * 7 + self._bsize,
            },
        }

        self._s_rects = {
            { self._size * 2 + self._bsize + self._ssize * 2, self._bsize },
            {
                self._size * 2 + self._bsize + self._ssize * 2,
                self._size + self._bsize,
            },
            {
                self._size * 2 + self._bsize + self._ssize * 2,
                self._size * 2 + self._bsize,
            },
            {
                self._size * 2 + self._bsize + self._ssize * 2,
                self._size * 3 + self._bsize,
            },
            {
                self._size * 2 + self._bsize + self._ssize * 2,
                self._size * 4 + self._bsize,
            },
            {
                self._size * 2 + self._bsize + self._ssize * 2,
                self._size * 5 + self._bsize,
            },
            {
                self._size * 2 + self._bsize + self._ssize * 2,
                self._size * 6 + self._bsize,
            },
            {
                self._size * 2 + self._bsize + self._ssize * 2,
                self._size * 7 + self._bsize,
            },
        }
    elseif layout == 3 then
        self._layout = 3
        love.window.setMode(
            self._size * 8 + self._bsize,
            self._bsize + self._size * 3 + self._ssize * 2
        )

        self._h_rects = {
            { self._bsize, self._bsize },
            { self._size + self._bsize, self._bsize },
            { self._size * 2 + self._bsize, self._bsize },
            { self._size * 3 + self._bsize, self._bsize },
            { self._size * 4 + self._bsize, self._bsize },
            { self._size * 5 + self._bsize, self._bsize },
            { self._size * 6 + self._bsize, self._bsize },
            { self._size * 7 + self._bsize, self._bsize },
        }

        self._m_rects = {
            { self._bsize, self._size + self._bsize + self._ssize },
            {
                self._size + self._bsize,
                self._size + self._bsize + self._ssize,
            },
            {
                self._size * 2 + self._bsize,
                self._size + self._bsize + self._ssize,
            },
            {
                self._size * 3 + self._bsize,
                self._size + self._bsize + self._ssize,
            },
            {
                self._size * 4 + self._bsize,
                self._size + self._bsize + self._ssize,
            },
            {
                self._size * 5 + self._bsize,
                self._size + self._bsize + self._ssize,
            },
            {
                self._size * 6 + self._bsize,
                self._size + self._bsize + self._ssize,
            },
            {
                self._size * 7 + self._bsize,
                self._size + self._bsize + self._ssize,
            },
        }

        self._s_rects = {
            { self._bsize, self._size * 2 + self._bsize + self._ssize * 2 },
            {
                self._size + self._bsize,
                self._size * 2 + self._bsize + self._ssize * 2,
            },
            {
                self._size * 2 + self._bsize,
                self._size * 2 + self._bsize + self._ssize * 2,
            },
            {
                self._size * 3 + self._bsize,
                self._size * 2 + self._bsize + self._ssize * 2,
            },
            {
                self._size * 4 + self._bsize,
                self._size * 2 + self._bsize + self._ssize * 2,
            },
            {
                self._size * 5 + self._bsize,
                self._size * 2 + self._bsize + self._ssize * 2,
            },
            {
                self._size * 6 + self._bsize,
                self._size * 2 + self._bsize + self._ssize * 2,
            },
            {
                self._size * 7 + self._bsize,
                self._size * 2 + self._bsize + self._ssize * 2,
            },
        }
    end
end

return setLayout
