<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<xsl:for-each select="rss/channel/item">
<h2><xsl:value-of select="title"/></h2>
<p>
<b>Author: </b><xsl:call-template name="author"/><br/>
<b>Posted: </b><xsl:value-of select="pubDate"/>
</p>
<blockquote>
<xsl:variable name="descnc" select="substring-before(description, ' (&lt;a href=&quot;http://sourceforge.net/forum/forum.php?forum_id=')"/>
<xsl:choose>
<xsl:when test="starts-with(title, 'NSIS ') and contains(title, 'released')">
<xsl:variable name="desc" select="substring-after($descnc, '&lt;br /&gt;')"/>
<xsl:call-template name="strip_br">
<xsl:with-param name="text" select="$desc"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$descnc" disable-output-escaping="yes"/>
</xsl:otherwise>
</xsl:choose>
</blockquote>
<!--xsl:variable name="forum" select="substring-before(substring-after(description, ' (&lt;a href=&quot;http://sourceforge.net/forum/forum.php?forum_id='), '&quot;')"/>
<p><i><a href="http://sourceforge.net/forum/forum.php?forum_id={$forum}">Comments</a>: </i><xsl:value-of select="substring-before(substring-after(substring-after(description, $forum), '&gt;'), ' ')"/></p-->
</xsl:for-each>
</xsl:template>

<xsl:template name="author">
<a href="mailto:{substring-before(author, ' (')}">
<xsl:value-of select="substring-before(substring-after(author, '('), ')')"/>
</a>
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
