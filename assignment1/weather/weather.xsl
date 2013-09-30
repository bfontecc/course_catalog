<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
	<xsl:template match="/">
	<html>
	<head>
		<title><xsl:value-of select="/current_observation/location"/></title>
		<style type="text/css">
			body {
				font-family: Arial, Sans-Serif;
			}
			td.var_name {
				text-align: right;
				padding-right: .5em;
				font-weight: bold;
			}
			p#history, p#source {
				padding-left: .5em;
			}
			p#update {
				font-size: .8em;
			}
			table#basic_info {
				margin-left: 4em;
			}
			#weather {
				text-align: center;
			}
			#temp {
				font-size: 2em;
				margin: 0;
				padding: 0 .5em 0 .5em;
			}
		</style>
	</head>
	<body>
		<xsl:apply-templates />
		</body>
	</html>
	</xsl:template>
  
  
	<xsl:template match="current_observation">
	<h1>
		<xsl:value-of select="location"/>
	</h1>
		<table id="basic_info">
			<tr>
			<td>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="concat(icon_url_base, icon_url_name)"/>
				</xsl:attribute>
			</img>
			</td>
			<td>
				<p id="temp">
				<xsl:value-of select="temp_f"/>
				&#176;F
				</p>
			</td>
			</tr>
			<tr>
			<td id="weather">
					<xsl:value-of select="weather"/>
			</td>
			</tr>
		</table>
		<table id="additional_info">
			<tr>
				<td class="var_name">Wind</td>
				<td>
					<xsl:value-of select="wind_string"/>
				</td>
			</tr>
			<tr>
				<td class="var_name">Humidity</td>
				<td>
					<xsl:value-of select="relative_humidity"/>%
				</td>
			</tr>
			<tr>
				<td class="var_name">Pressure</td>
				<td>
					<xsl:value-of select="pressure_in"/>"
				</td>
			</tr>
			<tr>
				<td class="var_name">Dew Point</td>
				<td>
					<xsl:value-of select="dewpoint_f"/>&#176;F
				</td>
			</tr>
			<tr>
				<td class="var_name">Visibility</td>
				<td>
					<xsl:value-of select="visibility_mi"/> mi
				</td>
			</tr>
		</table>
		<p id="update">
			<xsl:value-of select="observation_time"/>
		</p>
		<p id="history">
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="two_day_history_url"/>
				</xsl:attribute>
				View Two-Day History
			</xsl:element>
		</p>
		<p id="source">
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="credit_url"/>
				</xsl:attribute>
				<xsl:value-of select="credit"/>
			</xsl:element>
		</p>
	</xsl:template>


</xsl:stylesheet>
