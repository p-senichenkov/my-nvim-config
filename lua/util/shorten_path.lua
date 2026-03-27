local M = {}

---@param str string
---@param max_len integer
---@return string
local function shorten_str(str, max_len)
    if #str >= max_len then
        return str
    end
    local one_side_len = (max_len - 1) / 2
    local begin = ''
    if (max_len - 1) % 2 == 0 then
        begin = str:sub(1, one_side_len)
    else
        begin = str:sub(1, one_side_len + 1)
    end
    local end_st = str:sub(#str - one_side_len, #str)
    return begin .. '…' .. end_st
end


---@param tab `T`[]
---@param num integer
---@return `T`[]
local function tail(tab, num)
    if #tab >= num then
        return tab
    end
    ---@type `T`[]
    local copy = {}
    local start = #tab - num
    for i = start, #tab do
        table.insert(copy, tab[i])
    end
    return copy
end

---@param entries string[]
---@param lens integer[]
local function take_lens(entries, lens)
    local result = ''
    for i, entry in ipairs(entries) do
        local stripped = ''
        if lens[i] == 1 then
            stripped = entry:sub(1, 1)
        elseif lens[i] == #entry then
            stripped = entry
        else
            stripped = entry:sub(1, lens[i] - 1) .. '…'
        end
        result = result .. stripped .. '/'
    end
    return result
end

---@param entries string[]
---@param max_len integer
---@param max_entry_len integer
---@return string
local function cut_path(entries, max_len, max_entry_len)
    if #entries * 2 > max_len then
        -- Cannot take all entries
        local max_num = max_len / 2
        local stripped_entries = tail(entries, max_num)
        ---@type integer[]
        local lens = {}
        for i, _ in ipairs(stripped_entries) do
            lens[i] = 1
        end
        return take_lens(stripped_entries, lens)
    end

    ---@type integer[]
    local max_lens = {}
    local total_len = 0
    for i, entry in ipairs(entries) do
        local len = math.min(#entry, max_entry_len)
        max_lens[i] = len
        total_len = total_len + len + 1
    end
    if total_len <= max_len then
        return take_lens(entries, max_lens)
    end

    total_len = 0
    ---@type integer[]
    local lens = {}
    for i, _ in ipairs(entries) do
        lens[i] = 1
        total_len = total_len + 2
    end

    local entry_num = #lens
    while total_len < max_len do
        if lens[entry_num] < max_lens[entry_num] then
            lens[entry_num] = lens[entry_num] + 1
            total_len = total_len + 1
        end

        entry_num = entry_num - 1
        if entry_num == 0 then
            entry_num = #lens
        end
    end
    return take_lens(entries, lens)
end

---@param path string
---@param max_len integer
---@param max_depth integer
---@param max_entry_len integer
---@return string
function M.shorten_path(path, max_len, max_depth, max_entry_len)
    ---@type string[]
    local entries = {}
    string.gsub(path, '([^/]+)', function(arg)
        table.insert(entries, arg)
    end)

    if #entries == 0 then
        return ''
    end
    if #entries == 1 then
        return entries[1]
    end

    entries = tail(entries, max_depth)

    local last_entry = entries[#entries]
    local prev_entries = entries
    table.remove(prev_entries, #prev_entries)
    local prev_entries_num = #prev_entries
    local prev_min_len = prev_entries_num * 2

    if prev_min_len + 3 < max_len then
        return cut_path(prev_entries, max_len - 3, max_entry_len) .. shorten_str(last_entry, 3)
    end
    return cut_path(prev_entries, max_len, max_entry_len) .. last_entry
end

return M
