<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
  <!-- Find the root node called Menus 
       and call MenuListing for its children -->
  <xsl:template match="/dsMenus">
	<Nodes>
      <xsl:call-template name="NoPai" />
    </Nodes>
  </xsl:template>
  
  <!-- Allow for recusive child node processing -->
  <xsl:template name="NoPai">
    <xsl:apply-templates select="tbMenu" />
  </xsl:template>
  
  <xsl:template match="tbMenu">
	  <TreeNode>
		  <!-- Convert Menu child elements to MenuItem attributes -->
          <xsl:attribute name="Text">
              <xsl:value-of select="Titulo"/>
          </xsl:attribute>
          <xsl:attribute name="Value">
              <xsl:value-of select="IdMenu"/>
          </xsl:attribute>
          <xsl:attribute name="Image">
              <xsl:value-of select="Imagem"/>
          </xsl:attribute>
          <xsl:attribute name="Tip">
              <xsl:value-of select="Descricao"/>
          </xsl:attribute>

          <!-- Call MenuListing if there are child Menu nodes -->
		  <xsl:if test="count(tbMenu) > 0">
			  <xsl:call-template name="NoPai" />
		  </xsl:if>
	  </TreeNode>
  </xsl:template>
</xsl:stylesheet>
