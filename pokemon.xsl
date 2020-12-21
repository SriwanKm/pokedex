<?xml version="1.0" encoding="UTF-8" ?>

<!--   Pokemon catalogue-->
<!--   Author: Sriwan Khaomuang-->
<!--   Date:   12/14/2020-->

<!--   Filename: pokemon.xsl-->


<xsl:stylesheet version="1.0"

                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes"/>


    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title>Electric Pokemon</title>
                <link rel="stylesheet" type="text/css" href="pokemon.css"/>
                <link rel="preconnect" href="https://fonts.gstatic.com"/>
            </head>
            <body>
                <header>
                    <div id="navbar">

                        <table id="menu-table">
                            <tr>
                                <td id="navlogo">
                                    <img id="pokeball" alt="logo" src="images/pokeball.png"/>
                                    <img id="logo" alt="logo" src="images/pokemon_text.png"/>
                                </td>
                                <td class="menu-icon">
                                    <a href="pokemon.xml"><img alt="elec" src="images/pikachu.png"/>Electric
                                    </a>
                                </td>
                                <td class="menu-icon">
                                    <a href="grass.html"><img alt="grass" src="images/caterpie.png"/>Grass
                                    </a>
                                </td>
                                <td class="menu-icon">
                                    <a href="water.html"><img alt="water" src="images/dratini.png"/>Water
                                    </a>
                                </td>
                                <td class="menu-icon">
                                    <a href="fairy.html"><img alt="psychic" src="images/jigglypuff.png"/>Fairy
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </header>

                <section>
                    <div>
                        <div id="grid-container">

                            <xsl:apply-templates select="pokedex/pokemon">
                                <xsl:sort select="gen"/>
                            </xsl:apply-templates>

                        </div>
                    </div>
                </section>
                <footer>
                    <div id="footer-div">
                        By Sriwan Khaomuang
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="pokemon">

        <div class="outer-electric">


            <table class="sub-dataTable">

                <tr>
                    <th id="electric" colspan="2">
                        <xsl:value-of select="@name"/>
                    </th>
                </tr>
                <tr>
                    <td colspan="2">
                        <img class="pic" src="images/{img}" alt="{img}"/>
                    </td>
                </tr>
                <tr>
                    <td>Generation</td>
                    <td>
                        <xsl:value-of select="gen"/>
                    </td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td>
                        <xsl:for-each select="types/type">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </td>
                </tr>
                <tr>
                    <td>Species</td>
                    <td>
                        <xsl:value-of select="species"/>
                    </td>
                </tr>
                <tr>
                    <td>Abilities</td>
                    <td>
                        <xsl:for-each select="abilities/ability">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </td>

                </tr>

                <tr>
                    <td>Hidden ability</td>
                    <td>
                        <xsl:value-of select="abilities/@hidden"/>
                    </td>
                </tr>
                <tr>
                    <td>Base Exp.</td>
                    <td>
                        <xsl:value-of select="baseExp"/>
                    </td>
                </tr>
                <tr>
                    <td>Growth Rate</td>
                    <td>
                        <xsl:value-of select="growthRate"/>
                    </td>
                </tr>
            </table>
        </div>


    </xsl:template>

</xsl:stylesheet>