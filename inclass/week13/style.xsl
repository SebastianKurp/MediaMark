<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/TEI">
    <html>
    <head>
        
    </head>
        <body>            
            <xsl:apply-templates select="teiHeader/fileDesc"/>
            <xsl:apply-templates select="text/p"/>
        </body>
    </html>
</xsl:template>

<xsl:template match="fileDesc">
    <h2><xsl:value-of select="titleStmt/title"/></h2>
    <h4>by <xsl:value-of select="titleStmt/author"/></h4>
    <h6><xsl:value-of select="sourceDesc/edition"/></h6>
    <xsl:apply-templates select="titleStmt/respStmt"/>
    <xsl:apply-templates select="publicationStmt"/>
</xsl:template>

<xsl:template match="respStmt">
    <h4><xsl:value-of select="resp"/>: <xsl:value-of select="name"/></h4>
</xsl:template>

<xsl:template match="publicationStmt">
    <h4><xsl:value-of select="ps"/></h4>
    <h4><xsl:value-of select="publisher"/></h4>
    <h4><xsl:value-of select="location"/></h4>
</xsl:template>

<xsl:template match="p">
    
</xsl:template>
</xsl:stylesheet>