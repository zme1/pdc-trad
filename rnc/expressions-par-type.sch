<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <pattern>
        <rule context="trad[@pdc='same' or @pdc='dif']">
            <assert test="@conven">Any translated expressions that include a body part must have a @conven attribute.</assert>
        </rule>
        <rule context="trad[@fig='true']">
            <assert test="@pdc">Any figurative translated expressions must have a @pdc atttribute.</assert>
        </rule>
        <rule context="trad[not(@idiom='none')]">
            <assert test="@pdc and @conven">Any locutions must specify if a body part and conventionalized meaning apply.</assert>
        </rule>
    </pattern>
</sch:schema>