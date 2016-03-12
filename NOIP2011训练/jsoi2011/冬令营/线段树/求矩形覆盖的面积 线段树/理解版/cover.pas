procedure sorth(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=h[(l+r) div 2];
         repeat
           while h[i]<x do
            inc(i);
           while x<h[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=h[i];
                h[i]:=h[j];
                h[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sorth(l,j);
         if i<r then
           sorth(i,r);
      end;

procedure sortindex(l,r: longint);
      var
         i,j,x1,x2,y: longint;
      begin
         i:=l;
         j:=r;
         x1:=index[(l+r) div 2].a;
		 x2:=index[(l+r)div 2].flag;
         repeat
           while (index[i].a<x1)or((index[i].a=x1)and(index[i].flag<x2)) do
            inc(i);
           while (x1<index[j].a)or((x1=index[j].a)and(x2<index[j].flag)) do
            dec(j);
           if not(i>j) then
             begin
                y:=index[i].a;
                index[i].a:=index[j].a;
                index[j].a:=y;
				y:=index[i].w;
				index[i].w:=index[j].w;
				index[j].w:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sortindex(l,j);
         if i<r then
           sortindex(i,r);
      end;

function find(x:longint):longint;
var l,r,mid:longint;
begin
l:=1; r:=n;
while l<=r do
  begin
  mid:=(l+r)div 2;
  if x<h[mid] then r:=mid-1 
     else if x>h[mid] then l:=mid+1
	      else exit(mid);
  end;

end;
procedure build(f,t:longint);
var now,mid:longint;
begin
inc(tot);
now:=tot;
m[now].l:=f; m[now].r:=t; //线段树常规操作  设置左右端点
if f=t then exit;         //这句话很容易漏掉 如果左右端点相同相当于是左端点等于右端点 则退出   
mid:=(f+t)div 2;
m[now].lc:=tot+1;         //设置Now的左节点编号  tot+1是为了省空间
build(f,mid);
m[now].rc:=tot+1;
build(mid,t);
end;
procedure insert(f,t,x:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then  //区间被完全包含
   begin
   inc(m[x].cover);
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if (m[x].lc<>0)and(f<mid) then insert(f,t,m[x].lc);   //与左半边相交
if (m[x].rc<>0)and(t>mid) then insert(f,t,m[x].rc);   //与右半边相交
end;
end;
procedure delete(f,t,x:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then  //区间被完全包含
   begin
   dec(m[x].cover);
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if (m[x].lc<>0)and(f<mid) then delete(f,t,m[x].lc);   //与左半边相交
if (m[x].rc<>0)and(t>mid) then delete(f,t,m[x].rc);   //与右半边相交
end;                              //相当于删除线段
function count(x:longint):longint;
var res:longint;
begin
if (m[x].cover>0) then exit(h[m[x].r]-h[m[x].l])          //m[x].l表示该区间左端点对应的  有序高度数组中的位置  同理M[x].r可以解释
   else begin
        res:=0;
        if m[x].lc<>0 then  inc(res,count(m[x].lc));
		if m[x].rc<>0 then inc(res,count(m[x].rc));
		exit(res);
        end;
end;
begin
assign(input,'cover.in');
reset(input);
assign(output,'cover.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
	readln(a[i],b[i],w[i]);
	h[i]:=w[i];
	end;
sorth(1,n);          //将高度排序  为后面作准备
for i:=1 to n do
    w[i]:=find(w[i]);   //二分查找第i个建筑物高度 在  有序的高度数组中所处的位置 （第k小高度）
t:=0;
for i:=1 to n do
    begin
	inc(t); index[t].a:=a[i]; index[t].w:=w[i]; index[i].flag:=1;  //矩形左边界标记为1
	inc(t); index[t].a:=b[i]; index[t].w:=w[i]; index[i].flag:=-1; //矩形右边界标记为-1
	end;
sortindex(1,t); //将纵线  垂直于x轴的线离散化
tot:=0;
build(0,n); //将n种高度放在线段树中 [1,n]不断二分为小的线段
index[t+1].a:=index[t].a;
for i:=1 to t do
    begin
	if index[i].flag=1 then insert(0,index[i].w,1)
	   else if index[i].flag=-1 then delete(0,index[i].w,1);
	tmp:=index[i+1].a-index[i].a;
	tmp:=tmp*count(1);
	end;
close(input);
close(output);
end.