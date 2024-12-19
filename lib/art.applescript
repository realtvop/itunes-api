on write_to_file(this_data, target_file, append_data)
  try
    set the target_file to the target_file as string
    log target_file
    set the open_target_file to open for access target_file with write permission
    log "trying"
    if append_data is false then set eof of the open_target_file to 0
    write this_data to the open_target_file starting at eof
    close access the open_target_file
    return true
  on error
    log "failed"
    try
      close access file target_file
    end try
    return false
  end try
end write_to_file

tell application "Music"
  try
    set aTrack to the current track
    set aArtwork to data of artwork 1 of aTrack
    my write_to_file(aArtwork, "/tmp/currently-playing.jpg", false)
  on error
    log "error getting info"
  end try
end tell
