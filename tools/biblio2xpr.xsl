<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" 
  xmlns:act="http://capetiens.github.io/actes/actes.rng" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://capetiens.github.io/actes/actes.rng"
  exclude-result-prefixes="act"
  >
  <xsl:strip-space elements="String"/>
  <xsl:output indent="no" method="xml" encoding="UTF-8" />
  <xsl:variable name="lf" select="'&#10;'"/>
  <xsl:template match="*|text()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="act:biblio">
    <codeTemplateItem-array>
      <xsl:apply-templates/>
    </codeTemplateItem-array>
  </xsl:template>
  <xsl:template match="act:ref">
    <xsl:value-of select="$lf"/>
    <codeTemplateItem >
      <field name="contentType">
        <String>text/any</String>
      </field>
      <field name="unparsedInsertString">
        <xsl:value-of select="$lf"/>
        <String>
          <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
          <xsl:copy-of select="." />
          <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
        </String>
      </field>
      <xsl:value-of select="$lf"/>
      <field name="descriptionString">
        <String/>
      </field>
      <field name="renderString">
        <String>
          <xsl:value-of select="@sigle"/>
        </String>
      </field>
      <field name="enabled">
        <Boolean>true</Boolean>
      </field>
      <field name="accelerator">
        <null/>
      </field>
    </codeTemplateItem>
  </xsl:template>
  <xsl:template match="act:*">
    <xsl:text>&lt;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:for-each select="@*">
      <xsl:text> </xsl:text>
      <xsl:value-of select="name()"/>
      <xsl:text>="</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>"</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:transform>
