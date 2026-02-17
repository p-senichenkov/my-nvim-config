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

return M
