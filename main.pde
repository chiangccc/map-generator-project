void setup() {
  size(600, 600);

  // 初始化圖片
  initImages();

  // 初始化地圖
  initMap();

  // 開始演化
  evolveMaps(10); // 進行 10 代演化
}

void draw() {
  background(255);
  drawMap(); // 繪製當前地圖
  noLoop(); // 停止繪圖，專注於生成與保存
}
