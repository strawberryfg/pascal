//package noip2005.equal;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigInteger;

public class Main {

	public static void main(String[] args) throws Exception{
        BufferedReader stdin =
            new BufferedReader(
                new InputStreamReader(System.in));
        Polynomial poly = new Evaluator(stdin.readLine()).count();
        int n = Integer.parseInt(stdin.readLine());
        for (int i = 0; i < n; i++) {
        	if (poly.equals(new Evaluator(stdin.readLine()).count())){
        		System.out.print((char)('A' + i));
        	}
        }
        System.out.println();
	}
}

interface Invariant {
	int POLY_LEN = 200;
	int EVA_LEN = 1000;
}

class Polynomial {
	private BigInteger[] v = new BigInteger[Invariant.POLY_LEN];
	private int length = 0;

	private void initial() {
		for (int i = 0; i < Invariant.POLY_LEN; i++) {
			v[i] = BigInteger.ZERO;
		}
	}

	private void clear() {
		while(length >= 0 && v[length].equals(BigInteger.ZERO))
			length--;
	}

	Polynomial() {
		initial();
		length = -1;
	}
	Polynomial(int a) {
		initial();
		if (a == 0) {
			length = 1;
			v[1] = BigInteger.ONE;
		}
		else if (a > 0) {
			length = 0;
			v[0] = BigInteger.valueOf(a);
		}
		else assert false;
	}

	Polynomial add(Polynomial other) {
		Polynomial ans = new Polynomial();
		ans.length = Math.max(length, other.length);
		for (int i = 0; i <= ans.length; i++) {
			ans.v[i] = v[i].add(other.v[i]);
 		}
		ans.clear();
		return ans;
	}

	Polynomial subtract(Polynomial other) {
		Polynomial ans = new Polynomial();
		ans.length = Math.max(length, other.length);
		for (int i = 0; i <= ans.length; i++) {
			ans.v[i] = v[i].subtract(other.v[i]);
 		}
		ans.clear();
		return ans;
	}

	Polynomial multiply(Polynomial other) {
		Polynomial ans = new Polynomial();
		if (length == -1 || other.length == -1) return ans;
		ans.length = length + other.length;
		for (int i = 0; i <= length; i++) {
			for (int j = 0; j <= other.length; j++)
				ans.v[i + j] = ans.v[i + j].add(v[i].multiply(other.v[j]));
 		}
		//ans.clear();
		return ans;
	}

	Polynomial pow(int a) {
		if (length == -1) return new Polynomial();
		return pow_1(a);
	}

	private Polynomial pow_1(int a) {
		if (a == 0) return new Polynomial(1);
		if (a == 1) return this;
		Polynomial ans = pow_1(a / 2);
		ans = ans.multiply(ans);
		if (a % 2 == 1) ans = ans.multiply(this);
		return ans;
	}

	boolean equals(Polynomial other) {
		if (length != other.length) return false;
		for (int i = 0; i <= length; i++) {
			if (v[i].equals(other.v[i]) == false) return false;
		}
		return true;
	}

	int intValue() {
		assert length == 0;
		return v[0].intValue();
	}
}

class Evaluator {
	private String str = null;
	Polynomial []num = new Polynomial[Invariant.EVA_LEN];
	int lnum = 0;
	char []sign = new char[Invariant.EVA_LEN];
	int lsign = 0;

	static boolean [][]pos = new boolean[256][256];
	static{
		pos['^']['^']=pos['^']['*']=pos['^']['+']=pos['^']['-']
		          =pos['*']['*']=pos['*']['+']=pos['*']['-']=pos['+']['+']
		          =pos['+']['-']=pos['-']['+']=pos['-']['-']=true;
	}

	Evaluator(String s) {
		str = s;
	}
	Polynomial count(){
		lnum=lsign=0;
		int i;
		int t;
		for(i=0; i < str.length(); i++){
			if (str.charAt(i) == ' ') continue;
			if (Character.isDigit(str.charAt(i))){
				t=0;
				while(i < str.length() && Character.isDigit(str.charAt(i))){
					t=10*t+str.charAt(i)-'0';
					i++;
				}
				num[lnum++]= new Polynomial(t);
				i--;
			}
			else if(str.charAt(i) == 'a') {
				num[lnum++]= new Polynomial(0);
			}
			else if(str.charAt(i)=='(') {
				sign[lsign++]='(';
			}
			else if(str.charAt(i)=='+'||str.charAt(i)=='-'||str.charAt(i)=='^'||str.charAt(i)=='*'){
				while(lsign>0&&sign[lsign-1]!='('
					&&pos[sign[lsign-1]][str.charAt(i)]){
						if(sign[lsign-1]=='+')
							num[lnum-2] = num[lnum-2].add(num[lnum-1]);
						else if(sign[lsign-1]=='-')
							num[lnum-2] = num[lnum-2].subtract(num[lnum-1]);
						else if(sign[lsign-1]=='*')
							num[lnum-2] = num[lnum-2].multiply(num[lnum-1]);
						else if(sign[lsign-1]=='^')
							num[lnum-2] = num[lnum-2].pow(num[lnum-1].intValue());
						lnum--;
						lsign--;
				}
				sign[lsign++]=str.charAt(i);
			}
			else if(str.charAt(i)==')'){
				count_1();
			}
			else assert false;
		}
		count_1();
		return num[0];
	}

	private void count_1(){
		while(lsign>0&&sign[lsign-1]!='('){
			if(sign[lsign-1]=='+')
				num[lnum-2] = num[lnum-2].add(num[lnum-1]);
			else if(sign[lsign-1]=='-')
				num[lnum-2] = num[lnum-2].subtract(num[lnum-1]);
			else if(sign[lsign-1]=='*')
				num[lnum-2] = num[lnum-2].multiply(num[lnum-1]);
			else if(sign[lsign-1]=='^')
				num[lnum-2] = num[lnum-2].pow(num[lnum-1].intValue());
			lnum--;
			lsign--;
		}
		if(lsign>0&&sign[lsign-1]=='(')lsign--;
	}
}