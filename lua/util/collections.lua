local M = {}

--- Make a set
---@param list `T`[]
---@return table<`T`, integer[]>
function M.Set(list)
    local set = {}
    for _, item in ipairs(list) do
        set[item] = {}
    end
    return set
end

-- Make a set of booleans (less memory-efficient)
--@param list `T`[]
--@return table<`T`, boolean>
function M.BoolSet(list)
    local set = {}
    for _, item in ipairs(list) do
        set[item] = true
    end
    local mt = {
        __index = function(_, _)
            return false
        end
    }
    setmetatable(set, mt)
    return set
end

return M
