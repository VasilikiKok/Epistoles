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
                        <!-- define a row layout with bootstrap's css classes (three columns) -->
                        <!-- <xsl:for-each select="//tei:facsimile/tei:surface[not(@xml:id='indexx')]/*"> -->
                        <div class="row">
                            <!-- first column: load the thumbnail image based on the IIIF link in 0the graphic above -->
                            <div class="col-md-6">
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='April_1942_1.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='April_1942_1']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='April_1942_1']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='April_1942_2.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='April_1942_2']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='April_1942_2']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-md-6">
                                <article id="transcript">
                                    <xsl:apply-templates select="//tei:TEI//tei:text[@xml:id='letter2']//tei:body"/>
                                </article>
                            </div>
                        </div>
                        <hr/>
                        <div class="row">
                            <!-- first column: load the thumbnail image based on the IIIF link in 0the graphic above -->
                            <div class="col-md-6">
                               <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='October_1942_up.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='October_1942_up']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='October_1942_up']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='October_1942_down.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='October_1942_down']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='October_1942_down']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='October_1942_folded.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='October_1942_folded']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='October_1942_folded']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='October_1942_full.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='October_1942_full']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='October_1942_full']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-md-6">
                                <article id="transcript">
                                    <xsl:apply-templates select="//tei:TEI//tei:text[@xml:id='letter3']//tei:front"/>
                                    <xsl:apply-templates select="//tei:TEI//tei:text[@xml:id='letter3']//tei:body"/>
                                </article>
                            </div>
                        </div>
                           <hr/>
                         <div class="row">

                            <!-- first column: load the thumbnail image based on the IIIF link in 0the graphic above -->
                            <div class="col-md-6">
                               <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='November_1944_1.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='November_1944_1']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='November_1944_1']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='November_1944_2.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='November_1944_2']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='November_1944_2']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='November_1944_3.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='November_1944_3']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='November_1944_3']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='November_1944_address.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='November_1944_address']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='November_1944_address']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-md-6">
                                <article id="transcript">
                                    <xsl:apply-templates select="//tei:TEI//tei:text[@xml:id='letter4']//tei:body"/>
                                </article>
                            </div>
                        </div>
                           <hr/>
                           <div class="row">
                            <!-- first column: load the thumbnail image based on the IIIF link in 0the graphic above -->
                            <div class="col-md-6">
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='December_1944_front.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='December_1944_front']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='December_1944_front']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                                <article>
                                    <img class="img-thumbnail">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//tei:graphic[@xml:id='December_1944_back.full']/@url"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="//tei:surface[@xml:id='December_1944_back']//tei:label"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="//tei:facsimile/tei:surface[@xml:id='December_1944_back']//tei:figDesc"/>
                                        </xsl:attribute>
                                    </img>
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-md-6">
                                <article id="transcript">
                                    <xsl:apply-templates select="//tei:TEI//tei:text[@xml:id='letter5']//tei:body"/>
                                </article>
                            </div>
                        </div>
                    </div>
                </main>
                <footer>
                <div class="row" id="footer">
                  <div class="col-sm copyright">
                      <div>
                        <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                            <img src="assets/img/logos/cc.svg" class="copyright_logo" alt="Creative Commons License"/><img src="assets/img/logos/by.svg" class="copyright_logo" alt="Attribution 4.0 International"/>
                        </a>
                      </div>
                      <div>
                         2022 <xsl:apply-templates select="//tei:TEI//tei:principal"/>
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

    <!-- by default all text nodes are printed out, unless something else is defined.
    We don't want to show the metadata. So we write a template for the teiHeader that
    stops the text nodes underneath (=nested in) teiHeader from being printed into our
    html-->
    <xsl:template match="tei:teiHeader"/>

    <!-- we turn the tei head element (headline) into an html h1 element-->
    <xsl:template match="tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <!-- transform tei paragraphs into html paragraphs -->
    <xsl:template match="tei:p">
        <p>
            <!-- apply matching templates for anything that was nested in tei:p -->
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- transform tei del into html del -->
    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>

    <!-- transform tei add into html sup -->
    <xsl:template match="tei:add">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>

    <!-- transform tei hi (highlighting) with the attribute @rend="u" into html u elements -->
    <!-- how to read the match? "For all tei:hi elements that have a rend attribute with the value "u", do the following" -->
    <xsl:template match="tei:hi[@rend = 'underlined']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>


</xsl:stylesheet>
