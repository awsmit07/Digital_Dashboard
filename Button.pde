class Button
{
	Boolean hovered=false;
	Boolean clickable=false;
	public Boolean autoPress=false;
	int xPos;
	int yPos;
	int width;
	int height;
	String _text;
	int color0;
	int color1;
	int color2;
	Button(int xPos, int yPos, int width, int height, String text, int color0, int color1, int color2)
  	{
		this.xPos=xPos;
		this.yPos=yPos;
		this.width=width;
		this.height=height;
		this._text=text;
		this.color0=color0;
		this.color1=color1;
		this.color2=color2;
		//println("im in button 1");
  	}
  	void button_update()
  	{
    textAlign(CENTER);
    stroke(0);
		if((mouseX>xPos && mouseX<xPos+width && mouseY>yPos && mouseY<yPos+height) || autoPress)
		{
			fill(color1);
			rect(xPos, yPos, width, height);
			hovered=true;
      
			if(mousePressed || autoPress)
			{
				fill(color2);
				rect(xPos, yPos, width, height);
				button_function();
				
				
			}
		}
		else if(!(mouseX>xPos && mouseX<xPos+width && mouseY>yPos && mouseY<yPos+height))
		{
			hovered=false;
		}
		if(!hovered)
		{
			fill(color0); 
			rect(xPos, yPos, width, height);
		}
		
		fill(0);
		textSize(12);
		text(_text, xPos+0.5*width, yPos+0.5*height);
		
  	}
  	void button_function(){ println("error");}
}

class TruckButton extends Button
{
	TruckButton(int xPos, int yPos, int width, int height, String text, int color0, int color1, int color2)
	{
		super(xPos, yPos, width, height, text, color0, color1, color2);
	}
	void button_function()
	{
		file="car_status_Truck_F150.csv";
		inputMode=false;
    radius=0.254;
    
    tankCapacity = 80;
	}
}

class CarButton extends Button
{
	CarButton(int xPos, int yPos, int width, int height, String text, int color0, int color1, int color2)
	{
		super(xPos, yPos, width, height, text, color0, color1, color2);
	}
	void button_function()
	{
		file="car_status_BMW_323i.csv";
    radius=0.23;
		inputMode=false;
    dataStream=new SensorDataProvider(file);
    tankCapacity = 60;
	}
}

class ExitButton extends Button
{
	ExitButton(int xPos, int yPos, int width, int height, String text, int color0, int color1, int color2)
	{
		super(xPos, yPos, width, height, text, color0, color1, color2);
	}
	void button_function()
	{
		exit();
	}
}

class GPSModeButton extends Button
{
	GPSModeButton(int xPos, int yPos, int width, int height, String text, int color0, int color1, int color2)
	{
		super(xPos, yPos, width, height, text, color0, color1, color2);
	}
	void button_function()
	{
		gpsMode=!gpsMode;
    gps.drawGPS();
	}
}

class MenuButton extends Button
{
	MenuButton(int xPos, int yPos, int width, int height, String text, int color0, int color1, int color2)
	{
		super(xPos, yPos, width, height, text, color0, color1, color2);
	}
	void button_function()
	{
		currentIndex=600;
	}
}
