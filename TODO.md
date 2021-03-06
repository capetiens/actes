# TODO

Liste de choses à faire. Les plus urgentes en haut. Ce qui est fait passe sous le titre DONE.




## Expansion biblio

Vidimus RTC, à la fois témoin d’un acte, et indiqué dans une édition. Répliquer et développer cette référence dans la section des indiqué de la tradition. 

```xml
    <temoin type="vidimus"><fonds>AN, P6</fonds> RTC 449</temoin>
    <temoin type="indique"><ref>Aline Vallée et Jules Viard, 
      <i>Registres du Trésor des chartes. Inventaire analytique</i>, t. III : 
      <i>Règne de Philippe de Valois</i>, 3 vol., Paris, 1978-1984 
      (Archives nationales : inventaires et documents)</ref>, 
    n° 449</temoin>
    
    <temoin type="vidimus"><fonds>AN, P5</fonds> RTC 449</temoin>
    <temoin type="indique"><ref>Jean Guerout, 
    <i>Registres du Trésor des chartes. Inventaire analytique</i>, t. II : 
    <i>Règnes des fils de Philippe le Bel</i>, 2e partie : 
    <i>Règnes de Louis X le Hutin et de Philippe V le Long</i>, 
    dir. Robert Fawtier, Paris, 1966 (Archives nationales : inventaires et documents)</ref>, 
    n° 449</temoin>

    <temoin type="vidimus"><fonds>AN, L10</fonds> RTC 449</temoin>
    <temoin type="indique"><ref>Jean Guerout, 
    <i>Registres du Trésor des chartes. Inventaire analytique</i>, 
    t. II : <i>Règnes des fils de Philippe le Bel</i>, 2e partie : 
    <i>Règnes de Louis X le Hutin et de Philippe V le Long</i>, 
    dir. Robert Fawtier, Paris, 1966 (Archives nationales : 
    inventaires et documents)</ref>, n° 449</temoin>
```

## Dates restituées ? 

Le schéma est très strict sur le format de date et ne supporte pas les crochets. Proposition à valider par Olivier

```xml
<titre>
  <date>1314]-12-21</date>
  <lieu>Vincennes</lieu>
</titre>

<titre>
  <!-- crochet supprimé -->
  <date>1314-12-21</date>
  <lieu>Vincennes</lieu>
</titre>
<datation>Millésime restitué</datation>

```

## Insertion EAD

pour les mentions

    <temoin type="vidimus"><fonds>AN, C4</fonds> RTC 449</temoin>

on fera matcher le numéro avec l'inventaire 

    <num type="notice">Notice 449</num>) 

pour retenir 

    <unitid>Fol. 5-6, n° 15</unitid> 

et à aboutir à 

    <temoin type="vidimus"><fonds>AN, JJ</fonds> 61, fol. 5-6, n° 15</temoin> 
    
[la cote JJ 61, JJ 62 ou JJ 64 va changer en fonction du numéro]

et on ajoutera

    <temoin type="indique"><ref>Jean Guerout, Henri Jassemin et Aline Vallée, <i>Registres du Trésor des chartes. Inventaire analytique</i>, t. II : <i>Règnes des fils de Philippe le Bel</i>, 2e partie : <i>Règne de Charles IV le Bel</i>, Paris, 1999 (Archives nationales : inventaires et documents)</ref>, n° 449</temoin>



# DONE

Liste des choses faîtes, du plus récent au plus ancien.
