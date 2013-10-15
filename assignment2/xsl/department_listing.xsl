<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

		<xsl:import href="common.xsl" />

        <xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" indent="yes" />

		<xsl:template match="/">
			<xsl:call-template name="header" />
			<xsl:text>Hello from department_listing.xsl</xsl:text>
			<xsl:call-template name="footer" />
		</xsl:template>

</xsl:stylesheet>
