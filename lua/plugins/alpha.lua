vim.keymap.set('n', '<leader>al', ':Alpha <CR>')

local ascii = {
  neovim = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  },

  hydra = {
    [[                                   ]],
    [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
    [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
    [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
    [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
    [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
    [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
    [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
    [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
    [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
    [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
    [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
  },

  bonfire = {
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
  },

  saturn = {
    [[                                                ]],
    [[                                          _.oo. ]],
    [[                  _.u[[/;:,.         .odMMMMMM' ]],
    [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
    [[              oN88888UU[[[/;::-.        dP^     ]],
    [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
    [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
    [[            NNMMMNN888UU[[[/~.o@P^              ]],
    [[            888888888UU[[[/o@^-..               ]],
    [[           oI8888UU[[[/o@P^:--..                ]],
    [[        .@^  YUU[[[/o@^;::---..                 ]],
    [[      oMP     ^/o@P^;:::---..                   ]],
    [[   .dMMM    .o@^ ^;::---...                     ]],
    [[  dMMMMMMM@^`       `^^^^                       ]],
    [[ YMMMUP^                                        ]],
    [[  ^^                                            ]],
    [[                                                ]],
  }
}

local footers = {
  soulsborne = {
    { 'The brighter a flame, the deeper the shadow', '', '- Vendrick' },
    { 'Every age it seems, is tainted by the greed of men', '', '- Patches' },
    { 'Like a moth drawn to the flame, your wings will burn in anguish, time after time', '', '- Shrine Handmaid' },
    { 'Men are props on the stage of life, and no matter how tender, how exquisite... a lie will remain a lie!', '', '- Aldia' },
    { 'The world began without knowledge and without knowledge will it end' },
    { 'Seek strength... the rest will follow', '', '- Vendrick' },
    { 'What is bravery without a bit of recklessness?', '', 'Hawkeye Gough' },
    { 'For the curse of life is the curse of want. And so, you peer into the fog, in hope of answers' },
    { 'Only in truth, the Lords will abandon their thrones, and the Unkindled will rise. Nameless accursed undead, unfit even to be cinder. And so it is that ash seeketh embers' },
    { 'Fear not the dark, my friend. And let the feast begin!' },
    { 'There is no path. Beyond the scope of light, beyond the reach of Dark. What could possibly await us? And yet, we seek it, insatiably... such is our fate' },
    { 'You\'ve got a heart of gold. Don\'t let them take it from you' }
  },
  astronomy = {
    { 'Astronomy compels the soul to look upwards and leads us from this world to another.', '', '- Plato' },
    { 'Somewhere, something incredible is waiting to be known.', '', '- Carl Sagan' },
    { 'We are made of star-stuff.', '', '- Carl Sagan' },
    { 'The cosmos is within us. We are a way for the universe to know itself.', '', '- Carl Sagan' },
    { 'Astronomy teaches humility.', '', '- Arthur C. Clarke' },
    { 'Equipped with his five senses, man explores the universe around him and calls the adventure Science.', '', '- Edwin Hubble' },
    { 'The nitrogen in our DNA, the calcium in our teeth, the iron in our blood were made in the interiors of collapsing stars.', '', '- Carl Sagan' },
    { 'Astronomers are often misunderstood as people who gaze at stars instead of life.', '', '- Anonymous' },
    { 'We are all in the gutter, but some of us are looking at the stars.', '', '- Oscar Wilde' },
    { 'Across the sea of space, the stars are other suns.', '', '- Carl Sagan' },
    { 'The universe is under no obligation to make sense to you.', '', '- Neil deGrasse Tyson' },
    { 'For small creatures such as we, the vastness is bearable only through love.', '', '- Carl Sagan' },
    { 'Astronomy is useful because it raises us above ourselves.', '', '- Henry David Thoreau' },
    { 'To confine our attention to terrestrial matters would be to limit the human spirit.', '', '- Stephen Hawking' },
    { 'The universe seems neither benign nor hostile, merely indifferent.', '', '- Carl Sagan' },
    { 'Not only is the universe stranger than we imagine, it is stranger than we can imagine.', '', '- J.B.S. Haldane' },
    { 'The stars don’t look bigger, but they do look brighter.', '', '- Sally Ride' },
    { 'The Earth is a very small stage in a vast cosmic arena.', '', '- Carl Sagan' },
    { 'Astronomy will change your perspective forever.', '', '- Neil deGrasse Tyson' },
    { 'Look up at the stars and not down at your feet.', '', '- Stephen Hawking' }
  }
}

return {
  'goolord/alpha-nvim',

  config = function()
    local alpha                   = require('alpha')
    local dashboard               = require('alpha.themes.dashboard')
    local fortune                 = require('alpha.fortune')

    dashboard.section.buttons.val = {
      dashboard.button('l', '     last session', ':source ' .. vim.fn.stdpath('config') .. '/data/session.vim <CR>'),
      dashboard.button('s', '     settings', ':e $MYVIMRC <CR>'),
      dashboard.button('n', '     notes', ':e ~/documents/notes.md <CR>'),
      dashboard.button('q', '     quit', ':qa <CR>')
    }

    dashboard.section.header.val = ascii[Alpha_header] or 'neovim'
    if (Alpha_footer) then dashboard.section.footer.val = fortune({ fortune_list = footers[Alpha_footer] }) end

    alpha.setup(dashboard.opts)
  end
}
