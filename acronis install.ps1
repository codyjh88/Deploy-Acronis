
Param ([parameter(Position=0)]$client)
switch ($client) 
{
  client1 {$token = '1700-1213-xxxx'}
  client2 {$token = 'AA01-28F9-xxxx'}
  Client3 {$token = '3D13-ECCA-xxxx'} 
  
}
Measure-Command {wget https://yourcoolcompany-static-content.s3-us-west-2.amazonaws.com/Acronis/acronis.zip -OutFile c:\acronis.zip}
Expand-Archive -LiteralPath 'C:\Acronis.Zip' -DestinationPath C:\
msiexec /i C:\acronis\BackupClient64.msi /qn /l*v install.log TRANSFORMS=C:\acronis\BackupClient64.msi.mst
Start-Sleep -Second 300
cd "C:\Program Files\BackupClient\RegisterAgentTool\"
./register_agent.exe -o register -t cloud -a https://us5-cloud.acronis.com/ --token $token