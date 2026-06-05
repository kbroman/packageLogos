# make logos for the miner and craft packages


white <- "white"
black <- "#222"
blue <- broman::brocolors("web")["blue"]

lwd <- 2
ylim <- c(-1.2, 1.2)


library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

library(ggplot2)
pickaxe_file <- "stone_pickaxe.png"
crafting_table_file <- "crafting_table.png"

s <- sticker(pickaxe_file, package="miner",
             p_color=blue, p_size=20,
             p_family="inconsolata", filename="miner_logo.png",
             u_color=white, h_color=black, h_fill=white,
             s_x=0.97, s_y=0.8,
             s_width=0.45, s_height=0.45)

s <- sticker(crafting_table_file, package="craft",
             p_color=blue, p_size=20,
             p_family="inconsolata", filename="craft_logo.png",
             u_color=white, h_color=black, h_fill=white,
             s_x=1.0, s_y=0.7,
             s_width=0.45, s_height=0.45)
