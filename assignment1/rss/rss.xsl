<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">
	<xsl:param name="wantdesc">
		<xsl:value-of select="'yes'" />
	</xsl:param>
        <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
          doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
          indent="yes" />
        <xsl:template match="/">
          <html>
            <head>
              <title>
                <xsl:value-of select="/rss/channel/title" />
              </title>
              <meta name="description" content="{/rss/channel/description}" />
              <xsl:call-template name="css"/>
            </head>
            <body>
              <h1>
                <a href="{normalize-space(/rss/channel/link)}">
                  <xsl:value-of select="/rss/channel/title" />
                </a>
              </h1>
              <div class="description">
                <xsl:apply-templates select="/rss/channel/image" />
                <xsl:value-of select="/rss/channel/description"/>
              </div>
              <xsl:apply-templates />
              <hr style="clear: both;"/>
              <p >
                <xsl:call-template name="validxhtml" />
                <xsl:call-template name="validcss" />
              </p>
            </body>
          </html>
        </xsl:template>
        
        <xsl:template match="channel">
          <xsl:apply-templates select="item" />
	</xsl:template>
        
        <xsl:template match="item">
          <div class="item">
            <div class="rsstitle">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="link" />
                </xsl:attribute>
                <xsl:value-of select="title" />
              </a>
            </div>
            <xsl:if test="$wantdesc = 'yes'">
              <div class="rssdescription">
                <xsl:value-of select="description"  disable-output-escaping="yes" />
              </div>
            </xsl:if>
          </div>
	</xsl:template>
        
        <xsl:template match="image">
          <xsl:if test="url">
            <a href="{normalize-space(/rss/channel/link)}">
              <img src="{normalize-space(url)}" alt="{title}" width="{width}"
                height="{height}" />
            </a>
          </xsl:if>
        </xsl:template>
        <xsl:template match="text()" />
        <xsl:template name="validxhtml">
          <a href="http://validator.w3.org/check/referer">
            <img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0!"
              height="31" width="88" />
          </a>
        </xsl:template>
        <xsl:template name="validcss">
          <a href="http://jigsaw.w3.org/css-validator/check/referer">
            <img src="http://jigsaw.w3.org/css-validator/images/vcss" height="31"
              width="88" alt="Valid CSS!" />
          </a>
        </xsl:template>
        
	<xsl:template name="css">
	<style type="text/css">body { margin: 1em; background-color: #ffd; font-family: calibri, tahamo, verdana, helvetica, sans-serif; }
div.rssdescription {font-size: 0.8em;}
div.rsstitle {font-weight: bold;}
div.item { width: 90%; float: left; padding: 0.5em; margin: 0.5em; border: thin dotted black; background-color: #fff; }
h1 {text-align: center}
a:active, a:visited {text-decoration: none;}
a:link { text-decoration: none;}
a:hover { background-color: blue; color: white }
div.description img {float: left; margin-right: 1em;}
div.description {float: left; font-style: italic; margin-bottom: 1em;}
h1 a:link, h1 a:hover, h1 a:visited { text-decoration: none; background-color: #ffd; color: #000;}
img { border:none; }
img.itemthumbnail {margin-right: 5px; float: left;}</style>
   </xsl:template>
</xsl:stylesheet>
