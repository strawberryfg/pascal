  const
    maxn=30;
  var
    i,j,n,d:byte;
    a:array[1..maxn]of byte;
    value:array[1..maxn,1..maxn]of comp;
    root:array[1..maxn,1..maxn]of byte;
    s,temp:comp;
    f1,f2:text;fn1,fn2,fileNo:string;
  procedure preorder(p1,p2:byte);{按前序遍历输出最大加分二叉树}
    begin
      if p2>=p1 then begin
        write(f2,root[p1,p2],' ');
        preorder(p1,root[p1,p2]-1);
        preorder(root[p1,p2]+1,p2);
      end;
    end;
  begin
    write('Input fileNo:');readln(fileNo);
    fn1:='tree.in'+fileNo;fn2:='tree.ou'+fileNo;
    assign(f1,fn1);reset(f1);
    assign(f2,fn2);rewrite(f2);
    readln(f1,n);
    for i:=1 to n do read(f1,a);
    close(f1);
    fillchar(value,sizeof(value),0);
    for i:=1 to n do begin
      value[i,i]:=a;{计算单个节点构成的二叉树的加分}
      root[i,i]:=i;{记录单个节点构成的二叉树的根节点}
    end;
    for i:=1 to n-1 do begin
      value[i,i+1]:=a+a[i+1];{计算相邻两个节点构成的二叉树的最大加分}
      root[i,i+1]:=i;{记录相邻两个节点构成的二叉树的根节点；需要说明的是，两个节点构成的二叉树，其根节点可以是其中的任何一个；这里选编号小的为根节点，则编号大的为其右子树；若选编号大的为根节点，则编号小的为其左子树；因此，最后输出的前序遍历结果会有部分不同，但同样是正确的。如果最大加分二叉树的所有节点的度数都是0或2，则最后输出的前序遍历结果是唯一的。}
    end;
    for d:=2 to n-1 do begin{依次计算间距为d的两个节点构成的二叉树的最大加分}
      for i:=1 to n-d do begin
        s:=value[i,i]+value[i+1,i+d];{计算以i为根节点，以i+1至i+d间所有节点为右子树的二叉树的最大加分}
        root[i,i+d]:=i; {记录根节点i}
        for j:=1 to d do begin
          temp:=value[i+j,i+j]+value[i,i+j-1]*value[i+j+1,i+d];{计算以i+j为根节点，以i至i+j-1间所有节点为左子树，以i+j+1至i+d间所有节点为右子树的二叉树的最大加分}
          if temp>s then begin{如果此值为最大}
            s:=temp;root[i,i+d]:=i+j;{记下新的最大值和新的根节点}
          end;
        end;
        temp:=value[i,i+d-1]+value[i+d,i+d];{计算以i+d为根节点，以i至i+d-1间所有节点为左子树的二叉树的最大加分}
        if temp>s then begin
          s:=temp;root[i,i+d]:=i+d+1;
        end;
        value[i,i+d]:=s;
      end;
    end;
    writeln(f2,value[1,n]:0:0);{输出最大加分}
    preorder(1,n);{输出最大加分二叉树的前序遍历序列}
    close(f2);
  end.