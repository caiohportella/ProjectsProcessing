class Cubie {
    PVector pos;
    float len;

    Cubie(float x, float y, float z, float _len) {
        pos = new PVector(x, y, z);
        len = _len;
    }

    void show() {
        fill(255);
        stroke(0);
        strokeWeight(8);
        pushMatrix();
        translate(pos.x, pos.y, pos.z);
        beginShape(QUADS);
        
        float r = len/2;
        
        // z-fixed
        fill(colours[BCK]);
        vertex(-r, -r, -r);
        vertex(r, -r, -r);
        vertex(r, r, -r);
        vertex(-r, r, -r);
    
        fill(colours[FRT]);
        vertex(-r, -r, r);
        vertex(r, -r, r);
        vertex(r, r, r);
        vertex(-r, r, r);
    
        // y-fixed
        fill(colours[DWN]);
        vertex(-r, -r, -r);
        vertex(r, -r, -r);
        vertex(r, -r, r);
        vertex(-r, -r, r);
    
        fill(colours[UPP]);
        vertex(-r, r, -r);
        vertex(r, r, -r);
        vertex(r, r, r);
        vertex(-r, r, r);
    
    
        // x-fixed
        fill(colours[LFT]);
        vertex(-r, -r, -r);
        vertex(-r, r, -r);
        vertex(-r, r, r);
        vertex(-r, -r, r);
    
        fill(colours[RGT]);
        vertex(r, -r, -r);
        vertex(r, r, -r);
        vertex(r, r, r);
        vertex(r, -r, r);
        
        endShape();
        popMatrix();
    }
}
