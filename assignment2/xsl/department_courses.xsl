<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="dept_code" />
	<xsl:import href="common.xsl" />
	<xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" indent="yes" />

	<xsl:template match="/">
		<html lang="en">
			<xsl:call-template name="header" />
			<body>
				<xsl:call-template name="title_content" />
				<xsl:call-template name="nav" />
				<xsl:apply-templates />
				<xsl:call-template name="footer" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="courses">
		<xsl:for-each-group select="course[department/@code=$dept_code]" group-by="course_group/@code">
			<div class="course_group" id="{current-grouping-key()}">
				<table id="course_name">
					<caption>
						<h2>
							<xsl:value-of select="./course_group[@code=current-grouping-key()]" />
						</h2>
					</caption>
					<thead>
						<tr>
							<th>Number</th>
							<th>Term</th>
							<th>Title</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="current-group()">
							<xsl:sort select="course_number/num_int" />
							<xsl:sort select="course_number/num_char" />
							<tr>
								<td class="course_number">
									<xsl:value-of select="./course_group[@code=current-grouping-key()]" />
									<xsl:value-of select="./course_number/num_int" />
									<xsl:value-of select="./course_number/num_char" />
								</td>
								<td class="term">
									<xsl:value-of select="./term" />
								</td>
								<td class="course_title">
									<xsl:value-of select="./title" />
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				
			</div>
		</xsl:for-each-group>
	</xsl:template>

	<xsl:template name="nav">
		<div id="nav">
			<a href="../index.html">Departments</a>
			<img src="../images/arrow.gif" alt="arrow" id="nav_arrow" />
			<xsl:value-of select="(courses/course/department[@code=$dept_code]/dept_short_name)[1]" />
		</div>
	</xsl:template>

	<!-- override default behavior of outputting text nodes -->
	<xsl:template match="text()">
	</xsl:template>

</xsl:stylesheet>

