<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:premis="http://www.loc.gov/premis/v3" exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 28, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b>henkvanstappen</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <!-- grouping by premis:objectIdentifierValue creates a PREMIS/XML file for each PREMIS object. 
            Change the group-by parameter if needed.  
            E.g. premis:fixity/premis:messageDigest to group identical objects
	    Don't forget to change the $filename variable as well.-->
        <xsl:for-each-group select="premis:premis/premis:object"
            group-by="premis:objectIdentifier/premis:objectIdentifierValue">
	    <xsl:variable name="filename" select="premis:objectIdentifier/premis:objectIdentifierValue"/>
            <xsl:result-document href="{$filename}.xml">
                <premis:premis>
                    <xsl:copy-of select="current-group()"/>
                    <xsl:copy-of select="../premis:agent"/>
                    <xsl:copy-of select="../premis:event"/>
                </premis:premis>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>
