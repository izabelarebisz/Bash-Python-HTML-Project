@echo off
@chcp 1250
setlocal enabledelayedexpansion

:menu

    cls
    echo Zadanie: Trzy wie¿e - Izabela Rêbisz
    echo.
    echo ___________MENU___________ 
    echo.

    echo 1 - informacje o programie
    echo 2 - uruchom program
    echo 3 - utwórz kopiê danych
    echo 4 - usuñ kopiê danych
    echo 5 - wyjdz

    set /p opcja=">>"
    if %opcja%==1 goto :info
    if %opcja%==2 goto :wieze
    if %opcja%==3 goto :backup
    if %opcja%==4 goto :delete
    if %opcja%==5 exit
    echo Nie ma takiej opcji - kliknij enter i wybierz ponownie.
    pause 
    goto :menu

:info
    cls
    echo Zadaniem programu jest przeanalizowanie ci¹gu znaków sk³adaj¹cego siê z liter "b", "c" i "s" 
    echo oznaczaj¹cych kolejno bia³y, czarny i szary. Przyjmujemy, ¿e ka¿de wyst¹pienie literki mo¿emy
    echo odczytaæ jako wyst¹pienie jednego klocka w danym kolorze. Z klocków budujemy maksymalnie 3 wie¿e,
    echo ka¿da w innym kolorze. Dodatkowo dwie wie¿e nie mog¹ byæ zbudowane z takiej samej iloœci klocków.
    echo We wczytanym tekœcie szukamy najd³u¿szego mo¿liwego ci¹gu, z którego mo¿liwe by³o by zbudowanie
    echo wie¿y wed³ug powy¿szych warunków. Program w wyniku podaje d³ugoœæ takiego ci¹gu.

    echo wcisnij enter aby wrocic do menu
    pause 
    goto :menu

:wieze
    cls 
    FOR /f "tokens=*" %%G IN ('dir input /b') DO (
	python projekt.py %%G wynik_%%G
	python website.py wynik_%%G

    )
	
    echo.
    echo wcisnij enter aby wrocic do menu
    pause 
    goto :menu

:backup
    cls
    if not exist backup mkdir backup
    cd backup
    set ti=%time:~0,5%
    if "%ti:~0,1%" == " " set tim=0%ti:~1,5%
    set data=%date%-%tim%
    set data=%data::=_%
    mkdir %data%
    cd..
    set stat=statystyka.html
    xcopy %stat% "backup/%data%" /I
    echo.
    echo wcisnij enter aby wrocic do menu
    pause 
    goto :menu

:delete
    cls
    if not exist backup (
	echo Nie znaleziono katalogu z kopi¹ zapasow¹.
    )
    if exist backup (
	del /S /Q backup
	rmdir /S backup
        echo Usuniêto kopiê danych.
    )
    echo.
    echo wcisnij enter aby wrocic do menu
    pause 
    goto :menu
