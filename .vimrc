" VIM Configuration Profile

" Use the PowerLine plugin. Change Python directory if needed.
set rtp+=$HOME/.local/lib/python3.8/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Always show the command as it is being typed.
set showcmd

" Show line numbers
" set number

" My things below ---------------------------------------------------

" Set Airline Theme by Profile theme
function! SetAirlineThemeByProfile()
    " Obtém o ID do perfil atual do terminal GNOME
    let terminal_profile = system('dconf read /org/gnome/terminal/legacy/profiles:/default')

    " Remove espaços em branco e caracteres especiais do ID do perfil
    let terminal_profile = substitute(terminal_profile, '[^a-zA-Z0-9/-]', '', 'g')

    " Define o tema com base no ID do perfil
    if terminal_profile ==# '2f2884e5-e2dd-491a-8747-218457e1297d'
        let g:airline_theme='papercolor'
    else
        let g:airline_theme='bubblegum'
    endif
endfunction

" Chama a função para configurar o tema do Airline com base no perfil
" call SetAirlineThemeByProfile()

" Set theme
let g:airline_theme='angr'
