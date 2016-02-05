"Disable the CMD + P to print in MacVim
if has("gui_macvim")
	macmenu &File.Print key=<nop>
endif
