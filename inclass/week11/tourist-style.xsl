<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
        <body>
            <h3>Tourist Sites</h3>

            <table>
            <thead>
                <th>Name</th>
                <th>Location</th>
                <th>Age</th>
                <th>Year Built</th>
                <th>Rounded Year Built</th>
                <th>Description</th>
                <th>Short Description</th>
                <th>Note</th>
                <th>Image</th>
            </thead>
            <xsl:apply-templates select="tourist_sites/site"/>
            </table>

            <p>Average age: <xsl:value-of select="sum(/tourist_sites/site/age) div count(/tourist_sites/site)"/></p>
            
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
    <td>
        <xsl:value-of select="substring(.,1,15)"/>...
    </td>
</xsl:template>

<xsl:template match="age">
    <td>
        <xsl:value-of select="."/>
        <xsl:value-of select="translate(./@units, 'y', 'Y')"/>
    </td>
    <td>
        <xsl:value-of select="format-number(2017 - ., '#.05')"/>
    </td>
    <td>
        <xsl:value-of select="floor(format-number(2017 - ., '#.05'))"/>
    </td>
</xsl:template>

<xsl:template match="notes">
    <td>
        <xsl:value-of select="note[position() = last()]"/>
    </td>
    <!-- <td>
        <xsl:value-of select="count(./note)"/>
    </td> -->
</xsl:template>

<xsl:template match="img">
    <td>
        <a href="{./@href}" >
            <img style="width: 200" >
            <xsl:attribute name="src">
                <xsl:value-of select="./@src"/>
            </xsl:attribute>
            </img>
        </a>
    </td>
</xsl:template>

</xsl:stylesheet>