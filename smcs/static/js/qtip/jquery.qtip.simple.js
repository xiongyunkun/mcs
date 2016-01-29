function tip(selecter, text){
    $(selecter).qtip({
        content: {
            text: text,
            title: {
                button: true
            }
        },
        position: {
            my: 'top left', // Use the corner...
            at: 'right bottom' // ...and opposite corner
        },
        show: {
            event: false, // Don't specify a show event...
            ready: true // ... but show the tooltip when ready
        },
        hide: false, // Don't specify a hide event either!
        style: {
            classes: 'qtip-shadow qtip-blue' 
        }
    });
}

function checkTip(gamesrc, server){
    $(".qtip").remove();

    if(gamesrc == ''){
        tip("#select_game_chzn", "请先选择游戏");
    }else if(server == ''){
        tip("#select_server_chzn", "请选择服务器");
    }
}