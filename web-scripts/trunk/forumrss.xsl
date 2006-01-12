<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<xsl:for-each select="rss/channel/item">
<p><a href="{link}"><xsl:value-of select="substring-before(title, ' (Last Post: ')"/></a></p>
</xsl:for-each>
</xsl:template>
</xsl:transform>
