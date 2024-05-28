## Process images in a specified folder to make sure they are a standard
## size.

library(magick)

# Function to resize images to a specified width and height
resize_images <- function(sourcePath, destPath, width, quality=90) {
  # List all PNG or JPG files in the folder
  files <- list.files(sourcePath, pattern = "\\.png$|\\.jpg$", full.names = TRUE)
  
  # Loop through files and resize
  for (file in files) {
    image <- image_read(file)
    image <- image_resize(image, paste0(width, "x"))
    output_file <- sub("\\.[^.]*$", ".jpg", file)
    image_write(image, output_file, format="jpg", quality=quality)
  }
}


## Manually compress and turn images to JPG
downsample_one_image_jpg <- function(sourceFile, quality=90) {
  image <- image_read(sourceFile)
  output_file <- sub("\\.[^.]*$", ".jpg", sourceFile)
  output_file <- sub("(.*)(\\.[^.]+$)", "\\1s\\2", output_file)
  image_write(image, output_file, format="jpg", quality=quality)
}
