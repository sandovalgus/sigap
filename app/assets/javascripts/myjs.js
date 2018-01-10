
function number_pages() {
  var vars={};
  var x=document.location.search.substring(1).split('&');
  for(var i in x) {var z=x[i].split('=',2);vars[z[0]] = decodeURIComponent(z[1]);}
  var x=['frompage','topage','page','webpage','section','subsection','subsubsection'];
  for(var i in x) {
    var y = document.getElementsByClassName(x[i]);
    for(var j=0; j<y.length; ++j) y[j].textContent = vars[x[i]];
  }
}
      
$('#datatable-responsive').DataTable();

 function thecheck(){
      document.getElementById('contacto').checked = 1;
      document.getElementById('domicilio').checked = 1;
      document.getElementById('laboral').checked = 1;
      document.getElementById('medico').checked = 1;
      document.getElementById('familia').checked = 1;
 }

  function thecheckEmployeeLlist(){
      document.getElementById('name_and_lastname').checked = 1;
      document.getElementById('legajo').checked = 1;
      document.getElementById('categoria').checked = 1;
      document.getElementById('regimen').checked = 1;
      document.getElementById('dni').checked = 1;
      document.getElementById('cuil').checked = 1;
      document.getElementById('email').checked = 1;
 }

function showContent() {
    element = document.getElementById("content");
    check = document.getElementById("check");
    if (check.checked) {
        element.style.display='block';
    }
    else {
        element.style.display='none';
    }
}


function closePrint(){
  $("#miModal").modal('hide');


}