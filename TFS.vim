function! TFSetBin(binpath)
	let g:tfvim_bin = a:binpath
endfunction

function! TFget(...)
	let rec = 0
	let all = 0
	let prev = 0
	let files = ""
	for i in range(1, a:0)
		if a:[i] == "-R"
			let rec = 1
		elseif a:[i] == "-P"
			let prev = 1
		elseif a:[i] == "-A"
			let all = 1
		else
			let files = files . '"' . a:[i] . '" '
		endif
	endfor
	let arg = ( rec? "/recursive " : "" ) . ( all? "/all " : "" ) . ( prev? "/preview" : "" ) . " " . files
	:call TFresult('get '.arg, '""'.g:tfvim_bin.'" get ' . arg . '"')  
endfunction
command! -complete=file -nargs=* TFget :call TFget(&lt;f-args>)

function! TFadd(...)
	let rec = 0
	let files = ""
	for i in range(1, a:0)
		if a:[i] == "-R"
			let rec = 1
		else
			let files = files . '"' . a:[i] . '" '
		endif
	endfor
	let arg = (rec? "/recursive" : "") . " " . files
	:call TFresult('add '.arg, '""'.g:tfvim_bin.'" add ' . arg . '"')
endfunction
command! -complete=file -nargs=* TFadd :call TFadd(&lt;f-args>)

function! TFdelete(...)
	let rec = 0
	let files = ""
	for i in range(1, a:0)
		if a:[i] == "-R"
			let rec = 1
		else
			let files = files . '"' . a:[i] . '" '
		endif
	endfor
	let arg = (rec? "/recursive" : "") . ' ' . files
	:call TFresult('delete '.arg, '""'.g:tfvim_bin.'" delete ' . arg . '"')
endfunction
command! -complete=file -nargs=* TFdelete :call TFdelete(&lt;f-args>)

function! TFundo(...)
	let rec = 0
	let files = ""
	for i in range(1, a:0)
		if a:[i] == "-R"
			let rec = 1
		else
			let files = files . '"' . a:[i] . '" '
		endif
	endfor
	let arg = (rec? "/recursive" : "") . ' ' . files
	:call TFresult('undo '.arg,'""'.g:tfvim_bin.'" undo ' . arg . '"')
endfunction
command! -complete=file -nargs=* TFundo :call TFundo(&lt;f-args>)

function! TFcheckout(...)
	let rec = 0
	let files = ""
	for i in range(1, a:0)
		if a:[i] == "-R"
			let rec = 1
		else
			let files = files . '"' . a:[i] . '" '
		endif
	endfor
	let arg = (rec? "/recursive" : "") . ' ' . files
	:call TFresult('checkout '.arg, '""'.g:tfvim_bin.'" checkout ' . arg . '"')
endfunction
command! -complete=file -nargs=* TFcheckout :call TFcheckout(&lt;f-args>)

function! TFcheckin(...)
	let rec = 0
	let files = ""
	for i in range(1, a:0)
		if a:[i] == "-R"
			let rec = 1
		else
			let files = files . '"' . a:[i] . '" '
		endif
	endfor
	let arg = (rec? "/recursive" : "") . ' ' . files
	:call TFresult('checkin '.arg, '""'.g:tfvim_bin.'" checkin ' . arg . '"')
endfunction
command! -complete=file -nargs=* TFcheckin :call TFcheckin(&lt;f-args>)

function! TFshelve(...)
	exe '!""'.g:tfvim_bin.'" shelve 'a:0>0? a:1 : ""'"'
endfunction
command! -complete=file -nargs=* TFshelve :call TFshelve(&lt;f-args>)

function! TFunshelve()
	exe '!""'.g:tfvim_bin.'" unshelve "'
endfunction
command! TFunshelve :call TFunshelve()

function! TFhistory()
	:call TFresult("history",'""'.g:tfvim_bin.'" history "#""')
endfunction
command! TFhistory :call TFhistory() 

function! TFresult(name, cmd)
	exe 'split '.a:name 
	setlocal noswapfile
	setlocal buftype=nofile
	setlocal modifiable
		exe '!'.a:cmd
	setlocal nomodified
	normal 1G
	wincmd J
endfunction

call TFSetBin("C:\\Program Files\ (x86)\\Microsoft\ Visual\ Studio\ 10.0\\Common7\\IDE\\TF.exe")
