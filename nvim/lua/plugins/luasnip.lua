local M = {
  "L3MON4D3/LuaSnip",
}

function M.config()
  local luasnip = require "luasnip"

  luasnip.config.set_config {
    history = true,
    update_events = "TextChanged,TextChangedI",
  }
  -- Keys
  local u = require "utils"
  u.map({ "i", "s" }, "<Tab>", function()
    return luasnip.expand_or_jumpable() and luasnip.expand_or_jump() or "<Tab>"
  end, { expr = true })

  u.map({ "i", "s" }, "<S-Tab>", function()
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    end
  end)

  u.map({ "i", "s" }, "C-l", function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end)
end

return M
