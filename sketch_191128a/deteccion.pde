class deteccion{
  deteccion(){
  }
  
  void imagen(){
    scale(2);
    open.loadImage(video);
    image(video, 0, 0 );
  }
  
  void detec(){
    fill(0);
    noStroke();
    Rectangle[] faces = open.detect();
    println(faces.length);
    for (int i = 0; i < faces.length; i++) {
      println(faces[i].x + "," + faces[i].y);
      image(filtro,faces[i].x+faces[i].width/-1, faces[i].y+faces[i].height*- 1, 200, 100);
    }
  }
}
