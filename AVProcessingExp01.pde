import ddf.minim.*;

int windowWidth = 1000;
int windowHeight = 600;

float waveformHeight = 400;

Minim minim;
AudioInput in; 

void setup()
{
  size(windowWidth, windowHeight, P3D);

  minim = new Minim(this);

  in = minim.getLineIn();
}

void draw()
{
  background(0);
  stroke(255);
  
  int bufferSize = in.bufferSize();
  
  for(int i = 0; i < bufferSize - 1; i++)
  {
    int x1 = i * windowWidth / bufferSize;
    int x2 = (i + 1) * windowWidth / bufferSize;
    line( x1, (windowHeight - in.left.get(i)*waveformHeight) / 2, x2, (windowHeight - in.left.get(i+1)*waveformHeight) / 2);
  }  
}

