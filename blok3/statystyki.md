# Statystyki - Blok 3
#Liczba sekwencji i dopasowań na kolejnych etapach
|Analiza | Opis / warunek | Liczba wierszy / rekordów | Liczba unikalnych sond | Uwagi |
|:--- | :--- | :--- | :--- | :--- |
|sondy wejściowe ('probes.fa') | Wyodębnione z 'DArT_SNP.csv' (długość sondy: 69 nt) | - | 2008 (albo własny wynik??? 'grep -c '>' probes.fa') | Każda sonda ma 69 nukleotydów |
|sondy z trafieniem ('blast_raw.tsv') | Wynik 'blastn' ('-evalue 1e-10', '-max_target_seqs 1', '-outfmt 6 ...') | uzupełnić! (PDF: 2306) | uzupełnić! (PDF: 1984) | Część sond nie ma trafienia w złożeniu, bo niektóre mają >1 HSP mimo '-max_target_seqs 1' |
|trafienia po filtrze ('blast_filtered.tsv') | 'pident >=96' i 'length >= 68' | uzupełnić (PDF: 1616) | uzupełnić (PDF 1543) | Różnica wierszy a unikalnych sond pokazuje opasowania wielokrotne (PDF: 73 nadmiaru wiersze) |
|Sondy po wyborze najlepszego trafienia ('blast_best.tsv') | Najwyższy 'bitscore' dla każdej sondy ('sort -k1,1 k12,12gr \| awk '![$1]++'') | uzupełnić (PDF: 1543) | uzupełnić (PDF: 1543) | 1 sonda - 1 dopasowanie, duplikaty usuwane podczas VCF |
|Rozkład orientacji nici ('dart_blast_filtered.tsv') | Kolumna 13: '+'('sstart < send') vs '-' ('sstart > send') | uzupełnić ('+' / '-') | - | W poprawnym mapowaniu orientacje '+' i '-' występują w zbliżonej proporcji (1:11) |
#Ćwiczenie 3.3
| Próg'pident' | Warunek długości | Liczba wierszy po filtrze | Liczba unikalnych sond | Wpływ na wynik |
| :---| |:--- | :---| :---| :--- |
| '90' ('>= 90') | 'length >= 68' | uzupełnić | uzupełnić | Więcej dopasowań niż przy 96- większe ryzyko włączenia trafień z regionów duplikowanych lub błędó |
| '96' ('>= 96') | 'length >= 68" | uzupełnić (PDF:1616) | uzupełnić (PDF:1543) | Próg bazowy - kompromis między czułością a poprawnym mapowaniem 69-nt sondy |
| '99' ('>= 99') | 'length >= 68' | uzupełnić | uzupełnić | Mniej dopasowań niż przy 96 - odrzuca część trafień z pojedynczymi różnicami/polimorfizmami |
#Uzasadnienie
Sonda DArT ma 69 nukleotydów długości, a dopasowanie powinno obejmować niemal całą sondę ('length >= 68') przy zachowaniu bardzo wysokiej zgodności sekwencyjnej.
Próg 'pident >= 96' dopuszcza ok. 2-3 niezgodności na długość sondy, a jednocześnie odrzuca słabe i częściowe dopasowania w regionach powtarzalnych czy zdupliowanych, które zafałszowałyby wyznaczenie pozycji SNP w genomie [cite: 19, 21].

