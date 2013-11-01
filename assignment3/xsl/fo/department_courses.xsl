<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
    
    <xsl:param name="dept_code" />
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" page-height="11in" page-width="8.5in" margin-top="1.0in" margin-bottom="1.0in" margin-left="1.25in" margin-right="1.25in">
                    <fo:region-body margin-top="0.25in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
            <fo:flow flow-name="xsl-region-body">
                <!-- generate table of contents -->
                <xsl:call-template name="TOC" />
                <!-- loop through all courses for this department, grouped by course_group code, sorted alphabetically -->
                <xsl:for-each-group select="courses/course[department/@code=$dept_code]" group-by="course_group/@code">
                    <xsl:sort select="course_group" />
                    <!-- create a block for this group, with id group code -->
                    <fo:block id="{current-grouping-key()}">
                        <!-- show the group name -->
                        <fo:block xsl:use-attribute-sets="group" break-before="page">
                            <xsl:value-of select="./course_group[@code=current-grouping-key()]" />
                        </fo:block>
                        <!-- loop through each course in the group -->
                        <xsl:for-each select="current-group()">
                            <fo:block xsl:use-attribute-sets="title" id="{generate-id()}">
                                <xsl:call-template name="title" />
                            </fo:block>
                            <fo:block xsl:use-attribute-sets="text" font-style="italic">
                                <xsl:text>Catalog Number: </xsl:text>
                                <xsl:value-of select="@cat_num" />
                            </fo:block>
                            <fo:block xsl:use-attribute-sets="text" font-style="italic">
                                <xsl:value-of select="faculty_text" />
                            </fo:block>
                            <fo:block xsl:use-attribute-sets="text">
                                <xsl:value-of select="credit" />
                                <xsl:text> (</xsl:text>
                                <xsl:value-of select="term" />
                                <xsl:text>) </xsl:text>
                                <xsl:value-of select="meeting_text" />
                            </fo:block>
                            <fo:block xsl:use-attribute-sets="text">
                                <xsl:value-of select="course_level" />
                                <xsl:text> / </xsl:text>
                                <xsl:value-of select="course_type" />
                            </fo:block>
                            <fo:block xsl:use-attribute-sets="p">
                                <xsl:value-of select="description" />
                            </fo:block>
                            <fo:block xsl:use-attribute-sets="p">
                                <xsl:value-of select="notes" />
                                <xsl:comment> </xsl:comment>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block>
                </xsl:for-each-group>
            </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <xsl:template name="TOC">
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
                    <xsl:with-param name="anchor-dest" select="generate-id()"></xsl:with-param>
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

    <xsl:template name="title">
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
    </xsl:template>
    
    <xsl:attribute-set name="text">
        <xsl:attribute name="font-family">Helvetica, sansSerif</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="p">
        <xsl:attribute name="space-before.optimum">.5em</xsl:attribute>
        <xsl:attribute name="margin-left">1em</xsl:attribute>
        <xsl:attribute name="text-indent">1em</xsl:attribute>
        <xsl:attribute name="font-size">11pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="title">
        <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">.2em</xsl:attribute>
        <xsl:attribute name="font-size">13pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="group">
        <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">.2em</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>