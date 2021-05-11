# Lilith
A HolyC to C Transpiler written in C

## Usage
`make clean; make;` to build the compiler  
`./lil < filename` to compile the HolyC file. outputs are out.c and a.out  
`./a.out` to run the compiled file

## Included files
- Makefile: it's a Makefile
- scanner.l: a lexer that also writes to out.c and calls gcc on it
- randTest.HC: an included HolyC test file
- linkedList.h: linked lists, was going to be used to make a basic symbol finder but ran out of time
- README.md: this file that you're reading right now

## What it does
- Takes a HolyC file as input
- Writes translation to a c file (out.c)
- Compiles out.c with gcc into a.out

## What is supported
- All basic types
- HolyC classes
- HolyC multiple print statments (Print() and "")
- Line number errors

## What will be supported given more time
- Calling void functions in the dir; format (dir; -> dir();) 
- Proper implimentation of switch statements (use the same process as HolyC)
- More of the DOS like syntax of HolyC

## License
The license selected for this project is the GNU General Public License v2.0