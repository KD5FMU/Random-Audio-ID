# Random Audio File Player / random_asl3.sh
**Random Audio File Player for AllStarLink version 3**

This script file will allow your AllStarLink version 3 node to play an audio file from a deisgnated folder randomly at any designated interval. I chose to have mine play at the bottom of every hour. I can also set the audio files play and a number of different intervals. Use the https://crontab.guru/ website to get your crontab timing the way you want it.

First thing first. I don't like to break away from the methods that have worked for me so with that said I like to put this script file in /usr/local/sbin becuase that is where the script creator Tony put it and that is where is worked for me. Will it work if it's in a different dorectory? I don't know, I just like to go with what works. Do with that said...

change your directory to /use/local/sbin by using the following command:
```
cd /usr/local/sbin
```

Then we can download the script file with the following command:
```
sudo wget https://raw.githubusercontent.com/KD5FMU/Random-Audio-ID/refs/heads/main/random_asl3.sh
```

Then once it is downloaded we need to make it executable and we can do so with this command:
```
sudo chmod +x random_asl3.sh
```

Now we can load the sounds files you want to be randomized into the following folder /var/lib/asterisk/sounds/notices
If the folder does not exist then you can create it with this command:
```
sudo mkdir /var/lib/asterisk/sounds/notices
```

**Reminder that the file that you want played have to be 16bit PCM file that is 8000hz mono output. 

I use the Audacity program to convert my wav files to the approproate settings as well as the cloud convert website. Referecne this video for the audio file proceedure. I am working on a simplified method and will update this repository once I have done so. Meanwhile consult this video. https://www.youtube.com/watch?v=Otb_iAXuV4g&t=514s

Now we need to go into the crontab editor and add our cron job so that the sript file will fire and play a random file as desinated. I use this particular entry:
```
30 * * * * /usr/local/sbin/random_asl3.sh var/lib/asterisk/sounds/notices YOUR_NODE_NUMBER
```

Be sure and replace the X's with your node number.

This is derived from the Random Audio file player script file that Tony Morris created from his GMRSLive page. This one works great with ASL 3. Here is the original video for the HamVoIP version and the process is practially the same. 

Use this video for a Reference for now.

https://www.youtube.com/watch?v=Otb_iAXuV4g&t=498s
