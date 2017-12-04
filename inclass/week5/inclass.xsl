<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <body>
            <h2>My Art Collection</h2>
            <table>
                <tr>
                    <th>Title of Piece</th>
                    <th>Artist</th>
                    <th>Date Created</th>
                    <th>Movement</th>
                </tr>
                <xsl:for-each select="catalogue/art[date!='1787']">
                    <tr>
                        <td><xsl:value-of select="title"/></td>
                        <td><xsl:value-of select="artist"/></td>
                        <td><xsl:value-of select="date"/></td>
                        <td><xsl:value-of select="movement"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
