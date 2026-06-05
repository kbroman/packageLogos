# make an logo for the circplot package

white <- "white"
black <- "#222"
blue <- broman::brocolors("web")["blue"]
purple <- broman::brocolors("web")["purple"]

library(circplot)
library(qtl2)

library(hexSticker)

library(showtext)
font_add_google("Inconsolata", "inconsolata")
showtext_auto()

cachefile <- "out.rds"
if(file.exists(cachefile)) {
    out <- readRDS(cachefile)
} else {

    file <- paste0("https://raw.githubusercontent.com/rqtl/",
                   "qtl2data/main/DO_Gatti2014/do.zip")
    do <- read_cross2(file)

    pr <- calc_genoprob(do, err=0.002, cores=0)

    query_variants <- create_variant_query_func("~/Data/CCdb/cc_variants.sqlite")
    out <- scan1snps(pr, do$pmap, do$pheno[,1], query_func=query_variants, cores=0, Xcovar=get_x_covar(do))

    saveRDS(out, cachefile)
}

lod <- out$lod
map <- qtl2:::snpinfo_to_map(out$snpinfo)

figfile <- "logofig.png"
png(figfile, height=400, width=400, pointsize=7)
par(cex=1.8, mar=rep(0,4))
plot_scan1_circ(lod, map, lwd=3, r=c(4, 7),
                type="p", col="darkslateblue", altcol="green4", cex=0.4)
u <- par("usr")
dev.off()

s <- sticker(figfile, package="circplot",
             p_color=purple, p_size=20,
             p_family="inconsolata", filename="circplot_logo.png",
             u_color=white, h_color=black, h_fill=white,
             s_x=1.0, s_y=0.75,
             s_width=0.45, s_height=0.45)
