# SFML Template

## Description
<p>
This project aims to share a simple SFML template for your projects with this library. This has been done on Windows, so it may not work for Linux users.
<p>

## Structure
<pre>
+---bin
¦   +---debug
¦   ¦   +---obj
¦   ¦   +---SFML_Template.exe
¦   +---release
¦       +---obj
¦       +---SFML_Template.exe
+---externals
¦   +---SFML        
+---src
    +---app
    ¦    +---app.cpp
    ¦    +---app.hpp
    +---main.cpp
</pre>

## Requirements
- C++ Compiler, **the same version used for SFML** (or it may not work). This information can be found [here](https://www.sfml-dev.org/download/sfml/2.6.1/index.php)
- Make for Windows

## How to use
Before using the commands you may have to create two folder named *obj*: one in *bin/debug* and one in *bin/release.*

### Build the debug version
> make debug

### Build the release version
> make release

**/!\ Release version does not show the console when running /!\\**

### Build both debug and release versions
> make all

### Clean the object folders
> make clean

**/!\ This will remove EVERY files in these folders /!\\**

### Change the executable name
Go in the Makefile and modify the variable *EXECUTABLE_NAME*

### Add external libraries
- Add them in the *externals* folder
- In the Makefile, in the variable *CFLAGS*, add:
```
-Iexternals/<YOUR_LIBRARY>/include
```

- In the Makefile, in the variable *LDFLAGS*, add:
```
-Lexternals/<YOUR_LIBRARY>/lib
```

- In the Makefile, in the variable *LDLIBS*, add:
``` 
 -l<YOUR_LIBRARY>-<LIBS> 
```

## License

## Links
[SFML](https://www.sfml-dev.org/index.php)

[Make for window](https://gnuwin32.sourceforge.net/packages/make.htm)

[Makefile tutorial](https://makefiletutorial.com)



