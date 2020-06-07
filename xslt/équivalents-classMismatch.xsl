<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <!-- This file creates a .tsv file which will present all entries where the English and
French expressions have the same conventionalized meaning but are given different markers
on the online dictionary, i.e., they don't receive the same markers on figuration and inflexibility
despite operating with the same conventionalized meaning -->
    <xsl:template match="/">
        <xsl:text>Expression anglaise</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Expression française</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="descendant::trad[@conven='same'][preceding-sibling::alt/@idiom ne ./@idiom or preceding-sibling::alt/@fig ne ./@fig][preceding-sibling::alt/@pos eq ./@pos]">
            <xsl:value-of select="normalize-space(preceding-sibling::alt)"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="preceding-sibling::alt/@pos"/>
            <xsl:choose>
                <xsl:when test="preceding-sibling::alt[@idiom='loc' and @fig='true']">
                    <xsl:text>, loc, fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt[@idiom='loc' and @fig='false']">
                    <xsl:text>, loc.)</xsl:text>
                </xsl:when>
                <xsl:when test="preceding-sibling::alt[@idiom='none' and @fig='true']">
                    <xsl:text>, fig.)</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>)</xsl:text>
                </xsl:otherwise>
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
            <xsl:value-of select="normalize-space(current())"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@pos"/>
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
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>