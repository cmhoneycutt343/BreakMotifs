/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

boolean debug_verbose = false;
String[] ssybm_arrs = new String[5];
riffdata[] cur_riffs;

String utf_16parsed = "";
int riff_count=0;
boolean riff_busy=true;

void setup() {
  size(800,200);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);

  cur_riffs = new riffdata[5];
  
  for(int i =0;i<5;i++)
  {
      cur_riffs[i] = new riffdata();
  }
  
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
  
  String mystring = "READY";

  println(mystring);
  
  ssybm_arrs[0] = "";
  
 
}


void draw() {
  background(0);
  
  PFont myfont = createFont("unifont-14.0.01.ttf",50);
  
  textFont(myfont);
  stroke(255);
  fill(255);
  
  //FOR EACH CURRENT RIFF
  for(int i=0;i<(riff_count+1);i++)
  {
    
    //for each char in the riff
    for(int j=0;j<cur_riffs[i].s_count;j++)
    {
       //if it has amplitude data
       if(cur_riffs[i].has_a_data)
       {
          char a_char = cur_riffs[i].a_data.charAt(j);
          
          if(a_char!='_')
          {
            char[] a_chars = Character.toChars(a_char);
            String a_str = new String(a_chars);
            fill(unhex(a_str)*16);
          } else
          {
            fill(255); 
          }
       } 
       else
       {
          fill(255); 
       }
       
       char s_char = cur_riffs[i].s_data.charAt(j);
      
       if(s_char!='_')
       {
       text(cur_riffs[i].s_data.charAt(j),50+j*25,100+50*i);
       }
    }
    
  }
}

void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(123); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  

  
  if(debug_verbose)
  {
    print("### received an osc message.");
    print(" addrpattern: "+theOscMessage.addrPattern());
    println(" typetag: "+theOscMessage.typetag());
  }
  
  

  if (theOscMessage.addrPattern().equals("/r_index"))
  {
    
    int riff_index = theOscMessage.get(0).intValue();
    
    print("riff_index:");
    println(riff_index);
    riff_count = riff_index;
    

    
    for(int i=0;i<5;i++)
    {
      cur_riffs[riff_index].has_p_data = false;
      cur_riffs[riff_index].has_a_data = false;
    }
  }
  else if(theOscMessage.addrPattern().equals("/ssymb"))
  {
     String string_received = theOscMessage.get(0).stringValue();
    
    if(riff_busy==true)
    {
      riff_busy=false;
       
      //reset riff index
      riff_count=0; 
    }
    
    
    cur_riffs[riff_count].s_data = chuckparse(string_received,false);
    print("[s]-ri:");
    print(riff_count);
    print("-");
    println(cur_riffs[riff_count].s_data);
    
    cur_riffs[riff_count].s_count = int(chuckparse(string_received,true));
    print("symbol count:");
    println(cur_riffs[riff_count].s_count);
    
  }
  else if(theOscMessage.addrPattern().equals("/a-ar"))
  {
    String string_received = theOscMessage.get(0).stringValue();
    
    cur_riffs[riff_count].a_data = chuckparse(string_received,false);
    print("[a]-ri:");
    print(riff_count);
    print("-");
    println(cur_riffs[riff_count].a_data);
    
    cur_riffs[riff_count].has_a_data = true;
  }
  
  
  
  else if (theOscMessage.addrPattern().equals("/pkt_end"))
  {
      String string_received = theOscMessage.get(0).stringValue();
    
    riff_busy=true;
    
    print("Riffs in pkt:");
    println(riff_count);
    println(chuckparse(string_received,false));  
  }
  
  
  
  
}
