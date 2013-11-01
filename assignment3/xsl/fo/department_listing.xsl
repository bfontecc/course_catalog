<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:import href="common.xsl" />
    <xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" indent="yes" />
    
    <xsl:template match="/">
        <html lang="en">
            <body>
                <xsl:call-template name="title_content" />
                <xsl:call-template name="nav" />
                <xsl:apply-templates />
                <xsl:call-template name="footer" />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="courses">
        <table id="dept-table">
            <thead>
                <th scope="col" class="dept-name">
                    Department Name
                </th>
                <th scope="col" class="XSL-FO-link">
                    XSL-FO
                </th>
                <th scope="col" class="PDF-link">
                    PDF
                </th>
            </thead>
            <tbody>
                <xsl:for-each-group select="course" group-by="department/dept_short_name">
                    <tr>
                        <td class="dept-name">
                            <xsl:value-of select="current-grouping-key()"/>
                        </td>
                        <td class="XSL-FO-link">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>departments/</xsl:text>
                                    <xsl:value-of select="department/@code" />
                                    <xsl:text>.xsl</xsl:text>
                                </xsl:attribute>
                                XSL-FO
                            </xsl:element>
                        </td>
                        <td>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>departments/</xsl:text>
                                    <xsl:value-of select="department/@code" />
                                    <xsl:text>.pdf</xsl:text>
                                </xsl:attribute>
                                PDF
                            </xsl:element>
                        </td>
                    </tr>
                </xsl:for-each-group>
            </tbody>
        </table>

    </xsl:template>
    
    <xsl:template name="nav">
        <div id="breadcrumbs">
            <xsl:text>Departments</xsl:text>
        </div>
    </xsl:template>
    
    <xsl:template match="text()">
    </xsl:template>
    
</xsl:stylesheet>