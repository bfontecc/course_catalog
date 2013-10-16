<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="common.xsl" />
	<xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" indent="yes" />

	<xsl:template match="/">
		<html lang="en">
			<xsl:call-template name="header" />
			<body>
				<xsl:call-template name="title_content" />
				<xsl:call-template name="nav" />
				<xsl:apply-templates />
				<xsl:call-template name="footer" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="courses">
	<ul id="depts">
	<xsl:for-each-group select="course" group-by="department/dept_short_name">
		<li>
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:text>departments/</xsl:text>
					<xsl:value-of select="department/@code" />
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="current-grouping-key()"/>
			</xsl:element>
		</li>
	</xsl:for-each-group>
	</ul>
	</xsl:template>

	<xsl:template name="nav">
		<div id="nav">
			<xsl:text>Departments</xsl:text>
		</div>
	</xsl:template>

	<!-- override default behavior of outputting text nodes -->
	<xsl:template match="text()">
	</xsl:template>

</xsl:stylesheet>
