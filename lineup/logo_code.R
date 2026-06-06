# make an logo for the R/qtl2 package

bg <- "gray82"
black <- "#222"
purple <- "darkslateblue"

library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

figfile <- "logofig.png"

s <- sticker(figfile, package="R/lineup",
             p_color=purple, p_size=20, p_y=1.4,
             p_family="inconsolata", filename="lineup_logo.png",
             u_color=bg, h_color=black, h_fill=bg,
             s_x=1.0, s_y=0.85,
             s_width=0.65)
