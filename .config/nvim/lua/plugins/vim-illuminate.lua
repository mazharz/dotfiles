return {
	'RRethy/vim-illuminate',
	config = function()
		require('illuminate').configure({
			under_cursor = false
		})
	end
}
