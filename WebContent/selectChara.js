function selectedChara(){
    for(var i = 0; i< 6; i++){
        if(document.selection-group.chara[i].checked === true){
            document.selection-group.chara[i].style.disabled;
        }
    }

}