<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text><xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                    <xsl:apply-templates select="//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>                
                </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:apply-templates select="//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Home</a> |
                    <a href="reading.html">Letters</a>
                </nav>
                <main id="manuscript">
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="container">
                    <!-- define a row layout with bootstrap's css classes (two columns) -->
                        <div class="row">
                            <!-- first column: load the image based on the IIIF link in the graphic above -->
                            <div class="col-sm">
                               <article id="thumbnail">
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="//tei:facsimile/tei:surface//tei:graphic[@xml:id='indexx_full']/@url"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='indexx']//tei:label"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='indexx']//tei:figDesc"/>
                                    </xsl:attribute>
                                </img>
                               </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-sm">
                                <article id="transcription">
                                  <p>
                                    <strong>Description:</strong>
                                    <xsl:apply-templates select="//tei:facsimile/tei:surface[@xml:id='indexx']//tei:figDesc"/>
                                  </p>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                                <div class="col-sm">
                                    <article id="details">
                                      <p>
                                        <strong>Author:</strong><br/>
                                        <xsl:apply-templates select="//tei:TEI//tei:author"/>
                                      </p>
                                      <p>
                                        <strong>Transcription by:</strong><br/>
                                        <xsl:apply-templates select="//tei:TEI//tei:principal"/>
                                      </p>
                                        <p>
                                        <strong>Provided by:</strong><br/>
                                        <xsl:apply-templates select="//tei:TEI//tei:respStmt//tei:name"/>
                                      </p>
                                    </article>
                                </div>
                            <div class="col-sm">
                              <!--  <a href="https://example.com">ddsdsdsds</a> But when I enter the link I want, it doesn;t work --> 
                                <p>In the pages the reader can immerse in the historical and cultural realm of 1940s Greece under occupation: academic life, strikes and exams, family ties and social networks, correspondence transfered hand by hand, the community of the church and of a choir, visits to relatives, waiting in line for food supplies, an imprisoned professor, drama performance as a rebellious act, taking part in the resistance, theatre in the mountain, asking for a sweater to be knitted, waiting for letters to be written, being covered with daddy's blanket, longing to meet the family in the feasts.</p>
                                </div>
                        </div>
                    </div>
                </main>
                <footer>
                <div class="row" id="footer">
                  <div class="col-sm copyright">
                  		<div class="copyright_logos">
                  			<a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                  			    <img src="assets/img/logos/cc.svg" class="copyright_logo" alt="Creative Commons License"/><img src="assets/img/logos/by.svg" class="copyright_logo" alt="Attribution 4.0 International"/>
                  			</a>
                  		</div>
                  		<div class="copyright_text">
                         2022 <xsl:apply-templates select="//tei:TEI//tei:principal"/>
                    This edition has been realised as part of the course Digitizing Cultural Heritage Materials, University of Bor??s, Spring 2022. 
                     </div>
                    </div>
                </div>
                </footer>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
