<?xml version="1.0" encoding="UTF-8" ?>

<!--   Pokemon catalogue-->
<!--   Author: Sriwan Khaomuang-->
<!--   Date:   12/14/2020-->

<!--   Filename: pokemon.xsl-->


<xsl:stylesheet version="1.0"

                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
                doctype-system="about:legacy-compat"
                encoding="UTF-8"
                indent="yes"/>

<!--    <xsl:variable name="currentYear" select="2020"/>-->

    <xsl:template match="/">
        <html>
            <head>
                <title>Electric Pokemon</title>
                <link href="pokemon.css"
                      rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <header>
                    <h1>Electric Pokemon</h1>
                </header>
                <section>
                    <h1>Pokemon</h1>
                    <xsl:apply-templates select="pokedex/pokemon">
                        <xsl:sort select="pokemon att='name'"/>
                    </xsl:apply-templates>
                </section>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pokemon">
        <article>
            <h1>
                <xsl:value-of select="pokemon att='name'"/>
            </h1>
            <h2>
                Type(s)
                <xsl:for-each select="types/type">

                    <xsl:value-of select="."/>

                </xsl:for-each>
            </h2>
            <p>
                Species:
                <span>
                    <xsl:for-each select="species">
                        <xsl:value-of select="."/>/
                    </xsl:for-each>
                </span>
            </p>
            <table>

                <tr>
                    <td>
                        <xsl:value-of select="format-number(purchased/price, '$#,#0.00') "/>
                    </td>
                    <td>
                        <xsl:value-of select="purchased/location"/>
                    </td>
                    <td>
                        <xsl:value-of select="year"/>
                    </td>
                    <td>
                        <xsl:value-of select="$currentYear - year"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <p>My Rating:</p>
                        <xsl:call-template name="drawStars">
                            <xsl:with-param name="starFile" select="'star.png'"/>
                            <xsl:with-param name="starCount" select="rating"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </table>
        </article>
    </xsl:template>

    <xsl:template name="drawStars">

        <xsl:param name="starFile"/>
        <xsl:param name="starCount"/>

        <xsl:if test="$starCount > 0">
            <img src="{$starFile}" alt="starFile"/>
            <xsl:call-template name="drawStars">
                <xsl:with-param name="starCount" select="$starCount - 1"/>
                <xsl:with-param name="starFile" select="$starFile"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>