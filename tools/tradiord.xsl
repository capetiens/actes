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
  <xsl:template match="act:tradition">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="act:temoin">
        <xsl:sort select="@n" data-type="number"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
</xsl:transform>
