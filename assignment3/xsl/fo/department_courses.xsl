<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" page-height="11in" page-width="8.5in" margin-top="1.0in" margin-bottom="1.0in" margin-left="1.25in" margin-right="1.25in">
                    <fo:region-body margin-top="0.25in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
            <fo:flow flow-name="xsl-region-body">
                <fo:block font-size="18pt" font-family="sans-serif" line-height="24pt" space-after.optimum="15pt" background-color="blue" color="white" text-align="center" padding-top="3pt">
                    USPS Abbreviations
                </fo:block><!-- this defines normal text -->
                <fo:table>
                    <fo:table-column column-width="1in"/>
                    <fo:table-column column-width="4in"/>
                    <fo:table-body>
                        <xsl:apply-templates select="/usps/state"/>
                    </fo:table-body>
                </fo:table>
            </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>