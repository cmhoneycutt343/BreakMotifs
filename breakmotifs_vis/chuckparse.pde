//takes 
riffdata chuckparse(String rawbytes)
{
  //println("bytes received: %d", rawbytes.length());

  //total chars
  int total_chars = 0;
  int byte_index=0;
  int char_index=0;
  
  String output = new String();

  //repeats for each character in string
  while (byte_index<rawbytes.length())
  {
    byte start_byte = (byte) rawbytes.charAt(byte_index);

    int unicode_bytes = 0;
    int utf_16_Eq = 0;
    String cur_char = new String();

    if (debug_verbose)
    {
      print("Char index[");
      print(char_index);
      print("]-");
      print("0x");
      print(hex(start_byte));
      print(":");
    }

    if ((start_byte&0b10000000)==0)
    {
      if (debug_verbose)
      {
        print("ASCII (1Byte) -> ");


      }
        //print(char(start_byte));
        
        char[] charbuf = new char[1];
        
        charbuf[0]=char(start_byte);
        
        cur_char = new String(charbuf);

      unicode_bytes = 1;
    } else
    {
      int length_mask = (start_byte&0b11110000);

      switch(length_mask)
      {
      case 208:
        {
          unicode_bytes = 2;
          break;
        }
      case 192:
        {
          unicode_bytes = 2;
          break;
        }
      case 224:
        {
          unicode_bytes = 3;
          break;
        }
      case 240:
        {
          unicode_bytes = 4;
          break;
        }
      default:
        {
          break;
        }
      }

      if (debug_verbose)
      {
        print("UTF-8 Bytes:");
        print(unicode_bytes);
        print(" -> ");
      }

      //generat unicode char from multi-bytes



      //calculate UTF-16 equivalent
      switch(unicode_bytes)
      {
      case 2:
        {
          int utf_16_byte1 = ((rawbytes.charAt(byte_index)&0x1F)>>2);
          int utf_16_byte2 = (((rawbytes.charAt(byte_index))<<6)&0xFF)|((rawbytes.charAt(byte_index+1)&0x3f));
          utf_16_Eq = (utf_16_byte1<<8)+utf_16_byte2;

          cur_char = print_utf16(utf_16_Eq);
          break;
        }
      case 3:
        {
          int utf_16_byte1 = (((rawbytes.charAt(byte_index))<<4)|(rawbytes.charAt(byte_index+1)&0x3f)>>2)&0xff;
          int utf_16_byte2 = (((rawbytes.charAt(byte_index+1))<<6)&0xFF)|((rawbytes.charAt(byte_index+2)&0x3f));
          utf_16_Eq = (utf_16_byte1<<8)+(utf_16_byte2);

          cur_char = print_utf16(utf_16_Eq);
          break;
        }
      case 4:
        {

          int utf_16_byte1 = (((rawbytes.charAt(byte_index)&0x7)<<2))|((rawbytes.charAt(byte_index+1)&0x3F)>>4);
          int utf_16_byte2 = (((rawbytes.charAt(byte_index+1))<<4)&0xFF)|((rawbytes.charAt(byte_index+2)&0x3f)>>2);
          int utf_16_byte3 = (((rawbytes.charAt(byte_index+2))<<6)&0xFF)|((rawbytes.charAt(byte_index+3)&0x3f));
          utf_16_Eq = (utf_16_byte1<<16)+(utf_16_byte2<<8)+(utf_16_byte3);


          //print(hex(utf_16_byte1));
          //print(hex(utf_16_byte2));
          //print(hex(utf_16_byte3));
          //print(hex(utf_16_Eq));
          cur_char = print_utf16(utf_16_Eq);
          break;
        }
      }
    }
    
    output = output + cur_char;

    char_index++;
    if (debug_verbose)
    {
      println();
    }

    byte_index+=unicode_bytes;
  }
  
  //println();
  
  return output;
}
