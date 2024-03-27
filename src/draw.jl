# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause

using RecipesBase


"""
$(SIGNATURES)

Add pixels on the image.

Parameters
----------
- `img` : The image where we add pixels.
- `xs` : The x coordinate of the pixels to add.
- `ys` : The y coordinate of the pixels to add.

"""
function draw_pixel!(img, xs, ys)

    img_size = size(img, 1)
    for (x, y) in zip(xs, ys)
        i = ceil(Int, x * img_size)
        j = ceil(Int, y * img_size)
        if 0 < i <= img_size && 0 < j <= img_size
            img[i, j] += 1
        end
    end
end

@userplot ShowImg

"""
$(SIGNATURES)

Plot recipe to show the image.

Parameters
----------
- `img` : The image to save.

"""
@recipe function f(img::ShowImg)

    array = img.args

    @series begin

        color := :grays
        aspect_ratio := 1
        legend := false
        showaxis := false
        seriestype := :heatmap

        array
    end


end
