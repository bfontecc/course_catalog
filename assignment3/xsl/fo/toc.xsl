<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <xsl:template name="toc">
        <xsl:param name="dept_code" />
        <!-- loop through all courses for this department, grouped by course_group code (just like before) -->
        <xsl:for-each-group select="courses/course[department/@code=$dept_code]" group-by="course_group/@code">
            <xsl:sort select="course_group" />
            <!-- map our group code (which is the current-grouping key) to a more verbose group_name -->
            <xsl:variable name="group_name" select="./course_group[@code=current-grouping-key()]" />
            <!-- generate group link in bold text-->
            <fo:block xsl:use-attribute-sets="title">
                <xsl:call-template name="toc-link">
                    <xsl:with-param name="anchor-text" select="$group_name" />
                    <xsl:with-param name="anchor-dest" select="generate-id()" />
                </xsl:call-template>
            </fo:block>
            <!-- generate course links in regular text-->
            <xsl:for-each select="current-group()">
                <xsl:sort select="course_number/num_int" />
                <xsl:call-template name="toc-link">
                    <xsl:with-param name="anchor-text" select="title" />
                    <xsl:with-param name="anchor-dest" select="generate-id()" />
                </xsl:call-template>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="toc-link">
        <xsl:param name="anchor-text" />
        <xsl:param name="anchor-dest" />
        <fo:block xsl:use-attribute-sets="text" text-align-last="justify">
            <fo:basic-link>
                <xsl:attribute name="internal-destination">
                    <xsl:value-of select="$anchor-dest" />
                </xsl:attribute>
                <xsl:value-of select="$anchor-text"/>
            </fo:basic-link>
            <fo:leader leader-pattern="dots"/>
            <fo:page-number-citation>
                <xsl:attribute name="ref-id">
                    <xsl:value-of select="$anchor-dest" />
                </xsl:attribute>
            </fo:page-number-citation>
        </fo:block>
    </xsl:template>
    
</xsl:stylesheet>