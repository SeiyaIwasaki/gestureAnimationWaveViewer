/******************************************
    AnimationGraphViewer
    
    2015 Seiya Iwasaki
******************************************/

final int timeLength = 150;
final int disW = timeLength * 2 + 100, disH = disW * 2;

int playerX = width / 2, playerY = height / 4;
int[] Xgraph = new int[timeLength];
int[] Ygraph = new int[timeLength];

void setup(){
    size(disW, disH);
    noCursor();
    ellipseMode(CENTER);
    colorMode(256, 256, 256, 256);
    noStroke();
    strokeWeight(2);
    smooth();
    frameRate(60);
    
    for(int i = 0; i < timeLength; i++){
        Xgraph[i] = 0;
        Ygraph[i] = 0;   
    }
   
    mouseX = width / 2;
    mouseY = height / 4;
}

void draw(){
    background(#FFFFFF);
    fill(#222222);
    rect(0, height / 2, width, height);
    
    updatePlayer();
    fill(#ff6666);
    ellipse(playerX, playerY, 10, 10);
    graphDraw();
    updateGraphData();
}

void graphDraw(){
    // draw Graph axis
    fill(#FFFFFF);
    int marginX = (width - timeLength * 2) / 3;
    int marginY = (height / 2 - 300) / 2;
    line(marginX, height / 2 + marginY, marginX, height - marginY);
    line(width / 2 + marginX / 2, height / 2 + marginY, width / 2 + marginX / 2, height - marginY);
    
    // prot Graph points
    float x, y, size = 3;
    for(int i = 0; i < timeLength; i++){
        x = i;
        // X points
        fill(#6666dd);
        y = map(Xgraph[i], -(height / 4), height / 4, -150, 150);
        ellipse(marginX + x, height / 4 * 3 + y, size, size);
        // Y points
        fill(#66dd66);
        y = map(Ygraph[i], -(height / 4), height / 4, -150, 150);
        ellipse(width / 2 + marginX / 2 + x, height / 4 * 3 + y, size, size);
    }
}

void updatePlayer(){
    if(0 < mouseX && mouseX < width){
        playerX = mouseX;
    }
    if(0 < mouseY && mouseY < height / 2){
        playerY = mouseY;
    }   
}

void updateGraphData(){
    for(int i = 0; i < timeLength - 1; i++){
        Xgraph[i] = Xgraph[i + 1];
        Ygraph[i] = Ygraph[i + 1];
    }
    Xgraph[timeLength - 1] = playerX - width / 2;
    Ygraph[timeLength - 1] = playerY - height / 4;
}
