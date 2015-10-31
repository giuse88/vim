"Invoke sudo vi on the current buffer
cmap w!! w !sudo tee > /dev/null %

"Json formater
com! FormatJSON %!python -m json.tool

"NPM 
command -nargs=* Npm !npm --no-color <args>
