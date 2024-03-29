<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml">
	<xsl:param name="base_url" />
	<xsl:template name="header">
		<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
			<title> 
			Harvard University FAS Course Catalog
			</title>
			<xsl:call-template name="css" />
			<xsl:call-template name="js" />
		</head>
	</xsl:template>
	
	<xsl:template name="title_content">
		<div id="title">
			<img src="{$base_url}/images/harvard_shield.png" alt="shield" />
			<h1>Harvard University Faculty of Arts and Sciences Course Catalog</h1>
		</div>
	</xsl:template>
	
	<xsl:template name="footer">
		<div id="footer">
			<hr />
				<xsl:text>
				Web Development with XML | Bret Fontecchio | Fall 2013
				</xsl:text>
		</div>
	</xsl:template>
	
	<xsl:template name="css">
		<link rel="stylesheet" type="text/css"
			href="{$base_url}/css/site.css" title="site" media="screen" />
	</xsl:template>
	
	<xsl:template name="js">
		<!-- use this template to add js
		<script type="text/javascript" src="js/foobar.js"></script>
		-->
	</xsl:template>

</xsl:stylesheet>
