class Gauge
{
    private float currentValue;
    private float min, max;
    private String units;
    private int x;
    private int y;
    private String text;
    private PFont font;
    Gauge (float min, float max, String units, int x, int y, String text) 
    {
        this.min=min;
        this.max=max;
        this.units=units;
        this.x=x;
        this.y=y;
        this.text=text;
        font=createFont("ConnectionSerif.otf", 12);
        //textFont(font);
    }

    //Gets input and stores it as current Value if it is within range
    void getInput(float input)
    {
        if(input>=min && input<=max)
        {
            currentValue=input;
            display();
        }
        else
        {
            println("input out of range");
        }
    }

    //Displays the Gauge on screen
    void display()
    {
        stroke(255);
        fill(0);
        ellipse(x, y, 100, 100);
        fill(255);
        textAlign(CENTER);
        textSize(16);
        text(nf(currentValue,0, 2)+units, x, y);
        text(text, x,y+65);
    }

}
