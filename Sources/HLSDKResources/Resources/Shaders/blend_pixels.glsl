
vec3 hl_BlendPixels_Standard (vec3 local, vec3 remote) {
    /* Here's the steps
     * 1. Soft Light on local with pure white layer
     * 2. Soft Light on remote with pure white layer
     * 3. Multiply results
     *
     * The SoftLight is described here:
     *  https://docs.gimp.org/en/gimp-concepts-layer-modes.html
     *
     * Rs = 255 - ((255 - M) * (255 - I)) / 255
     * E = ((255 - I) * M + Rs) / 255 * I
     *
     * Since we do a Soft Light with a pure white layer
     *  The Rs cancels out to 1
     */
    
    vec3 ones = vec3(1.0, 1.0, 1.0);
    vec3 white = vec3(1.0, 1.0, 1.0);
    
    vec3 local1 = ((ones - local) * white + ones) / ones * local;
    vec3 remote1 = ((ones - remote) * white + ones) / ones * remote;
    
    /* mix these together */
    vec3 color = local1 * remote1;
    return color;
}

#define BackgroundMaskColorThreshold (0.98)
#define BackgroundMaskBlendAlpha (0.75)

vec3 hl_BlendPixels_BackgroundMask (vec3 source, vec3 mask) {
    float grey = (mask.r + mask.g + mask.b) / 3.0;
    if (grey > BackgroundMaskColorThreshold) {
        // the pixel is a background pixel, use the source pixel
        return source;
    }
    
    /* mix these together */
    vec3 blendedColor = source * (1.0  - BackgroundMaskBlendAlpha) + mask * BackgroundMaskBlendAlpha;
    return blendedColor;
}
