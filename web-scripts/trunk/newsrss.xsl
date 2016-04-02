<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/">
<xsl:template match="/">
<xsl:for-each select="rss/channel/item">
<xsl:if test="not(position() > 3)">
<h2><xsl:value-of select="title"/></h2>
<p>
<b>Author: </b><xsl:call-template name="author"/><br/>
<b>Posted: </b><xsl:value-of select="pubDate"/>
</p>
<blockquote>
<xsl:value-of select="description" disable-output-escaping="yes"/>
</blockquote>
<!--xsl:variable name="forum" select="substring-before(substring-after(description, ' (&lt;a href=&quot;http://sourceforge.net/forum/forum.php?forum_id='), '&quot;')"/>
<p><i><a href="http://sourceforge.net/forum/forum.php?forum_id={$forum}">Comments</a>: </i><xsl:value-of select="substring-before(substring-after(substring-after(description, $forum), '&gt;'), ' ')"/></p-->
</xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template name="author">
<xsl:value-of select="dc:creator"/>
</xsl:template>

<xsl:template name="strip_br">
<xsl:param name="text"/>
<xsl:choose>
<xsl:when test="starts-with($text, '&lt;br /&gt;')">
<xsl:call-template name="strip_br">
<xsl:with-param name="text" select="substring-after($text, '&lt;br /&gt;')"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$text" disable-output-escaping="yes"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:transform>
