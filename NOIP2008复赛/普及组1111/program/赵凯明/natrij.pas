var h3,m3,s3,hou1,min1,sec1,hou2,min2,sec2:longint;
    s1,s2:string;


procedure setup(s:string;var hou,min,sec:longint);
          var i:longint;
              ts:string;
              f:boolean;
          begin
            ts:=copy(s,1,pos(':',s));
            for i:=1 to length(ts)-1 do
                hou:=hou*10+ord(ts[i])-48;
            delete(s,1,pos(':',s));
            ts:=copy(s,1,pos(':',s));
            for i:=1 to length(ts)-1 do
                min:=min*10+ord(ts[i])-48;
            delete(s,1,pos(':',s));
            ts:=copy(s,1,pos(':',s));
            for i:=1 to length(ts)-1 do
                sec:=sec*10+ord(ts[i])-48;
            delete(s,1,pos(':',s));
          end;

procedure work(a,b:string;h1,m1,s1,h2,m2,s2:longint);
          var t:longint;
          begin
                 t:=h1;h1:=h2;h2:=t;
                 t:=m1;m1:=m2;m2:=t;
                 t:=s1;s1:=s2;s2:=t;
          if a>b then inc(h1,24);
          if s1<s2 then
                begin
                  inc(s1,60);
                  dec(m1);
                end;
            s3:=s1-s2;
            if m1<m2 then
                 begin
                  while m1<=0 do
                    begin
                      inc(m1,60);
                      dec(h1);
                    end;
                end;
            m3:=m1-m2;
            h3:=h1-h2;
            if h3<10 then write(0);
            write(h3,':');
            if m3<10 then write(0);
            write(m3,':');
            if s3<10 then write(0);
            write(s3);
          end;

begin
assign(input,'natrij.in');reset(input);
assign(output,'natrij.out');rewrite(output);
  readln(s1);s1:=s1+':';
  readln(s2);s2:=s2+':';
  setup(s1,hou1,min1,sec1);setup(s2,hou2,min2,sec2);
  work(s1,s2,hou1,min1,sec1,hou2,min2,sec2);
close(input);close(output);
end.
