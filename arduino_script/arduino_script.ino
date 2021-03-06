const byte numChars = 16;
char receivedChars[numChars];
char tempChars[numChars];        // temporary array for use when parsing

// variables to hold the parsed data
char signal_type[8];
float amplitude = 0;
int frequency = 0;

boolean newData = false;

void setup()
{
   Serial.begin(9600);
}

void loop()
{
   recvWithStartEndMarkers();
   if (newData == true)
   {
      strcpy(tempChars, receivedChars);
      // this temporary copy is necessary to protect the original data
      //   because strtok() used in parseData() replaces the commas with \0
      parseData();

      
      Serial.println(signal_type);
      Serial.println(amplitude);
      Serial.println(frequency);
      
      newData = false;
   }
}


void recvWithStartEndMarkers()
{
   static boolean recvInProgress = false;
   static byte ndx = 0;
   char startMarker = '<';
   char endMarker = '>';
   char rc;

   while (Serial.available() > 0 && newData == false)
   {
      rc = Serial.read();

      if (recvInProgress == true)
      {
         if (rc != endMarker)
         {
            receivedChars[ndx] = rc;
            ndx++;
            if (ndx >= numChars)
            {
               ndx = numChars - 1;
            }
         }
         else
         {
            receivedChars[ndx] = '\0'; // terminate the string
            recvInProgress = false;
            ndx = 0;
            newData = true;
         }
      }

      else if (rc == startMarker)
      {
         recvInProgress = true;
      }
   }
}


void parseData()        // split the data into its parts
{

   char * strtokIndx; // this is used by strtok() as an index

   strtokIndx = strtok(tempChars, ",");     // get the first part - the string
   strcpy(signal_type, strtokIndx); // copy it to dir

   strtokIndx = strtok(NULL, ","); // this continues where the previous call left off
   amplitude = atoi(strtokIndx);     // convert this part to an integer, speed

   strtokIndx = strtok(NULL, ","); // this continues where the previous call left off
   frequency = atoi(strtokIndx);     // convert this part to an integer, speed
}