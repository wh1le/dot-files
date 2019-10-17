" if executable('javascript-typescript-stdio')
" 	let g:LanguageClient_serverCommands.javascript = [exepath('javascript-typescript-stdio')]
" 	autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
" else
" 	echo "javascript-typescript-stdio not installed!\n"
" 	:cq
" endif

" if executable('solargraph')
"   let g:LanguageClient_serverCommands.ruby = ['~/.rbenv/shims/solargraph', 'stdio']
"   autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
" else
"   echo "solargraph not installed run $ gem install solargraph!\n"
"   :cq
" endif

" let g:LanguageClient_rootMarkers = {
"       \   'javascript': ['tsconfig.json', '.flowconfig', 'package.json'],
"       \   'typescript': ['tsconfig.json', '.flowconfig', 'package.json'],
" 			\   'ruby': ['Gemfile', '.ruby-version']
"       \ }
