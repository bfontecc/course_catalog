<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
	<!-- there are no output options here because the serializer has the last say anyway.
		see sitemap.xmap components for serializer output options -->
    
    <!-- search criteria -->
    <xsl:param name="keyword" />
    <xsl:param name="course_group" select="'*'"/>
    <xsl:param name="term" />
    <xsl:param name="offered" />   
    <xsl:param name="course_type" />
    
    <!-- filter by keyword -->
    <xsl:template match="/">
        <courses>
        <xsl:apply-templates select="/courses/course[(
            ($keyword=''             or contains(.,$keyword))
            and ($course_group=''   or $course_group='*'    or course_group/@code=$course_group)
            and ($term=''           or $term='*'            or term/@term_pattern_code=$term)
            and ($offered=''        or $offered='*'         or @offered=$offered)
            and ($course_type=''    or $course_type='*'     or course_type=$course_type)
            )]"/>
        </courses>
    </xsl:template>
	<!-- this is only called from a select, i.e. we have already filtered when we match course -->
    <xsl:template match="course">
        <xsl:copy-of select="." />
    </xsl:template>
    <xsl:template match="text()">
    </xsl:template>
</xsl:stylesheet>
