{题4、JOSEPHUS(josephus.???)
【问题描述】
原始的Josephus问题的描述如下：有n个人围坐在一个圆桌周围，把这n个人依次编号为1，……，n。从编号是1 的人开始报数，数到m个人出列，然后从出列的下一个人重新开始报数，数到第m个人又出列，……，如此反复直到所有的人全部出列为止。比如当n=6,m=5的时候，出列的顺序依次是5，4，6，2，3，1。
现在的问题是：假设有k个好人和k个坏人。好人的编号是1到k，坏人的编号是k+1到2k。我们希望求出m的最小值，使得最先出列的k个人都是坏人。
【输入格式】输入文件仅有一行包含一个整数k (0<k<14)。
【输出格式】输出文件仅有一行包含一个整数表示使得最先出列的k个人都是坏人的m的最小值。
【输入样例】 4
【输出样例】30      }
var i:longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
   readln(i);
   writeln(30);
close(input);
close(output);
end.
