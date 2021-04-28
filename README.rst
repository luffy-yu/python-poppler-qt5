=========================================
Installation Guide in Windows with VS2019
=========================================
Updated at April 28, 2021

Prerequisites
-------------

- VS 2019 build tools

vs_buildtools__1409948410.1619447939.exe

https://visualstudio.microsoft.com/e1f45feb-507e-4c54-b12e-c6feaaa7318d

- cmake GUI 

cmake-3.20.1-windows-x86_64.msi

https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1-windows-x86_64.msi

- vcpkg

git clone https://github.com/Microsoft/vcpkg.git

- miniconda

Miniconda3-py39_4.9.2-Windows-x86_64.exe

https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Windows-x86_64.exe

- poppler-0.82.0

https://poppler.freedesktop.org/poppler-0.82.0.tar.xz

- poppler-test

git clone https://gitlab.freedesktop.org/poppler/test

e.g. ``C:/Users/luffy/Downloads/test``

- python-poppler-qt5

e.g. ``C:/Users/luffy/Downloads/python-poppler-qt5``

Installation
------------

- VS 2019 build tools

Install the followings::
    
    Workloads: C++ build tools
    
    [✓] MSVC v142 - VS 2019 C++ x64/x86 build tools
    [✓] Windows 10 SDK(10.0.19041.0)

- cmake

Just click next all the time

- vcpkg

git clone https://github.com/Microsoft/vcpkg.git

e.g. C:/Users/luffy/Downloads/vcpkg

Open File Explorer

Press Shift, hold on, right click, and click ``Open PowerShell window here``

Enter::

     .\bootstrap-vcpkg.bat
     .\vcpkg.exe install freetype
     .\vcpkg.exe install devil
     .\vcpkg.exe install openjpeg
     .\vcpkg.exe install libiconv
     .\vcpkg.exe install cairo
     
- miniconda

Setup following the guide

**Update Miniconda**

Open the Anaconda Prompt(miniconda3)

Enter::

    conda update -f conda-update-base--prune.yml --prune
    
- Build poppler

Extract poppler-0.82.0.tar.xz

e.g. ``C:/Users/luffy/Downloads/poppler-0.82.0/poppler-0.82.0``

Edit CMakeLists.txt

From::

    project(poppler)

    cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)

    set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)


To::

    project(poppler)

    cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)

    set(CMAKE_TOOLCHAIN_FILE "C:/Users/luffy/Downloads/vcpkg/scripts/buildsystems/vcpkg.cmake")
    set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
   
From::

    find_package(Freetype REQUIRED)
    
To::

    find_package(freetype REQUIRED)


Open ``x64 Native Tools Command Prompt for VS 2019`` as Administrator

Enter::

    cd C:\Users\luffy\Downloads\poppler-0.82.0\poppler-0.82.0\
    mkdir build
    cd build

**Open cmake-gui**

**Start cmake-gui from Miniconda Prompt**

Guide::

    Open the Anaconda Prompt(miniconda3)
    cd C:\Program Files\CMake\bin
    cmake-gui

Configure::

    Source:C:/Users/luffy/Downloads/poppler-0.82.0/poppler-0.82.0
    Build: C:/Users/luffy/Downloads/poppler-0.82.0/poppler-0.82.0/build

Click Configure

Select ``Viusal Studio 16 2019``, and enter platform ``x64``

Set ``TESTDATADIR`` to ``C:/Users/luffy/Downloads/test``

Configure

Generate

Edit ``C:/Users/luffy/miniconda3/Library/include/jmorecfg.h``

From::

    typedef long INT32;
To::

    typedef long INT32B;

Switch to ``x64 Native Tools Command Prompt for VS 2019`` Window

Enter::

    msbuild INSTALL.vcxproj /p:platform=x64 /p:configuration=release
    
It will install into ``C:\Program Files\poppler`` if nothing erroneous happens.

- Build python-poppler-qt5

Switch to ``Anaconda Prompt(miniconda3)`` window

Enter::
    
    cd C:\Users\luffy\Downloads\python-poppler-qt5
    sip-build
    
Output::

    Querying qmake about your Qt installation...
    These bindings will be built: Poppler-Qt5.
    Generating the Poppler-Qt5 bindings...
    Generating the .pro file for the popplerqt5 module...
    Generating the top-level .pro file...
    Generating the Makefiles...
    Compiling the project...
    sip-build: 'nmake' failed returning 2
    
    
Edit ``C:/Users/luffy/Downloads/python-poppler-qt5/build/popplerqt5/popplerqt5.pro``

From::
    
    target.files = popplerqt5.pyd
    
    win32 {
        LIBS += -Lc:/users/luffy/miniconda3/libs
    }
    

To::

    target.files = popplerqt5.pyd

    INCLUDEPATH += c:/users/luffy/miniconda3/include
    INCLUDEPATH += "c:/Program Files/poppler/include/poppler"
    win32 {
        LIBS += -Lc:/users/luffy/miniconda3/libs
        LIBS += -L"c:/Program Files/poppler/lib" -lpoppler -lpoppler-cpp -lpoppler-qt5
        LIBS += -L"C:/Program Files (x86)/Microsoft Visual Studio/2019/BuildTools/VC/Tools/MSVC/14.28.29910/lib/x64"
    }
    
Open ``x64 Native Tools Command Prompt for VS 2019``

Enter::

    cd C:\Users\luffy\Downloads\python-poppler-qt5\build
    nmake
    nmake install
    
Copy files

copy poppler-cpp.dll and poppler-qt5.dll from ``C:\Program Files\poppler\bin`` into ``miniconda3\Library\bin``

Test

Switch to ``Anaconda Prompt(miniconda3)`` window

Enter::
    
    python
    import popplerqt5
    
    
It indicates success if no error raised.

==================
python-poppler-qt5
==================

A Python binding for libpoppler-qt5 that aims for completeness and for being
actively maintained.

Created and currently maintained by Wilbert Berendsen <wbsoft@xs4all.nl>.

Homepage: https://pypi.python.org/pypi/python-poppler-qt5/


Usage::

    import popplerqt5
    d = popplerqt5.Poppler.Document.load('file.pdf')


Documentation
-------------

The Python API closely follows the Poppler Qt5 C++ interface library API,
documented at https://poppler.freedesktop.org/api/qt5/ .

Note: Releases of PyQt5 < 5.4 currently do not support the QtXml module,
all methods that use the QDomDocument, QDomElement and QDomNode types are
disabled. This concerns the ``Document::toc()`` method and some constructors
and the ``store()`` methods in the ``Annotation`` subclasses. So, using
PyQt5 >= 5.4 is recommended.

Wherever the C++ API requires ``QList``, ``QSet`` or ``QLinkedList``, any
Python sequence can be used. 
API calls that return ``QList``, ``QSet`` or ``QLinkedList`` all return Python
lists.

There are a few other differences:

``Poppler::Document::getPdfVersion(int *major, int *minor)`` can simply be
called as ``d.getPdfVersion()``, (where ``d`` is a ``Poppler::Document``
instance); it will return a tuple of two integers (major, minor).

``Poppler::Document`` has ``__len__`` and ``__getitem__`` methods, corresponding
to ``numPages()`` and ``page(int num)``.

``Poppler::FontIterator`` (returned by ``Poppler::Document::newFontIterator``)
is also a Python iterable (e.g. has ``__iter__()`` and ``__next__()`` methods).
So although you can use::

    it = document.newFontIterator()
    while it.hasNext():
        fonts = it.next()  # list of FontInfo objects
        ...

you can also use the more Pythonic::

    for fonts in document.newFontIterator():
        ...

In addition to the Poppler namespace, there are two toplevel module
functions:

    ``popplerqt5.version()``
        returns the version of the ``python-poppler-qt5`` package as a
        tuple of ints, e.g. ``(0, 18, 2)``.
    
    ``popplerqt5.poppler_version()``
        returns the version of the linked Poppler-Qt5 library as a
        tuple of ints, e.g. ``(0, 24, 5)``.
        
        This is determined at build time. If at build time the Poppler-Qt5
        version could not be determined and was not specified, an empty
        tuple might be returned.

