<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->
    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:body">
        <div class="row">
        <div class="col-3"><br/><br/><br/><br/><br/>
            <xsl:for-each select="//tei:add[@place = 'marginleft']">
                <div class="marginLeft">
                    <xsl:choose>
                        <xsl:when test="parent::tei:del">
                            <del>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="attribute::hand" />
                                </xsl:attribute>
                                <xsl:apply-templates/></del><br/>
                        </xsl:when>
                        <xsl:otherwise>
                            <span>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="attribute::hand" />
                                </xsl:attribute>
                            <xsl:apply-templates/><br/>
                            </span>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </xsl:for-each> 
        </div>
        <div class="col-9">
            <div class="transcription">
                <xsl:apply-templates select="//tei:div"/>
            </div>
        </div>
        </div> 
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div class="#MWS"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

  <!-- processes the marginal additions again to give them a class to hide them in the 'main' text in css. By hiding them using css, they can also be made visible again when showing a reading text, for example-->
    <xsl:template match="tei:add[@place = 'marginleft']">
        <span class="marginAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <xsl:template match="tei:del">
        <del>
            <xsl:attribute name="class">
                <xsl:value-of select="@hand"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    
    <!-- all the supralinear additions are given in a span with the class supraAdd, make sure to put this class in superscript in the CSS file, -->
    <xsl:template match="tei:add[@place = 'supralinear']">
        <span class="supraAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <!-- add additional templates below, for example to transform the tei:lb in <br/> empty elements, tei:hi[@rend = 'sup'] in <sup> elements, the underlined text, additions with the attribute "overwritten" etc. -->
    <xsl:template match="tei:add[@place = 'supralinear']">
        <span class="supraAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <!-- add additional templates below, for example to transform the tei:lb in <br/> empty elements, tei:hi[@rend = 'sup'] in <sup> elements, the underlined text, additions with the attribute "overwritten" etc. -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <!-- tei:hi[@rend = 'sup'] in <sup> elements -->
    <xsl:template match="tei:hi[@rend = 'sup']">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>
    
    <!-- tei:hi the underlined text -->
    <xsl:template match="tei:hi[@rend = 'u']">
        <u><xsl:apply-templates/></u>
    </xsl:template> 
    
    <!-- additions with the attribute "overwritten" etc. -->
    <xsl:template match="tei:add[@type = 'overwritten']"> 
        <ins>
            <xsl:attribute name="class">
                <xsl:value-of select="@hand"/>         
            </xsl:attribute>
            <xsl:apply-templates/> 
        </ins>
    </xsl:template>
    
    <xsl:template match="tei:metamark">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- <metamark function="pagenumber"><num><hi rend="circled">77</hi></num></metamark> -->
    <xsl:template match="tei:hi[@rend = 'circled']">
        <span class="circled">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:metamark[@rend = 'thick']">
        <span class="thickline">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'unclear']">
        <ins>
            <xsl:attribute name="class">
                <xsl:value-of select="@hand"/>         
            </xsl:attribute>
            <xsl:apply-templates/> 
        </ins>
    </xsl:template>
    
    <!--<choice><sic>had</sic><corr>hand</corr></choice> -->
    <xsl:template match="tei:choice">
        <xsl:apply-templates/> 
    </xsl:template>
    
    <xsl:template match="tei:sic">   
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    
    <xsl:template match="tei:corr">   
        <ins>
            <xsl:apply-templates/>
        </ins>
    </xsl:template>
</xsl:stylesheet>

