<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
<xsl:variable name="title">Weather</xsl:variable>

	<xsl:template match="/">
		<html>
                  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
			<head>
				<title><xsl:value-of select="$title"/></title>
				<xsl:call-template name="js"/>
				<xsl:call-template name="css"/>
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
<xsl:template name="css">
<style type="text/css">body {font-family: calibri,verdana,arial,helvetica,sans-serif;}
	p {margin: 0px; padding: 0px;}
	img { border: none; }
	a, a:link, a:visited {background-color: white; color: blue; text-decoration: none;}
	a:hover { text-decoration: underline; color: white; background-color: blue;}
	.temp {font-size: 250%; font-weight: bold; }
	.weather {text-align: center;}
	.current table td { text-align: center; padding: .25em;}
	.conditions table th { text-align: right; }
	.conditions table td { text-align: left; padding-left: 0.5em;}
        .lastupdated {font-size: 0.80em; margin-top: 0.25em;}
	.links {margin-top: 0.25em; }
	.credit { font-size: 0.75em; margin-top: 1em; padding-top: 1em; border-top: thin solid black;}
</style>
</xsl:template>
<xsl:template name="footer">
		<p class="credit">

			<a href="{image/link}">
				<img src="{image/url}" alt="{image/title}"/>
			</a>
			&#160;
			<a href="{credit_URL}">
				<xsl:value-of select="credit"/>
			</a>
		</p>
<xsl:comment>
          XSL Version: <xsl:value-of select="system-property('xsl:version')"/>
          Vendor: <xsl:value-of select="system-property('xsl:vendor')"/>
          URL: <xsl:value-of select="system-property('xsl:vendor-url')"/>
          Product Name: <xsl:value-of select="system-property('xsl:product-name')"/>
          Product Version: <xsl:value-of select="system-property('xsl:product-version')"/>

</xsl:comment>
</xsl:template>
<xsl:template name="js" />
</xsl:stylesheet>
