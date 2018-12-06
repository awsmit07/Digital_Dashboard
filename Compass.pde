class Compass
{
    private float preLat;
    private float preLong;
    private String text = "";
    private int X;
    private int Y;
    Compass(float preLat, float preLong, int X, int Y)
    {
        this.preLat=preLat;
        this.preLong=preLong;
        this.X=X;
        this.Y=Y;
    }
    
    public void update(float curLat, float curLong)
    {
        float dLat=curLat-preLat;
        float dLong=curLong-preLong;
        float angle=degrees(atan2(dLat,dLong));
        //println(angle);
        if(angle<0) angle+=360;
        //println(angle);
        if(angle>22.5 && angle<157.5) text+='N';
        else if(angle>202.5 && angle<337.5) text+='S';
        
        if((angle>=0&&angle<67.5)||(angle<=360&&angle>292.5)) text+='E';
        else if(angle>112.5 && angle<247.5) text+='W';
        stroke(0,0,255);
        strokeWeight(2);
        fill(0);
        ellipse(X,Y, 50, 50);
        textAlign(CENTER, CENTER);
        fill(255);
        text(text, X,Y);
        preLat=curLat;
        preLong=curLong;
        text="";
    }
}
