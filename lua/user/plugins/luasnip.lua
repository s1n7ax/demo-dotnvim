return {
	'L3MON4D3/LuaSnip',
	event = 'VeryLazy',
	version = '1.2.1',
	config = function()
		require('user.snips')
		local ls = require('luasnip')

		local M = {}

		function M.expand_or_jump()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end

		function M.jump_next()
			if ls.jumpable(1) then
				ls.jump(1)
			end
		end

		function M.jump_prev()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end

		function M.change_choice()
			if ls.choice_active() then
				ls.change_choice()
			end
		end

		function M.unload_package(package_name)
			for module_name, _ in pairs(package.loaded) do
				if string.find(module_name, '^' .. package_name) then
					package.loaded[module_name] = nil
				end
			end
		end

		function M.refresh_snippets()
			M.unload_package('user.snips')
			ls.cleanup()
		end

		local set = vim.keymap.set

		local mode = { 'i', 's' }

		set(mode, '<c-i>', M.expand_or_jump)
		set(mode, '<c-n>', M.jump_prev)
		set(mode, '<c-l>', M.change_choice)
		set(mode, ',r', M.refresh_snippets)
	end
}
