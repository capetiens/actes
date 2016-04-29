<?php
// charger le fichier XML de catalogue
// boucler sur tous le XPath qui nous intéresse
// réinsérer le nœud transformé


array(
  "/>JJ /" => ">AN, JJ ",
  "/>KK /" => ">AN, KK ",
  "/>KK([0-9]+) /" => ">AN, KK$1 ",
  "/>([JKLPRS] ?[0-9]+) /" => ">AN, $1 ",
  "/>(1AP|Q1|R1|V2|X1|X2A|Y1|Z1B) /" => ">AN, $1 ",
  "/(Doat|fr.|lat.|Mélanges Colbert|NAL|NAF) /" => "BNF, $1",
  "/((Champagne|Clairambault|Dupuy|Moreau|Picardie|PO|Touraine) [0-9]+)/" => "BNF, $1",
  "/AGR /" => "Archives générales du royaume, ",
  "/AD PdC /" => "AD Pas-de-Calais ",
  "/(AD|AM|BM) ([^ ]) /" => "$1 $2, ",
  "/ACA /" => "Archivo de la Corona de Aragón, ",
  "/BL /" => "British Library, ",
  "/BSG /" => "bibliothèque Sainte-Geneviève, ",
  "/Lenoir 104 Mi /" => "collection Lenoir, AN, 104 Mi ",
  "/PRO /" => "The National Archives, ",
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
$search = array_keys($bib);
$replace = array_values($bib);

$reader = fopen( dirname(dirname(__FILE__))."/L10.xml", "r");
$writer = fopen( dirname(dirname(__FILE__))."/test.xml", "w");
while ( ( $line = fgets($reader) ) !== false) {
  if ( preg_match( '@<temoin@', $line, $matches ) ) {
    $line = strtr( $line, $bib );
  }
  fwrite( $writer, $line );
}
fclose( $reader );
fclose( $writer );


?>
