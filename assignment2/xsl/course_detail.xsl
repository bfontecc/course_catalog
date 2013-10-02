<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:param name="cat_num" />
  <xsl:template match="/">
    <html>
      <body>
        <h2>Catalog Number <xsl:value-of select="$cat_num"/></h2>
        <xsl:apply-templates select="/courses/course[@cat_num eq $cat_num]" />
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
