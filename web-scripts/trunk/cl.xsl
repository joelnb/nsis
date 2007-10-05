<?xml version="1.0" encoding="ISO-8859-1"?>

<!--

 TODO

   * link author to full name and maybe http://sf.net/users/<author>
   * consolidate paths like cvs2cl did

-->

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="baseurl" select="'http://nsis.svn.sourceforge.net/viewvc/nsis'" />

	<xsl:template match="/">
		<xsl:for-each select="/log/logentry">
		<xsl:variable name="rev" select="@revision" />
		<li>
			<p>
				<xsl:value-of select="substring-before(date, 'T')" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring-after(substring-before(date, '.'), 'T')" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="author" />
			</p>
			<p class="clitem">
				<xsl:for-each select="paths/path">
					<a href="{$baseurl}{text()}?r1={$rev}&amp;r2={($rev)-1}&amp;pathrev={$rev}">
						<xsl:choose>
							<xsl:when test="starts-with(text(), '/NSIS/trunk')">
								<xsl:value-of select="substring-after(text(), '/NSIS/trunk/')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="substring-after(text(), '/NSIS/')" />
							</xsl:otherwise>
						</xsl:choose>
					</a>
					<xsl:choose>
						<xsl:when test="last() != position()">
							<xsl:text>, </xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
				<xsl:text>: </xsl:text>
				<xsl:call-template name="replace-string">
					<xsl:with-param name="text">
						<xsl:call-template name="strip_lf">
							<xsl:with-param name="text" select="msg" />
						</xsl:call-template>
					</xsl:with-param>
					<xsl:with-param name="from" select="'&#xA;'" />
					<xsl:with-param name="to" select="'&lt;br /&gt;'" />
				</xsl:call-template>
			</p>
		</li>
		<xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
	</xsl:template>

	<!-- reusable replace-string function -->
	<xsl:template name="replace-string">
		<xsl:param name="text"/>
		<xsl:param name="from"/>
		<xsl:param name="to"/>

		<xsl:choose>
			<xsl:when test="contains($text, $from)">
				<xsl:variable name="before" select="substring-before($text, $from)"/>
				<xsl:variable name="after" select="substring-after($text, $from)"/>
				<xsl:variable name="prefix" select="concat($before, $to)"/>

				<xsl:value-of select="$before" disable-output-escaping="yes"/>
				<xsl:value-of select="$to" disable-output-escaping="yes"/>
				<xsl:call-template name="replace-string">
					<xsl:with-param name="text" select="$after"/>
					<xsl:with-param name="from" select="$from"/>
					<xsl:with-param name="to" select="$to"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" disable-output-escaping="yes"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- strips line breaks from end of string -->
	<xsl:template name="strip_lf">
		<xsl:param name="text"/>
			<xsl:choose>
				<xsl:when test="substring($text, string-length($text), 1) = '&#xA;'">
					<xsl:call-template name="strip_lf">
						<xsl:with-param name="text" select="substring($text, 0, string-length($text))"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$text" disable-output-escaping="yes"/>
				</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:transform>
