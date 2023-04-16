local ls = require('luasnip')

vim.keymap.set({ 'i', 's' }, '<c-n>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-p>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set('i', '<c-l>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

ls.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    store_selection_keys = '<c-s>',
})
