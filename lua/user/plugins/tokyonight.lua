return {
	'folke/tokyonight.nvim',
	event = 'VeryLazy',
	config = function ()
		vim.cmd('colorscheme tokyonight')
	end
}
