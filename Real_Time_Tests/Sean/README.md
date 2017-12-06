Here is where Sean will put his examples.  Make sure to mention how to get it running and how it is expandable!
So, basically what I have included is a way to break down a video frame by frame.  It creates a binary image for each frame
which we could use to help detect the objects.  From what I noticed, it does a better job than the built in version.  It is expandable
because we this will lead to more accurate detection which in turn we could use to identify what the moving object is.  
What we would need to do: Create detector for each frame which we might be able to pull from the built in function or assignment 2(?),
train a data set for what we are trying to identify.
Limitations: Only works for videos where the camera is stationary. 
How to run: Add path to folder to matlab, click run.  The video can be changed on line 20.
