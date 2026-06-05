# make an logo for the circplot package

white <- "white"
black <- "#222"
purple <- "darkslateblue"
blue <- broman::crayons("Violet Blue")
pink <- broman::crayons("Red")
lwd <- 7

library(qtl)
library(qtlbook)

library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

cachefile <- "out.rds"
if(file.exists(cachefile)) {
    out <- readRDS(cachefile)
} else {

    data(myocard)
    set.seed(20260608)
    f2 <- sim.cross(pull.map(myocard), n.ind=200, type="f2",
                    model=c(6,35,0.45,0.25))

    f2 <- calc.genoprob(f2, step=0.2, err=0.05)
    out <- scanone(f2, method="em")

    saveRDS(out, cachefile)
}

chr <- c(1:19,"X")
out <- out[,c(1,2,3,3)]
chr <- c(1:19,"X")
for(i in seq_along(chr)) {
    if(i != 6) out[out[,1]==chr[i], 4] <- NA
    else out[out[,1]==chr[i], 3] <- NA
}

figfile <- "logofig.png"
png(figfile, height=300, width=600, pointsize=7)
par(cex=1.8, mar=rep(0,4))
par(bty="n")
plot(out, lwd=lwd, col=pink, incl.markers=FALSE, chr=c(4:10,13:15),
     xaxt="n", yaxt="n", xlab="", ylab="", lod=2)
plot(out, lwd=lwd, col=blue, add=TRUE, lod=1, chr=c(4:10,13:15))
dev.off()

s <- sticker(figfile, package="\n\nR/qtl",
             p_color=purple, p_size=20, p_y=1.65,
             p_family="inconsolata", filename="qtl_logo.png",
             u_color=white, h_color=black, h_fill=white,
             s_x=1.0, s_y=1.1,
             s_width=0.79)
