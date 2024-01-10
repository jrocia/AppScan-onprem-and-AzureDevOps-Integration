# Copyright 2023 HCL America
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

write-host "======== Step: Running scan in $url ========"
# Checking if there is Manual explorer file and/or Login process file and running AppScan Stardard scan 
if ((Test-Path -Path $env:manualExploreDastConfig -PathType Leaf) -and (Test-Path -Path $env:loginDastConfig -PathType Leaf)){
  write-host "Manual explorer and login file were found in repository folder. It will be used in scanning process."
  AppScanCMD.exe /su $env:url /d $env:scanFile /rt xml /rf $env:reportXMLsevSec /mef $env:manualExploreDastConfig /to /lf $env:loginDastConfig
  }
elseif ((Test-Path -Path $env:manualExploreDastConfig -PathType Leaf)){
  write-host "Manual explorer file was found in repository folder. It will be used in scanning process."
  AppScanCMD.exe /su $env:url /d $env:scanFile /rt xml /rf $env:reportXMLsevSec /mef $env:manualExploreDastConfig /to
  }
elseif ((Test-Path -Path $env:loginDastConfig -PathType Leaf)){
  write-host "Login file was found in repository folder. It will be used in scanning process."
  AppScanCMD.exe /su $env:url /d $env:scanFile /rt xml /rf $env:reportXMLsevSec /lf $env:loginDastConfig
  }
else{
  write-host "There is no Login or Manual Explorer file in repository folder."
  AppScanCMD.exe /su $env:url /d $env:scanFile /rt xml /rf $env:reportXMLsevSec
  }
write-host "Scan on $env:url finished."
