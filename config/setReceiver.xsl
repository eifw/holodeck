<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pmode="http://holodeck-b2b.org/schemas/2014/06/pmode">
    <xsl:param name="receiverHost">localhost:8080</xsl:param>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/pmode:PMode/pmode:Leg/pmode:Protocol/pmode:Address">
        <pmode:Address>
            <xsl:value-of select="concat('http://', $receiverHost, '/msh')"/>
        </pmode:Address>
    </xsl:template>
</xsl:stylesheet>
