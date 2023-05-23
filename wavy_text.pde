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


PFont font;

String[] data = {
  "Nairobi",
  "Dodoma",
  "Bangui",
  "Bujumbura",
  "Addis-Ababa",
  "N'Djamena",
  "Pretoria",
  "Windhoek",
  "Kinshasa"  
  
}
;


void setup() {
   
  size(1080, 1080);
  font = createFont("Helvetica.ttf", 1000);
  frameRate(10);
  randomSeed(10);
}

void draw() {
  background(#000000);
  textAlign(CENTER,TOP);
  fill(#FFFFFF);

  float stepY = random(width*2) / data.length;
  float fontSize = stepY * 1.4;


  textFont(font);
  textSize(fontSize);

  translate(0, 10);

  for (int i = 0; i < data.length; i++) {

    float wave = map(sin(radians(frameCount*300 + i * 20)), -1, 1, -100, 100);

    pushMatrix();
    translate(width/2 + wave, i * stepY);
    text(data[i].toUpperCase(), 0, 0);
    popMatrix();
    
     
  }
  if (frameCount == 100) {
    exit();

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
