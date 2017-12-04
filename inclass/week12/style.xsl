<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/TEI">
    <html>
    <head>
        
    </head>
        <body>            
            <xsl:apply-templates select="teiHeader/fileDesc"/>
            <xsl:apply-templates select="text/body"/>
        </body>
    </html>
</xsl:template>

<xsl:template match="fileDesc">
    <h2><xsl:value-of select="titleStmt/title"/></h2>
    <xsl:value-of select="sourceDesc"/>
    <xsl:apply-templates select="titleStmt/respStmt"/>
    <h4><xsl:value-of select="publicationStmt"/></h4>
</xsl:template>

<xsl:template match="respStmt">
    <h4><xsl:value-of select="resp"/>: <xsl:value-of select="name"/></h4>
</xsl:template>

<xsl:template match="body">
    <xsl:for-each select="p">
        <p><xsl:value-of select="."/></p>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>