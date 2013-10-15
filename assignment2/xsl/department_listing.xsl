<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

        <xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" indent="yes" />

		<!-- we are currently in the xsl folder, with common.xsl
		<xsl:import href="common.xsl" />
		-->

		<xsl:template match="/">
			<xsl:text>Hello from department_listing.xsl</xsl:text>
		</xsl:template>

</xsl:stylesheet>
