// 用最小生成树近似求解TSP（2近似比）
// 采用Prim算法求最小生成树，时间复杂度为O(n^2)，其中n为点数
// 输入：n个点，m条边；接下来m行每行3个数字，分别代表无向边的起点，终点，长度
#include <iostream>
#include <string.h>
#define N 1005
#define M 100005
#define INF 1000000007
using namespace std;

struct Edge
{
  int pre, end, weight;
} edge[M];

struct Tree
{
  int father, num; // num是直接连接点i的子结点的个数（不包括点i本身）
  int son[N];      // son储存点i直接连接的子节点的序号
} tree[N];

bool visited[N];             // 记录被选到的点
int n, m, cnt = 0, sum = 0;  // cnt统计已加入的边数，sum计算最小生成树的边权和
int atlas[N][N], lowCost[N]; // atlas[i][j]表示点i到点j的边权；lowCost[i]表示到某点i的最小花销，也就是与点i相连的边中的最小边
int tot = 0;                 // DFS时寻找TSP回路序列的计数器
int q[N];                    // 储存TSP回路的序列

void Prim()
{
  memset(visited, 0, sizeof(visited));
  visited[1] = 1; // 先将点1加入树
  for (int i = 1; i <= n; ++i)
    lowCost[i] = atlas[1][i];
  int k, minWeight, treeNode; // 与点k相连的最小边边长是minWeight,treeNode表示与新加入点以最小边相连的树上的点
  for (int i = 1; i <= n; ++i)
  {
    minWeight = INF;
    for (int j = 1; j <= n; ++j)
    {
      if ((!visited[j]) && (minWeight > lowCost[j]))
      {
        k = j;
        minWeight = lowCost[j]; // 遍历未加入树的点j，若点j到树的距离是未加入树的点中到该树最小的边权，则将该点标记为点k，准备加入
      }
    }
    if (minWeight == INF)
      break;        // 数据正常的情况下，“minWeight==INF”表明最小生成树已构造完成
    visited[k] = 1; // 将点k加入树
    for (int j = 1; j <= n; ++j)
    {
      if ((visited[j]) && (atlas[j][k] == minWeight))
      {
        treeNode = j;
        break; // 找出与新加入的点k相连的树上的点
      }
    }
    ++cnt;
    edge[cnt].pre = treeNode;
    edge[cnt].end = k;
    edge[cnt].weight = minWeight;
    sum += minWeight;
    for (int j = 1; j <= n; ++j)
      if ((!visited[j]) && (lowCost[j] > atlas[j][k]))
        lowCost[j] = atlas[j][k]; // 更新未加入树的点j到树的最短距离
  }
}

void buildTree()
{
  for (int i = 1; i < n; ++i)
  {
    tree[edge[i].end].father = edge[i].pre;
    tree[edge[i].pre].num++;
    tree[edge[i].pre].son[tree[edge[i].pre].num] = edge[i].end;
  }
}

void DFS(int x)
{
  ++tot;
  q[tot] = x;
  for (int i = 1; i <= tree[x].num; ++i)
    DFS(tree[x].son[i]);
}

void TSP()
{
  memset(q, 0, sizeof(q));
  q[1] = 1;
  for (int i = 1; i <= n; ++i)
  {
    tree[i].father = i;
    tree[i].num = 0;
  }
  buildTree(); // 把已选的最小生成树边建成一棵树
  DFS(1);      // 对树进行深度优先遍历
}

int main()
{
  scanf("%d%d", &n, &m);
  for (int i = 0; i < N; ++i)
    for (int j = 0; j < N; ++j)
      atlas[i][j] = INF;
  for (int i = 1; i <= m; ++i)
  {
    int u, v, w;
    scanf("%d%d%d", &u, &v, &w);
    if (w < atlas[u][v])
      atlas[u][v] = atlas[v][u] = w;
  }
  Prim();
  printf("\nThe minimum spanning tree:\n");
  printf("%d\n", sum);
  for (int i = 1; i < n; ++i)
    printf("%d %d %d\n", edge[i].pre, edge[i].end, edge[i].weight);
  printf("\nTSP:\n");
  TSP();
  for (int i = 1; i <= n; ++i)
    printf("%d ", q[i]);
  printf("%d\n", q[1]);
}
/*
输入输出样例：

（输入）
6 10
1 2 6
1 3 1
1 4 5
2 3 5
2 5 3
3 4 5
3 5 6
3 6 4
4 6 2
5 6 6

（输出）
The minimum spanning tree:
15
1 3 1
3 6 4
6 4 2
3 2 5
2 5 3

TSP:
1 3 6 4 2 5 1
*/