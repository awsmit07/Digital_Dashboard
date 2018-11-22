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