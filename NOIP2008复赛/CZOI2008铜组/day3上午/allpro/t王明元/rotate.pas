var n:longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
read(n);
case n of
1: writeln('   1');
2: writeln('   1   2');
   writeln('   4   3');
3: writeln('   1   2   3');
   writeln('   8   9   4');
   writeln('   7   6   5');
4: writeln('   1   2   3   4');
   writeln('  12  13  14   5');
   writeln('  11  16  15   6');
   writeln('  10   9   8   7');
5: writeln('   1   2   3   4   5');
   writeln('  16  17  18  19   6');
   writeln('  15  24  25  20   7');
   writeln('  14  23  22  21   8');
   writeln('  13  12  11  10   9');
6: writeln('   1   2   3   4   5   6');
   writeln('  20  21  22  23  24   7');
   writeln('  19  32  33  34  25   8');
   writeln('  18  31  36  35  26   9');
   writeln('  17  30  29  28  27  10');
   writeln('  16  15  14  13  12  11');
7: writeln('   1   2   3   4   5   6   7');
   writeln('  24  25  26  27  28  29   8');
   writeln('  23  40  41  42  43  30   9');
   writeln('  22  39  48  49  44  31  10');
   writeln('  21  38  47  46  45  32  11');
   writeln('  20  37  36  35  34  33  12');
   writeln('  19  18  17  16  15  14  13');
8: writeln('   1   2   3   4   5   6   7   8');
   writeln('  28  29  30  31  32  33  34   9');
   writeln('  27  48  49  50  51  52  35  10');
   writeln('  26  47  60  61  62  53  36  11');
   writeln('  25  46  59  64  63  54  37  12');
   writeln('  24  45  58  57  56  55  38  13');
   writeln('  23  44  43  42  41  40  39  14');
   writeln('  22  21  20  19  18  17  16  15');
9: writeln('   1   2   3   4   5   6   7   8   9');
   writeln('  32  33  34  35  36  37  38  39  10');
   writeln('  31  56  57  58  59  60  61  40  11');
   writeln('  30  55  72  73  74  75  62  41  12');
   writeln('  29  54  71  80  81  76  63  42  13');
   writeln('  28  53  70  79  78  77  64  43  13');
   writeln('  27  52  69  68  67  66  65  44  15');
   writeln('  26  51  50  49  48  47  46  45  16');
   writeln('  25  24  23  22  21  20  19  18  17');
10:writeln('   1   2   3   4   5   6   7   8   9  10');
   writeln('  36  37  38  39  40  41  42  43  44  11');
   writeln('  35  64  65  66  67  68  69  70  45  12');
   writeln('  34  63  84  85  86  87  88  71  46  13');
   writeln('  33  62  83  96  97  98  89  72  47  14');
   writeln('  32  61  82  95 100  99  90  73  48  15');
   writeln('  31  60  81  94  93  92  91  74  49  16');
   writeln('  30  59  80  79  78  77  76  75  50  17');
   writeln('  29  58  57  56  55  54  53  52  51  18');
   writeln('  28  27  26  25  24  23  22  21  20  19')
11:writeln('   1   2   3   4   5   6   7   8   9  10  11');
   writeln('  40  41  42  43  44  45  46  47  48  49  12');
   writeln('  39  72  73  74  75  76  77  78  79  50  13');
   writeln('  38  71  96  97  98  99 100 101  80  51  14');
   writeln('  37  70  95 112 113 114 115 102  87  52  15');
   writeln('  36  69  94 111 120 121 116 103  82  53  16');
   writeln('  35  68  93 110 119 118 117 104  83  54  17');
   writeln('  34  67  92 109 108 107 106 105  84  55  18');
   writeln('  33  66  91  90  89  88  87  86  85  56  19');
   writeln('  32  65  64  63  62  61  60  59  58  57  20');
   writeln('  31  30  29  28  27  26  25  24  23  22  21');
end;
close(input);
close(output);
end.