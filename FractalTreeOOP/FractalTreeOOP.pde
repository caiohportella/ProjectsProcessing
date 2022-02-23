ArrayList<Branch> tree = new ArrayList<Branch>();
ArrayList<PVector> leaves = new ArrayList<PVector>();

Branch root;

int count = 0;

void setup() {
  size(400, 400);
  
  PVector a =  new PVector(width/2, height);
  PVector b = new PVector(width/2, height - 100);
  root = new Branch(a, b);
  tree.add(root);
  tree.add(root.calculateBranch(true));
  tree.add(root.calculateBranch(false));
}

void mousePressed() {
  for(int i = tree.size() - 1; i >= 0; i--) {
    Branch current = tree.get(i);
    
    if(!current.finished) {
      tree.add(current.calculateBranch(true));
      tree.add(current.calculateBranch(false));
    }
    current.finished = true;
  }
  count++;
  
  if(count == 6) {
    for(int i = 0; i < tree.size(); i++) {
      Branch current = tree.get(i);
      if(!current.finished){
        PVector leaf = current.end.copy();
        leaves.add(leaf);
      }
      current.finished = true;
    }
  }
}

void draw() {
  background(51);
  
  for(int i = 0; i < tree.size(); i++) {
    tree.get(i).show();
  }
  
  for(int i = 0; i < leaves.size(); i++) {
    fill(0, 255, 0, 100);
    noStroke();
    PVector leave = leaves.get(i);
    ellipse(leave.x, leave.y, 8, 8);
  }
}
