# goto
Bash script to bookmark directories and jump to them using the bookmark name.

To use, put the following in your bashrc:

alias goto='. <path to the goto.sh file>'

Example:

alias goto='. $HOME/dev/goto/goto.sh'

The dot will make the script execute in the context of the console, which enables the script to change the directory.

The bookmarks are saved in the $HOME/.bookmarks text file. If you want to change the location, change the line 2 of the script.

