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
                <xsl:for-each select="courses/course[department/@code=$dept_code]">
                    <fo:block xsl:use-attribute-sets="text title" id="{generate-id()}">
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
            </fo:flow>
            </fo:page-sequence>
        </fo:root>
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
    
</xsl:stylesheet>