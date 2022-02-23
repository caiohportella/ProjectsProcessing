class Branch {
  public PVector start;
  public PVector end;
  
  public boolean finished = false;

  Branch(PVector start, PVector end) {
    this.start = start;
    this.end = end;
  }
  
  void show() {
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }
  
  Branch calculateBranch(boolean _rightBranch)
  {
    PVector dir = PVector.sub(end, start);
    dir.rotate(_rightBranch ? PI/6 : -PI/6);
    dir.mult(0.67);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd);
    
    return b;
  }
}
