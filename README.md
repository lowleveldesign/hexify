
## Hexify

Hexify is a .NET library which contains methods to make work with hex string easier. The static **Hex** class is the one to be used to convert from/to hex, as well as to nicely print the byte arrays. Hex encoding was imported from the excellent [Bouncy Castle](http://bouncycastle.org/csharp/index.html) library.

Hexify is available as a Nuget package: <https://www.nuget.org/packages/Hexify/>

### Example usage

To pretty print a content of a binary file you may use the following code:

```csharp
using System;
using System.IO;
using LowLevelDesign.Hexify;

public static class Program
{
    public static void Main(string[] args) {
        byte[] b = File.ReadAllBytes(args[0]);
        Console.WriteLine(Hex.PrettyPrint(b));
    }
}
```

And the result of running this code will be:

```
PS temp> .\Test.exe Test.exe
0000: 4d 5a 90 00 03 00 00 00 04 00 00 00 ff ff 00 00  MZ..........yy..
0010: b8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  ........@.......
0020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0030: 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00  ................
0040: 0e 1f ba 0e 00 b4 09 cd 21 b8 01 4c cd 21 54 68  ..o....Í!..LÍ!Th
0050: 69 73 20 70 72 6f 67 72 61 6d 20 63 61 6e 6e 6f  is.program.canno
0060: 74 20 62 65 20 72 75 6e 20 69 6e 20 44 4f 53 20  t.be.run.in.DOS.
0070: 6d 6f 64 65 2e 0d 0d 0a 24 00 00 00 00 00 00 00  mode............
0080: 50 45 00 00 4c 01 03 00 7d 82 6a 58 00 00 00 00  PE..L...}.jX....
0090: 00 00 00 00 e0 00 22 00 0b 01 30 00 00 06 00 00  ....a."...0.....
00a0: 00 08 00 00 00 00 00 00 3a 25 00 00 00 20 00 00  ........:%......
00b0: 00 40 00 00 00 00 40 00 00 20 00 00 00 02 00 00  .@....@.........
00c0: 04 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00  ................
00d0: 00 80 00 00 00 02 00 00 00 00 00 00 03 00 40 85  ..............@.
00e0: 00 00 10 00 00 10 00 00 00 00 10 00 00 10 00 00  ................
00f0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00  ................
0100: e8 24 00 00 4f 00 00 00 00 40 00 00 ac 04 00 00  c...O....@......
0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
...
```
