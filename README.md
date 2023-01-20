# Rakendusserverite halduse automatiseerimine: ahls-skriptid

### 0. Eeldused:
1. olemas on Linuxi opsüsteemiga arvuti,
2. git-juhendi kasutamise eelduseks on varem loodud githubi repositoorium.

# git
## 1. Paigaldamine
Giti paigaldamiseks tuleb teostada järgmine käsk:
```
"apt install git"
```
### 2. Seadistamine
Giti seadistamiseks on vaja lisada enda githubi kasutajanimi, e-post ja ka seostada redaktor.

```
git config --global user.name "Eesnimi Perekonnanimi"
git config --global user.email meiliaadress@domeen.com
git config --global core.editor nano
```
Pärast seda tuleks luua repositoorimi kaust. Linuxi opsüsteemide puhul tuleb seda teha root-kasutajana. Repositoorium tehakse järgmiste käskudega:
```
"su root"
"cd ~"
"mkdir "kausta nimi""

```

Nüüd on vaja minna eelnevalt loodud kataloogi ja käivitada lokaalne repositoorium. "Git init" käsku on vaja sisestada ainult üks kord.
```
"cd "kausta nimi""
"git init"
```

### 3. Githubi repositooriumiga ühendamine, kasutades SSH võtmepaari.
Linuxi masinasse on vaja luua uus SSH võtmepaar, loodud võtmepaar salvestada kausta ja sellele lisada parool. Võtmepaari saab luua käsuga:
 ```
 "ssh-keygen -t rsa -b 4096 -C "meiliaadress@domeen.com""
 ```
Võtmepaari saab salvestada ükskõik millisesse kausta.
Pärast seda on vaja kopeerida SSH public key ja see lisada enda Githubi SSH võtemete alla.
### 4. SSH ühenduvuse testimine
Ühenduvust saab testida järgmiste käskudega: 
```
"ssh -T git@github.com"
```
# Repositooriumi sisu ja skriptide kasutamine
Selles repositooriumis on olemas järgmised skriptid:
- apache2 paigaldamine,
- mysql'i paigaldamine,
- phpmyadmin'i paigaldamine,
- wordpress'i paigaldamine,
- php paigaldamine,
- kasutajate loomine, mille parameetriks on nimi,
- kasutajate loomine, mille parameetriteks on tekstidokumendid.
- varundusfailide loomine, mille parameetriks on kaust.
- varundusfailide + mysql andmebaaside varundamine, parameetriteks on kaust ja mysql andmebaasi nimi
Skriptid vajavad root-kasutajat või ``` "sudo" ``` käsu kasutamist. Skript käivitatakse käsuga
``` "sudo ./skriptinimi.sh" ("sudo" ei pea ees olema kui kasutatakse root-kontot)```
