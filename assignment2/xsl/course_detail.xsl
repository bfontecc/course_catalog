<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="2.0">
  <xsl:import href="common.xsl" />
  <xsl:param name="cat_num" />
  <xsl:template match="/">
    
    <html>
      <xsl:call-template name="header" />
      <body>
        <xsl:call-template name="title_content" />
        <xsl:apply-templates select="/courses/course[@cat_num eq $cat_num]" />
        <xsl:call-template name="footer" />
      </body>
    </html>
  </xsl:template>
  
  <!-- used pull style because data is not really nested, and xpaths can't be refactored -->
  <xsl:template match="*">
    <xsl:call-template name="nav" />
    <h2>
      <xsl:value-of select="title" />
    </h2>
    <h3>
      <xsl:if test="instructor_approval_required = 'Y'">
        <xsl:text>*</xsl:text>
      </xsl:if>
      <xsl:if test="@offered='N'">
        <xsl:text> [</xsl:text>
      </xsl:if>
      <xsl:value-of select="course_group" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="course_number/num_int" />
      <xsl:value-of select="course_number/num_char" />
      <xsl:text>. </xsl:text>
      <xsl:value-of select="title" />
      <xsl:if test="@offered='N'">
        <xsl:text>] </xsl:text>
      </xsl:if>
    </h3>
    <p class="cat_num">
      <xsl:text>Catalog Number: </xsl:text>
      <xsl:value-of select="@cat_num" />
    </p>
    <p class="faculty_text">
      <xsl:value-of select="faculty_text" />
    </p>
    <p class="meeting">
      <xsl:value-of select="credit" />
      <xsl:text> (</xsl:text>
      <xsl:value-of select="term" />
      <xsl:text>) </xsl:text>
      <xsl:value-of select="meeting_text" />
    </p>
    <p class="level">
      <xsl:value-of select="course_level" />
      <xsl:text> / </xsl:text>
      <xsl:value-of select="course_type" />
    </p>
    <p class="desc">
      <xsl:value-of select="description" />
    </p>
    <p class="notes">
      <xsl:value-of select="notes" />
      <xsl:comment> </xsl:comment>
    </p>
    
  </xsl:template>
  
  <xsl:template name="nav">
    <div id="breadcrumbs">
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
