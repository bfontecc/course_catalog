<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
	
	<xsl:param name="description">true</xsl:param>
	
	<xsl:template match="/">
		<html lang="en" xml:lang="en">
			<head>
				<meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
				<title>
					<xsl:value-of select="xbel/title"/>
				</title>
				<style type="text/css">
					p.desc {
						margin: .1em .5em .1em .5em;
						font-size: .9em;
					}
					body {
						font-family: Arial, Sans-Serif;
					}
				</style>
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
			<xsl:if test="exists(folder) or exists(bookmark)">
				<ul>
					<xsl:apply-templates/>
				</ul>
			</xsl:if>
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
			<xsl:if test="$description = 'true'">
				<p class="desc">
					<xsl:value-of select="desc"/>
				</p>
			</xsl:if>
		</li>
	</xsl:template>
	<xsl:template match="text()">
	</xsl:template>
</xsl:stylesheet>