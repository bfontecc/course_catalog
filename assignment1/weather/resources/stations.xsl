<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="common.xsl" />
<xsl:key name="statekey" match="station" use="state"/>
<xsl:variable name="title">NOAA NWS Weather Stations</xsl:variable>

	<xsl:template match="wx_station_index"><h1>NOAA NWS<br/>Weather Stations</h1>
<ul>
        <xsl:apply-templates
          select="station[
          generate-id() = 
          generate-id(key('statekey',state)[1])]"
          mode="state">
          <xsl:sort select="document('usps.xml')/usps/state[@abbreviation=current()/state]/@name"/>
        </xsl:apply-templates>
</ul>
                <xsl:call-template name="footer"/>
	</xsl:template>

<xsl:template match="station" mode="state">
<xsl:choose>
<xsl:when test="count(document('usps.xml')/usps/state[@abbreviation=current()/state]) = 1">
<li>
<a id="{state}" class="stationname" href="#">
<xsl:value-of select="document('usps.xml')/usps/state[@abbreviation=current()/state]/@name" />
</a>
<ul id="stationlist-{state}" style="display: none;">
<xsl:apply-templates select="key('statekey',state)" >
<xsl:sort select="station_name"/>
</xsl:apply-templates>
</ul>
</li>
</xsl:when>
<xsl:otherwise>
<!-- nothing -->
</xsl:otherwise>
</xsl:choose>
</xsl:template>
<xsl:template match="station">
<li>
<a href="{station_id}.html"><xsl:value-of select="station_name"/></a>
</li>
</xsl:template>
<xsl:template name="js">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js">&#160;</script>
<script type="text/javascript">
$(document).ready(function(){
  $("a.stationname").toggle(
    function(event){
      var myid = '#stationlist-'+this.id;
      $(myid).fadeIn('slow');
      event.preventDefault();
    },
    function(event){
      var myid = '#stationlist-'+this.id;
      $(myid).fadeOut('slow');
      event.preventDefault();
    }
  );
});
</script>
</xsl:template>
</xsl:stylesheet>
