function playerChoice() {
    var rdo_name = document.getElementsByName('player') ;   
    for (var i=0; i < rdo_name.length; i++) {
        var id = rdo_name.item(i).id;
        if (rdo_name.item(i).checked) {
            document.getElementById( id + "_lb").style.backgroundColor = 'rgb(187, 217, 215)';
            document.getElementById( id + "_lb").style.color = '#000000';
            document.getElementById( id + "_lb").style.borderRadius = '3px';
        } else {
        document.getElementById( id + "_lb").style.backgroundColor = 'rgb(22, 44, 65)';
        document.getElementById( id + "_lb").style.color = '#666';
        }
    }
}

function squareChoice() {
    var rdo_name = document.getElementsByName('square') ;   
    for (var i=0; i < rdo_name.length; i++) {
        var id = rdo_name.item(i).id;
        if (rdo_name.item(i).checked) {
            document.getElementById( id + "_ls").style.backgroundColor = 'rgb(187, 217, 215)';
            document.getElementById( id + "_ls").style.color = '#000000';
            document.getElementById( id + "_ls").style.borderRadius = '3px';
        } else {
        document.getElementById( id + "_ls").style.backgroundColor = 'rgb(22, 44, 65)';
        document.getElementById( id + "_ls").style.color = '#666';
        }
    }
}