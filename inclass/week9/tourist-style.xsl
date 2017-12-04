<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <body>
            <h3>Tourist Sites Table (by location -- ascending)</h3>
            <table>
            <thead>
                <th>Name</th>
                <th>Location</th>
                <th>Age</th>
                <th>Description</th>
                <th>Note</th>
                <th>Image</th>
            </thead>
            <xsl:apply-templates select="tourist_sites/site">
                <xsl:sort select="location" order="ascending"/>
            </xsl:apply-templates>
            </table>
            <hr/>

            <h3>Absolute Path Table (by year -- ascending)</h3>

            <table>
            <thead>
                <th>Name</th>
                <th>Location</th>
                <th>Age</th>
                <th>Description</th>
                <th>Note</th>
                <th>Image</th>
            </thead>
            <xsl:apply-templates select="tourist_sites/site[./age &lt; 1950]">
                <xsl:sort select="age" order="ascending" data-type="number"/>
            </xsl:apply-templates>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="site">
    <tr>
        <xsl:apply-templates select="name"/>
        <xsl:apply-templates select="location"/>
        <xsl:apply-templates select="age"/>
        <xsl:apply-templates select="description"/>
        <xsl:apply-templates select="notes"/>
        <xsl:apply-templates select="img"/>
    </tr>
</xsl:template>

<xsl:template match="name">
    <td>
        <xsl:value-of select="."/>
    </td>
</xsl:template>

<xsl:template match="location">
    <td>
        <xsl:value-of select="."/>
    </td>
</xsl:template>

<xsl:template match="description">
    <td>
        <xsl:value-of select="."/>
    </td>
</xsl:template>

<xsl:template match="age">
    <td>
        <xsl:value-of select="."/>
        <xsl:value-of select="./@units"/>
    </td>
</xsl:template>

<xsl:template match="notes">
    <td>
        <xsl:value-of select="note[position() = last()]"/>
    </td>
</xsl:template>

<xsl:template match="img">
    <td>
        <img style="width: 200" >
        <xsl:attribute name="src">
            <xsl:value-of select="./@src"/>
        </xsl:attribute>
        </img>
    </td>
</xsl:template>

</xsl:stylesheet>