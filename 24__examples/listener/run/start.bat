set ROBOT_DEPLOY=C:\Users\jbeaumon\Documents\sandbox
set WORKSPACE=%ROBOT_DEPLOY%%\run\WORKSPACE

robot ^
  --loglevel TRACE ^
  --include TNR ^
  --outputdir %WORKSPACE% ^
  %ROBOT_DEPLOY%/tests