<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <!-- This file creates a .tsv file which will present all entries where the English and
French expressions have the same conventionalized meaning and are given the same markers
on the online dictionary, i.e., they both receive the same markers on figuration and inflexibility
and operate with the same conventionalized meaning -->
    <xsl:template match="/">
        <xsl:text>Expression anglaise</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Expression française</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="descendant::trad[@conven='same' and preceding-sibling::alt/@idiom eq ./@idiom and preceding-sibling::alt/@fig eq ./@fig]">
            <xsl:value-of select="normalize-space(preceding-sibling::alt)"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="preceding-sibling::alt/@pos"/>
            <xsl:choose>
                <xsl:when test="preceding-sibling::alt[@idiom='loc' and @fig='true']">
                    <xsl:text>, loc., fig.)</xsl:text>
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
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="normalize-space(current())"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@pos"/>
            <xsl:choose>
                <xsl:when test="@idiom='loc' and @fig='true'">
                    <xsl:text>, loc., fig.)</xsl:text>
                </xsl:when>
                <xsl:when test="@idiom='loc' and @fig='false'">
                    <xsl:text>, loc.)</xsl:text>
                </xsl:when>
                <xsl:when test="@idiom='none' and @fig='true'">
                    <xsl:text>, fig.)</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>)</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>