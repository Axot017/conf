if status is-interactive
    starship init fish | source
    zoxide init fish | source
    thefuck --alias | source 

    set fish_greeting

    hidutil property --set '{"UserKeyMapping":
        [{"HIDKeyboardModifierMappingSrc":0x7000000e7,
          "HIDKeyboardModifierMappingDst":0x7000000e6},
         {"HIDKeyboardModifierMappingSrc":0x7000000e6,
          "HIDKeyboardModifierMappingDst":0x7000000e7}]
    }'
    clear 

    neofetch

end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mledwon/google-cloud-sdk/path.fish.inc' ]; . '/Users/mledwon/google-cloud-sdk/path.fish.inc'; end
