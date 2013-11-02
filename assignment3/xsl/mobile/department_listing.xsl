<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="../common.xsl" />
    
    <xsl:output method="html" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <xsl:call-template name="header" />
                <style type="text/css" media="screen">
                    .group_item {
                        list-style-type: square;
                        list-style-position: outside;
                        margin-left: 1em;
                        padding-left: .5em;
                    }
                    .group_list {
                        margin: 0;
                        padding: 0;
                    }
                </style>
            </head>
            <body>
                <xsl:call-template name="title_content" />
                <xsl:apply-templates />
                <xsl:call-template name="footer" />
            </body>
        </html>
        
    </xsl:template>
    
    <!-- match on courses because it's the root node
        Generate list of department name links using for-each-group loop
        grouping on department name.
        Within each department, generate list of links by group-->
    <xsl:template match="courses">
        <ul class="department_list">
            <xsl:for-each-group select="course" group-by="department/dept_short_name">
                <xsl:sort select="department/dept_short_name" />
                    <!-- outer list item is department name
                        create department name text with dept code id-->
                <xsl:variable name="dept_code" select="department[dept_short_name=current-grouping-key()]/@code" />
                    <li class="dept_item" id="{translate($dept_code, ' ', '')}">
                    <xsl:value-of select="current-grouping-key()"/>
                    <ul class="group_list">
                    <!-- inner li is course group link -->
                    <xsl:for-each-group select="current-group()" group-by="course_group/@code">
                        <xsl:sort select="course_group" />
                        <li class="group_item">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>course_groups/</xsl:text>
                                    <xsl:value-of select="current-grouping-key()" />
                                    <xsl:text>.html</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="course_group"/>
                            </xsl:element>
                        </li>
                    </xsl:for-each-group>
                    </ul>
                    </li>
            </xsl:for-each-group>
        </ul>
    </xsl:template>


</xsl:stylesheet>