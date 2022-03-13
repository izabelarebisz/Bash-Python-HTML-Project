import os, datetime, sys

def web(napis, wynik):

    f = open("statystyka.html", "a")
    if os.stat("statystyka.html").st_size == 0: # plik jest pusty 
        f.write("<html> \n <center> \n <em><br> Izabela Rębisz - projekt Trzy wieże </em><br><br><br><b> Statystyka wyników \
        </b> \n \n <body bgcolor=#99CCCC>")
        f.write("<style> td, th { border: 1px solid black;} </style>")
        f.write("<table style=\"width: 50%\"> \n <thead> \n <tr bgcolor=Teal>")
        f.write("<th style=\"width: 30%\">Data</th> <th style=\"width: 60%\">Dane wejściowe</th> <th style=\"width: 10%\">Wynik</th>")
        f.write("</tr> \n </thead> \n ")
        f.write("</table \n </body> \n </html>")

    f.write("<html> \n <center> \n <body>")
    f.write("<table style=\"width: 50%\"> \n <tbody> \n <tr bgcolor=Gray>")
    data = str(datetime.datetime.now())
    f.write("<th style=\"width: 30%\">" + data[0:10] + "</th> \
    <td style=\"width: 60%\">" + napis + "</td> \
    <td style=\"width: 10%\">" + str(wynik) + "</td> \n </tr>")
    f.write(" </tbody> \n  </table> \n </body> \n </html>")
    f.close()

try:
    plik = open("output/" + sys.argv[1], "r")
    napis = plik.readline()
    if napis == "error":
        error = error + 1
    else:
        wynik = plik.readline()
        web(napis,wynik)

except IOError:
    print("Nie znaleziono pliku z danymi")
    web("nie udalo sie otworzyć pliku", "-")