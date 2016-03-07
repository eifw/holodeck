<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="port">8080</xsl:param>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/axisconfig/transportReceiver/parameter[@name='port']">
        <parameter name="port"><xsl:value-of select="$port"/></parameter>
    </xsl:template>

</xsl:stylesheet>