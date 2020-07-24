let s:_rock_dark   = '#0f0c14'
let s:_rock        = '#181320'
let s:_rock_medium = '#36323d'
let s:_gray_dark   = '#534d5e'
let s:_gray        = '#847d91'
let s:_gray_medium = '#beb8cc'
let s:_gray_light  = '#d2c3ef'
let s:_cloud       = '#e4e0ed'
let s:_turquoise   = '#3fc997'
let s:_fluoric     = '#d0ffc3'
let s:_cyan        = '#99feff'
let s:_steel       = '#83a8d1'
let s:_powder      = '#8fc7db'
let s:_purple      = '#7470ce'
let s:_sky         = '#b3e4eb'
let s:_pink        = '#db0088'
let s:_sap         = '#fde9a2'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:_rock_dark, s:_pink, 'bold' ], [ s:_turquoise, s:_rock_dark, ] ]
let s:p.normal.middle = [ [ s:_rock_dark, s:_rock_dark ] ]
let s:p.normal.right = [ [ s:_rock_medium, s:_fluoric ], [ s:_gray, s:_rock_dark ], [ s:_gray, s:_rock_dark ], [ s:_gray, s:_rock_dark ], [ s:_gray, s:_rock_dark ] ]
let s:p.inactive.left =  [ [ s:_rock_dark, s:_rock_dark ] ]
let s:p.inactive.middle = [ [ s:_rock_dark, s:_rock_dark ] ]
let s:p.inactive.right = [ [ s:_rock_dark, s:_rock_dark, 'bold' ] ]
let s:p.insert.left = [ [ s:_rock_dark, s:_sap ], [ s:_turquoise, s:_rock_dark ] ]
let s:p.replace.left = [ [ s:_rock_dark, s:_purple ], [ s:_turquoise, s:_rock_dark ] ]
let s:p.visual.left = [ [ s:_rock_dark, s:_powder ], [ s:_turquoise, s:_rock_dark ] ]
let s:p.tabline.tabsel = [ [ s:_rock, s:_sky ] ]
let s:p.tabline.left = [ [ s:_turquoise, s:_rock_dark ] ]
let s:p.tabline.middle = [ [ s:_turquoise, s:_rock_dark ] ]
let s:p.tabline.right = [ [ s:_turquoise, s:_rock_dark ] ]

let g:lightline#colorscheme#lucid#palette = lightline#colorscheme#fill(s:p)
