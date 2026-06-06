# make an logo for the R/lineup2 package

bg <- "gray82"
black <- "#222"
purple <- "darkslateblue"
blue <- broman::crayons("Sky Blue")
yellow <- broman::crayons("Yellow")
white <- "white"

library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

set.seed(20260604)
figfile <- "logofig.png"
png(figfile, height=300, width=600, pointsize=7)
par(mar=rep(0,4), bty="n", bg=bg)
plot(0,0,type="n", xlim=c(0,100), ylim=c(0,100), xaxs="i", yaxs="i",
     xaxt="n", yaxt="n", xlab="", ylab="")
pos1 <- c(5,5,45,95) #x1,y1,x2,y2
pos2 <- pos1+c(50,0,50,0)
rect(pos1[1], pos1[2], pos1[3], pos1[4], lwd=2, col=white)
rect(pos2[1], pos2[2], pos2[3], pos2[4], lwd=2, col=white)
y <- runif(2,10,90)
rect(pos1[1],y[1],pos1[3],y[1]+5, col=blue)
rect(pos2[1],y[2],pos2[3],y[2]+5, col=yellow)
dev.off()

s <- sticker(figfile, package="R/lineup2",
             p_color=purple, p_size=20, p_y=1.4,
             p_family="inconsolata", filename="lineup2_logo.png",
             u_color=bg, h_color=black, h_fill=bg,
             s_x=1.0, s_y=0.85,
             s_width=0.65)
