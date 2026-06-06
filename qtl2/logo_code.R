# make an logo for the R/qtl2 package

white <- "white"
black <- "#222"
purple <- "darkslateblue"

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

figfile <- "logofig.png"
png(figfile, height=300, width=600, pointsize=7)
par(cex=1.8, mar=rep(0,4))
par(bty="n")
plot(out$lod, out$snpinfo, lwd=3,col="darkslateblue", altcol="green4", cex=0.4, chr=1:8,
     xaxt="n", yaxt="n", xlab="", ylab="", bgcolor="#FFFFFF00", altbgcolor="#FFFFFF00")
dev.off()

s <- sticker(figfile, package="\n\nR/qtl2",
             p_color=purple, p_size=20, p_y=1.65,
             p_family="inconsolata", filename="qtl2_logo.png",
             u_color=white, h_color=black, h_fill=white,
             s_x=1.0, s_y=1.1,
             s_width=0.79)
