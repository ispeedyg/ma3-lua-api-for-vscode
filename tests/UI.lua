function Main()

    MessageBox({
        title = 'This is Speedy\'s Message Box',
        titleTextColor = 1.8, -- Supposed to reference the colortheme in the showfile. Toy with it
        backColor = 1.13,
        icon = 'spot',
        message = ' This is the message in the box.\n And on the next line is the dick in the box',
        messageTextColor = 'Global.AlertText',
        message_align_h = Enums.AlignmentH["Center"], -- can be .Center
        messageTextSize = '26',
    })

end
return Main