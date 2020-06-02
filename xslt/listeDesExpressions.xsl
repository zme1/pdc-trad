<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:text>Expression anglaise</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Expression française</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Partie du corps</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Métaphore (ou non)</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="descendant::trad">
            <xsl:value-of select="normalize-space(preceding-sibling::alt)"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="preceding-sibling::alt/@pos"/>
            <xsl:text>.</xsl:text>
            <xsl:choose>
                <xsl:when test="preceding-sibling::alt/@fig = 'true' and preceding-sibling::alt/@loc = 'true'">
                    <xsl:text>, fig., loc.)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt/@fig = 'false' and preceding-sibling::alt/@loc = 'false'">
                    <xsl:text>)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt/@fig = 'true' and preceding-sibling::alt/@loc = 'false'">
                    <xsl:text>, fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt/@fig = 'false' and preceding-sibling::alt/@loc = 'true'">
                    <xsl:text>, loc.)</xsl:text>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="preceding-sibling::alt/@register and not(preceding-sibling::alt/@note)">
                <xsl:text> (</xsl:text><xsl:value-of select="preceding-sibling::alt/@register"/><xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:if test="preceding-sibling::alt/@register and preceding-sibling::alt/@note">
                <xsl:text> (</xsl:text><xsl:value-of select="preceding-sibling::alt/@register"/><xsl:text>, </xsl:text><xsl:value-of select="preceding-sibling::alt/@note"/><xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:if test="not(preceding-sibling::alt/@register) and preceding-sibling::alt/@note">
                <xsl:text> (</xsl:text><xsl:value-of select="preceding-sibling::alt/@note"/><xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@pos"/>
            <xsl:text>.</xsl:text>
            <xsl:choose>
                <xsl:when test="@fig = 'true' and @loc = 'true'">
                    <xsl:text>, fig., loc.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig = 'false' and @loc = 'false'">
                    <xsl:text>)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig = 'true' and @loc = 'false'">
                    <xsl:text>, fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig = 'false' and @loc = 'true'">
                    <xsl:text>, loc.)</xsl:text>
                </xsl:when>
            </xsl:choose>
            <xsl:text>&#x9;</xsl:text>
            <xsl:choose>
                <xsl:when test="@pdc = 'same'">
                    <xsl:text>Oui, la même</xsl:text>
                </xsl:when>
                <xsl:when test="@pdc = 'dif'">
                    <xsl:text>Oui, mais différente</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Non</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x9;</xsl:text>
            <xsl:choose>
                <xsl:when test="@metaphor='same'">
                    <xsl:text>Oui, la même</xsl:text>
                </xsl:when>
                <xsl:when test="@metaphor='dif'">
                    <xsl:text>Oui, mais différente</xsl:text>
                </xsl:when>
                <xsl:when test="@metaphor='unsure'">
                    <xsl:text>Incertain</xsl:text>
                </xsl:when>
            </xsl:choose>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
