import org.gicentre.utils.stat.*;

public class Graph extends BarChart {
    int X;
    int Y;
    float min;
    float max;
    float [] data={};
    int maxData;
    String title;
    public Graph (int X, int Y, float min, float max, PApplet app, int maxData, String title) 
    {
        super(app);
        this.X=X;
        this.Y=Y;
        this.min=min;
        this.max=max;
        this.title=title;
        this.setMinValue(min);
        this.setMaxValue(max);
        this.maxData=maxData;
        setBarGap(4);
        setBarColour(color(0,0, 255));
        showValueAxis(true);
        setValueFormat("#");
        showCategoryAxis(true);
    }
    public void updateData(float newData)
    {
        //data=append(this.data, currentIndex);
        data=append(this.data, newData);
        if(data.length>maxData)
        {
            data=subset(data, 1);
            float tempMax=0;
            for(float i: data)
            {
                if(i>tempMax) tempMax=i;
            }
            if(tempMax<max)
            {
                max=5*(((int)tempMax)/5+1);
                setMaxValue(max);

            }
        }
        if(newData>max)
        {
            max=5*(((int)newData)/5+1);
            setMaxValue(max);
        }
        setData(this.data);
    }
    public void drawChart()
    {
        draw(X, Y, 500, 250);
        //println(this.data);
        textAlign(CENTER);
        text(title, X+250, Y);
    }

}
