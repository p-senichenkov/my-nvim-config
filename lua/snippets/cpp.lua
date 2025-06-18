local ls = require("luasnip")

return {
	--[[
namespace NAME {

}  // namespace NAME

NOTE: This creates dynamic snippet, i. e. changes to NAME are reflected in comment
('til buffer is closed)
NOTE 2: clangd doesn't provide facility to disable individual snippets.
Maybe I'll get a complete collection of custom snippets once.
See https://clangd.llvm.org/config#completion.
]] --
	ls.snippet('namesp', {
		ls.text_node('namespace '),
		ls.insert_node(1, 'name'),
		ls.text_node { ' {', '', '}  // namespace ' },
		ls.function_node(function(text)
			return text[1][1]
		end, { 1 }),
	}),
}
