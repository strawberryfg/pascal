  const
    maxn=30;
  var
    i,j,n,d:byte;
    a:array[1..maxn]of byte;
    value:array[1..maxn,1..maxn]of comp;
    root:array[1..maxn,1..maxn]of byte;
    s,temp:comp;
    f1,f2:text;fn1,fn2,fileNo:string;
  procedure preorder(p1,p2:byte);{��ǰ�����������ӷֶ�����}
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
      value[i,i]:=a;{���㵥���ڵ㹹�ɵĶ������ļӷ�}
      root[i,i]:=i;{��¼�����ڵ㹹�ɵĶ������ĸ��ڵ�}
    end;
    for i:=1 to n-1 do begin
      value[i,i+1]:=a+a[i+1];{�������������ڵ㹹�ɵĶ����������ӷ�}
      root[i,i+1]:=i;{��¼���������ڵ㹹�ɵĶ������ĸ��ڵ㣻��Ҫ˵�����ǣ������ڵ㹹�ɵĶ�����������ڵ���������е��κ�һ��������ѡ���С��Ϊ���ڵ㣬���Ŵ��Ϊ������������ѡ��Ŵ��Ϊ���ڵ㣬����С��Ϊ������������ˣ���������ǰ�����������в��ֲ�ͬ����ͬ������ȷ�ġ�������ӷֶ����������нڵ�Ķ�������0��2������������ǰ����������Ψһ�ġ�}
    end;
    for d:=2 to n-1 do begin{���μ�����Ϊd�������ڵ㹹�ɵĶ����������ӷ�}
      for i:=1 to n-d do begin
        s:=value[i,i]+value[i+1,i+d];{������iΪ���ڵ㣬��i+1��i+d�����нڵ�Ϊ�������Ķ����������ӷ�}
        root[i,i+d]:=i; {��¼���ڵ�i}
        for j:=1 to d do begin
          temp:=value[i+j,i+j]+value[i,i+j-1]*value[i+j+1,i+d];{������i+jΪ���ڵ㣬��i��i+j-1�����нڵ�Ϊ����������i+j+1��i+d�����нڵ�Ϊ�������Ķ����������ӷ�}
          if temp>s then begin{�����ֵΪ���}
            s:=temp;root[i,i+d]:=i+j;{�����µ����ֵ���µĸ��ڵ�}
          end;
        end;
        temp:=value[i,i+d-1]+value[i+d,i+d];{������i+dΪ���ڵ㣬��i��i+d-1�����нڵ�Ϊ�������Ķ����������ӷ�}
        if temp>s then begin
          s:=temp;root[i,i+d]:=i+d+1;
        end;
        value[i,i+d]:=s;
      end;
    end;
    writeln(f2,value[1,n]:0:0);{������ӷ�}
    preorder(1,n);{������ӷֶ�������ǰ���������}
    close(f2);
  end.