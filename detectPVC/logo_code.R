# make an logo for the detectPVC package

dat <- readRDS("ecg_data.rds")

red <- "#FF4136"
white <- "white"
darkred <- "#DF2116"
black <- "#222"

lwd <- 2
ylim <- c(-1.2, 1.2)


library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

library(ggplot2)
p <- ggplot(aes(x=datetime, y=ecg), data=dat) + geom_line(col=white, lwd=0.6)
p <- p + theme_void() + theme_transparent()

s <- sticker(p, package="detectPVC",
             p_color=black, h_size=1, u_color=red, h_color=darkred, h_fill=red,
             p_size=20, s_x=1.00, s_y=0.85,
             s_width=1.7, s_height=0.7,
             p_family="inconsolata", filename="detectPVC_logo.png")
