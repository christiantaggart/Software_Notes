## [Object file](https://en.wikipedia.org/wiki/Object_file)  ( File type: .o && or .so is)

- An object file format is a computer file format used for the storage of object code and related data.

- Object file is a file containing object code, meaning relocatable format machine code that is usually not directly executable.

- There are various formats for object files, and the same object code can be packaged in different object files.
  - An object file may also work like a shared library.

- In addition to the object code itself, object files may contain metadata used for linking or debugging, including:
  - information to resolve symbolic cross-references between different modules
  - relocation information
  - stack unwinding information
  -  comments
  - program symbols
  - debugging or profiling information.

- Most object file formats are structured as separate sections of data, each section containing a certain type of data.
  - These sections are known as "segments" due to the term "memory segment", which was previously a common form of memory management.
- When a program is loaded into memory by a loader, the loader allocates various regions of memory.
  - Some of these regions correspond to segments of the object file, and thus are usually known by the same names.
  - Others, such as the stack, only exist at run time.

- In some cases relocation is done by the loader (or linker) to specify the actual memory addresses. However, for many programs or architectures relocation is not necessary, due to being handled by the memory management unit or by position-independent code.

- On some systems the segments of the object file can then be copied (paged) into memory and executed, without needing further processing.
  - On these systems this may be done lazily, that is, only when the segments are referenced during execution, for example via a memory-mapped file backed by the object file.

- Types of data supported by typical object file formats:

  -  Header (descriptive and control information)
  -  Code segment ("text segment", executable code)
  -  Data segment (initialized static variables)
  -  Read-only data segment (rodata, initialized static constants)
  -  BSS segment (uninitialized static data, both variables and constants)
  -  External definitions and references for linking
  -  Relocation information
  -  Dynamic linking information
  -  Debugging information

- Segments in different object files may be combined by the linker according to rules specified when the segments are defined.
- Conventions exist for segments shared between object files

The [GNU Project's Binary File Descriptor library (BFD library)](https://en.wikipedia.org/wiki/Binary_File_Descriptor_library
) provides a common API for the manipulation of object files in a variety of formats.
