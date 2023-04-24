local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
  theme = 'doom',
  config = {
    header = {
     [[ ]],
     [[ ]],
     [[ ██╗  ██╗███████╗     ██╗██╗   ██╗███╗   ██╗    ██████╗██╗  ██╗███████╗███╗   ██╗ ]],
     [[ ██║ ██╔╝██╔════╝     ██║██║   ██║████╗  ██║   ██╔════╝██║  ██║██╔════╝████╗  ██║ ]],
     [[ █████╔╝ █████╗       ██║██║   ██║██╔██╗ ██║   ██║     ███████║█████╗  ██╔██╗ ██║ ]],
     [[ ██╔═██╗ ██╔══╝  ██   ██║██║   ██║██║╚██╗██║   ██║     ██╔══██║██╔══╝  ██║╚██╗██║ ]],
     [[ ██║  ██╗███████╗╚█████╔╝╚██████╔╝██║ ╚████║██╗╚██████╗██║  ██║███████╗██║ ╚████║ ]],
     [[ ╚═╝  ╚═╝╚══════╝ ╚════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ]],
     [[ ]],
     [[ ]],
     [[ ]],
    }, --your header
    center = {
      {
        icon = ' ',
        desc = 'Projects                          ',
        key = 'p',
        keymap = 'p',
        action = 'Telescope projects'
      },
      {
        icon = ' ',
        desc = 'Find Files                        ',
        key = 'f',
        keymap = 'f',
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        desc = 'Search Text                       ',
        key = 't',
        keymap = 's',
        action = 'Telescope live_grep'
      },
      {
        icon = ' ',
        desc = 'Recent Files                      ',
        key = 'f',
        keymap = 'r',
        action = 'Telescope oldfiles'
      },
    },
    footer = {HardwareSecurityLab}  --your footer
  }
})
