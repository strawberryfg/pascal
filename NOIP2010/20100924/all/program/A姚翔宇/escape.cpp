// Program : escape

#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cstring>

using namespace std;

struct node
{
    int v, weight;
    node * next;
} address[1000001], * ge[301];
int atop = 0, q[1000001], n, dist[301], limit[301];
bool vis[301];
const int INF = 1000000000;

void Insert(int a, int b, int w)
{
    node * p = &address[atop ++];
    p -> v = b;
    p -> weight = w;
    p -> next = ge[a];
    ge[a] = p;
}

int solve(int a, int b, int li)
{
    int head, tail, len, i, j;
    head = tail = 1;
    q[1] = a;
    for (i = 0; i < n; i ++) dist[i] = INF;
    memset(vis, 0, sizeof(vis));
    dist[a] = 0;
    vis[a] = true;
    while (head <= tail)
    {
        i = q[head];
        vis[i] = false;
        for (node * p = ge[i]; p; p = p -> next)
        {
            if (p -> weight + dist[i] < dist[p -> v] && (p -> v == b || limit[p -> v] <= li))
            {
                j = p -> v;
                dist[j] = dist[i] + p -> weight;
                if (! vis[j])
                {
                    q[++ tail] = j;
                    vis[j] = true;
                }
            }
        }
        head ++;
    }
    if (dist[b] == INF) return -1; else return dist[b];
}

int main()
{
    freopen("escape.in", "r", stdin);
    freopen("escape.out", "w", stdout);
    
    int m, i, a, b, w, c, t;
    scanf("%d %d", &n, &m);
    for (i = 0; i < n; i ++) scanf("%d", &limit[i]);
    for (i = 1; i <= m; i ++)
    {
        scanf("%d %d %d", &a, &b, &w);
        Insert(a, b, w);
        Insert(b, a, w);
    }
    scanf("%d", &t);
    for (i = 1; i <= t; i ++)
    {
        scanf("%d %d %d", &a, &b, &c);
        printf("%d\n", solve(a, b, c));
    }
    return 0;    
}
