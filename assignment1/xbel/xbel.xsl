<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="xbel/title"/>
				</title>
			</head>
			<body>
				<h1>
					<xsl:value-of select="xbel/title"/>
				</h1>
				<ul>
					<xsl:apply-templates/>
				</ul>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="folder">
		<li>
			<xsl:value-of select="title"/>
			<!-- if anything in the folder -->
			<ul>
				<xsl:apply-templates/>
			</ul>
			<!-- endif -->
		</li>
	</xsl:template>
	<xsl:template match="bookmark">
		<li>
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="@href"/>
				</xsl:attribute>
				<xsl:value-of select="title"/>
			</xsl:element>
		</li>
	</xsl:template>
	<xsl:template match="text()">
	</xsl:template>
</xsl:stylesheet>