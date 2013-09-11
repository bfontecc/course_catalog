<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="/current_observation/location"/></title>
      </head>
      <body>
        <xsl:apply-templates />
      </body>
    </html>
  </xsl:template>
  
  
  <xsl:template match="current_observation">
    <h1>
      <xsl:value-of select="location"/>
    </h1>
    <!-- Add here to build XHTML content
         with the weather data -->
  </xsl:template>


</xsl:stylesheet>
