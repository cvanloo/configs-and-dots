# Neovim

## From the CLI

Open a file on a specific line

```shell
nvim filename +160
```

Above command opens a file named "filename" in neovim and jumps directly to
line 160.

## Other

In the help docs, go to a keyword under the cursor by pressing K.

## Operations

An operation is usually build like this:

Operator | [Count] | Motion
:------- | :-----: | -----:
j        | 2       | w

Operator
:	The action to execute
:	j, delete

Motion
:	The element that the Operator will operate on
:	w, word

Count (Optional)
:	Number of elements (motions) to operate on
:	2, operate on two motions

### Motions

Motion | Description
:----- | :----------
0      | start of the line
^      | first non-blank character of the line
$      | end of the line
g_     | last non-blank character of the line
f(char) | to count'th occurrence of (char) to the right
F(char) | to count'th occurrence of (char) to the left
t(char) | till before count'th occurrence of (char) to the right
T(char) | till after count'th occurrence of (char) to the left
;      | repeat latest f, t, F, T count times
,      | repeat latest f, t, F, T count times in opposite direction
w      | go forward to the start of word
W      | go forward to the start of a WORD (includes non-blank characters)
e      | go forward to the end of word
E      | go forward to the end of WORD (includes non-blank characters)
b      | go backward to the start of word
B      | go backward to the start of a WORD (includes non-blank characters)
as     | a sentence


## Keybindings

I've rebound my <kbd>Capslock</kbd> key to be <kbd>ESC</kbd> instead, which is
done at OS level, not in my nvim-config.

`<C-x>`	means the Control-key (in this document just written as `Ctrl`) and x.

`<S-x>` means the Shift-key and x (in this document just written as the capital
letter `X`).

### Normal Mode

Key  | Function
:--- | :-------
F1   | Open help
j    | Move cursor down
k    | Move cursor up
h    | Move cursor left
l    | Move cursor right
x    | Delete character
i    | [Insert](#Insert-Mode) text (insert before cursor)
a    | [Append](#Insert-Mode) text (insert after cursor)
I    | [Insert](#Insert-Mode) text at start of line
A    | [Append](#Insert-Mode) text at end of line
o    | [Insert](#Insert-Mode) text below current line
O    | [Insert](#Insert-Mode) text above current line
: or <kbd>ESC</kbd> | Enter [Command Mode](#Command-Mode)
dd   | Delete current line
w    | Jump forward to the start of a word
e    | Jump forward to the end of a word
b    | Jump backward to the start of a word
dw   | Delete until start of next word
de   | Delete until end of current word
db   | Delete until start of current word
(    | Jump sentence backward
)    | Jump sentence forward
}    | Jump paragraph forward
{    | Jump paragraph backward
0    | Jump to start of line
\_ or ^| Jump to start of line excluding whitespaces
$ or - | Jump to end of line
d$ or d- | Delete until end of line
d^ or d_ | Delete until start of line excluding whitespaces
d0   | Delete until start of line
d/search | Delete from cursor position up to the next occurrence of "search"
u    | Undo
U    | Undo all changes of current line
Ctrl-r | Redo
p    | Paste _after_ cursor (from neovim clipboard, for os clipboard use <C-S-v>)
yy   | Copy current line
y(motion) | Copy motion
r(x) | Replace (with _x_)
R    | Enter Replace Mode (Allows to overwrite following text)
c(motion) | Change (deletes motion and enters [Insert Mode](#Insert-Mode))
ce   | Change until end of word
cc   | Change whole line
Ctrl-g | Show `position` and `filename`
1-Ctrl-g | Show full file path
2-Ctrl-g | Also show current buffer
G    | Move to bottom of file
gg   | Move to top of file
(line number)G | Move to line number (also works with \<line number\>gg)
/(search term)-Enter | Forward search
/(search term)\\c | Ignore case for this search
\*   | Forward-search for word under cursor
g\*   | Include matches that are not a whole word
?(search term)-Enter | Backward search
\#   | Backward-search for word under cursor
g#   | Include matches that are not a whole word
n    | Jump to next result
N    | Jump to previous result
%    | Jump to matching parentheses `(`,`[`,`{`,`}`,`]`,`)`
Ctrl-o | Go back where you came from (jump history)
Ctrl-i | Go forward again (jump history)
~    | Change (upper/lower)-case of current character
V    | Enter [Visual-Line Mode](#Visual-Mode)
v    | Enter [Visual Mode](#Visual-Mode)
v (motion) :w \<file\> | Save selected text to `file`
J    | Concatenate lines (with a single space between)
`>>`  | Indent line to the right (add indentation)
`<<` | Indent line to the left (remove indentation)
xph  | Cut, Paste, Move cursor left (Replace two characters)
zz | Center screen (Cursor to center)
z\<CR> | Center screen (Cursor to top)
z-   | Center screen (Cursor to bottom)
H    | Move cursor to top
M    | Move cursor to center
L    | Move cursor to bottom
==   | Indent current line
m[a-zA-Z] | Set mark
'[a-zA-Z] | Jump to the line of the mark
\`[zA-Z] | Jump to exact position of the mark
gx   | Open link under cursor in a webbrowser
f\<motion\> | Jump forward to `motion`. The cursor is placed onto the motion.
t\<motion\> | Jump forward to `motion`. The cursor is placed before the motion.
Ctrl-a | Increment current (or next) number
Ctrl-x | Decrement current (or next) number
zl   | Move viewport count to the right
zh   | Move viewport count to the left
zL   | Move viewport half screen-width to the right
zH   | Move viewport half screen-width to the left
.    | Repeat last command
q:   | Opens a buffer containing command history. Allows you to edit a command and execute it by pressing enter on top of it.
q/   | Same as above, but for search history.
\[M  | Go to previous end of a method.
\[m  | Go to previous stard of a method.
]M   | Go to next end of a method.
]m   | Go to next start of a method.
ZZ   | Same as :x, similar to :wq (:x writes only when changes have been made)
ZQ   | Same as :q!

#### Pane Movement (Splits)

Key  | Description
:--- | :----------
Ctrl-w j | Select pane below
Ctrl-w k | Select pane above
Ctrl-w h | Select pane left
Ctrl-w l | Select pane right
Ctrl-w x | Switch position of current pane with position of last active pane
Ctrl-w r | Rotate window positions
Ctrl-w H/L/K/J | Move window to far left/right/top/bottom
Ctrl-w T | Move split into its own tab
Ctrl-+ Ctrl-- Ctrl-> Ctrl-< | Resize split
Ctrl-= | Resize all splits to equal dimensions
Ctrl-_ | Resize window to maximal height
Ctrl-| | Resize window to maximal width

#### Tab Movement

Key  | Description
:--- | :----------
gt   | Go to next tab
gT   | Go to previous tab
(n)gt | Go to nth tab
g<kbd>Tab</kbd> | Go to last accessed tab
:tabnew {file} / :tabe[dit] {file} | Open new tab
:tabc[lose] | Close tab
:tabo[nly] | Close all tabs except current
:tabs | List all tabs and their windows
:tabm[ove] (n) | Move tab to nth position

### Insert Mode

Key  | Function
:--- | :-------
Ctrl-j | Move current line down (I have this rebound to something else)
Ctrl-k | Move current line up (I have this rebound to something else)
Ctrl-x s | (When `set spell`) Display auto correction
Ctrl-n | Select next element in completion-menu
Ctrl-p | Select previous element in completion-menu
Ctrl-e | Close completion menu
Ctrl-a | Insert last typed text
Ctrl-h | Delete character before cursor
Ctrl-w | Delete word before cursor
Ctrl-u | Delete line before cursor
Ctrl-i | Insert a tab (expandtab: spaces instead)
Ctrl-v | Insert non-digit literally (Ctrl-v \<Tab> to insert an actual tab, when expandtab is enabled)

### Visual Mode

(Also applies for visual line mode.)

Key  | Function
:--- | :-------
J    | Move selection a line down
K    | Move selection a line up
j    | Delete selected text
y    | Copy (yank) selected text
~    | Toggle (upper/lower) -case
U    | To upper case
u    | To lower case
H    | Move selected lines down
T    | Move selected lines up
gq   | Format lines (fixes indentation)
gqq  | Format entire line.
=    | Indent selection
<    | Remove indentation (indent to the left)
\>    | Add indentation (indent to the right)

#### Visual Block Mode

Enter by pressing <kbd>Ctrl-v</kbd>

### Command Mode

Use <kbd>Tab</kbd> for autocomplete.

Command | Function
:------ | :-------
:h, help (keyword) | Open help for "keyword"
:!\<command> | Execute external shell _command_
:w      | Write (Save)
:q      | Quit
:q!     | Quit without saving
:wq     | Save and quit
:zz     | Save and quit
:e \<path\> | Open _path_
:\<line number\> | Jump to line number
:s/find/replace/ | find-replace for only first occurrence
:s/find/replace/g | find-replace for all occurrences on current line
:`'<,'>`s/find/replace/g | find-replace for selection (Enter [Visual Mode](#Visual-Mode), select text, press `:`)
:`#,#`s/find/replace/g | find-replace between line `#` and line `#`
:%s/find/replace/g | find-replace in the whole file
:%s/find/replace/g<strong>c</strong> | Ask for confirmation on each result
:r \<file>  | Insert text from another `file` below cursor
:r !ls      | This also works with commands
:set ic  | Set search to case <strong>in</strong>sensitive
:set noic| Set search to case sensitive (no = off)
:set invic | Toggle search case (in)sensitive (inv = invert)
:set hls | Highlight ??? matching words
:noh    | Stop highlighting words after search
:%g/some pattern/d | % -> whole file, d -> delete all lines matching some pattern
:%g!/some pattern/d | % -> whole file, d -> delete all lines not matching some pattern
:only | close all but the current window
:%!command | Pipe the buffer through an Unix command

#### Tips & Tricks

* prefixing a command with `no` turns the function off
* prefixing a command with `inv` toggles the function
* appending an `!` to a command toggles the function

### Leader

The \<leader\> key is set to <kbd> </kbd> (Space).

Key     | Description
:------ | :----------
 s      | Replace all occurrences of a word
 nh     | Stop highlighting words after search
 j      | Move current line down
 k      | Move current line up
 m      | (Harpoon) Toggle quick-fix menu
 a      | (Harpoon) Add file to quick-fix-list
 ff or ,fs | Telescope find files
 fb     | Telescope buffers
 d or ,ld | Show LSP diagnostics
 lh     | Show LSP hover
 gd | LSP jump to definition
 gD | LSP jump to declaration
 dn | Go to next diagnostic
 dN | Go to previous diagnostic


### Terminal Mode

Key  | Description
:--- | :----------
ESC  | Leave terminal mode

### Advanced

#### Inside & Around

> NOTE: With some motions (" and ') the following will even work if your cursor
> is placed outside of the motion. In that case it will jump to the next motion
> on the _same_ line.

Key  | Description
:--- | :----------
i    | inside
a    | around
di\<motion> | Delete inside of `motion`.
di{  | Delete everything inbetween current braces.
da\<motion> | Delete around `motion`.
da{  | Delete everything inside and including current braces.
ci{  | Change (puts you in insert mode) everything inside current braces.
ci"  | Change (puts you in insert mode) everything inside current double quotes.
vi{  | Highlight everything inside current braces.
=i{  | Fix indentation between current braces.
di(  | Delete everything in-between current parentheses.
di'  | Delete everything in-between current single quotes.
yi(  | Copy (yank) everything in-between current parentheses.
f\<motion> | Jump forward to `motion`
f"   | Jump forward to next double quote.
gi   | Go to last insert location and switch to [Insert Mode](#Insert-Mode)
viw  | Highlight current word (visual - inside - word)

##### Treesitter Text Objects

Having the treesitter text objects plugin installed and configured.

Key  | Description
:--- | :----------
dif  | Delete inside function
daf  | Delete around function
dic  | Delete inside class
dac  | Delete around class

#### The G-Spot ;-)

Key  | Description
:--- | :----------
g; and g, | Jump around in changelist.
Ctrl-G | Show information about current cursor position.
g8   | Get UTF-8 code of symbol under cursor.
g<   | Reopen output of last command.
g&   | Replay last "s"-command (find command)
gJ   | Concatenate lines without inserting a space.
gU(motion) | Set `motion` to uppercase.
gUiw | Set current word to uppercase (g - uppercase - inside - word).
gUk<kbd>space</kbd> | Set everything until next space to uppercase.
gd   | Jump to local definition.
gD   | Jump to global definition.
<kbd>space</kbd>gd | (coc only) Jump to actual definition.
gf   | Jump to file (-name under cursor). (README.md)
gF   | Jump to file on line under cursor. (README.md:10)
gq   | [(Visual Mode)](#Visual-Mode) Format selected text.
(number)g_ | Jump down number-1 lines and put cursor to the end of the line.
g$, g_ | When `set wrap`, jump to the end of the current part of the wrapped line.
g??  | Rot-13 on the whole line.
g?   | Rot-13 on selected text.
gg   | To the top!
G    | To the bottom!
(number)G | Jump to line number.
gv   | Rehighlight last visual area.
gi   | Go to last insert location and switch to [Insert Mode](#Insert-Mode)
:'\<,'\>g/find/(action) | Execute action over find results.
:g/find/d | Search for `find` and `d` (delete) it. (Note that your keybindings won't work here.)
:g/find/norm! (action) | Execute any command (action) you want.
gg=G | Format whole file

##### Incrementing multiple numbers

* Enter Visual Block Mode (Ctrl-b)
* g
* Increment (Ctrl-a)

This will automatically increment all numbers like this:

```
0  ->  1
0  ->  2
0  ->  3
0  ->  4
0  ->  5
0  ->  6
0  ->  7
```

### LSP

Key  | Description
:--- | :----------
gd   | Go to definition
gD   | Go to declaration (most lsp servers only support goto definition)
gr   | Show references
gi   | Go to implementation(s)
gt   | Go to type definition
gw   | Show document symbols
gW   | Show workspace symbols

Key  | Description
:--- | :----------
,ld  | Show hover window
,lh  | Show errors/warnings
,ls  | Show signature help

Key  | Description
:--- | :----------
,la  | Show code actions
,lr  | Rename
,li  | Show incoming calls
,lo  | Show outgoing calls

### Macros

1. Start recording by pressing <kbd>q</kbd> and a char, e.g. <kbd>a</kbd>.
2. Do whatever you want to do.
3. Stop recording by pressing <kbd>q</kbd>.
4. Replay the macro by pressing <kbd>@</kbd> and the same char (e.g. <kbd>a</kbd>).

### Vimdiff

Key  | Description
:--- | :----------
dp   | put changes under cursor into the other file.
do   | obtain changes under cursor from other file.
]c   | jump to next diff
[c   | jump to previous diff

### netrw (neovims file browser)

Key | Description
:-- | :----------
\-  | Go up a directory
cd  | Make browsing directory the current working directory
d   | Create a directory
D   | Delete a file/directory
gh  | Hide/unhide dot-files
gn  | Go into directory
i   | Cycle between thin, long, wide, and tree listings
I   | Toggle banner display
o   | Open file/directory under cursor in new window (horizontal split)
v   | Open file/directory under cursor in new window (vertical split)
p   | Open file preview
P   | Browse in the previously used window
t   | Open a file/directory in a new tab
mb  | Bookmark current directory
qb  | List bookmarks
gb  | Go to previous bookmarked directory
gf  | Display file information
r   | Reverse sorting order
s   | Select sorting (name, time, file size)
S   | Specify suffix priority for name-sorting
R   | Rename a file/directory
mf  | Mark file
mF  | Unmark file
mu  | Unmark all files
mt  | Make current directory the mark-file target
mc  | Copy marked files to marked-file target directory
mm  | Move marked files to marked-file target directory
md  | Apply diff to marked files (max. 3)
me  | Place marked files on arg list and edit them
mg  | Vimgrep marked files

## Undo Tree

Key | Description
:-- | :----------
g-  | Navigate to older undo tree tip.
g+  | Navigate to newer undo tree tip.

From "acatton" via Lobste.rs:

> g+, g- (mic drop)
> 
> No, in all seriousness, the documentation sucks on this… So I’ll explain it
> how it was explained to me by a colleague:
> 
> Vim stores edit history and undo as a tree. For example, if you do A, B, C,
> D, undo, undo, E, F, undo, undo, undo, G, vim will store this history:
> 
>                  D        F
>                  |        |      G
>                  C        E      |
>                  |        |      |
>                  +----+---+      |
>                       |          |
>                       B          |
>                       |          |
>                       +----+-----+
>                            |
>                            A
> 
> g+ and g- will navigate between the “tips” of this tree, so between D, F and
> G. One goes back, the other forward. I never know which one is which between
> g+ and g- to go the way I want, so I always try both until I realize it’s
> going the right way :) .

## Marks

Key | Description
:-- | :----------
ma  | Set mark a
'a  | Jump to line of mark a
\`a | Jump to position of mark a
d'a | Delete from current line to line of mark a
d\`a | Delete from current cursor position to position of mark a
:marks | List all marks
:marks aB | List marks a, B
]' | Jump to next line with lowercase mark
[' | Jump to previous line with lowercase mark
]\` | Jump to next lowercase mark
[\` | Jump to previous lowercase mark

### Special marks

Mark | Description
:--- | :----------
\`.  | Last change
\`"  | Last existed
\`0  | Last file edited
\`1  | Same as above, but one file prior
''   | Jump back to line (where you jumped from)
\`\`   | Jump back to position
\`[ or \`] | Jump beginning/end of previously changed or yanked text
\`< or \`> | Jump beginning/end of last visual selection
m<kbd>SPACE</kbd> | Delete all marks
:delm a | Delete mark a

### Plugin specific

#### nvim-cmp

Key  | Description
:--- | :----------
Ctrl-n | Select next completion
Ctrl-p | Select previous completion
<kbd>Enter</kbd> | Accept selected completion
Ctrl-e | Close completion menu

#### Harpoon

Key  | Description
:--- | :----------
,m | Toggle quick-fix menu
,a | Add file to quick-fix list
Ctrl-[h,t,n,s] | Jump to according file from quick-fix list

#### Telescope

Key  | Description
:--- | :----------
,ff or ,fs | Telescope find files
,fb | Telescope buffers
,fg | Telescope git-files
,fl | Telescope lsp references
,lg | Telescope live grep
F1  | Telescope help tags

#### Neoformat

Key  | Description
:--- | :----------
,f   | Format buffer

#### vim-surround

Key  | Description
:--- | :----------
ds(surrounding) | Delete surrounding characters
dst | Delete surrounding HTML tag
cs(target)(replacement) | Change surrounding characters
cs"\<q\> | Replace " with the html tag \<q\>
cS(target)(replacement) | Change surrounding and put it on its own line(s)
ys(motion)(surrounding) | Surround motion with surrounding
ysW( | You surround WORD with `( `...` )`
ysW) | You surround WORD with `(`...`)`
yS(motion)(surrounding) | You surround motion and put it on its own line(s)
ySS(motion)(surrounding) | You surround motion and put it on its own line(s)
yss(motion)(surrounding) | You surround on the current line, ignoring leading whitespace
v(selection)S(surrounding) | Surround selection with surrounding

#### Fugitive

Key  | Description
:--- | :----------
:G   | Open fugitive
s    | add (stage)
u    | reset (unstage)
\-   | add/reset (stage/unstage)
U    | reset (unstage) everything
X    | Discard change. (uses checkout or clean)
2X   | checkout --ours (merge conflict)
3X   | checkout --theirs (merge conflict)
=    | Toggle inline diff
\>   | Insert inline diff
`<`  | Remove inline diff
dd   | :Gdiffsplit
dv   | :Gvdiffsplit
ds   | :ghdiffsplit
<kbd>Enter</kbd> | Open file under cursor
o    | Open file in a horizontal split
gO   | Open file in a vertical split
O    | Open file in new tab
cc   | Create commit
ca   | Amend last commit and edit the message
ce   | Amend last commit without editing the message
cw   | Reword the last commit
crc  | Revert commit under cursor
coo  | Checkout commit under cursor
:Gllog | Open git log

## Language Specific

### Clojure

#### Conjure

1. nvim some-file.clj
2. :Clj # Launch nREPL
3. :q # Close nREPL window (it will still be running in the background)
4. ,cf # Connect to nREPL

Key  | Description
:--- | :---------
,eb  | Evaluate whole buffer
,ee  | Evaluate inner form under cursor
,er  | Evaluate outermost form under cursor
,e!  | Evaluate a form and replace it with the result of the evaluation
(Visual) ,E | Evaluate visual selection
,E(motion) eg. ,Eiw or ,Ea( | Evaluate given motion
mf + ,emf | Evaluate form at mark f (Captial marks will work across buffers)
,ew  | Inspect contents of variable under cursor
,ls  | Open log buffer horizontally
,lv  | Open log buffer vertically
,lt  | Open log buffer in a new tab
,lq  | Close all visible log windows
,lr  | Clear/Reset log
,lR  | Hard reset/Close log
\"cp   | Paste result of evaluation
