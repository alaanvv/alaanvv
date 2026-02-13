vim.keymap.set('n', '<leader>al', ':Alpha <CR>')

local ascii = {
  [[⠀⠀⠀⠀⠀⠐⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠈⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⣈⣼⣄⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠉⠑⢷⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⣼⣐⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠘⡚⢧⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢃⢿⡇⠀⠀⡾⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠸⣇⠀⠀⠡⣰⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⣿⠀⢠⣄⢿⠇⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢸⡇⠜⣭⢸⡀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⡙⣿⣿⠰⢫⠁⣇⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⢰⣽⠱⡈⠋⠋⣤⡤⠳⠉⡆⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⡜⠡⠊⠑⠄⣠⣿⠃⠀⣣⠃⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠐⣼⡠⠥⠊⡂⣼⢀⣤⠠⡲⢂⡌⡄⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⣀⠝⡛⢁⡴⢉⠗⠛⢰⣶⣯⢠⠺⠀⠈⢥⠰⡀⠀⠀]],
  [[⠀⣠⣴⢿⣿⡟⠷⠶⣶⣵⣲⡀⣨⣿⣆⡬⠖⢛⣶⣼⡗⠈⠢⠀]],
  [[⢰⣹⠭⠽⢧⠅⢂⣳⠛⢿⡽⣿⢿⡿⢟⣟⡻⢾⣿⣿⡤⢴⣶⡃]],
}

local footer = {
  { 'The brighter a flame, the deeper the shadow',                                                                                                                              '', '- Vendrick' },
  { 'Every age it seems, is tainted by the greed of men',                                                                                                                       '', '- Patches' },
  { 'Like a moth drawn to the flame, your wings will burn in anguish, time after time',                                                                                         '', '- Shrine Handmaid' },
  { 'Men are props on the stage of life, and no matter how tender, how exquisite... a lie will remain a lie!',                                                                  '', '- Aldia' },
  { 'The world began without knowledge and without knowledge will it end' },
  { 'Seek strength... the rest will follow',                                                                                                                                    '', '- Vendrick' },
  { 'What is bravery without a bit of recklessness?',                                                                                                                           '', 'Hawkeye Gough' },
  { 'For the curse of life is the curse of want. And so, you peer into the fog, in hope of answers' },
  { 'Only in truth, the Lords will abandon their thrones, and the Unkindled will rise. Nameless accursed undead, unfit even to be cinder. And so it is that ash seeketh embers' },
  { 'Fear not the dark, my friend. And let the feast begin!' },
  { 'There is no path. Beyond the scope of light, beyond the reach of Dark. What could possibly await us? And yet, we seek it, insatiably... such is our fate' },
  { 'You\'ve got a heart of gold. Don\'t let them take it from you' }
}

return {
  'goolord/alpha-nvim',

  config = function()
    local alpha                   = require('alpha')
    local dashboard               = require('alpha.themes.dashboard')
    local fortune                 = require('alpha.fortune')

    dashboard.section.buttons.val = {
      dashboard.button('s', '     settings', ':e $MYVIMRC <CR>'),
      dashboard.button('n', '     notes', ':e ~/documents/notes.md <CR>'),
      dashboard.button('q', '     quit', ':qa <CR>')
    }

    dashboard.section.header.val = ascii
    dashboard.section.footer.val = fortune({ fortune_list = footer })

    alpha.setup(dashboard.opts)
  end
}
