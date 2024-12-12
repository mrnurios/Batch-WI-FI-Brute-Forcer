@echo off
setlocal enabledelayedexpansion
    set "char_list=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    set "int_list=1234567890"
    set "symbol_list=`~/=\!@#$%^&*()[]{}<>;:'.,-_"
    set randomChar=

    set prefix=PLDTWIFI
    set specialChars=
        
    cls
    echo [==================================================]
    echo                 PLDT Key Combinator
    echo [==================================================]
    echo.
    set /p numCombinations=Enter number of combinations: 

    :: Output file name
    set outputFile=pldtlist.txt

    :: Clear the previous output file if it exists
    if exist "%outputFile%" del "%outputFile%"

    :: Generate combinations
    call :generate_combinations

    pause
    exit

    :select_choice
	    set /a choice_code=!random! %% 8 + 1
        
        if !choice_code!==1 (
        set /a char_code=!random! %% 52
        call :select_char !char_code!
        )
        if !choice_code!==2 (
        set /a char_code=!random! %% 52
        call :select_char !char_code!
        )
        if !choice_code!==3 (
        set /a char_code=!random! %% 52
        call :select_char !char_code!
        )
        if !choice_code!==4 (
        set /a char_code=!random! %% 52
        call :select_char !char_code!
        )
        if !choice_code!==5 (
        set /a char_code=!random! %% 52
        call :select_char !char_code!
        )
        if !choice_code!==6 (
        set /a char_code=!random! %% 52
        call :select_char !char_code!
        )
        if !choice_code!==7 (
        set /a digit_code=!random! %% 10
        call :select_digit !digit_code!
        )
        if !choice_code!==8 (
        set /a digit_code=!random! %% 10
        call :select_digit !digit_code!
        )

        goto :eof

    :select_char !char_code!
        set current_char=!char_list:~%1,1!
        set randomChar=!current_char!
        goto :eof
    	
	:select_digit
        set current_digit=!int_list:~%1,1!
        set randomChar=!current_digit!
        goto :eof

    :generate_combinations
        setlocal
        set counter = 0
        set total=50
        set bar=
        :: Loop to generate all combinations of numbers
        for /L %%i in (1,1,%numCombinations%) do (
            set "combination=!prefix!"
            :: Loop to generate each combination of the specified length (5 characters)
            for /L %%j in (1,1,5) do (
                call :select_choice
                set combination=!combination!!randomChar!
            )
            set /a counter=!counter!+1
            cls
            echo Passwords Generated: !counter!
            echo !combination!>>pldtlist.txt
        )
        endlocal
        goto :eof
