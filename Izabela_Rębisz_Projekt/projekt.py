# PROJEKT SEMESTRALNY
# IZABELA RĘBISZ
# Zadanie: Trzy wieże (XXII OI)
import sys

def sprawdz(nowy): # analizuje przesłany fragment ciągu 
    c = 0
    b = 0
    s = 0
    for i in range(len(nowy)):
      
        if nowy[i] == "c":
            c = c + 1
        if nowy[i] == "b":
            b = b + 1
        if nowy[i] == "s":
            s = s + 1

    if c==b or c==s or b==s:
        return 1
    return len(nowy)



def szukaj(): # wyszukuje wszystkie możliwe fragmenty tekstu
    wynik = 0
    for i in range(dlugosc):
        for j in range(i,dlugosc):      
            nowy = napis[i:j+1]   #sprawdzam każdy fragment ciągu
            if sprawdz(nowy) == dlugosc:   #jeśli cały ciąg spełnia warunek - największa długość jest już znaleziona
                return dlugosc             
            elif sprawdz(nowy) > wynik:
                wynik = sprawdz(nowy)
    return wynik   # największa możliwa długość ciągu



try:
    plik = open("input/" + sys.argv[1] , "r")
    wejscie = plik.read()
    wejscie = wejscie.lower()

    #print ("Dane wejsciowe: " + str(wejscie))
    napis = ""
    for i in range(len(wejscie)):
        if wejscie[i] == "c" or wejscie[i] == "b" or wejscie[i] == "s":   # usuwam znaki niespełniające warunków zadania
            napis += wejscie[i]

    #print("Podany ciag: " + str(napis))

    dlugosc = len(napis)
    wynik = szukaj()
    if wynik == 1:
        print("Ciąg można zbudować tylko z jednego elementu")
    else:
        print("Najdłuższy ciąg składa się z " + str(wynik) + " kolejnych elementów")

    out = open("output/" + sys.argv[2], "w")
    out.write(napis + "\n" + str(wynik))
    out.close()


except IOError:
    print("Nie znaleziono pliku z danymi")
    out = open("output/" + sys.argv[2], "w")
    out.write("error")
    out.close()



