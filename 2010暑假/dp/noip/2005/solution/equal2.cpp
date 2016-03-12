#include <string.h>
#include <iostream.h>
#include <assert.h>
#include <stdio.h>
#include <ctype.h>
#include <string>

using  std::string;

//using namespace std;

inline int MAX(int a,int b) {return a>b?a:b;}

const int DIV = 10000;

struct bigint1{
  enum{LEN = 10};
  int num[LEN];
  bigint1(){
	//num = new int[LEN];
	int i;
    for(i=0;i<LEN;i++)
      num[i]=0;
  }
  bigint1(const bigint1& a){
	//num = new int[LEN];
    int i;
    for(i=0;i<LEN;i++)
      num[i]=a.num[i];
  }
  bigint1(int a) {
	  //num = new int[LEN];
    //memset(num, 0, sizeof(num));
    //assert(a > 0);
    int i = 0;
    while(i < LEN) {
      num[i] = a % DIV;
      i++;
      a = a / DIV;
    }
  }

//~bigint1() { delete[] num;}

  bigint1& operator=(const bigint1& a){
    int i;
    for(i=0;i<LEN;i++)
      num[i]=a.num[i];
    return *this;
  }

  bigint1 operator+(const bigint1& b) const{
    bigint1 result;
    int tot;
    int i;
    int add = 0;
    for(i=0;i<LEN;i++){
      tot = num[i] + b.num[i] + add;
      result.num[i] = tot % DIV;
      add = tot / DIV;
    }
    return result;
  }

  bigint1 operator*(const bigint1& b) const{
    bigint1 result;
    int i, j, tot, add;
    for(i=0;i<LEN;i++){
      if(b.num[i]==0)continue;
      add=0;
      for(j=0;i + j < LEN;j++){
	tot=result.num[i+j]+num[j]*b.num[i]+add;
	result.num[i+j]=tot%DIV;
	add=tot/DIV;
      }
    }
    return result;
  }

  bigint1 operator-(const bigint1& b) const{
    bigint1 result;
    int i, sub = 0;
    for (i = 0; i < LEN; i++) {
      if (num[i] - sub >= b.num[i]) {
	result.num[i] = num[i] - sub - b.num[i];
	sub = 0;
      }
      else {
	result.num[i] = num[i] - sub + DIV - b.num[i];
	sub = 1;
      }
    }
    return result;
  }

  int compare(const bigint1& b) const {
    int i;
    for(i = LEN - 1; i >= 0; i--) {
      if (num[i] != b.num[i]) return num[i] - b.num[i];
    }
    return 0;
  }

  void print() {
	  bool isp = false;
	  for (int i = LEN - 1; i >=0 ;i--) {
	  	if (num[i] != 0) isp = true;
	  	if (isp) cout << num[i];
	  }
	  if (!isp) cout << 0;
  }
};

struct bigint {
  int sign;
  bigint1 value;

  bigint(int a):value(a) {
    sign = 1;
  }

  bigint():value() {
    sign = 1;
  }

  void clear() {
    int i;
    for (i = 0; i < bigint1::LEN; i++) {
      if (value.num[i] != 0) break;
    }
    if (i == bigint1::LEN) sign = 1;
  }

  bigint& operator=(const bigint& b){
    sign = b.sign;
    value = b.value;
    return *this;
  }

  bigint operator+(const bigint& b) const{
    bigint result;
    if (sign * b.sign == 1) {
      result.sign = sign;
      result.value = value + b.value;
    }
    else {
      if (value.compare(b.value) >= 0) {
	result.sign = sign;
	result.value = value - b.value;
      }
      else {
	result.sign = b.sign;
	result.value = b.value - value;
      }
    }
    result.clear();
    return result;
  }

  bigint operator-(const bigint& b) const{
    bigint temp(b);
    temp.sign = -b.sign;
    bigint result = *this + temp;
    result.clear();
    return result;
  }

  bigint operator*(const bigint& b) const{
    bigint result;
    result.value = value * b.value;
    result.sign = sign * b.sign;
    result.clear();
    return result;
  }

  bool operator==(const bigint& b) const{
    if (sign == b.sign) {
      for (int i = 0; i < bigint1::LEN; i++)
	if (value.num[i] != b.value.num[i]) return false;
      return true;
    }
    else {
       return false;
    }
  }

	void print() {
		if (sign == -1) cout << '-';
		value.print();
	}

};



bool pos[256][256];
bigint ZERO;
bigint ONE(1);

const int POLY_LEN = 150;
const int EVA_LEN = 1000;

struct Polynomial {
  bigint* v;
  int length;

  void clear() {
    while(length >= 0 && v[length] == ZERO)
      length--;
  }

  Polynomial() {
	v = new bigint[POLY_LEN];
    length = -1;
  }
  Polynomial(int a) {
	  v = new bigint[POLY_LEN];
    if (a == 0) {
      length = 1;
      v[1] = ONE;
    }
    else if (a > 0) {
      length = 0;
      v[0] = bigint(a);
    }
    else assert(0);
  }

	Polynomial(const Polynomial& other) {
		v = new bigint[POLY_LEN];
		length = other.length;
		int i;
		for (i = 0; i <= length; i++) v[i] = other.v[i];
	}

	Polynomial& operator=(const Polynomial& other) {
		length = other.length;
		int i;
		for (i = 0; i < POLY_LEN; i++) v[i] = other.v[i];
		return *this;
	}

	~Polynomial(){delete[] v;}

  Polynomial add(Polynomial other) {
    Polynomial ans;
    ans.length = MAX(length, other.length);
    for (int i = 0; i <= ans.length; i++) {
      ans.v[i] = v[i] + other.v[i];
    }
    ans.clear();
    return ans;
  }

  Polynomial subtract(Polynomial other) {
    Polynomial ans;
    ans.length = MAX(length, other.length);
    for (int i = 0; i <= ans.length; i++) {
      ans.v[i] = v[i] - other.v[i];
    }
    ans.clear();
    return ans;
  }

  Polynomial multiply(Polynomial other) {
    Polynomial ans;
    if (length == -1 || other.length == -1) return ans;
    ans.length = length + other.length;
    assert(ans.length < POLY_LEN);
    for (int i = 0; i <= length; i++) {
      for (int j = 0; j <= other.length; j++)
	ans.v[i + j] = ans.v[i + j] + (v[i] * other.v[j]);
    }
    //ans.clear();
    return ans;
  }

  Polynomial pow_1(int a) {
    if (a == 0) return Polynomial(1);
    if (a == 1) return *this;
    Polynomial ans = pow_1(a / 2);
    ans = ans.multiply(ans);
    if (a % 2 == 1) ans = ans.multiply(*this);
    return ans;
  }


  Polynomial pow(int a) {
    if (length == -1) return Polynomial();
    return pow_1(a);
  }

  bool equals(Polynomial other) {
    if (length != other.length) return false;
    for (int i = 0; i <= length; i++) {
      if (!(v[i] == other.v[i])) return false;
    }
    return true;
  }

  int intValue() {
    assert(length == 0);
    return 10 * v[0].value.num[1] + v[0].value.num[0];
  }

  void print() {
	if (length == -1) cout << 0;
  	int i;
  	for (i = length; i >= 0; i--) {v[i].print(); cout << ' ';}
 }
};

struct Evaluator {
	string str;
  Polynomial* num;
  int lnum;
  char* sign;
  int lsign;

  Evaluator(const string s) {
    str = s;
    lnum = lsign = 0;
    num = new Polynomial[EVA_LEN];
    sign = new char[EVA_LEN];
  }
  ~Evaluator() {delete[] num; delete[] sign;}
  Polynomial count(){
    lnum=lsign=0;
    int i;
    int t;
    for(i=0; i < str.length(); i++){
      if (str[i] == ' ') continue;
      if (isdigit(str[i])){
	t=0;
	while(i < str.length() && isdigit(str[i])){
	  t=10*t+str[i]-'0';
	  i++;
	}
	num[lnum++]= Polynomial(t);
	i--;
      }
      else if(str[i] == 'a') {
	num[lnum++]= Polynomial(0);
      }
      else if(str[i]=='(') {
	sign[lsign++]='(';
      }
      else if(str[i]=='+'||str[i]=='-'||str[i]=='^'||str[i]=='*'){
	while(lsign>0&&sign[lsign-1]!='('
	      &&pos[sign[lsign-1]][str[i]]){
	  if(sign[lsign-1]=='+')
	    num[lnum-2] = num[lnum-2].add(num[lnum-1]);
	  else if(sign[lsign-1]=='-')
	    num[lnum-2] = num[lnum-2].subtract(num[lnum-1]);
	  else if(sign[lsign-1]=='*')
	    num[lnum-2] = num[lnum-2].multiply(num[lnum-1]);
	  else if(sign[lsign-1]=='^')
	    num[lnum-2] = num[lnum-2].pow(num[lnum-1].intValue());

	   //num[lnum-2].print(); cout << endl;

	  lnum--;
	  lsign--;
	}
	sign[lsign++]=str[i];
      }
      else if(str[i]==')'){
	count_1();
      }
      else assert(0);
    }
    count_1();
    return num[0];
  }

	void count_1(){
	  while(lsign>0&&sign[lsign-1]!='('){
		if(sign[lsign-1]=='+')
		  num[lnum-2] = num[lnum-2].add(num[lnum-1]);
		else if(sign[lsign-1]=='-')
		  num[lnum-2] = num[lnum-2].subtract(num[lnum-1]);
		else if(sign[lsign-1]=='*')
		  num[lnum-2] = num[lnum-2].multiply(num[lnum-1]);
		else if(sign[lsign-1]=='^')
		  num[lnum-2] = num[lnum-2].pow(num[lnum-1].intValue());

		//num[lnum-2].print(); cout << endl;

		lnum--;
		lsign--;
	  }
	  if(lsign>0&&sign[lsign-1]=='(')lsign--;
	}
};

int main() {

	pos['^']['^']=pos['^']['*']=pos['^']['+']=pos['^']['-']
	      =pos['*']['*']=pos['*']['+']=pos['*']['-']=pos['+']['+']
      =pos['+']['-']=pos['-']['+']=pos['-']['-']=true;


	char buffer[1024];
	cin.getline(buffer, 1024);
	Polynomial poly = Evaluator(buffer).count();

	//poly.print(); cout<< endl;

	cin.getline(buffer, 1024);
	int n;
	sscanf(buffer, "%d", &n);
	for (int i = 0; i < n; i++) {
		cin.getline(buffer, 1024);
		Polynomial temp = Evaluator(buffer).count();
		//temp.print();cout<< endl;
		if (poly.equals(temp)) cout << char('A' + i);
	}
	cout << endl;
	return 0;
}
