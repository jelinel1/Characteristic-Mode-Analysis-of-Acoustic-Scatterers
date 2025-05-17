%% getFileInfo is processing filePath
% Takes absolute or relative path and splits it into folder path and filename.
%
%  INPUTS
%   filePath: file path (absolute or relative), string [1 x N]
%
%  OUTPUTS
%   fileInfo: information about file path(s), struct [1 x 1]
%     .fileName: file name, string [1 x N]
%     .extension: file extension, string [1 x N]
%     .fullPath: full path (with slashes, excluding filename), string [1 x N]
%     .folderPath: folder path (with slashes), string [1 x N]
%     .packagePath: folder path (with dots), string [1 x N]
%
%  SYNTAX
%
%  fileInfo = getFileInfo(filePath)
%
% Function returns file information. If input does not include
% full file name, the path will be set to current directory.
%
% Example:
% filePath = 'D:\AToM\+mySpace\+myPref\data\+my\+Brain\hurts.m'
%
% fileInfo =
%        fileName: 'hurts'
%       extension: '.m'
%        fullPath: 'D:\AToM\+mySpace\+myPref\data\+my\+Brain\hurts.m'
%  fullFolderPath: 'D:\AToM\+mySpace\+myPref\data\+my\+Brain'
%      folderPath: 'D:\AToM\+mySpace\+myPref\data'
%     packagePath: 'my.Brain'
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% mcode
