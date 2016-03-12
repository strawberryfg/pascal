#include <iostream>
#include <cassert>
#include <algorithm>
#include <cstring>

using namespace std;

const int NN = 50000;

int nn;

int near[NN][2];

int circle[NN];

int counter[NN];

int getMax() {
	memset(counter, 0, sizeof(counter));
	int i;
	for (i = 0; i < nn; i++) {
		counter[(circle[i] - i + nn) % nn]++;
	}
	int ans = -1;
	for (i = 0; i < nn; i++) {
		if (counter[i] > ans) ans = counter[i];
	}
	return ans;
}

int main() {
	freopen("fire.in", "r", stdin);
	freopen("fire.out", "w", stdout);
	cin >> nn;
	assert(3 <= nn && nn <= NN);
	int i;
	for (i = 0; i < nn; i++) {
		int a, b;
		cin >> a >> b;
		a--; b--;
		assert(i != a);
		assert(i != b);
		assert(a != b);
		assert(0 <= a && a < nn);
		assert(0 <= b && b < nn);
		near[i][0] = a;
		near[i][1] = b;
	}
	{char c;assert(!(cin >> c));}
	circle[0] = 0;
	int next = near[0][1];
	for (i = 1; i < nn; i++) {
		if (near[next][0] != circle[i - 1]) {
			swap(near[next][0] , near[next][1]);
		}
		if (near[next][0] != circle[i - 1]) {
			cout << -1 << endl;
			return 0;
		}
		circle[i] = next;
		next = near[next][1];
	}
	if (next != 0 || near[0][0] != circle[nn - 1]) {
		cout << -1 << endl;
		return 0;
	}

	int a = getMax();
	reverse(circle, circle + nn);
	int b = getMax();

	cout << nn - max(a, b) << endl;
	fclose(stdin);
	fclose(stdout);
	return 0;
}
