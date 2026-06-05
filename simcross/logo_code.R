# make an logo for the simcross package

white <- "white"
black <- "#222"
purple <- "darkslateblue"
blue <- broman::crayons("Violet Blue")
pink <- broman::crayons("Red")

library(simcross)

library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

set.seed(20260605+7)
pgma <- create_parent(100, 1:2)
pgpa <- create_parent(100, 3:4)
mgma <- create_parent(100, 5:6)
mgpa <- create_parent(100, 7:8)
tmp1 <- cross(mgma, mgpa)
tmp2 <- cross(pgma, pgpa)
mom <- cross(tmp1, tmp2)
dad <- cross(tmp1, tmp2)
kid <- cross(mom, dad)

figfile <- "logofig.png"
png(figfile, height=500, width=400, pointsize=7)
par(bty="n", mar=rep(0,4))
plot(0,0, type="n", xlim=c(28, 72), ylim=c(15,85),
     xaxt="n", yaxt="n", xlab="", ylab="")
loc <- list(c(35,70), c(65,70), c(50,30))
plot_ind(mom, loc[[1]])
plot_ind(dad, loc[[2]])
plot_ind(kid, loc[[3]])
plot_crosslines(loc[[1]], loc[[2]], loc[[3]], cex=8, lwd=5, arrow_length=0.4)
dev.off()

s <- sticker(figfile, package="R/simcross",
             p_color=purple, p_size=20,
             p_family="inconsolata", filename="simcross_logo.png",
             u_color=white, h_color=black, h_fill=white,
             s_x=1.0, s_y=0.75,
             s_width=0.35)
