#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

void mainImage()
{
    // The output resolution in pixels, in this case 64x64
    vec2 screenRes = vec2(256., 256.);
    
    vec2 iPixelSize = vec2(1., 1.)/screenRes;
    
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // downsample rate (ex: 512x512 / 64x64 = 8x8)
    vec2 iPixelateRes = iResolution.xy * iPixelSize;

    vec2 sampleUV = floor(uv / iPixelSize) * iPixelSize;
    vec4 col = texture(iChannel0, sampleUV);

    fragColor = col;
}