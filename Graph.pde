import org.gicentre.utils.stat.*;
public class Graph extends BarChart {
    int X;
    int Y;
    float min;
    float max;
    float [] data={};
    public Graph (int X, int Y, float min, float max, PApplet app) 
    {
        super(app);
        this.X=X;
        this.Y=Y;
        this.min=min;
        this.max=max;
        this.setMinValue(min);
        this.setMaxValue(max);
        setBarGap(4);
        setBarColour(color(250, 100, 20));
        showValueAxis(true);
        setValueFormat("#");
        showCategoryAxis(true);
    }
    public void updateData(float newData)
    {
        //data=append(this.data, currentIndex);
        data=append(this.data, newData);
        setData(this.data);
    }
    public void updateData(int newData)
    {
        //data=append(this.data, currentIndex);
        data=append(this.data, (float)newData);  
        setData(this.data);
    }
    public void drawChart()
    {
        draw(X, Y, 500, 250);
        //println(this.data);
    }

}
