<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<!--Created by Sebastian Kurpiel on 12-5-17-->
    <html>
    <head>
        <title>Your Comments</title>
    </head>
        <body>
          <h1>Comments on your File</h1>
                <xsl:apply-templates/>
            </div>
        </body> 
    </html>
</xsl:template>
<xsl:template match="file">
  <p>
    <xsl:apply-templates select="desc"/>
    <xsl:apply-templates select="comments"/>
  </p>
</xsl:template>
<xsl:template match="comments">
  <p>
    <xsl:value-of select="."/>
  <p>
</xsl:template>
<xsl:template match="comment">
  <xsl:apply-templates match="title"/>
  <xsl:apply-templates match="author"/>
  <xsl:apply-templates match="mentions"/>
  <xsl:apply-templates match="quote"/>
  <xsl:apply-templates match="note"/>
</xsl:apply-template>
<xsl:template match="title">
  <p>
    <xsl:value-of select="."/>
  </p>
</xsl:template>
<xsl:template match="author">
  <p>
    <xsl:value-of select="."/>
  </p>
</xsl:template>
<xsl:template match="mentions">
  <p>
    <xsl:value-of select="."/>
  </p>
</xsl:template>
<xsl:template match="quote">
  <p>
    <xsl:value-of select="."/>
  </p>
</xsl:template>
<xsl:template match="note">
  <p>
    <xsl:value-of select="."/>
  </p>
</xsl:template>
</xsl:stylesheet>