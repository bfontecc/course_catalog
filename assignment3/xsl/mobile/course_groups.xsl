<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="../common.xsl" />
    
    <xsl:output method="html" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes" encoding="UTF-8"/>
    <xsl:param name="group_code"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <xsl:call-template name="header" />
                <!-- style info for this page -->
                <style type="text/css" media="screen">
                    ul.course_list {
                         margin: 0;
                         padding: 0;
                    }
                    li.course_item {
                        list-style-type: square;
                        list-style-position: outside;
                        margin-left: 1em;
                        padding: .18em;
                    }
                </style>
            </head>
            <body>
                <xsl:call-template name="title_content" />
                <xsl:call-template name="nav" />
                <xsl:apply-templates />
                <xsl:call-template name="footer" />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="courses">
        <!-- course group name -->
        <h2>
            <xsl:value-of select="(course/course_group[@code=$group_code])[1]"/>
        </h2>
        <ul class="course_list">
            <xsl:for-each select="/courses/course[course_group/@code=$group_code]">
                <xsl:sort select="course_number/num_int" />
                <li class="course_item">
                <xsl:call-template name="course_title" />
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template name="course_title">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:call-template name="course_href" />
            </xsl:attribute>
            <xsl:if test="instructor_approval_required = 'Y'">
                <xsl:text>*</xsl:text>
            </xsl:if>
            <xsl:if test="@offered = 'N'">
                <xsl:text>[</xsl:text>
            </xsl:if>
            <xsl:value-of select="title" />
            <xsl:if test="@offered = 'N'">
                <xsl:text>]</xsl:text>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="course_href">
        <xsl:text>../courses</xsl:text>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="@cat_num" />
        <xsl:text>.html</xsl:text>
    </xsl:template>
    
    <xsl:template name="nav">
        <nav>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:text>../index.html</xsl:text>
                </xsl:attribute>
                <xsl:text>Departments</xsl:text>
            </xsl:element>
        </nav>
    </xsl:template>
    
</xsl:stylesheet>