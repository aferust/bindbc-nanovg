/*
 * Copyright (c) 2015 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictILUT', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module bindbc.nanovg.funcs;

private {
    import bindbc.nanovg.types;
}

extern(C) nothrow @nogc 
{
    version(NanovgGL2)
    {
        alias da_nvgCreateGL2 = NVGcontext* function(int flags);
        alias da_nvgDeleteGL2 = void function(NVGcontext* ctx);
        alias da_nvglImageHandleGL2 = uint function(NVGcontext* ctx, int image);
    }
    else version(NanovgGL3)
    {
        alias da_nvgCreateGL3 = NVGcontext* function(int flags);
        alias da_nvgDeleteGL3 = void function(NVGcontext* ctx);
        alias da_nvglCreateImageFromHandleGL3 = int function(NVGcontext* ctx, uint textureId, int w, int h, int flags);
        alias da_nvglImageHandleGL3 = uint function(NVGcontext* ctx, int image);
    }
    else version(NanovgGLES2)
    {
        alias da_nvgCreateGLES2 = NVGcontext* function(int flags);
        alias da_nvgDeleteGLES2 = void function(NVGcontext* ctx);
        alias da_nvglCreateImageFromHandleGLES2 = int function(NVGcontext* ctx, uint textureId, int w, int h, int flags);
    }

    alias da_nvgBeginFrame = void function(NVGcontext* ctx, int windowWidth, int windowHeight, float devicePixelRatio);
    alias da_nvgCancelFrame = void function(NVGcontext* ctx);
    alias da_nvgEndFrame = void function(NVGcontext* ctx);
    alias da_nvgGlobalCompositeOperation = void function(NVGcontext* ctx, int op);
    alias da_nvgGlobalCompositeBlendFunc = void function(NVGcontext* ctx, int sfactor, int dfactor);
    alias da_nvgGlobalCompositeBlendFuncSeparate = void function(NVGcontext* ctx, int srcRGB, int dstRGB, int srcAlpha, int dstAlpha);
    alias da_nvgRGB = NVGcolor function(ubyte r, ubyte g, ubyte b);
    alias da_nvgRGBf = NVGcolor function(float r, float g, float b);
    alias da_nvgRGBA = NVGcolor function(ubyte r, ubyte g, ubyte b, ubyte a);
    alias da_nvgRGBAf = NVGcolor function(float r, float g, float b, float a);
    alias da_nvgLerpRGBA = NVGcolor function(NVGcolor c0, NVGcolor c1, float u);
    alias da_nvgTransRGBA = NVGcolor function(NVGcolor c0, ubyte a);
    alias da_nvgTransRGBAf = NVGcolor function(NVGcolor c0, float a);
    alias da_nvgHSL = NVGcolor function(float h, float s, float l);
    alias da_nvgHSLA = NVGcolor function(float h, float s, float l, ubyte a);
    alias da_nvgSave = void function(NVGcontext* ctx);
    alias da_nvgRestore = void function(NVGcontext* ctx);
    alias da_nvgReset = void function(NVGcontext* ctx);
    alias da_nvgStrokeColor = void function(NVGcontext* ctx, NVGcolor color);
    alias da_nvgStrokePaint = void function(NVGcontext* ctx, NVGpaint paint);
    alias da_nvgFillColor = void function(NVGcontext* ctx, NVGcolor color);
    alias da_nvgFillPaint = void function(NVGcontext* ctx, NVGpaint paint);
    alias da_nvgMiterLimit = void function(NVGcontext* ctx, float limit);
    alias da_nvgStrokeWidth = void function(NVGcontext* ctx, float size);
    alias da_nvgLineCap = void function(NVGcontext* ctx, int cap);
    alias da_nvgLineJoin = void function(NVGcontext* ctx, int join);
    alias da_nvgGlobalAlpha = void function(NVGcontext* ctx, float alpha);
    alias da_nvgResetTransform = void function(NVGcontext* ctx);
    alias da_nvgTransform = void function(NVGcontext* ctx, float a, float b, float c, float d, float e, float f);
    alias da_nvgTranslate = void function(NVGcontext* ctx, float x, float y);
    alias da_nvgRotate = void function(NVGcontext* ctx, float angle);
    alias da_nvgSkewX = void function(NVGcontext* ctx, float angle);
    alias da_nvgSkewY = void function(NVGcontext* ctx, float angle);
    alias da_nvgScale = void function(NVGcontext* ctx, float x, float y);
    alias da_nvgCurrentTransform = void function(NVGcontext* ctx, float* xform);
    alias da_nvgTransformIdentity = void function(float* dst);
    alias da_nvgTransformTranslate = void function(float* dst, float tx, float ty);
    alias da_nvgTransformScale = void function(float* dst, float sx, float sy);
    alias da_nvgTransformRotate = void function(float* dst, float a);
    alias da_nvgTransformSkewX = void function(float* dst, float a);
    alias da_nvgTransformSkewY = void function(float* dst, float a);
    alias da_nvgTransformMultiply = void function(float* dst, const float* src);
    alias da_nvgTransformPremultiply = void function(float* dst, const float* src);
    alias da_nvgTransformInverse = int function(float* dst, const float* src);
    alias da_nvgTransformPoint = void function(float* dstx, float* dsty, const float* xform, float srcx, float srcy);
    alias da_nvgDegToRad = float function(float deg);
    alias da_nvgRadToDeg = float function(float rad);
    alias da_nvgCreateImage = int function(NVGcontext* ctx, const(char*) filename, int imageFlags);
    alias da_nvgCreateImageMem = int function(NVGcontext* ctx, int imageFlags, ubyte* data, int ndata);
    alias da_nvgCreateImageRGBA = int function(NVGcontext* ctx, int w, int h, int imageFlags, const ubyte* data);
    alias da_nvgUpdateImage = void function(NVGcontext* ctx, int image, const ubyte* data);
    alias da_nvgImageSize = void function(NVGcontext* ctx, int image, int* w, int* h);
    alias da_nvgDeleteImage = void function(NVGcontext* ctx, int image);
    alias da_nvgLinearGradient = NVGpaint function(NVGcontext* ctx, float sx, float sy, float ex, float ey, NVGcolor icol, NVGcolor ocol);
    alias da_nvgBoxGradient = NVGpaint function(NVGcontext* ctx, float x, float y, float w, float h, float r, float f, NVGcolor icol, NVGcolor ocol);
    alias da_nvgRadialGradient = NVGpaint function(NVGcontext* ctx, float cx, float cy, float inr, float outr, NVGcolor icol, NVGcolor ocol);
    alias da_nvgImagePattern = NVGpaint function(NVGcontext* ctx, float ox, float oy, float ex, float ey, float angle, int image, float alpha);
    alias da_nvgScissor = void function(NVGcontext* ctx, float x, float y, float w, float h);
    alias da_nvgIntersectScissor = void function(NVGcontext* ctx, float x, float y, float w, float h);
    alias da_nvgResetScissor = void function(NVGcontext* ctx);
    alias da_nvgBeginPath = void function(NVGcontext* ctx);
    alias da_nvgMoveTo = void function(NVGcontext* ctx, float x, float y);
    alias da_nvgLineTo = void function(NVGcontext* ctx, float x, float y);
    alias da_nvgBezierTo = void function(NVGcontext* ctx, float c1x, float c1y, float c2x, float c2y, float x, float y);
    alias da_nvgQuadTo = void function(NVGcontext* ctx, float cx, float cy, float x, float y);
    alias da_nvgArcTo = void function(NVGcontext* ctx, float x1, float y1, float x2, float y2, float radius);
    alias da_nvgClosePath = void function(NVGcontext* ctx);
    alias da_nvgPathWinding = void function(NVGcontext* ctx, int dir);
    alias da_nvgArc = void function(NVGcontext* ctx, float cx, float cy, float r, float a0, float a1, int dir);
    alias da_nvgRect = void function(NVGcontext* ctx, float x, float y, float w, float h);
    alias da_nvgRoundedRect = void function(NVGcontext* ctx, float x, float y, float w, float h, float r);
    alias da_nvgRoundedRectVarying = void function(NVGcontext* ctx, float x, float y, float w, float h, float radTopLeft, float radTopRight, float radBottomRight, float radBottomLeft);
    alias da_nvgEllipse = void function(NVGcontext* ctx, float cx, float cy, float rx, float ry);
    alias da_nvgCircle = void function(NVGcontext* ctx, float cx, float cy, float r);
    alias da_nvgFill = void function(NVGcontext* ctx);
    alias da_nvgStroke = void function(NVGcontext* ctx);
    alias da_nvgCreateFont = int function(NVGcontext* ctx, const(char*) name, const(char*) filename);
    alias da_nvgCreateFontMem = int function(NVGcontext* ctx, const(char*) name, ubyte* data, int ndata, int freeData);
    alias da_nvgFindFont = int function(NVGcontext* ctx, const(char*) name);
    alias da_nvgAddFallbackFontId = int function(NVGcontext* ctx, int baseFont, int fallbackFont);
    alias da_nvgAddFallbackFont = int function(NVGcontext* ctx, const(char*) baseFont, const(char*) fallbackFont);
    alias da_nvgFontSize = void function(NVGcontext* ctx, float size);
    alias da_nvgFontBlur = void function(NVGcontext* ctx, float blur);
    alias da_nvgTextLetterSpacing = void function(NVGcontext* ctx, float spacing);
    alias da_nvgTextLineHeight = void function(NVGcontext* ctx, float lineHeight);
    alias da_nvgTextAlign = void function(NVGcontext* ctx, int _align);
    alias da_nvgFontFaceId = void function(NVGcontext* ctx, int font);
    alias da_nvgFontFace = void function(NVGcontext* ctx, const(char*) font);
    alias da_nvgText = float function(NVGcontext* ctx, float x, float y, const(char*) str, const(char*) end);
    alias da_nvgTextBox = void function(NVGcontext* ctx, float x, float y, float breakRowWidth, const(char*) str, const(char*) end);
    alias da_nvgTextBounds = float function(NVGcontext* ctx, float x, float y, const(char*) str, const(char*) end, float* bounds);
    alias da_nvgTextBoxBounds = void function(NVGcontext* ctx, float x, float y, float breakRowWidth, const(char*) str, const(char*) end, float* bounds);
    alias da_nvgTextGlyphPositions = int function(NVGcontext* ctx, float x, float y, const(char*) str, const(char*) end, NVGglyphPosition* positions, int maxPositions);
    alias da_nvgTextMetrics = void function(NVGcontext* ctx, float* ascender, float* descender, float* lineh);
    alias da_nvgTextBreakLines = int function(NVGcontext* ctx, const(char*) str, const(char*) end, float breakRowWidth, NVGtextRow* rows, int maxRows);
    alias da_nvgCreateInternal = NVGcontext* function(NVGparams* params);
    alias da_nvgDeleteInternal = void function(NVGcontext* ctx);
    alias da_nvgInternalParams = NVGparams* function(NVGcontext* ctx);
    alias da_nvgDebugDumpPathCache = void function(NVGcontext* ctx);
}

__gshared 
{
    version(NanovgGL2)
    {
        da_nvgCreateGL2 nvgCreateGL2;
        da_nvgDeleteGL2 nvgDeleteGL2;
        da_nvglImageHandleGL2 nvglImageHandleGL2;
    }
    else version(NanovgGL3)
    {
        da_nvgCreateGL3 nvgCreateGL3;
        da_nvgDeleteGL3 nvgDeleteGL3;
        da_nvglCreateImageFromHandleGL3 nvglCreateImageFromHandleGL3;
        da_nvglImageHandleGL3 nvglImageHandleGL3;
    }
    else version(NanovglGLES2)
    {
        da_nvgCreateGLES2 nvgCreateGLES2;
        da_nvgDeleteGLES2 nvgDeleteGLES2;
        da_nvglCreateImageFromHandleGLES2 nvglCreateImageFromHandleGLES2;
    }
    
    da_nvgBeginFrame nvgBeginFrame;
    da_nvgCancelFrame nvgCancelFrame;
    da_nvgEndFrame nvgEndFrame;
    da_nvgGlobalCompositeOperation nvgGlobalCompositeOperation;
    da_nvgGlobalCompositeBlendFunc nvgGlobalCompositeBlendFunc;
    da_nvgGlobalCompositeBlendFuncSeparate nvgGlobalCompositeBlendFuncSeparate;
    da_nvgRGB nvgRGB;
    da_nvgRGBf nvgRGBf;
    da_nvgRGBA nvgRGBA;
    da_nvgRGBAf nvgRGBAf;
    da_nvgLerpRGBA nvgLerpRGBA;
    da_nvgTransRGBA nvgTransRGBA;
    da_nvgTransRGBAf nvgTransRGBAf;
    da_nvgHSL nvgHSL;
    da_nvgHSLA nvgHSLA;
    da_nvgSave nvgSave;
    da_nvgRestore nvgRestore;
    da_nvgReset nvgReset;
    da_nvgStrokeColor nvgStrokeColor;
    da_nvgStrokePaint nvgStrokePaint;
    da_nvgFillColor nvgFillColor;
    da_nvgFillPaint nvgFillPaint;
    da_nvgMiterLimit nvgMiterLimit;
    da_nvgStrokeWidth nvgStrokeWidth;
    da_nvgLineCap nvgLineCap;
    da_nvgLineJoin nvgLineJoin;
    da_nvgGlobalAlpha nvgGlobalAlpha;
    da_nvgResetTransform nvgResetTransform;
    da_nvgTransform nvgTransform;
    da_nvgTranslate nvgTranslate;
    da_nvgRotate nvgRotate;
    da_nvgSkewX nvgSkewX;
    da_nvgSkewY nvgSkewY;
    da_nvgScale nvgScale;
    da_nvgCurrentTransform nvgCurrentTransform;
    da_nvgTransformIdentity nvgTransformIdentity;
    da_nvgTransformTranslate nvgTransformTranslate;
    da_nvgTransformScale nvgTransformScale;
    da_nvgTransformRotate nvgTransformRotate;
    da_nvgTransformSkewX nvgTransformSkewX;
    da_nvgTransformSkewY nvgTransformSkewY;
    da_nvgTransformMultiply nvgTransformMultiply;
    da_nvgTransformPremultiply nvgTransformPremultiply;
    da_nvgTransformInverse nvgTransformInverse;
    da_nvgTransformPoint nvgTransformPoint;
    da_nvgDegToRad nvgDegToRad;
    da_nvgRadToDeg nvgRadToDeg;
    da_nvgCreateImage nvgCreateImage;
    da_nvgCreateImageMem nvgCreateImageMem;
    da_nvgCreateImageRGBA nvgCreateImageRGBA;
    da_nvgUpdateImage nvgUpdateImage;
    da_nvgImageSize nvgImageSize;
    da_nvgDeleteImage nvgDeleteImage;
    da_nvgLinearGradient nvgLinearGradient;
    da_nvgBoxGradient nvgBoxGradient;
    da_nvgRadialGradient nvgRadialGradient;
    da_nvgImagePattern nvgImagePattern;
    da_nvgScissor nvgScissor;
    da_nvgIntersectScissor nvgIntersectScissor;
    da_nvgResetScissor nvgResetScissor;
    da_nvgBeginPath nvgBeginPath;
    da_nvgMoveTo nvgMoveTo;
    da_nvgLineTo nvgLineTo;
    da_nvgBezierTo nvgBezierTo;
    da_nvgQuadTo nvgQuadTo;
    da_nvgArcTo nvgArcTo;
    da_nvgClosePath nvgClosePath;
    da_nvgPathWinding nvgPathWinding;
    da_nvgArc nvgArc;
    da_nvgRect nvgRect;
    da_nvgRoundedRect nvgRoundedRect;
    da_nvgRoundedRectVarying nvgRoundedRectVarying;
    da_nvgEllipse nvgEllipse;
    da_nvgCircle nvgCircle;
    da_nvgFill nvgFill;
    da_nvgStroke nvgStroke;
    da_nvgCreateFont nvgCreateFont;
    da_nvgCreateFontMem nvgCreateFontMem;
    da_nvgFindFont nvgFindFont;
    da_nvgAddFallbackFontId nvgAddFallbackFontId;
    da_nvgAddFallbackFont nvgAddFallbackFont;
    da_nvgFontSize nvgFontSize;
    da_nvgFontBlur nvgFontBlur;
    da_nvgTextLetterSpacing nvgTextLetterSpacing;
    da_nvgTextLineHeight nvgTextLineHeight;
    da_nvgTextAlign nvgTextAlign;
    da_nvgFontFaceId nvgFontFaceId;
    da_nvgFontFace nvgFontFace;
    da_nvgText nvgText;
    da_nvgTextBox nvgTextBox;
    da_nvgTextBounds nvgTextBounds;
    da_nvgTextBoxBounds nvgTextBoxBounds;
    da_nvgTextGlyphPositions nvgTextGlyphPositions;
    da_nvgTextMetrics nvgTextMetrics;
    da_nvgTextBreakLines nvgTextBreakLines;
    da_nvgCreateInternal nvgCreateInternal;
    da_nvgDeleteInternal nvgDeleteInternal;
    da_nvgInternalParams nvgInternalParams;
    da_nvgDebugDumpPathCache nvgDebugDumpPathCache;
}
