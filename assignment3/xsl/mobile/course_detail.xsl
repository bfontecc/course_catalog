<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="../common.xsl" />
    
    <xsl:output method="html" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes" encoding="UTF-8"/>
    <xsl:param name="cat_num"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <xsl:call-template name="header" />
                <!-- style info for this page -->
                <style type="text/css" media="screen">
                    .faculty_text, .meeting { font-style:italic; }
                    .indented { padding-left: .8em; }
                </style>
            </head>
            <body>
                <xsl:call-template name="title_content" />
                <xsl:call-template name="nav" />
                <xsl:apply-templates select="/courses/course[@cat_num=$cat_num]" />
                <xsl:call-template name="footer" />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="courses/course[@cat_num=$cat_num]">
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
        <p class="faculty_text indented">
            <xsl:value-of select="faculty_text" />
        </p>
        <p class="meeting indented">
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
        <p class="desc indented">
            <xsl:value-of select="description" />
        </p>
        <p class="notes">
            <xsl:value-of select="notes" />
            <xsl:comment> </xsl:comment>
        </p>
    </xsl:template>
    
    <xsl:template name="nav">
        <nav>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:text>../index.html</xsl:text>
                </xsl:attribute>
                <xsl:text>Departments</xsl:text>
            </xsl:element>
            <img src="../../images/arrow.gif" alt="arrow" class="nav_arrow" />
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:text>../index.html#</xsl:text>
                    <xsl:value-of select="(courses/course[@cat_num=$cat_num]/department/@code)[1]" />
                </xsl:attribute>
                <xsl:value-of select="(courses/course[@cat_num=$cat_num]/department/dept_short_name)[1]" />
            </xsl:element>
            <img src="../../images/arrow.gif" alt="arrow" class="nav_arrow" />
            <xsl:value-of select="courses/course[@cat_num=$cat_num]/title" />
        </nav>
    </xsl:template>
    
</xsl:stylesheet>