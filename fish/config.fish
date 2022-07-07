if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

set fish_greeting

hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e7,
      "HIDKeyboardModifierMappingDst":0x7000000e6},
     {"HIDKeyboardModifierMappingSrc":0x7000000e6,
      "HIDKeyboardModifierMappingDst":0x7000000e7}]
}'
clear 

neofetch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mledwon/google-cloud-sdk/path.fish.inc' ]; . '/Users/mledwon/google-cloud-sdk/path.fish.inc'; end


export GOOGLE_APPLICATION_CREDENTIALS="/Users/mledwon/gcloud.json"
export JAVA_HOME="/opt/homebrew/opt/openjdk/bin"
thefuck --alias | source 
