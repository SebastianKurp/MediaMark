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
                <xsl:for-each select="catalogue/art">
                    <tr>
                        <td><xsl:value-of select="title"/></td>
                        <xsl:choose>
                            <xsl:when test="date &gt; 1900">
                                <td class="post">After: <xsl:value-of select="author"/></td>
                                <td><xsl:value-of select="date"/></td>
                            </xsl:when>
                            <!-- <xsl:otherwise>
                                <td>poop</td>
                            </xsl:otherwise> -->
                        </xsl:choose>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
