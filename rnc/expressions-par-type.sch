<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <pattern>
        <rule context="trad[@pdc = 'same' or @pdc = 'dif']">
            <assert test="@conven">Any translated expressions that include a body part must have a
                @conven attribute.</assert>
        </rule>
        <rule context="example[not(preceding-sibling::def)]">
            <report test="phrase[not(@fig and @loc)]">Sentences not preceded by definitions must
                have @fig and @loc attributes in their tags.</report>
        </rule>
        <rule context="alt[not(@pos = 'interj')]">
            <assert test="@loc">If it's not an interjection, every &lt;alt> element must have a @loc
                attribute.</assert>
        </rule>
        <rule context="alt[@pos = 'interj']">
            <report test="@loc">If it's an interjection, every &lt;alt> element must not have a @loc
                attribute.</report>
        </rule>
        <rule context="trad[@pos = 'interj']">
            <report test="@loc">If it's an interjection, every &lt;trad> element must not have a
                @loc attribute.</report>
        </rule>
        <rule context="sub-entry[not(@src-type = 'robert-collins')]">
            <assert test="@search-expression">For every online dictionary, you must determine
                whether or not the expression is searchable through the @search-expression
                attribute.</assert>
        </rule>
        <rule context="*[@src-type = 'robert-collins']">
            <assert test="@sub-article">Every Robert-Collins entry must have a @sub-article
                attribute to determine whether or not the expression is inline text or if it
                receives a sub-article treatment.</assert>
        </rule>
    </pattern>
</sch:schema>
