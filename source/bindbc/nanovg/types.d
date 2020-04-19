module bindbc.nanovg.types;

enum NVG_PI = 3.14159265358979323846264338327f;

alias NVGcreateFlags = int;
enum : int 
{
	// Flag indicating if geometry based anti-aliasing is used (may not be needed when using MSAA).
	NVG_ANTIALIAS = 1 << 0,
	// Flag indicating if strokes should be drawn using stencil buffer. The rendering will be a little
	// slower, but path overlaps (i.e. self-intersecting or sharp turns) will be drawn just once.
	NVG_STENCIL_STROKES = 1 << 1,
	// Flag indicating that additional debug checks are done.
	NVG_DEBUG = 1 << 2,
}

alias NVGwinding = int;
enum  : int
{
	NVG_CCW = 1,
	NVG_CW = 2
}

alias NVGsolidity = int;
enum : int
{
	NVG_SOLID = 1,
	NVG_HOLE = 2
}

alias NVGlineCap = int;
enum : int
{
	NVG_BUTT,
	NVG_ROUND,
	NVG_SQUARE,
	NVG_BEVEL,
	NVG_MITER
}

alias NVGalign = int;
enum : int
{
	// Horizontal align
	NVG_ALIGN_LEFT = 1 << 0,
	NVG_ALIGN_CENTER = 1 << 1,
	NVG_ALIGN_RIGHT = 1 << 2,
	// Vertical align
	NVG_ALIGN_TOP = 1 << 3,
	NVG_ALIGN_MIDDLE = 1 << 4,
	NVG_ALIGN_BOTTOM = 1 << 5,
	NVG_ALIGN_BASELINE = 1 << 6
}

alias NVGblendFactor = int;
enum : int
{
	NVG_ZERO = 1 << 0,
	NVG_ONE = 1 << 1,
	NVG_SRC_COLOR = 1 << 2,
	NVG_ONE_MINUS_SRC_COLOR = 1 << 3,
	NVG_DST_COLOR = 1 << 4,
	NVG_ONE_MINUS_DST_COLOR = 1 << 5,
	NVG_SRC_ALPHA = 1 << 6,
	NVG_ONE_MINUS_SRC_ALPHA = 1 << 7,
	NVG_DST_ALPHA = 1 << 8,
	NVG_ONE_MINUS_DST_ALPHA = 1 << 9,
	NVG_SRC_ALPHA_SATURATE = 1 << 10,
};

struct NVGcolor
{
	float r, g, b, a;
}

struct NVGpaint
{
	float[6] xform;
	float[2] extent;
	float radius;
	float feather;
	NVGcolor innerColor;
	NVGcolor outerColor;
	int image;
}

struct NVGglyphPosition
{
	char* str; // Position of the glyph in the input string.
	float x; // The x-coordinate of the logical glyph position.
	float minx, maxx; // The bounds of the glyph shape.
}

struct NVGtextRow
{
	const char* start; // Pointer to the input text where the row starts.
	const char* end; // Pointer to the input text where the row ends (one past the last character).
	const char* next; // Pointer to the beginning of the next row.
	float width; // Logical width of the row.
	float minx, maxx; // Actual bounds of the row. Logical with and bounds can differ because of kerning and some parts over extending.
}

struct NVGscissor
{
	float[6] xform;
	float[2] extent;
}

struct NVGvertex
{
	float x, y, u, v;
}

struct NVGpath
{
	int first;
	int count;
	ubyte closed;
	int nbevel;
	NVGvertex* fill;
	int nfill;
	NVGvertex* stroke;
	int nstroke;
	int winding;
	int convex;
}

struct NVGparams
{
	void* userPtr;
	int edgeAntiAlias;

    @nogc nothrow:
	extern (C) int function(void* uptr) renderCreate;
	extern (C) int function(void* uptr, int type, int w, int h, int imageFlags, const(byte)* data) renderCreateTexture;
	extern (C) int function(void* uptr, int image) renderDeleteTexture;
	extern (C) int function(void* uptr, int image, int x, int y, int w, int h, const(byte)* data) renderUpdateTexture;
	extern (C) int function(void* uptr, int image, int* w, int* h) renderGetTextureSize;
	extern (C) void function(void* uptr, int width, int height) renderViewport;
	extern (C) void function(void* uptr) renderCancel;
	extern (C) void function(void* uptr) renderFlush;
	extern (C) void function(void* uptr, NVGpaint* paint, NVGscissor* scissor,
			float fringe, const(float)* bounds, const(NVGpath)* paths, int npaths) renderFill;
	extern (C) void function(void* uptr, NVGpaint* paint, NVGscissor* scissor,
			float fringe, float strokeWidth, const(NVGpath)* paths, int npaths) renderStroke;
	extern (C) void function(void* uptr, NVGpaint* paint, NVGscissor* scissor,
			const(NVGvertex)* verts, int nverts) renderTriangles;
	extern (C) void function(void* uptr) renderDelete;
}

struct FONScontext;
struct NVGcontext;
