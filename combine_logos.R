# code to combine the package logos into a single tiled image
# (after https://masalmon.eu/2018/02/22/hexcombine/)

library("magrittr")

hexfiles <- NULL
dir <- list.files()
for(d in dir) {
    if(dir.exists(d)) {
        f <- list.files(d, pattern="_logo.png")
        hexfiles <- c(hexfiles, file.path(d, f))
    }
}
message(length(hexfiles), " hexfiles found")

nrow <- 4
ncol <- 3
row_paths <- split(sample(hexfiles), rep(1:nrow, each=ncol))

read_append <- . %>%
    magick::image_read() %>%
    magick::image_append()

rows <- purrr::map(row_paths, read_append)

info <- lapply(magick::image_read(hexfiles), magick::image_info)
heights <- unlist(lapply(info, "[", "height"))
widths <- unlist(lapply(info, "[", "height"))
height <- heights[1]
width <- widths[1]
stopifnot(all(heights==height), all(widths==width))

combined_logos <- magick::image_blank(width=width*ncol+30, height=height*nrow*0.82,
                                      col=broman::crayons("majesty"))
for(i in 1:nrow) {
    offset1 <- ifelse(i %% 2, width/2-40, 0)+8
    offset2 <- (i-1)*(height*0.75)
    combined_logos <- magick::image_composite(combined_logos, rows[[i]],
                                              offset=glue("+{offset1}+{offset2}"))
}

magick::image_write(combined_logos, "combined_logos.png")
openfile("combined_logos.png")
