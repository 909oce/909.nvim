return {
    {
     "goolord/alpha-nvim",
     config = function ()
         local alpha = require'alpha'
         local dashboard = require'alpha.themes.dashboard'
         dashboard.section.header.val = {
             [[                               __                ]],
             [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
             [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
             [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
             [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
             [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
         }
         dashboard.section.buttons.val = {
            dashboard.button( "e", "  New file" , ":ene<CR>"),
            dashboard.button( "SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f r", "󰊄  Recently opened files"),
            dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
         }
         alpha.setup(dashboard.config)
     end
  }
}
