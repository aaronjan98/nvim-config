local luasnip_nodes = { "s", "sn", "t", "f", "i", "c", "d", "r", "l", "rep", "p", "m", "n", "dl", "fmt", "fmta", "conds", "types", "events", "parse", "ai" }
local conf_globals = { "vim" }

local function union(a, b)
  local result = {}
  for _, v in pairs(a) do
    table.insert(result, v)
  end
  for _, v in pairs(b) do
    table.insert(result, v)
  end
  return result
end

return {
  settings = {

    Lua = {
      diagnostics = {
        globals = union(luasnip_nodes, conf_globals)
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
