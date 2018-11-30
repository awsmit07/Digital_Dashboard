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
        if(dLat>0) text+='N';
        else text+='S';
        if(dLong>0) text+='E';
        else text+='W';
        stroke(255);
        fill(0);
        ellipse(X,Y, 50, 50);
        textAlign(CENTER);
        fill(255);
        text(text, X,Y);
        preLat=curLat;
        preLong=curLong;
        text="";
    }
}
