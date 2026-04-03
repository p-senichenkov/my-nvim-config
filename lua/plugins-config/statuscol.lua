local builtin = require("statuscol.builtin")

require('statuscol').setup {
	-- Algin absolute numbers with relative
	relculright = true,

	segments = {
		{
			text = { builtin.lnumfunc },
		}
	}
}
