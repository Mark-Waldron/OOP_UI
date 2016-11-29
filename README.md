# OOP_UI
The following is a build of the OOP module assignment

#YouTube Video

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/Za1BAYiGklE/0.jpg)](https://www.youtube.com/watch?v=Za1BAYiGklE)

# Concept
When given the assignment brief which explained to a student to create a Sci-Fi UI. I briefly pondered through various different ideas. One that stood out was to recreate the Pit Boy from the game series Fallout. However, I became aware that many other students were attempting to recreate the Pit Boy as well. I then came to the conclusion where if I was to be unqiue, I would have to create my own UI. 

The UI is based upon the idea of the Cold War eventually escalating to full out war. In the 1960’s when America received word of Russia’s nuclear capabilities and their intentions with said capabilities, US President John F. Kennedy developed a secret program within NASA, regarded as DAWN. The DAWN program was the development of long range rockets that could be powered with powerful nuclear reactors. The reasoning for this was so that if a nuclear war were to begin, a group of humans could be placed into a rocket and fly space while carrying out research on various nearby planets and repopulate or to wait and return to Earth once it was habitable. In this universe, the war does indeed begin and the DAWN program, whilst still in development, is launched whilst America’s enemies begin war. 

The UI created is an engineer UI. This provides an engineer on board statistical information of the ship and its state while also tracking the BPM of said engineer. Humans in space was a new reality in this era so the tracking of one’s health at this time was conceived to be imperative.  

#Features
The UI has five features.

* Home Page
  * Contains information on ship status and a radar scope
* Health Page
  * Shows users current BPM
* Radio
  * A radio with a host of 4 songs
* Ship
  * A page that displays the live data of the ship. 
* Data
  * Displays the data of the ship in a line graph form

#Controls

* LEFT and RIGHT keys to navigate
* UP and DOWN to change keys songs and graph
* Z to exit
* ENTER to change page
* S to play song
* P to stop song

#Functionality

The sketch uses a switch based menu to to go between different menu options. The keyPressed function checks all user input and perfoms appropriate actions depending what page the user is on. If required, some pages classes share a super class that draw hosts the dimenions of the UI's screen.

* Home
  * The home page uses pushMatrix and popMatrix to draw the radar scope. To display the statistical data, a method calls upon string format library methods to display percentage values to the user. The radio icon is a PShape drawn which is only shown when a song is playing. This is achieved through boolean flag checks.
  
* Health
  * The Health page uses trigometric functions to create a unique heart rate animation on each iteration. The average BPM is calculated throughout the running of the prgram.

* Radio
  * The radio contains a sub menu of which consists of 4 songs. The UP and DOWN keys allow a user to navigate through each song. Once a user hits P whilst hovering over a song, the keyPressed method will utilising the SoundFile class and play the song file via the Song Class. Whilist a song is playing, a Sin Wave is generated to give an effect using trigometric algorithms.

* Ship Status
  * Data of the ship represented in bar charts and bubble graphs. All text is scaled appropriately using mapping functions.

* Data Display
  * Displays data by taking all data loaded from file and displays it via a line graph

#Running of the Program

* Home

When a user runs the sketch, the program begins with a "Welcome Message", this message provides a user basic instructions on how to run the program by listing the primary keys. After the startup, the user is placed on the Home page. Home contains a information regarding the ships structure status and provides a radar scope. If a piece of data falls below a certain percentage, the user is opted to restore that value in an emergancy reboot. As previously mentioned, a radar scope is also provided, this radar scope allows a user to view what is around ship.

* Health

If a user moves to the Health page, they are shown a heart rate monitor styled graph to highlight their current BPM. The heart rate monitor uses trigometric methods within the default libraries to calculate the angle and the y co-ordinates uses to draw the BPM to the graph. The page shall also print to the user their BPM via text next to the heart rate monitor. 

* Radio / Jack

The radio section of the UI displays a basic list of songs to a user as to which songs to play. A user is given a list of 4 songs. If a user hits the 'p' key, a chosen song shall play whilist 's' stops the song. To scroll through the songs, a user utilises the arrow keys. When a song is played, a Sine Wave graph is displayed. The graphs amplitutde is randomised and changed after a certain number of frames passes to give is a slow animation effect. Next to the radio play is a loaded image of JFK that utilises methods from the image class to display the image to slace and to change the outputted colour values

* Ship

The Ship page provides a visual representations of data being calculated. The page contains 4 bar chars for Engine, Shields, Temperature and Oxygen. A bubble graph is also found within the page to display the percentage value of the reactor. The text "Reactor Levels", is mapped to the size of the reactor bubble.

* Data

The Data page displays the averages of every statistic from each visit to a user with the use of a line graph. With use of the UP and DOWN keys, a user can toggle through each statistic. When the program is exited, the current averages are added to the table object that loaded from the data file and they table and its contents overwrite the data file. Therefore, each time a user runs the program, the data that is loaded is unique each time for an extra row is added.

#Key Notes
* The program contains Inheritance for many classes are an extention of the Dimension class. This was to reduce the amount of code in the project.

* The pragram uses file input and ouput to track the data from yeach user visit. The Table class hosts file I/O.

* The spike lines in the heart rate monitor are calculated via trigonometric methods.

* SoundFile objects are stored in an array list.  (Polymorphism)

* Radar scope generates random black nodes within its diameter.

* The curved screen effect is achieved with arcs that are rotated.

* Date and time are calculated and outputed in a form of a gradiant curve that matches the curve of the screen.

* Sound files are timed to end when required.

* The sketch is mapped to all sizes