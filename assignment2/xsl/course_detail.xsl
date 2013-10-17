<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="2.0">
  <xsl:import href="common.xsl" />
  <xsl:param name="cat_num" />
  <xsl:template match="/">
    
    <html>
      <body>
        <xsl:call-template name="title_content" />
        <xsl:apply-templates select="/courses/course[@cat_num eq $cat_num]" />
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:call-template name="nav" />
    <h2>
      <xsl:value-of select="title" />
    </h2>
    <h3>
      <xsl:value-of select="course_group" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="course_number/num_int" />
      <xsl:value-of select="course_number/num_char" />
      <xsl:text>. </xsl:text>
      <xsl:value-of select="title" />
    </h3>
    <p id="cat_num">
      <xsl:text>Catalog Number: </xsl:text>
      <xsl:value-of select="@cat_num" />
    </p>
    <p id="faculty_text">
      <xsl:value-of select="faculty_text" />
    </p>

  </xsl:template>
  
  <xsl:template name="nav">
    <div id="nav">
      <a href="../index.html">Departments</a>
      <img src="../images/arrow.gif" alt="arrow" class="nav_arrow" />
      <xsl:call-template name="dept_link" />
      <img src="../images/arrow.gif" alt="arrow" class="nav_arrow" />
      <xsl:value-of select="title" />
    </div>
  </xsl:template>
  
  <xsl:template name="dept_link">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:text>../departments/</xsl:text>
        <xsl:value-of select="department/@code" />
        <xsl:text>.html</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="department/dept_short_name" />
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="text()">
  </xsl:template>

</xsl:stylesheet>
