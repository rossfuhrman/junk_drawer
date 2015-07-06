set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype plugin indent on

syntax on

imap hh <esc>

map <Space> 20j
map <S-Space> 20k


set softtabstop=2 		" soft tab width
set tabstop=2 			" global tab width
set shiftwidth=2 		" number of spaces for un-indenting
set shiftround 			" round indent to multiple of 'shiftwidth'
set expandtab 			" expand tab characters into spaces
set autoindent 			" for filetypes that doesn't have indent rules


set number
set hlsearch

let mapleader=","

nnoremap <leader>w :w<cr>

"shortcuts to common text files
nnoremap <leader>S :e ~/Desktop/scratchpad.txt<cr>
nnoremap <leader>N :e ~/Desktop/notes.txt<cr>
nnoremap <leader>V :e ~/.vimrc<cr>
nnoremap <leader>B :e ~/.bashrc<cr>
"A = Activities - old name
nnoremap <leader>A :e ~/Documents/today_notes.txt<cr>
"H = Habitabs"
nnoremap <leader>H :e ~/Documents/today_notes.txt<cr>
"T = Today - really old name
nnoremap <leader>T :e ~/Documents/today_notes.txt<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with c-l
inoremap <c-l> <space>=><space>

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


:command WQ wq
:command Wq wq
:command W w
:command Q q


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
" :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>9 :w\|:call RunTestFile()<cr>
map <leader>8 :w\|:call RunNearestTest()<cr>
map <leader>7 :w\|:call RunTests('')<cr>
map <leader>6 :w\|:!script/features<cr>
map <leader>5 :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

" Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
" Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
" Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! MixTest()
  exec ":!mix test"
endfunction

""""
"more stuff???
"""

"added so that gx command will open a url in terminal vim on osx
let g:netrw_browsex_viewer = 'open'

"Use ctrl-p plugin for fuzzy finder
nnoremap <leader>t :CtrlP<CR>

nnoremap <leader>mt :w\|:call MixTest()<CR>

