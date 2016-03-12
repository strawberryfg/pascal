/*
 *	Problem		:	单词默写 (engzam), 天宇2008新年模拟赛
 *	Author		:	郭华阳
 *	Date		:	2008-2-7
 *	Modify		:
 *	Algorithm	:
 */

#include <iostream>
#include <map>
#include <vector>

using	namespace std;

const	int	wordLimit = 100000 + 100;
const	int	wordLength = 11;
const	int	nodeLimit = wordLimit * 10;

char		word[wordLimit][wordLength], prefix[wordLimit][wordLength];
int		lowerBound[wordLimit], idx[wordLimit], value[wordLimit];
map<char, int>	son[nodeLimit];
vector<int>	valueList[nodeLimit];

int		nodeCnt, N, M;

bool	compareValue(int i, int j)
{
	return	value[i] > value[j];
}

void	insert(int root, int wordIdx, int pos)
{
	valueList[root].push_back(value[wordIdx]);

	char	next = word[wordIdx][pos];

	if (next == '\0')
		return ;

	if (!son[root].count(next)) 
		son[root][next] = nodeCnt++;

	insert(son[root][next], wordIdx, pos + 1);
}

int	compute(int root, char *prefix, int lowerBound)
{
	char	next = *prefix;
	if (next == '\0')
	{
		if (valueList[root][0] < lowerBound)
			return 0;

		int	lower = 0;
		int	upper = valueList[root].size() - 1;

		while (lower < upper)
		{
			int	mid = (lower + upper + 1) / 2;
			if (valueList[root][mid] >= lowerBound)
				lower = mid;
			else
				upper = mid - 1;
		}
		return lower + 1;
	}	
	else {
		return !(son[root].count(next)) ? 0 : compute(son[root][next], ++prefix, lowerBound);
	}
}

int main()
{
	scanf("%d%d", &N, &M);

	for (int i = 0; i < N; ++i) 
		scanf("%s%d", word[i], &value[i]), idx[i] = i;

	for (int i = 0; i < M; ++i)
		scanf("%s%d", prefix[i], &lowerBound[i]);

	sort(idx, idx + N, compareValue);

	nodeCnt = 1; 

	for (int i = 0; i < N; ++i)
		insert(0, idx[i], 0);

	for (int i = 0; i < M; ++i) 
		printf("%d\n", compute(0, prefix[i], lowerBound[i]));
	
	return 0;
}
