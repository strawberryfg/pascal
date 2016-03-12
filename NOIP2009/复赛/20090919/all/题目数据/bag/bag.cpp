/*
 *	Problem		:	背包问题 (bag), 天宇2008新年模拟赛
 *	Author		:	郭华阳
 *	Date		:	2008-2-7
 *	Modify		:
 *	Algorithm	:	递推式为 F(N) = F(N - 1) + 5 * F(N - 2) + F(N - 3) - F(N - 4)
 *				利用矩阵优化时间复杂度，构造矩阵如下：
 *				|  0  0  0 -1  |
 *				|  1  0  0  1  |
 *				|  0  1  0  5  |
 *				|  0  0  1  1  |
 */

#include <iostream>

using	namespace std;

const	int	mSize	= 4;
const	int	modes	= 997;
const	int	memSize	= 16 * sizeof(int);

typedef	int	(matrix[mSize])[mSize];

int		N;
matrix		unit, factor;

void	print(matrix A)
{
	for (int i = 0; i < mSize; ++i)
	{
		for (int j = 0; j < mSize; ++j)
			cout << A[i][j] << ' ';
		cout << endl;
	}
}

void	mult(matrix A, matrix B, matrix C)
{
	memset(A, 0, memSize);
	for (int i = 0; i < mSize; ++i)
		for (int j = 0; j < mSize; ++j)
		{
			for (int k = 0; k < mSize; ++k)
				A[i][j] += B[i][k] * C[k][j];
			A[i][j] %= modes;
		}
}

void	compute(matrix A, int N)
{
	memcpy(A, unit, memSize);
	if (!N) return ;
	
	matrix	B;
	compute(B, N / 2);
	mult(A, B, B);
	if (N & 1)
	{
		mult(B, A, factor);
		memcpy(A, B, memSize);
	}
}

int main()
{
	scanf("%d", &N);

	memset(unit, 0, memSize);
	unit[0][0] = unit[1][1] = unit[2][2] = unit[3][3] = unit[4][4] = 1;

	memset(factor, 0, memSize);
	factor[1][0] = 1;
	factor[2][1] = 1;
	factor[3][2] = 1;
	
	factor[0][3] = modes - 1;
	factor[1][3] = 1;
	factor[2][3] = 5;
	factor[3][3] = 1;

	matrix	A;
	compute(A, N);

	int	answer = A[0][0] + A[1][0] + 5 * A[2][0] + 11 * A[3][0];
	printf("%d\n", answer % modes);
	return 0;
}
