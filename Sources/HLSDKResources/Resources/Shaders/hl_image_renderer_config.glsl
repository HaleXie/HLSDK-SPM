
#define HLImageFormatBGRA       (1)
#define HLImageFormatI420       (2)
#define HLImageFormatNV12Video  (3)
#define HLImageFormatNV12Full   (4)

#define HLBlendingDisabled          (0)
#define HLBlendingStandard          (1)
#define HLBlendingBackgroundMask    (2)

uniform lowp int u_ImageFormat;
uniform lowp int u_Blending;
