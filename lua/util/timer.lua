local M = {}

-- These functions are copied from Lua reference (see :h timer())

-- Creating a simple setTimeout wrapper
function M.setTimeout(timeout, callback)
    local timer = vim.uv.new_timer()
    timer:start(timeout, 0, function()
        timer:stop()
        timer:close()
        callback()
    end)
    return timer
end

-- Creating a simple setInterval wrapper
function M.setInterval(interval, callback)
    local timer = vim.uv.new_timer()
    timer:start(interval, interval, function()
        callback()
    end)
    return timer
end

-- And clearInterval
function M.clearInterval(timer)
    timer:stop()
    timer:close()
end

return M
