#include <iostream.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

char obj[200];
char data[30][200];

void change(char *a) {
	int i, j;
	for (i = 0; a[i] != 0; i++) {
		if (isalpha(a[i])) assert(a[i] == 'a');
		if (isdigit(a[i]) && a[i + 1] == ' ') {
			for (j = i + 2; a[j] != 0; j++) {
				if (a[j] != ' ') break;
			}
			assert(!isdigit(a[j]));
		}
	}
	for (i = j = 0; a[i] != 0; i++) {
		if (!isspace(a[i])) {
			a[j] = a[i];
			j++;
		}
	}
	a[j] = 0;
}

int pp[30];

bool pos[130][130];

int num[1000];
int lnum;
char sign[1000];
int lsign;

int divide;

inline int add(int a, int b) {
	return (a + b) % divide;
}

inline int sub(int a, int b) {
	return (a - b + divide) % divide;
}

inline int mul(int a, int b) {
	return a * b % divide;
}

inline int sqr(int a, int b) {
	assert(1 <= b && b <= 10);
	if (b == 0) return 1;
	if (b == 1) return a;
	int c = b / 2;
	int d = sqr(a, c);
	d = (d * d) % divide;
	if (2 * c != b) d = d * a % divide;
	return d;
}

void count(){
	while(lsign>0&&sign[lsign-1]!='('){
		if(sign[lsign-1]=='+')
			num[lnum-2] = add(num[lnum-2], num[lnum-1]);
		else if(sign[lsign-1]=='-')
			num[lnum-2] = sub(num[lnum-2], num[lnum-1]);
		else if(sign[lsign-1]=='*')
			num[lnum-2] = mul(num[lnum-2], num[lnum-1]);
		else if(sign[lsign-1]=='^')
			num[lnum-2] = sqr(num[lnum-2], num[lnum-1]);
		lnum--;
		lsign--;
	}
	if(lsign>0&&sign[lsign-1]=='(')lsign--;
}

int count(char* a){
	lnum=lsign=0;
	int i;
	int t;
	for(i=0;a[i]!=0;i++){
		if(isdigit(a[i])){
			t=0;
			assert(a[i] != 0);
			while(isdigit(a[i])){
				t=10*t+a[i]-'0';
				assert(0 < t && t < 10000);
				i++;
			}
			t = t % divide;
			num[lnum++]=t;
			i--;

			assert(a[i + 1] == 0 || a[i + 1] == '+' || a[i + 1] == '*' ||
				a[i + 1] == '-' || a[i + 1] == '^' || a[i + 1] == ')');
		}
		else if(isalpha(a[i])) {
			assert(islower(a[i]));
			assert(a[i + 1] == 0 || a[i + 1] == '+' || a[i + 1] == '*' ||
				a[i + 1] == '-' || a[i + 1] == '^' || a[i + 1] == ')');
			num[lnum++]=pp[a[i]-'a'];
		}
		else if(a[i]=='(') {
			assert(isdigit(a[i + 1]) || isalpha(a[i + 1]) || a[i + 1] == '(');
			sign[lsign++]='(';
		}
		else if(a[i]=='+'||a[i]=='-'||a[i]=='^'||a[i]=='*'){
			assert(isdigit(a[i + 1]) || isalpha(a[i + 1]) || a[i + 1] == '(');
			if (a[i] == '^') assert(isdigit(a[i + 1]));
			while(lsign>0&&sign[lsign-1]!='('
				&&pos[sign[lsign-1]][a[i]]){
					if(sign[lsign-1]=='+')
						num[lnum-2] = add(num[lnum-2], num[lnum-1]);
					else if(sign[lsign-1]=='-')
						num[lnum-2] = sub(num[lnum-2], num[lnum-1]);
					else if(sign[lsign-1]=='*')
						num[lnum-2] = mul(num[lnum-2], num[lnum-1]);
					else if(sign[lsign-1]=='^')
						num[lnum-2] = sqr(num[lnum-2], num[lnum-1]);
					lnum--;
					lsign--;
			}
			sign[lsign++]=a[i];
		}
		else if(a[i]==')'){
			assert(a[i + 1] == 0 || a[i + 1] == '+' || a[i + 1] == '*' ||
				a[i + 1] == '-' || a[i + 1] == '^' || a[i + 1] == ')');
			count();
		}
		else assert(0);
	}
	count();
	assert(lsign==0 && lnum==1);
	return num[0];
}

int equal[30];

int n;

void issame(){
	int t=100,i,j;
	int a,b;
	for(i=0;i<t;i++){
		divide = rand() % 10000 + 100;
		for(j=0;j<26;j++)pp[j] = rand() % divide;
		a=count(obj);
		for (j = 0; j < n; j++) {
			if (equal[j]) {
				if (count(data[j]) != a) equal[j] = 0;
			}
		}
	}
}

void solve(){
	cin.getline(obj,200);
	assert(1 <= strlen(obj) && strlen(obj) <= 50);
	change(obj);
	int i;
	cin >> n;
	assert(2 <= n && n <= 26);
	cin.ignore(200, '\n');
	for (i = 0; i < n; i++) {
		cin.getline(data[i], 200);
		//cerr << data[i] << endl;
		assert(1 <= strlen(data[i]));
		assert(strlen(data[i]) <= 50);
		change(data[i]);
	}
	{char c; assert(!(cin >> c));}

	memset(equal, -1, sizeof(equal));
	issame();
	for (i = 0; i < n; i++) {
		if (equal[i]) cout << char('A' + i);
	}
	cout << endl;
}

int main(){
	//frist >= second
	freopen("equal.in", "r", stdin);
	freopen("equal.out", "w", stdout);
	pos['^']['^']=pos['^']['*']=pos['^']['+']=pos['^']['-']
	=pos['*']['*']=pos['*']['+']=pos['*']['-']
	=pos['+']['+']=pos['+']['-']=pos['-']['+']=pos['-']['-']=true;
	solve();
	fclose(stdin);
	fclose(stdout);
	return 0;
}

