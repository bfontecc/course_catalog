<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="dept_code" />
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

	<xsl:template name="nav">
		<div id="nav">
			<a href="../index.html">Departments</a>
			<img src="../images/arrow.gif" alt="arrow" id="nav_arrow" />
			<xsl:value-of select="(courses/course/department[@code=$dept_code]/dept_short_name)[1]" />
		</div>
	</xsl:template>

	<!-- override default behavior of outputting text nodes -->
	<xsl:template match="text()">
	</xsl:template>

</xsl:stylesheet>

