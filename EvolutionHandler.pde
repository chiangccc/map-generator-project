import java.util.List;
import java.util.ArrayList;


void evolveMaps(int generations) {
  List<String[]> population = new ArrayList<>();
  population.add(map.clone()); // 初始化父代

  for (int gen = 0; gen < generations; gen++) {
    List<String[]> newPopulation = new ArrayList<>();

    // 產生子代
    for (String[] parent : population) {
      newPopulation.add(mutateMap(parent));
      newPopulation.add(mutateMap(parent));
    }

    // 合併父代與子代
    newPopulation.addAll(population);

    // 計算適應度並排序
    newPopulation.sort((map1, map2) -> calculateFitness(map2) - calculateFitness(map1));

    // 確保列表大小不超過 10
    int limit = Math.min(10, newPopulation.size());
    population = new ArrayList<>(newPopulation.subList(0, limit));

    // 保存結果
    saveGeneration(population, gen);
  }
}


String[] mutateMap(String[] baseMap) {
  String[] mutatedMap = baseMap.clone();
  for (int i = 1; i < rows - 1; i++) {
    StringBuilder row = new StringBuilder(mutatedMap[i]);
    for (int j = 1; j < cols - 1; j++) {
      if (random(1) < 0.1) row.setCharAt(j, getRandomTile());
    }
    mutatedMap[i] = row.toString();
  }
  return mutatedMap;
}

void saveGeneration(List<String[]> population, int generation) {
  for (int i = 0; i < population.size(); i++) {
    map = population.get(i);
    saveMapToFile("output/gen_" + generation + "_map_" + i + ".txt");
  }
}
void saveAllToZip() {
  String[] files = new String[maxImages * 2];
  for (int i = 0; i < maxImages; i++) {
    files[i * 2] = "output/result-" + nf(i, 4) + ".png";
    files[i * 2 + 1] = "output/map_" + nf(i, 4) + ".txt";
  }
  zip("output/maps_and_images.zip", files); // 壓縮所有文件
}
