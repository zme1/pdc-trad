<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <!-- This file creates a .tsv file which will present the English expressions, the words
    included in the expression that are searchable for the expression, and the grammatical role
    of words that are searchable, either head words (verbs for verbal phrases, nouns for noun phrases,
    etc.), the body part (when the body part *is* the head of the phrase it will be specified) and "other"
    a blanket term for any adjectifs, adverbs or prepositions that are also searchable on WordReference. -->
    <xsl:template match="/">
        <xsl:text>Expression anglaise</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Quels classements de mot ?</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>Quels mots ?</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="descendant::alt">
            <xsl:variable name="search-words" select="@search-words"/>
            <xsl:variable name="words-token" select="string-join(tokenize($search-words, ' '), ', ')"/>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:choose>
                <xsl:when test="@search='none'">
                    <xsl:text>aucun</xsl:text>
                </xsl:when>
                <xsl:when test="@search='body'">
                    <xsl:text>la PDC</xsl:text>
                </xsl:when>
                <xsl:when test="@search='head'">
                    <xsl:text>le mot-clé</xsl:text>
                </xsl:when>
                <xsl:when test="@search='other'">
                    <xsl:text>autre(s)</xsl:text>
                </xsl:when>
                <xsl:when test="@search='body-head'">
                    <xsl:text>la PDC, mot-clé</xsl:text>
                </xsl:when>
                <xsl:when test="@search='body-other'">
                    <xsl:text>la PDC, autre(s)</xsl:text>
                </xsl:when>
                <xsl:when test="@search='head-other'">
                    <xsl:text>le mot-clé, autre(s)</xsl:text>
                </xsl:when>
                <xsl:when test="@search='body-head-other'">
                    <xsl:text>la PDC, le mot-clé, autre(s)</xsl:text>
                </xsl:when>
                <xsl:when test="@search='bodyHead'">
                    <xsl:text>la PDC/mot-clé</xsl:text>
                </xsl:when>
                <xsl:when test="@search='bodyHead-other'">
                    <xsl:text>la PDC/mot-clé, autre(s)</xsl:text>
                </xsl:when>
            </xsl:choose>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="$words-token"/>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>