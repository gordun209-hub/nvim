local icons = {
  git = ' ',
  diagnostics = {
    Error = '✘', --   ✘
    Warn = '󰀪', -- 󰀪 󰳤 󱦄 󱗓 
    Info = 'ⁱ', --    ⁱ 󰋼 󰋽 Hint = '', --  󰌶 
  },
  status = {
    git = {
      added = '₊', --  ₊
      modified = '∗', --  ∗
      removed = '₋', --  ₋
    },
    diagnostics = {
      error = ' ',
      warn = ' ',
      info = ' ',
      hint = '󰌶 ',
    },
    filename = {
      modified = '+',
      readonly = '🔒',
      zoomed = '🔎',
    },
  },
  -- Default completion kind symbols.
  kinds = {
    Array = '󰅪 ', --  󰅪 󰅨 󱃶
    Boolean = '◩ ', --  ◩ 󰔡 󱃙 󰟡 󰨙
    Class = '󰌗 ', --  󰌗 󰠱 𝓒
    Color = '󰏘 ', -- 󰸌 󰏘
    Constant = '󰏿 ', --   󰏿
    Constructor = '󰆧 ', --  󰆧   
    Copilot = ' ', -- 
    Enum = '󰕘 ', --  󰕘  ℰ 
    EnumMember = ' ', --  
    Event = ' ', --  
    Field = ' ', -- 󰄶  󰆨  󰀻 󰃒
    File = ' ', --    󰈔 󰈙
    Folder = ' ', --   󰉋
    Function = '󰊕 ', --  󰊕 
    Interface = ' ', --    
    Key = ' ', -- 
    Keyword = ' ', --   󰌋 
    Method = '󰆧 ', --  󰆧 ƒ
    Module = ' ', --   󰅩 󰆧 󰏗
    Namespace = ' ', --   󰅩
    Null = ' ', --  󰟢
    Number = '󰎠 ', --  󰎠 
    Object = ' ', --   󰅩
    Operator = '󰃬 ', --  󰃬 󰆕 +
    Package = ' ', --   󰏖 󰏗
    Property = '󰖷 ', --  󰜢  
    Reference = '󰈝 ', --  󰈝 󰈇
    Snippet = ' ', --  󰘌 ⮡   
    String = '󰅳 ', --  󰅳
    Struct = ' ', --   𝓢 󰙅 󱏒
    Text = ' ', --   󰉿 𝓐
    TypeParameter = ' ', --  󰊄 𝙏
    Unit = ' ', --   󰑭 
    Value = ' ', --   󰀬 󰎠
    Variable = ' ', --   󰀫 
  },
}
return icons
