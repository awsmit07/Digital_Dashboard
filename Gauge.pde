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

<<<<<<< HEAD
    //Gets input and stores it as current Value if it is within range
=======
    //Gets input and stores it as current Value
>>>>>>> 0e442ae2894a94c2d58747c09430eba1f1d2b791
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
        text(currentValue+units, x, y);
        text(text, x,y+65);
    }

}
