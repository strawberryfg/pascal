const maxn=300000;
type rec=record x,fa,hei,flag:longint; end;
var a:array[0..2*maxn+1]of rec;
    lasth,lastx,n,total,tot,sum,i,j:longint;
    l,r,h,f,p:array[0..3*maxn+1]of longint;
    heap,pos:array[0..3*maxn]of longint;
procedure sort(l,r: longint);
      var
         i,j,tmp: longint;
         tt:rec;
      begin
         i:=l;
         j:=r;
         tmp:=a[(l+r) div 2].x;
         repeat
           while a[i].x<tmp do
            inc(i);
           while tmp<a[j].x do
            dec(j);
           if not(i>j) then
             begin
                tt:=a[i];
                a[i]:=a[j];
                a[j]:=tt;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
procedure up(t:longint);
var x,tmp:longint;
begin
x:=t;
while (x>1)and(h[heap[x]]>h[heap[x div 2]]) do
  begin
  tmp:=pos[heap[x]]; pos[heap[x]]:=pos[heap[x div 2]]; pos[heap[x div 2]]:=tmp;
  tmp:=heap[x]; heap[x]:=heap[x div 2]; heap[x div 2]:=tmp;
  x:=x div 2;
  end;
end;
procedure remove(t:longint);
var x,tmp,t1,t2,pnum:longint;
begin
tmp:=pos[t]; pos[heap[total]]:=tmp; pos[t]:=0;
heap[tmp]:=heap[total]; heap[total]:=0;
dec(total);
x:=tmp;
while (x*2<=total) do
 begin
 t1:=h[heap[x*2]]; if x*2+1<=total then t2:=h[heap[x*2+1]] else t2:=0;
 if t1>t2 then pnum:=0 else pnum:=1;
 if h[heap[x]]<h[heap[x*2+pnum]] then
    begin
    tmp:=pos[heap[x]]; pos[heap[x]]:=pos[heap[x*2+pnum]]; pos[heap[x*2+pnum]]:=tmp;
    tmp:=heap[x]; heap[x]:=heap[x*2+pnum]; heap[x*2+pnum]:=tmp;
    x:=x*2+pnum;                                                                       //ע����x*2+pnum
    end
 else
    break;
 end;
end;
begin
assign(input,'contour.in');
reset(input);
assign(output,'contour.out');
rewrite(output);
readln(n);
tot:=0;
for i:=1 to n do
    begin
    readln(l[i],r[i],h[i]);
    inc(tot);
    a[tot].x:=l[i]; a[tot].fa:=i; a[tot].hei:=h[i]; a[tot].flag:=1;
    inc(tot);
    a[tot].x:=r[i]; a[tot].fa:=i; a[tot].hei:=h[i]; a[tot].flag:=-1;
    end;
sort(1,tot);
sum:=1;
lastx:=a[1].x; lasth:=a[1].hei; sum:=1; f[1]:=lasth; p[1]:=lastx;           //lastx��ʾ��һ�θı�߶�ʱ��xֵ lasth��ʾ��һ�θı��ĸ߶�
total:=1; heap[1]:=a[1].fa; pos[a[1].fa]:=1;                                  
//writeln(lastx,' ',lasth);
for i:=2 to tot do
    begin
    if a[i].flag=1 then                                                     //a[i].x��ʾ�����߽��xֵ,hei��ʾ�߶θ߶�  fa��ʾ���ڵڼ������� flag=1��߽� flag=-1�ұ߽�
       begin
       inc(total); heap[total]:=a[i].fa; pos[a[i].fa]:=total;               //heap[]��ڼ�������  ����heap[1]=4 ��ʾ��ߵ��߶����ڵ�4������
       up(total);
       if a[i].hei>lasth then                                               // �����߶ο��ܸ�����߸߶�   
          begin
          if lastx=a[i].x then begin f[sum]:=a[i].hei;lasth:=f[sum]; end    //f[]��߶� ����߽�xֵ��ͬ����inc(sum) �����jpeg
             else begin

                  lastx:=a[i].x;
                  lasth:=a[i].hei;
                  inc(sum); f[sum]:=lasth;                                  //p[]��ı�߶�ʱxֵ
                            p[sum]:=lastx;
                  //writeln(lastx,' ',lasth);
                  end;
          end;
       end
    else
       begin
       remove(a[i].fa);                                                     //�Ƴ��� ��Ҫ֪���߽����ڵڼ�������
       if h[heap[1]]<lasth then
          begin
          lastx:=a[i].x;
          lasth:=h[heap[1]];
          inc(sum); f[sum]:=lasth;
                    p[sum]:=lastx;
          //writeln(lastx,' ',lasth);
          end;
       end;
    end;
i:=1;
while i<=sum do
    begin
    j:=i;
    while(j+1<=sum)and(p[j+1]=p[i]) do inc(j);
    writeln(p[j],' ',f[j]);
    i:=j+1;
    end;
close(input);
close(output);
end.