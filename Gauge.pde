class Gauge
{
    private float currentValue;
    private float min, max;
    private String units;
    private int x;
    private int y;
    private String text;

    Gauge (float min, float max, String units, int x, int y, String text) 
    {
        this.min=min;
        this.max=max;
        this.units=units;
        this.x=x;
        this.y=y;
        this.text=text;
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
        stroke(0,0,400);
        strokeWeight(10);
        fill(0);
        ellipse(x, y, 250, 250);
        strokeWeight(2);
        rect(390, 400, 300, 35);
        fill(255);
        textAlign(CENTER);
        textSize(30);
        text(nf(currentValue,0, 2)+units, x, y+15);
        textSize(20);
        text(text, x,y+160);
       
    }

}
