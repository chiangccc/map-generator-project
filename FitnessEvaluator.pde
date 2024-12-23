int calculateFitness(String[] map) {
  int fitness = 0;
  int reachableCommodities = countReachableCommodities(map);
  fitness += reachableCommodities * 10;

  int trapCount = countTraps(map);
  fitness += trapCount * 5;

  return fitness;
}

int countReachableCommodities(String[] map) {
  // 計算玩家可到達的商品數量
  int count = 0;
  // 使用 BFS 或其他演算法計算
  return count;
}

int countTraps(String[] map) {
  // 計算所有商品的路徑中包含的陷阱數量
  int count = 0;
  return count;
}
