String print_utf16(int uni_whole)
{
  
   boolean debug_print = false;
  
  //if surrogates needed
  if(uni_whole>65535)
  {
    
    /*
    H = (S - 1000016) / 40016 + D80016
    L = (S - 1000016) % 40016 + DC0016
    */
    
    int h_nib = ((uni_whole - 0x10000) / 0x400) + 0xD800;
    int l_nib = ((uni_whole - 0x10000) % 0x400) + 0xDC00;
    
    String hn = new String(hex(h_nib,4));
    String ln = new String(hex(l_nib,4));
    
    int h = unhex(hn);
    char[] h_char = Character.toChars(h);
    String h_str = new String(h_char);
    
    int l = unhex(ln);
    char[] l_char = Character.toChars(l);
    String l_str = new String(l_char);
    
    String combo = h_str+l_str;
    
    if(debug_print)
    {
    print(combo);
    }
    
    return combo;
  }
  else
  {
    char[] c_char = Character.toChars(uni_whole);
    String c_str = new String(c_char);
    
    if(debug_print)
    {
    print(c_str);
    }
    
    return c_str;
  }
}
