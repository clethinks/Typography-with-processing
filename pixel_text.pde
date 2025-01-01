import videoExport.*;
import kotlin.collections.jdk8.*;
import kotlin.internal.jdk8.*;
import kotlin.random.jdk8.*;
import kotlin.streams.jdk8.*;
import kotlin.text.jdk8.*;
import kotlin.time.jdk8.*;
import kotlin.internal.jdk7.*;
import kotlin.io.path.*;
import kotlin.jdk7.*;
import kotlin.collections.*;
import kotlin.jvm.internal.*;
import kotlin.*;
import kotlin.annotation.*;
import kotlin.collections.builders.*;
import kotlin.collections.unsigned.*;
import kotlin.comparisons.*;
import kotlin.concurrent.*;
import kotlin.contracts.*;
import kotlin.coroutines.*;
import kotlin.coroutines.cancellation.*;
import kotlin.coroutines.intrinsics.*;
import kotlin.coroutines.jvm.internal.*;
import kotlin.experimental.*;
import kotlin.internal.*;
import kotlin.io.*;
import kotlin.js.*;
import kotlin.jvm.*;
import kotlin.jvm.functions.*;
import kotlin.jvm.internal.markers.*;
import kotlin.jvm.internal.unsafe.*;
import kotlin.math.*;
import kotlin.properties.*;
import kotlin.random.*;
import kotlin.ranges.*;
import kotlin.reflect.*;
import kotlin.sequences.*;
import kotlin.system.*;
import kotlin.text.*;
import kotlin.time.*;
import org.intellij.lang.annotations.*;
import org.jetbrains.annotations.*;

PImage img;

color c = #00AB32;
void setup(){
  size(900,900);
  img= loadImage("max.jpg");
  img.resize(900,900);
}

void draw(){
  background(#000000);
  
  float tilesX = 80;
  float tilesY= 80;
  
  float tileW= width/tilesX*frameCount/100;
  float tileH= width/tilesY*frameCount/100;
  
  for (int x=0; x<tilesX; x++){
    for (int y=0; y<tilesY; y++) {
  int px= int (x*tileW);
  int py=int (y*tileH);
  
      color c= img.get(px,py);
      
      fill(c);
      
     rect(x*tileW,y*tileH,tilesX,tilesY);
     
}
if (frameCount == 440) {
    exit();

  }
  }
  rec();
}
final String sketchname = getClass().getName();

VideoExport videoExport;

void rec() {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "../"+sketchname+".mp4");
    videoExport.setFrameRate(10);  
    videoExport.startMovie();
    
  }
  videoExport.saveFrame();
}
