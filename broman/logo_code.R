# make an logo for the R/broman package

bg <- "gray97"
black <- "#222"
blue <- broman::brocolors("web")["blue"]
purple <- broman::crayons("Royal Purple")

library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

s <- sticker("kbroman_lego_square.jpg", package="R/broman",
             p_color=purple, p_size=20,
             p_family="inconsolata", filename="broman_logo.png",
             u_color=bg, h_color=black, h_fill=bg,
             s_x=1.0, s_y=0.77,
             s_width=0.42, s_height=0.42)
