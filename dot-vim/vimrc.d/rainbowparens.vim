" rainbow parens
com! RainbowParenthesesToggle       cal rainbow_parentheses#toggle()
com! RainbowParenthesesToggleAll    cal rainbow_parentheses#toggleall()
com! RainbowParenthesesActivate     cal rainbow_parentheses#activate()
com! RainbowParenthesesLoadRound    cal rainbow_parentheses#load(0)
com! RainbowParenthesesLoadSquare   cal rainbow_parentheses#load(1)
com! RainbowParenthesesLoadBraces   cal rainbow_parentheses#load(2)
com! RainbowParenthesesLoadChevrons cal rainbow_parentheses#load(3)

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
