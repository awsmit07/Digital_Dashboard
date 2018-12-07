public class Box 
{
    private int X, Y, width, height;
    public Box (int X, int Y, int width, int height) 
    {
        this.X=X;
        this.Y=Y;
        this.width=width;
        this.height=height;
    }
    public void update(String text)
    {
        strokeWeight(2);
        rectMode(CENTER);
        stroke(0,0,255);
        fill(0);
        rect(X, Y, width, height);
        rectMode(CORNER);
        textAlign(CENTER,CENTER);
        textSize(20);
        fill(255);
        text(text, X, Y);
    }
}