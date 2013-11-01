<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <xsl:import href="toc.xsl"/>
    <xsl:import href="attribute_sets.xsl"/>
    <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
    <xsl:param name="dept_code" />
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" page-height="11in" page-width="8.5in" margin-top="1.0in" margin-bottom="1.0in" margin-left="1.25in" margin-right="1.25in">
                    <fo:region-body margin-top="3em"/>
                    <fo:region-before extent="1em"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <!-- Page number in the top-right corner -->
            <fo:page-sequence master-reference="simple">
                <fo:static-content flow-name="xsl-region-before">
                    <xsl:call-template name="header" />
                </fo:static-content>
                <!-- Our main content -->
                <fo:flow flow-name="xsl-region-body">
                    <!-- generate department title -->
                    <xsl:call-template name="dept-title" />
                    <!-- generate table of contents -->
                    <xsl:call-template name="toc">
                        <xsl:with-param name="dept_code" select="$dept_code" />
                    </xsl:call-template>
                    <!-- loop through all courses for this department, grouped by course_group code, sorted alphabetically -->
                    <xsl:for-each-group select="courses/course[department/@code=$dept_code]" group-by="course_group/@code">
                        <xsl:sort select="course_group" />
                        <!-- create a block for group, with group code from xml as id in fo -->
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
                    <fo:block id="doc-end" />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <xsl:template name="header">
        <fo:block font-size="10pt" text-align="end">
            <xsl:value-of select="(courses/course[department/@code=$dept_code]/department/dept_short_name)[1]" />
            <xsl:text>, Page </xsl:text>
            <fo:page-number />
            <xsl:text> of </xsl:text>
            <fo:page-number-citation ref-id="doc-end" />
        </fo:block>
    </xsl:template>
    
    <xsl:template name="dept-title">
        <fo:block font-size="24pt" font-family="Times Serif" text-align="center" font-weight="bold">
            <xsl:value-of select="(courses/course[department/@code=$dept_code]/department/dept_long_name)[1]" />
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
    

    
</xsl:stylesheet>