# Dynamic and static bindings to nanovg, compatible with -betterC, @nogc, and nothrow.

- based on [DerelictNANOVG](https://github.com/aldocd4/DerelictNANOVG)

An example with glfw
```d
import core.stdc.stdio;

import bindbc.nanovg;
import bindbc.glfw;
import bindbc.opengl;

@nogc nothrow:

int initNanovg(){
    version(BindNanovg_Static){
    	 // todo: some stuff
    }else{
    	NanovgSupport ret = loadNanovg();
        if(ret == NanovgSupport.noLibrary){
            printf("noLibrary \n".ptr);
            return 1;
        }

    }
    
    return 0;
}

bool exit;

extern (C) void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods) 
{
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        exit = true;
} 


extern (C) int main()
{
    initNanovg();

    exit = false;

    GLFWSupport glfw = loadGLFW();
	printf("GLFW: %d", glfw);
	
	if(!glfwInit()){
		return -1;
	}

	if(!glfwInit()){
		return -1;
	}

	enum glVersion = 32;
	
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, glVersion / 10);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, glVersion % 10);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	glfwWindowHint(GLFW_RESIZABLE, false);
	glfwWindowHint(GLFW_SAMPLES, 4);
		
	auto window = glfwCreateWindow(1024, 768, "D yellow rect with nanovg", null, null);
	//writeln(window is null);
	glfwMakeContextCurrent(window);
	glfwSwapInterval(false);
	
	glfwSetKeyCallback(window, &key_callback);

	// You have a context, you can load opengl
	GLSupport gl = loadOpenGL();
	
	//writeln("Opengl: ", gl);

	auto vg = nvgCreateGL3(NVGcreateFlags.NVG_STENCIL_STROKES | NVGcreateFlags.NVG_DEBUG);

	while(!exit)
	{
		glViewport(0, 0, 1024, 768);
		glClearColor(0.3f, 0.3f, 0.32f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT|GL_STENCIL_BUFFER_BIT);

		nvgBeginFrame(vg, 1024, 768, 1);
		{
			nvgBeginPath(vg);
			nvgFillColor(vg, nvgRGBA(255,192,0,255));
			nvgRect(vg, 200, 200, 300, 300);
			nvgFill(vg);
		}		
		nvgEndFrame(vg);
		
		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	nvgDeleteGL3(vg);
	
	return 0;
}
```