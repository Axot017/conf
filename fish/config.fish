if status is-interactive
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

    if [ -f '/Users/mledwon/google-cloud-sdk/path.fish.inc' ]; . '/Users/mledwon/google-cloud-sdk/path.fish.inc'; end


    export GOOGLE_APPLICATION_CREDENTIALS="/Users/mledwon/gcloud.json"
    export JAVA_HOME="/opt/homebrew/Cellar/openjdk/18.0.2"
    thefuck --alias | source 
end

