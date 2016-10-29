<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" 
  xmlns:act="http://capetiens.github.io/actes/actes.rng" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://capetiens.github.io/actes/actes.rng"
  exclude-result-prefixes="act"
  >
  <xsl:output indent="no" method="xml" encoding="UTF-8" />
  <xsl:variable name="lf" select="'&#10;'"/>
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <!-- 
<temoin type="vidimus"><fonds>AN, P6</fonds> RTC 449</temoin>
  -->
  <xsl:template match="act:temoin[@type='vidimus'][act:fonds = 'AN, P6']">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="node()[local-name() != 'source']"/>
      <todo/>
      <xsl:if test="not(contains(., 'RTC'))">
        <problem>???</problem>
      </xsl:if>
      <xsl:apply-templates select="act:source"/>
    </xsl:copy>
    <xsl:value-of select="$lf"/>
    <temoin type="indique">
      <ref sigle="RTC">Aline Vallée et Jules Viard, <i>Registres du Trésor des chartes. Inventaire analytique</i>, t. III : <i>Règne de Philippe de Valois</i>, 3 vol., Paris, 1978-1984 (Archives nationales : inventaires et documents)</ref>
      <xsl:text>, n° </xsl:text>
      <xsl:apply-templates select="node()[local-name() != 'fonds']"/>
    </temoin>
  </xsl:template>
  <!-- P5 -->
  <xsl:template match="act:temoin[@type='vidimus'][act:fonds = 'AN, P5']">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="node()[local-name() != 'source']"/>
      <todo/>
      <xsl:if test="not(contains(., 'RTC'))">
        <problem>???</problem>
      </xsl:if>
      <xsl:apply-templates select="act:source"/>
    </xsl:copy>
    <xsl:value-of select="$lf"/>
    <temoin type="indique">
      <ref sigle="RTC">Jean Guerout, <i>Registres du Trésor des chartes. Inventaire analytique</i>, t. II : <i>Règnes des fils de Philippe le Bel</i>, 2e partie : <i>Règnes de Louis X le Hutin et de Philippe V le Long</i>, dir. Robert Fawtier, Paris, 1966 (Archives nationales : inventaires et documents)</ref>
      <xsl:text>, n° </xsl:text>
      <xsl:apply-templates select="node()[local-name() != 'fonds']"/>
    </temoin>
  </xsl:template>
  <!-- P5 -->
  <xsl:template match="act:temoin[@type='vidimus'][act:fonds = 'AN, L10']">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="node()[local-name() != 'source']"/>
      <todo/>
      <xsl:if test="not(contains(., 'RTC'))">
        <problem>???</problem>
      </xsl:if>
      <xsl:apply-templates select="act:source"/>
    </xsl:copy>
    <xsl:value-of select="$lf"/>
    <temoin type="indique">
      <ref sigle="RTC">Jean Guerout, <i>Registres du Trésor des chartes. Inventaire analytique</i>, t. II : <i>Règnes des fils de Philippe le Bel</i>, 2e partie : <i>Règnes de Louis X le Hutin et de Philippe V le Long</i>, dir. Robert Fawtier, Paris, 1966 (Archives nationales : inventaires et documents)</ref>
      <xsl:text>, n° </xsl:text>
      <xsl:apply-templates select="node()[local-name() != 'fonds']"/>
    </temoin>
  </xsl:template>
  
</xsl:transform>
