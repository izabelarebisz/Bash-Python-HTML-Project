@echo off
@chcp 1250
setlocal enabledelayedexpansion

:menu

    cls
    echo Zadanie: Trzy wie�e - Izabela R�bisz
    echo.
    echo ___________MENU___________ 
    echo.

    echo 1 - informacje o programie
    echo 2 - uruchom program
    echo 3 - utw�rz kopi� danych
    echo 4 - usu� kopi� danych
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
    echo Zadaniem programu jest przeanalizowanie ci�gu znak�w sk�adaj�cego si� z liter "b", "c" i "s" 
    echo oznaczaj�cych kolejno bia�y, czarny i szary. Przyjmujemy, �e ka�de wyst�pienie literki mo�emy
    echo odczyta� jako wyst�pienie jednego klocka w danym kolorze. Z klock�w budujemy maksymalnie 3 wie�e,
    echo ka�da w innym kolorze. Dodatkowo dwie wie�e nie mog� by� zbudowane z takiej samej ilo�ci klock�w.
    echo We wczytanym tek�cie szukamy najd�u�szego mo�liwego ci�gu, z kt�rego mo�liwe by�o by zbudowanie
    echo wie�y wed�ug powy�szych warunk�w. Program w wyniku podaje d�ugo�� takiego ci�gu.

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
	echo Nie znaleziono katalogu z kopi� zapasow�.
    )
    if exist backup (
	del /S /Q backup
	rmdir /S backup
        echo Usuni�to kopi� danych.
    )
    echo.
    echo wcisnij enter aby wrocic do menu
    pause 
    goto :menu
