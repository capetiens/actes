<?php
// charge un fichier d’actes, procède aux remplacements
/*

n="2" type="chancellerie"
n="10" type="copie"
n="20" type="edition"
n="30" type="indique"
n="1" type="original"
n="3" type="parlement"
n="10" type="vidimus"
*/

$fonds = array(
  "/([> ])JJ /" => "$1<fonds>AN, JJ</fonds> ",
  "/([> ])KK /" => "$1<fonds>AN, KK</fonds> ",
  "/([> ])KK([0-9]+) /" => "$1<fonds>AN, KK$2</fonds> ",
  "/([> ])([JKLPRS] ?[0-9][0-9ABC]+) /" => "$1<fonds>AN, $2</fonds> ",
  "/([> ])(1AP|Q1|R1|V2|X1|X2A|Y1|Z1B) /" => "$1<fonds>AN, $2</fonds> ",
  "/(Doat|fr.|lat.|Mélanges Colbert|NAL|NAF) /" => "<fonds>BNF, $1</fonds> ",
  "/((Champagne|Clairambault|Dupuy|Moreau|Picardie|PO|Touraine) [0-9]+)/" => "<fonds>BNF, $1</fonds> ",
  "/AGR /" => "<fonds>Archives générales du royaume</fonds>, ",
  "/AD PdC /" => "<fonds>AD Pas-de-Calais</fonds> ",
  // <fonds>AD Val d’Oise</fonds>
  "/(AD|AM|BM) ([^ ,]+),? /" => "<fonds>$1 $2</fonds>, ",
  "/ACA /" => "<fonds>Archivo de la Corona de Aragón</fonds>, ",
  "/BL /" => "<fonds>British Library</fonds>, ",
  "/BSG /" => "<fonds>bibliothèque Sainte-Geneviève</fonds>, ",
  "/Lenoir 104 Mi /" => "<fonds>collection Lenoir, AN, 104 Mi</fonds> ",
  "/PRO /" => "<fonds>The National Archives</fonds>, ",
);
// charger le biblio
$bib = array();
$handle = fopen( dirname(dirname(__FILE__))."/biblio.xml", "r");
while (($line = fgets($handle)) !== false) {
  if ( !preg_match( '@sigle="([^"]+)"@', $line, $matches ) )
    continue;
  $bib[ $matches[1] ] = trim($line);
}
fclose($handle);
// print_r($bib);
$search = array_keys($fonds);
$replace = array_values($fonds);

$reader = fopen( dirname(dirname(__FILE__))."/L10.xml", "r");
$writer = fopen( dirname(dirname(__FILE__))."/test.xml", "w");
while ( ( $line = fgets($reader) ) !== false) {
  if ( preg_match( '@<temoin@', $line, $matches ) ) {
    $line = strtr( $line, $bib );
    $line = preg_replace( $search, $replace, $line );
  }
  fwrite( $writer, $line );
}
fclose( $reader );
fclose( $writer );


?>
