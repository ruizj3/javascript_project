document.addEventListener("DOMContentLoaded", appendData)

const BACKEND_URL = 'http://localhost:3000';


fetch(`${BACKEND_URL}/doctors`)
.then(function (response) {
  return response.json();
})
.then(function (data) {
  appendData(data);
})
.catch(function (err) {
  console.log(err);
});


function appendData(data) {
  const doctors = document.getElementById("doctors");
  const patients = document.getElementById("patients");
  for (var i = 0; i < data.data.length; i++) {
      const y = document.getElementById("doctors") ;
      y.innerHTML += "<button id = " + data.data[i].id +" "+ "class="+"btn"+ " onclick="+"filterSelection(this.id)"+ ">" + data.data[i].attributes.username + "</button>"
  }
}

function filterSelection(id) {
  fetch(`${BACKEND_URL}/patients`)
  .then(function (response) {
    return response.json();
  })
  .then(function (data) {
    for (var i = 0; i < data.data.length; i++){
      const doctor = data.data[i].attributes.doctor.id;
      const patients = document.getElementById("patients");
      if (document.getElementById("patients") != '')
      if (doctor == id) {
        const ul = document.createElement("ul");
        ul.innerHTML += "<button id =" + data.data[i].id + " class="+"btn"+ ">" + data.data[i].attributes.username + ' Date of Birth: ' + data.data[i].attributes.dob + "</button>"
        patients.appendChild(ul);
      }
    }
  })
  .catch(function (err) {
    console.log(err);
  });

}

function removeAll(){
    document.getElementById("patients").innerHTML = "";
}
