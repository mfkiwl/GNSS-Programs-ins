function Insert_In_NAV_Database(conn, id, satelliteid, epoch, ephemeris)
    
    global textVal
    
    Din = dbarray.pack(ephemeris',conn); % Pack it for the given database 
    
    timestamp = sprintf('%04d-%02d-%02d %02d:%02d:%02d.00',...
        epoch(1), epoch(2), epoch(3), epoch(4), epoch(5), epoch(6));
    
%     fastinsert(conn, 'navigation',...
%         {'id', 'satelliteid', 'epoch', 'ephemeris'},...
%         { id,   satelliteid, timestamp, Din});
    
    dinStr = Din.toString();
    
    textVal = [textVal 'INSERT INTO navigation (id, satelliteid, epoch, ephemeris) VALUES (' ...
                        mat2str(id)          ', ' ...
                        mat2str(satelliteid) ', ' ...
                        '''' timestamp ''''  ', ' ...
                        '''' char(dinStr) '''' ...
                        ');\n'];
end