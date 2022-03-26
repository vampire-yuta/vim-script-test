" 行末スペースを自動的に削除します
" Version: 1.0
" Author: yuta
" License: VIM LICENSE

" 多重ロード防止
if exists('g:loaded_sweep_trail')
	finish
endif
let g:loaded_sweep_trail = 1

" cpoptionsを一時的に待避した上で、スクリプトを読み込むのに適切なcpoptionsを設定する
let s:save_cpo = &cpo
set cpo&vim

command! -bar SweepTrail call sweep_trail#auto_sweep()

nnoremap <silent> <Plug>(sweep_trail) :<C-u>SweepTrail<CR>

if !hasmapto('<Plug>(sweep_trail)')
			\	&&	(!exists('g:sweep_trail_no_default_key_mappings')
			\				|| !g:sweep_trail_no_default_key_mappings)
	silent! nmap <unique> <Leader>sw <Plug>(sweep_trail)
endif

augroup plugin-sweep_trail
	autocmd!
	autocmd BufWritePre * call sweep_trail#auto_sweep()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

