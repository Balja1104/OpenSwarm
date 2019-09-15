% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright (C) OMG Plc 2009.
% All rights reserved.  This software is protected by copyright
% law and international treaties.  No part of this software / document
% may be reproduced or distributed in any form or by any means,
% whether transiently or incidentally to some other use of this software,
% without the written permission of the copyright owner.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part of the Vicon DataStream SDK for MATLAB.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Program options

% % while(1)
% %     
% % xf = 925;     %desired destination for testing purposes1
% % yf = -1813;
% %         
% % TransmitMulticast = false;
% % EnableHapticFeedbackTest = false;
% % HapticOnList = {'ViconAP_001';'ViconAP_002'};
% % bReadCentroids = false;
% % bReadRays = false;
% % 
% % % A dialog to stop the loop
% % %MessageBox = msgbox( 'Stop DataStream Client', 'Vicon DataStream SDK' )
% % 
% % % Load the SDK
% % fprintf( 'Loading SDK...' );
% % Client.LoadViconDataStreamSDK();
% % fprintf( 'done\n' );
% % 
% % % Program options
% % HostName = 'localhost:801';
% % 
% % % Make a new client
% % MyClient = Client();
% % 
% % % Connect to a server
% % fprintf( 'Connecting to %s ...', HostName );
% % while ~MyClient.IsConnected().Connected
% %   % Direct connection
% %   MyClient.Connect( HostName );
% %   
% %   % Multicast connection
% %   % MyClient.ConnectToMulticast( HostName, '224.0.0.0' );
% %   
% %   fprintf( '.' );
% % end
% % fprintf( '\n' );
% % 
% % % Enable some different data types
% % MyClient.EnableSegmentData();
% % MyClient.EnableMarkerData();
% % MyClient.EnableUnlabeledMarkerData();
% % MyClient.EnableDeviceData();
% % if bReadCentroids
% %   MyClient.EnableCentroidData();
% % end
% % if bReadRays
% %   MyClient.EnableMarkerRayData();
% % end
% % 
% % fprintf( 'Segment Data Enabled: %s\n',          AdaptBool( MyClient.IsSegmentDataEnabled().Enabled ) );
% % fprintf( 'Marker Data Enabled: %s\n',           AdaptBool( MyClient.IsMarkerDataEnabled().Enabled ) );
% % fprintf( 'Unlabeled Marker Data Enabled: %s\n', AdaptBool( MyClient.IsUnlabeledMarkerDataEnabled().Enabled ) );
% % fprintf( 'Device Data Enabled: %s\n',           AdaptBool( MyClient.IsDeviceDataEnabled().Enabled ) );
% % fprintf( 'Centroid Data Enabled: %s\n',         AdaptBool( MyClient.IsCentroidDataEnabled().Enabled ) );
% % fprintf( 'Marker Ray Data Enabled: %s\n',       AdaptBool( MyClient.IsMarkerRayDataEnabled().Enabled ) );
% % 
% % % Set the streaming mode
% % MyClient.SetStreamMode( StreamMode.ClientPull );
% % % MyClient.SetStreamMode( StreamMode.ClientPullPreFetch );
% % % MyClient.SetStreamMode( StreamMode.ServerPush );
% % 
% % % Set the global up axis
% % MyClient.SetAxisMapping( Direction.Forward, ...
% %                          Direction.Left,    ...
% %                          Direction.Up );    % Z-up
% % % MyClient.SetAxisMapping( Direction.Forward, ...
% % %                          Direction.Up,      ...
% % %                          Direction.Right ); % Y-up
% % 
% % Output_GetAxisMapping = MyClient.GetAxisMapping();
% % fprintf( 'Axis Mapping: X-%s Y-%s Z-%s\n', Output_GetAxisMapping.XAxis.ToString(), ...
% %                                            Output_GetAxisMapping.YAxis.ToString(), ...
% %                                            Output_GetAxisMapping.ZAxis.ToString() );
% % 
% % 
% % % Discover the version number
% % Output_GetVersion = MyClient.GetVersion();
% % fprintf( 'Version: %d.%d.%d\n', Output_GetVersion.Major, ...
% %                                 Output_GetVersion.Minor, ...
% %                                 Output_GetVersion.Point );
% %   
% % if TransmitMulticast
% %   MyClient.StartTransmittingMulticast( 'localhost', '224.0.0.0' );
% % end  
% % 
% % Counter = 0;
% % % Loop until the message box is dismissed
% % %while (ishandle( MessageBox ) )
% %   drawnow;
% %   Counter = Counter + 1;
% %   
% %   % Get a frame
% %   fprintf( 'Waiting for new frame...' );
% %   while MyClient.GetFrame().Result.Value ~= Result.Success
% %     fprintf( '.' );
% %   end% while
% %   fprintf( '\n' );  
% %   
% %   if EnableHapticFeedbackTest
% %     if mod( Counter,2 ) == 0
% %       for i = 1:length( HapticOnList )
% %           DeviceName = HapticOnList{i};
% %           Output_GetApexFeedback = MyClient.SetApexDeviceFeedback( DeviceName, true );
% %           if Output_GetApexFeedback.Result.Value == Result.Success
% %               fprintf( 'Turn haptic feedback on for device: %s\n', DeviceName );
% %           elseif Output_GetApexFeedback.Result.Value == Result.InvalidDeviceName
% %               fprintf( 'Device doesn''t exist: %s\n', DeviceName );
% %           end
% %       end
% %     end
% %     if mod( Counter, 20 ) == 0
% %       for i = 1:length( HapticOnList )
% %           DeviceName = HapticOnList{i};
% %           Output_GetApexFeedback = MyClient.SetApexDeviceFeedback( DeviceName, false );
% %           if Output_GetApexFeedback.Result.Value == Result.Success
% %               fprintf( 'Turn haptic feedback on for device: %s\n', DeviceName );
% %           end
% %       end
% %     end
% %   end
% %       
% % 
% %   % Get the frame number
% %   Output_GetFrameNumber = MyClient.GetFrameNumber();
% %   fprintf( 'Frame Number: %d\n', Output_GetFrameNumber.FrameNumber );
% % 
% %   % Get the frame rate
% %   Output_GetFrameRate = MyClient.GetFrameRate();
% %   fprintf( 'Frame rate: %g\n', Output_GetFrameRate.FrameRateHz );
% % 
% %   for FrameRateIndex = 1:MyClient.GetFrameRateCount().Count
% %     FrameRateName  = MyClient.GetFrameRateName( FrameRateIndex ).Name;
% %     FrameRateValue = MyClient.GetFrameRateValue( FrameRateName ).Value;
% % 
% %     fprintf( '%s: %gHz\n', FrameRateName, FrameRateValue );
% %   end% for  
% % 
% %   fprintf( '\n' );
% %   % Get the timecode
% %   Output_GetTimecode = MyClient.GetTimecode();
% %   fprintf( 'Timecode: %dh %dm %ds %df %dsf %s %d %d %d\n\n',    ...
% %                      Output_GetTimecode.Hours,                  ...
% %                      Output_GetTimecode.Minutes,                ...
% %                      Output_GetTimecode.Seconds,                ...
% %                      Output_GetTimecode.Frames,                 ...
% %                      Output_GetTimecode.SubFrame,               ...
% %                      AdaptBool( Output_GetTimecode.FieldFlag ), ...
% %                      Output_GetTimecode.Standard.Value,         ...
% %                      Output_GetTimecode.SubFramesPerFrame,      ...
% %                      Output_GetTimecode.UserBits );
% % 
% %   % Get the latency
% %   fprintf( 'Latency: %gs\n', MyClient.GetLatencyTotal().Total );
% %   
% %   for LatencySampleIndex = 1:MyClient.GetLatencySampleCount().Count
% %     SampleName  = MyClient.GetLatencySampleName( LatencySampleIndex ).Name;
% %     SampleValue = MyClient.GetLatencySampleValue( SampleName ).Value;
% % 
% %     fprintf( '  %s %gs\n', SampleName, SampleValue );
% %   end% for  
% %   fprintf( '\n' );
% %                      
% %   % Count the number of subjects
% %   SubjectCount = MyClient.GetSubjectCount().SubjectCount;
% %   fprintf( 'Subjects (%d):\n', SubjectCount );
% %   for SubjectIndex = 1:SubjectCount
% %     fprintf( '  Subject #%d\n', SubjectIndex - 1 );
% %     
% %     % Get the subject name
% %     SubjectName = MyClient.GetSubjectName( SubjectIndex ).SubjectName;
% %     fprintf( '    Name: %s\n', SubjectName );
% %     
% %     % Get the root segment
% %     %RootSegment = MyClient.GetSubjectRootSegmentName( SubjectName ).SegmentName;
% %     %fprintf( '    Root Segment: %s\n', RootSegment );
% %     
% %     % Count the number of segments
% %     SegmentCount = MyClient.GetSegmentCount( SubjectName ).SegmentCount;
% %     fprintf( '    Segments (%d):\n', SegmentCount );
% %     for SegmentIndex = 1:SegmentCount
% %       fprintf( '      Segment #%d\n', SegmentIndex - 1 );
% %       
% %       % Get the segment name
% %       SegmentName = MyClient.GetSegmentName( SubjectName, SegmentIndex ).SegmentName;
% %       fprintf( '        Name: %s\n', SegmentName );
% %       %{
% %       % Get the segment parent
% %       SegmentParentName = MyClient.GetSegmentParentName( SubjectName, SegmentName ).SegmentName;
% %       fprintf( '        Parent: %s\n',  SegmentParentName );
% % 
% %       % Get the segment's children
% %       
% %       ChildCount = MyClient.GetSegmentChildCount( SubjectName, SegmentName ).SegmentCount;
% %       fprintf( '     Children (%d):\n', ChildCount );
% %       for ChildIndex = 1:ChildCount
% %         ChildName = MyClient.GetSegmentChildName( SubjectName, SegmentName, ChildIndex ).SegmentName;
% %         fprintf( '       %s\n', ChildName );
% %       end% for  
% % 
% %       % Get the static segment translation
% %       
% %       Output_GetSegmentStaticTranslation = MyClient.GetSegmentStaticTranslation( SubjectName, SegmentName );
% %       fprintf( '        Static Translation: (%g, %g, %g)\n',                  ...
% %                          Output_GetSegmentStaticTranslation.Translation( 1 ), ...
% %                          Output_GetSegmentStaticTranslation.Translation( 2 ), ...
% %                          Output_GetSegmentStaticTranslation.Translation( 3 ) );
% %       %}
% %       
% %         
% %       % Get the global segment translation
% %       Output_GetSegmentGlobalTranslation = MyClient.GetSegmentGlobalTranslation( SubjectName, SegmentName );
% %       fprintf( '        Global Translation: (%g, %g, %g) %s\n',               ...
% %                          Output_GetSegmentGlobalTranslation.Translation( 1 ), ...
% %                          Output_GetSegmentGlobalTranslation.Translation( 2 ), ...
% %                          Output_GetSegmentGlobalTranslation.Translation( 3 ), ...
% %                          AdaptBool( Output_GetSegmentGlobalTranslation.Occluded ) );
% %                     
% %       x1 = Output_GetSegmentGlobalTranslation.Translation( 1 );
% %       y1 = Output_GetSegmentGlobalTranslation.Translation( 2 );
% %       
% %       
% %       % Get the local segment translation
% %       Output_GetSegmentLocalTranslation = MyClient.GetSegmentLocalTranslation( SubjectName, SegmentName );
% %       fprintf( '        Local Translation: (%g, %g, %g) %s\n',               ...
% %                          Output_GetSegmentLocalTranslation.Translation( 1 ), ...
% %                          Output_GetSegmentLocalTranslation.Translation( 2 ), ...
% %                          Output_GetSegmentLocalTranslation.Translation( 3 ), ...
% %                          AdaptBool( Output_GetSegmentLocalTranslation.Occluded ) );
% %       
% %      
% % 
% %     end% SegmentIndex
% %     
% %     % Count the number of markers
% %     MarkerCount = MyClient.GetMarkerCount( SubjectName ).MarkerCount;
% %     fprintf( '    Markers (%d):\n', MarkerCount );
% %     
% %     for MarkerIndex = 1:MarkerCount
% %       % Get the marker name
% %       MarkerName = MyClient.GetMarkerName( SubjectName, MarkerIndex ).MarkerName;
% % 
% %       % Get the marker parent
% %       MarkerParentName = MyClient.GetMarkerParentName( SubjectName, MarkerName ).SegmentName;
% % 
% %       % Get the global marker translation
% %       Output_GetMarkerGlobalTranslation = MyClient.GetMarkerGlobalTranslation( SubjectName, MarkerName );
% % 
% %       fprintf( '      Marker #%d: %s (%g, %g, %g) %s\n',                     ...
% %                          MarkerIndex - 1,                                    ...
% %                          MarkerName,                                         ...
% %                          Output_GetMarkerGlobalTranslation.Translation( 1 ), ...
% %                          Output_GetMarkerGlobalTranslation.Translation( 2 ), ...
% %                          Output_GetMarkerGlobalTranslation.Translation( 3 ), ...
% %                          AdaptBool( Output_GetMarkerGlobalTranslation.Occluded ) );
% %       mark[MarkerIndex;1] = Output_GetMarkerGlobalTranslation.Translation( 1 );
% %       mark{MarkerIndex;2] = Output_GetMarkerGlobalTranslation.Translation( 2 );
% % 
% %         %{
% %       if bReadRays
% %         % Get the ray contributions for this marker
% %         Output_GetMarkerRayContributionCount = MyClient.GetMarkerRayContributionCount( SubjectName, MarkerName );
% %         if( Output_GetMarkerRayContributionCount.Result.Value == Result.Success )
% %           fprintf('      Contributed to by: ');
% % 
% % 		  MarkerRayContributionCount = Output_GetMarkerRayContributionCount.RayContributionsCount;
% %           for ContributionIndex = 1: MarkerRayContributionCount
% %             Output_GetMarkerRayContribution = MyClient.GetMarkerRayContribution(SubjectName, MarkerName, ContributionIndex);
% %             fprintf( '%d %d ', Output_GetMarkerRayContribution.CameraID, Output_GetMarkerRayContribution.CentroidIndex);
% %           end
% % 
% %           fprintf('\n' );
% %         end
% %       end% bReadRays
% %                          %}
% %     end% MarkerIndex
% %     
% %   end% SubjectIndex
% % 
% %   % Get the unlabeled markers
% %   %{
% %   UnlabeledMarkerCount = MyClient.GetUnlabeledMarkerCount().MarkerCount;
% %   fprintf( '    Unlabeled Markers (%d):\n', UnlabeledMarkerCount );
% %   for UnlabeledMarkerIndex = 1:UnlabeledMarkerCount
% %     % Get the global marker translation
% %     Output_GetUnlabeledMarkerGlobalTranslation = MyClient.GetUnlabeledMarkerGlobalTranslation( UnlabeledMarkerIndex );
% %     fprintf( '      Marker #%d: (%g, %g, %g)\n',                                    ...
% %                        UnlabeledMarkerIndex - 1,                                    ...
% %                        Output_GetUnlabeledMarkerGlobalTranslation.Translation( 1 ), ...
% %                        Output_GetUnlabeledMarkerGlobalTranslation.Translation( 2 ), ...
% %                        Output_GetUnlabeledMarkerGlobalTranslation.Translation( 3 ) );
% %   end% UnlabeledMarkerIndex
% % 
% %   % Count the number of devices
% %   DeviceCount = MyClient.GetDeviceCount().DeviceCount;
% %   fprintf( '  Devices (%d):\n', DeviceCount );
% % 	
% %   for DeviceIndex = 1:DeviceCount
% %   
% %     fprintf( '    Device #%d:\n', DeviceIndex - 1 );
% %     
% %     % Get the device name and type
% %     Output_GetDeviceName = MyClient.GetDeviceName( DeviceIndex );
% %     fprintf( '      Name: %s\n', Output_GetDeviceName.DeviceName );
% %     fprintf( '      Type: %s\n', Output_GetDeviceName.DeviceType.ToString() );
% % 
% %     % Count the number of device outputs
% %     DeviceOutputCount = MyClient.GetDeviceOutputCount( Output_GetDeviceName.DeviceName ).DeviceOutputCount;
% %     fprintf( '      Device Outputs (%d):\n', DeviceOutputCount );
% %     for DeviceOutputIndex = 1:DeviceOutputCount
% %       % Get the device output name and unit
% %       Output_GetDeviceOutputName = MyClient.GetDeviceOutputName( Output_GetDeviceName.DeviceName, DeviceOutputIndex );
% % 
% %       % Get the number of subsamples associated with this device.
% %       Output_GetDeviceOutputSubsamples = MyClient.GetDeviceOutputSubsamples( Output_GetDeviceName.DeviceName, Output_GetDeviceOutputName.DeviceOutputName );
% % 
% %       fprintf( '      Device Output #%d:\n', DeviceOutputIndex - 1 );
% % 
% %       fprintf( '      Samples (%d):\n', Output_GetDeviceOutputSubsamples.DeviceOutputSubsamples );
% % 
% % 
% %       for DeviceOutputSubsample = 1:Output_GetDeviceOutputSubsamples.DeviceOutputSubsamples
% %         fprintf( '        Sample #%d:\n', DeviceOutputSubsample - 1 );
% %         % Get the device output value
% %         Output_GetDeviceOutputValue = MyClient.GetDeviceOutputValue( Output_GetDeviceName.DeviceName, Output_GetDeviceOutputName.DeviceOutputName, DeviceOutputSubsample );
% % 
% %         fprintf( '          ''%s'' %g %s %s\n',                                    ...
% %                            Output_GetDeviceOutputName.DeviceOutputName,            ...
% %                            Output_GetDeviceOutputValue.Value,                      ...
% %                            Output_GetDeviceOutputName.DeviceOutputUnit.ToString(), ...
% %                            AdaptBool( Output_GetDeviceOutputValue.Occluded ) );
% %       end% DeviceOutputSubsample
% %     end% DeviceOutputIndex
% %     
% %   end% DeviceIndex
% %     
% %   % Count the number of force plates
% %   ForcePlateCount = MyClient.GetForcePlateCount().ForcePlateCount;
% %   fprintf( '  Force Plates: (%d)\n', ForcePlateCount );
% %   for ForcePlateIndex = 1:ForcePlateCount
% %     fprintf( '    Force Plate #%d:\n', ForcePlateIndex - 1 );
% %     
% %     % Get the number of subsamples associated with this device.
% %     Output_GetForcePlateSubsamples = MyClient.GetForcePlateSubsamples( ForcePlateIndex );
% %     
% %     fprintf( '    Samples (%d):\n', Output_GetForcePlateSubsamples.ForcePlateSubsamples );
% %     for ForcePlateSubsample = 1:Output_GetForcePlateSubsamples.ForcePlateSubsamples
% %       % Output all the subsamples.
% %       fprintf( '      Sample #%d:\n', ForcePlateSubsample - 1 );
% %       
% %       Output_GetGlobalForceVector = MyClient.GetGlobalForceVector( ForcePlateIndex, ForcePlateSubsample );
% %       fprintf( '      Force (%g, %g, %g)\n',                           ...
% %                          Output_GetGlobalForceVector.ForceVector( 1 ), ...
% %                          Output_GetGlobalForceVector.ForceVector( 2 ), ...
% %                          Output_GetGlobalForceVector.ForceVector( 3 ) );
% %     
% %       Output_GetGlobalMomentVector = MyClient.GetGlobalMomentVector( ForcePlateIndex, ForcePlateSubsample );
% %       fprintf( '      Moment (%g, %g, %g)\n',                            ...
% %                          Output_GetGlobalMomentVector.MomentVector( 1 ), ...
% %                          Output_GetGlobalMomentVector.MomentVector( 2 ), ...
% %                          Output_GetGlobalMomentVector.MomentVector( 3 ) );
% %     
% %       Output_GetGlobalCentreOfPressure = MyClient.GetGlobalCentreOfPressure( ForcePlateIndex, ForcePlateSubsample );
% %       fprintf( '      CoP (%g, %g, %g)\n',                                       ...
% %                          Output_GetGlobalCentreOfPressure.CentreOfPressure( 1 ), ...
% %                          Output_GetGlobalCentreOfPressure.CentreOfPressure( 2 ), ...
% %                          Output_GetGlobalCentreOfPressure.CentreOfPressure( 3 ) );    
% %     end% ForcePlateSubsample                     
% %   end% ForcePlateIndex
% %   
% %   % Count the number of eye trackers
% %   EyeTrackerCount = MyClient.GetEyeTrackerCount().EyeTrackerCount;
% %   fprintf( '  Eye Trackers: (%d)\n', EyeTrackerCount );
% %   for EyeTrackerIndex = 1:EyeTrackerCount
% %     fprintf( '    Eye Tracker #%d:\n', EyeTrackerIndex - 1 );
% % 
% %     Output_GetEyeTrackerGlobalPosition = MyClient.GetEyeTrackerGlobalPosition( EyeTrackerIndex );
% %     fprintf( '      Position (%g, %g, %g) %s\n',                       ...
% %                      Output_GetEyeTrackerGlobalPosition.Position( 1 ), ...
% %                      Output_GetEyeTrackerGlobalPosition.Position( 2 ), ...
% %                      Output_GetEyeTrackerGlobalPosition.Position( 3 ), ...
% %                      AdaptBool( Output_GetEyeTrackerGlobalPosition.Occluded ) );
% %    
% %     Output_GetEyeTrackerGlobalGazeVector = MyClient.GetEyeTrackerGlobalGazeVector( EyeTrackerIndex );
% %     fprintf( '      Gaze (%g, %g, %g) %s\n',                               ...
% %                      Output_GetEyeTrackerGlobalGazeVector.GazeVector( 1 ), ...
% %                      Output_GetEyeTrackerGlobalGazeVector.GazeVector( 2 ), ...
% %                      Output_GetEyeTrackerGlobalGazeVector.GazeVector( 3 ), ... 
% %                      AdaptBool( Output_GetEyeTrackerGlobalGazeVector.Occluded ) );
% %      
% %   end% EyeTrackerIndex 
% %  %}
% %     
% %   if bReadCentroids
% %     CameraCount = MyClient.GetCameraCount().CameraCount;
% %     fprintf( 'Cameras(%d):\n', CameraCount);
% % 
% %     for CameraIndex = 1:CameraCount
% %       fprintf('  Camera #%d:\n', CameraIndex - 1 );
% %         
% %       CameraName = MyClient.GetCameraName( CameraIndex ).CameraName;
% %       fprintf ( '    Name: %s\n', CameraName );
% % 
% %       CentroidCount = MyClient.GetCentroidCount( CameraName ).CentroidCount;
% %       fprintf ( '    Centroids(%d):\n', CentroidCount );
% % 
% %       for CentroidIndex = 1:CentroidCount
% %         fprintf( '      Centroid #%d:\n', CentroidIndex - 1 );
% % 
% %         Output_GetCentroidPosition = MyClient.GetCentroidPosition( CameraName, CentroidIndex );
% %         fprintf( '        Position: (%g, %g)\n', Output_GetCentroidPosition.CentroidPosition( 1 ), ...
% %                                                  Output_GetCentroidPosition.CentroidPosition( 2 ) );
% %         fprintf( '        Radius: (%g)\n', Output_GetCentroidPosition.Radius );
% %         %fprintf( '        Accuracy: (%g)\n', Output_GetCentroidPosition.Accuracy );
% %       end% CentroidIndex
% %     end% CameraIndex
% %   end% bReadCentroids 
% % 
% % %end% while true  

% if TransmitMulticast
%   MyClient.StopTransmittingMulticast();
% end  

% % Disconnect and dispose
% MyClient.Disconnect();
% 
% % Unload the SDK
% fprintf( 'Unloading SDK...' );
% % Client.UnloadViconDataStreamSDK();
% fprintf( 'done\n' );

x1 = 10;
y1 = 10;
xf = 20;
yf = 20;

if x1 ~= 0

    fprintf("Starting TCP Server")
    id1 = 1;
    id2 = 2;
    %t = tcpip('10.10.10.9', 12000,'NetworkRole','Server');
    t = tcpip('localhost', 80, 'NetworkRole', 'Server');
    fprintf("\nServer Started")
    p1 = [x1;y1];
    pf = [xf;yf];
    
    length = round(findl(x1,y1,xf,yf));
    strlen = num2str(length)
    if strlength(strlen) == 3
        strlen = strcat('0',strlen);
    elseif strlength(strlen) == 2
        strlen = strcat('00',strlen);
    elseif strlength(strlen) == 1
        strlen = strcat('000',strlen);
    end
    strlen = strcat('+++',strlen)
    
    set(t,'OutputBufferSize',10);
    fopen(t);
    fprintf("\nServer Opened")
    data = str2num(char(fread(t, 1))');
    fprintf("\nReceived Data")
    if data  == id1
        fprintf("\nit's robot 1!")
        send(t,"aaa")
        send(t,strlen)
    elseif data == id2
        fprintf("\nit's robot 2!")
        send(t,"bbb")
    end
    fclose(t);
    fprintf("\nDone with the TCP connection");
    pause(10);
end


function send(t,s)
    fwrite(t,s)
    pause(.2)
    fwrite(t,s)
    pause(.2)
    fwrite(t,s)
    pause(.2)
end
function l = findl(x1,y1,x2,y2)
    xdis = x2 - x1;
    ydis = y2 - y1;
    totx = xdis * xdis;
    toty = ydis * ydis;
    l = sqrt(totx + toty);
end

%calculates the angle the robot must turn to face the destination
function delt = findAngle(mark,cent,dest)
    m = midpoint(mark(:,2),mark(:,3));  %finds midpoint of markers 2 and 3
    trobo = findt(m,mark(:,1));         %finds angle of robot which is the 1st marker with respect to the midpoint of marker 2 and 3
    tglob = findt(cent,dest);           %finds angle of destination with respect to centroid of robot
    
    delt = tglob - trobo;
    delt = (delt * 180) / 3.14;
    if delt > 180
        delt = delt -360;
    elseif delt < -180
        delt = delt +360;
    end
    delt = round(delt)
end

%finds the midpoint between two points p1 and p2
function m = midpoint(p1,p2)
    m(1,1) = (p1(1,1) + p2(1,1)) / 2;
    m(2,1) = (p1(2,1) + p2(2,1)) / 2;
end

%find the angle between two points po (point origin) and p2 (second point)
%treats po as the origin and finds the angle of p2 relative to it
function t = findt(po,p2)
    %if p2 in first quadrant
    if p2(1,1) > po(1,1) && p2(2,1) >= po(2,1)
        fprintf("1st quad");
        t = atan((p2(2,1) - po(2,1))/(p2(1,1) - po(1,1)));
    %if p2 in second quadrant
    elseif p2(1,1) <= po(1,1) && p2(2,1) > po(2,1)
        fprintf("2nd quad");
        t = atan((po(2,1) - p2(2,1))/(p2(1,1) - po(1,1)));
        t = t + (3.14 / 2);
    %if p2 in third quadrant
    elseif p2(1,1) < po(1,1) && p2(2,1) <= po(2,1)
        fprintf("3rd quad");
        t = atan((p2(2,1) - po(2,1))/(p2(1,1) - po(1,1)));
        t = t + 3.14;
    %if p2 in fourth quadrant
    elseif p2(1,1) >= po(1,1) && p2(2,1) < po(2,1)
        fprintf("4th quad");
        t = atan((p2(2,1) - po(2,1))/(po(1,1) - p2(1,1)));
        t = t + 3.14 + (3.14 / 2);
    else 
        fprintf("error");
        t = 0;
    end
end