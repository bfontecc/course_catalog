<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:template match="/">
        <xsl:text>{"courses":[</xsl:text>
        <xsl:apply-templates select="//course"/>
        <xsl:text>]}</xsl:text>
    </xsl:template>
    
    <xsl:template match="course">
        {
        "title":"<xsl:value-of select="title"/>",
        "course_group":"<xsl:value-of select="course_group"/>",
        "catalog_number":"<xsl:value-of select="@cat_num"/>",
        "course_number":"<xsl:value-of select="course_number/num_int"/>",
        "term":"<xsl:value-of select="term"/>",
        "offered":"<xsl:value-of select="@offered"/>",
        "course_type":"<xsl:value-of select="course_type"/>",
        "course_level":"<xsl:value-of select="course_level"/>"
        }<xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
    </xsl:template>
</xsl:stylesheet>