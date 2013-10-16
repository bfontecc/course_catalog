<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml">

<!-- Use these templates by importing common.xsl and using call-templates on header and footer
-->

<xsl:template name="header">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<head>
		<title> 
		<!-- static for now. Can use parameters though. -->
		Harvard University FAS Course Catalog
		</title>
		<xsl:call-template name="css" />
		<xsl:call-template name="js" />
	</head>
</xsl:template>

<xsl:template name="footer">
	<div id="footer">
		<hr />
		<ul>
			<li>Web Development with XML</li>
			<li>Bret Fontecchio</li>
			<li>Fall 2013</li>
		</ul>
	</div>
</xsl:template>

<xsl:template name="css">
	<style type="text/css">
		<!-- CSS Rules -->
	</style>
</xsl:template>

<xsl:template name="js">
	<!-- use this template to add js
	<script type="text/javascript" src="foobar.js"></script>
	-->
</xsl:template>

</xsl:stylesheet>
