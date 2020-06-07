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
        <xsl:text>Signification conventionnalisé</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="descendant::trad">
            <xsl:value-of select="normalize-space(preceding-sibling::alt)"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="preceding-sibling::alt/@pos"/>
            <xsl:text>.</xsl:text>
            <xsl:choose>
                <xsl:when test="preceding-sibling::alt/@fig = 'true' and preceding-sibling::alt/@idiom = 'loc'">
                    <xsl:text>, loc., fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt/@fig = 'false' and preceding-sibling::alt/@idiom = 'none'">
                    <xsl:text>)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt/@fig = 'true' and preceding-sibling::alt/@idiom = 'none'">
                    <xsl:text>, fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt/@fig = 'false' and preceding-sibling::alt/@idiom = 'loc'">
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
                <xsl:when test="@fig = 'true' and @idiom = 'loc'">
                    <xsl:text>, loc., fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig = 'false' and @idiom = 'none'">
                    <xsl:text>)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig = 'true' and @idiom = 'none'">
                    <xsl:text>, fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig = 'false' and @idiom = 'loc'">
                    <xsl:text>, loc.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig='false' and @idiom='expr'">
                    <xsl:text>, expr.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig='true' and @idiom='expr'">
                    <xsl:text>, expr., fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig='true' and @idiom='loc-prep'">
                    <xsl:text>, loc. + prep., fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="@fig='false' and @idiom='loc-prep'">
                    <xsl:text>, loc. + prep)</xsl:text>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="@register and not(@note)">
                <xsl:text> (</xsl:text><xsl:value-of select="@register"/><xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:if test="@register and @note">
                <xsl:text> (</xsl:text><xsl:value-of select="@register"/><xsl:text>, </xsl:text><xsl:value-of select="@note"/><xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:if test="not(@register) and @note">
                <xsl:text> (</xsl:text><xsl:value-of select="@note"/><xsl:text>)</xsl:text>
            </xsl:if>
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
                <xsl:when test="@conven='same'">
                    <xsl:text>Oui, la même</xsl:text>
                </xsl:when>
                <xsl:when test="@conven='dif'">
                    <xsl:text>Oui, mais totalement différente</xsl:text>
                </xsl:when>
                <xsl:when test="@conven='similar'">
                    <xsl:text>Oui, similaire</xsl:text>
                </xsl:when>
                <xsl:when test="@conven='unsure'">
                    <xsl:text>Incertain</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Signification compositionnelle</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
