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
    output_file <- sub(sourcePath, destPath, output_file)
    image_write(image, output_file, format="jpg", quality=quality)
  }
}

