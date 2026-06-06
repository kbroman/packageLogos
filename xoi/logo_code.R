# make an logo for the xoi package

bg <- "white"
black <- "#222"
purple <- "darkslateblue"

library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

figfile <- "logofig.png"

s <- sticker(figfile, package="R/xoi",
             p_color=purple, p_size=20, p_y=1.5,
             p_family="inconsolata", filename="xoi_logo.png",
             u_color=bg, h_color=black, h_fill=bg,
             s_x=1.0, s_y=0.84,
             s_width=0.45)
