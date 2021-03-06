#property version   "1.00"
#property strict

#import "mt4-websockets.dll"
   int Init( const uchar &url[], int heatBeatPeriod);
   int SetHeader( const uchar &key[], const uchar &value[]);
   int GetCommand(uchar &data[]);
   int SendCommand(const uchar &command[]);
   void Deinit();
#import

void WS_Init(string _host, int _heatBeatPeriod) {
   uchar __host[];
   StringToCharArray(_host, __host);
   
   Init(__host, _heatBeatPeriod);
}

void WS_SetHeader(string _key, string _value) {
   uchar __key[], __value[];
   StringToCharArray(_key, __key);
   StringToCharArray(_value, __value);
   
   SetHeader(__key, __value);
}

string WS_GetCommand() {
  uchar _command[8048];
  
   int r = 0;
   r = GetCommand( _command );
   
   if(r == 1) {
      return CharArrayToString( _command );
   }
   
   return "";
}

void WS_SendCommand(string command) {
   uchar __command[];
   StringToCharArray(command, __command);
   
   SendCommand(__command);
}
