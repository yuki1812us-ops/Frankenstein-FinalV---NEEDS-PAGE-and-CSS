<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->
    
    <xsl:template match="tei:TEI">
                    <div class="row">
                         <div class="col">
                             <h4>About the manuscript page:</h4>
                                <xsl:value-of select="//tei:sourceDesc"/>
                             <ul> 
                                 <li>Licence:
                                <xsl:value-of select="//tei:licence"/> <!-- You can change the way the metadata is visualised as well-->
                                </li>
                             </ul> 
                         </div>
                         <div class="col">
                            <ul> 
                                <li>Total number of modifications: 
                                    <xsl:value-of select="count(//tei:del|//tei:add)" /> <!-- Counts all the add and del elements, and puts it in a list item -->
                                </li>
                                
                                <li>Number of additions: 
                                    <!-- Counts all the add -->
                                    <xsl:value-of select="count(//tei:add)" />
                                </li>
                                <!-- add other list items in which you count things, such as the modifications made by Percy -->  
                                
                                <li>Number of corrections by Mary Shelley: 
                                    <!-- add other list items in which you count things, such as the modifications made by Percy -->
                                    <xsl:value-of select="count(//*[@hand='#PBS'])"/>
                                </li>
                                
                                <li>Number of corrections by Percy Shelley: 
                                    <!-- add other list items in which you count things, such as the modifications made by Percy -->
                                     <xsl:value-of select="count(//*[@hand='#MWS'])"/>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row mt-4 mb-5">
                        <div class="col-12 text-center">
                            <div class="btn-group shadow-sm">
                                <a href="#" id="prev" class="btn btn-secondary">← Previous</a>
                                <a href="#" id="next" class="btn btn-primary">Next →</a>
                            </div>
                        </div>
                    </div>
                    
        <hr/>
    </xsl:template>
    

</xsl:stylesheet>
