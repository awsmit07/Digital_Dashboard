public class GPS
{
    private int [] imageDimentions={854, 863};
    private int [] imagePos=new int [2];
    private float [] imageLoc={51.129648, -114.169247, 51.036706, -114.022762};
    private float [] xArray=new float [0];
    private float [] yArray=new float [0];
    private float gpsDistance=0;
    private float gpsSpeed;
    private float xScale;
    private float yScale;
    private float preLat;
    private float preLong;
    private PImage map;
    private float earthRadiusKm = 6371;
    public GPS () 
    {
        xScale=(imageLoc[3]-imageLoc[1]);
        yScale=(imageLoc[2]-imageLoc[0]);
        int [] tempPos={width/2-imageDimentions[0]/2, height/2-imageDimentions[1]/2};
        imagePos=tempPos;
        map=loadImage("map0.png");
    }
    
    public void updateGPSData(float lat, float Long)
    {
        float xCord, yCord;
        xCord=(Long-imageLoc[1])/xScale*imageDimentions[0];
        yCord=(lat-imageLoc[0])/yScale*imageDimentions[1];

        xArray=append(xArray, xCord);
        yArray=append(yArray, yCord);
        gpsSpeed=calcSpeed(lat, Long);
        gpsDistance+=gpsSpeed;
    }

    public void drawGPS()
    {
        image(map, imagePos[0], imagePos[1] );
        for(int i=0; i<xArray.length; i++)
        {
            fill(0,0,255);
            stroke(0,0,255);
            if(i==0) ellipse(xArray[i]+imagePos[0], yArray[i]+imagePos[1],5,5);
            else 
            {
                line(xArray[i-1]+imagePos[0], yArray[i-1]+imagePos[1], xArray[i]+imagePos[0], yArray[i]+imagePos[1]);    
            }
        }
        fill(0);
        fill(0,0,255);
        textAlign(LEFT);
        textSize(20);
        text("Distance: "+nf(gpsDistance,0,2)+" km", imagePos[0], height-30);
        textAlign(RIGHT);
        text("Speed: "+nf(gpsSpeed*3600,0,2)+" km/h", imagePos[0]+imageDimentions[0], height-30);
    }

    private float calcSpeed(float lat, float Long)
    {
        if(currentIndex==0) 
        {
            preLat=lat;
            preLong=Long;
            return 0;
        }
        else
        {
            float dLat=radians(lat-preLat);
            float dLong=radians(lat-preLat);
            preLat=lat;
            preLong=Long;
            lat=radians(lat);
            Long=radians(Long);
            float a = sin(dLat/2) * sin(dLat/2) +sin(dLong/2) * sin(dLong/2) * cos(lat) * cos(radians(preLat));
            float c = 2 * atan2(sqrt(a), sqrt(1-a));
            return earthRadiusKm * c;
        }

    }

}
