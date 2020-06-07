<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <pattern>
        <rule context="trad[@pdc='same' or @pdc='dif']">
            <assert test="@conven">Any translated expressions that include a body part must have a @conven attribute.</assert>
        </rule>
        <rule context="trad[not(@level='word')]">
            <assert test="@pdc and @conven">Any multi-word expressions must have @pdc and @conven atttributes.</assert>
        </rule>
    </pattern>
</sch:schema>