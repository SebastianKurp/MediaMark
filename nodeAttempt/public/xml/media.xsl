<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <body>
            <h2>Comments</h2>
            <table>
                <tr>
                    <th>Author</th>
                    <th>Mentions</th>
                    <th>Quote</th>
                </tr>
                <xsl:for-each select="directory/file/comment">
                    <tr>
                        <td><xsl:value-of select="author"/></td>
                        <td><xsl:value-of select="mention"/></td>
                        <td><xsl:value-of select="quote"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
