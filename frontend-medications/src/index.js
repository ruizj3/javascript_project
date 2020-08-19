document.addEventListener("DOMContentLoaded", showDocs)

const BACKEND_URL = 'http://localhost:3000';


fetch(`${BACKEND_URL}/doctors`)
.then(function (response) {
  return response.json();
})
.then(function (data) {
  showDocs(data);
})
.catch(function (err) {
  console.log(err);
});


function showDocs(data) {
  const doctors = document.getElementById("doctors");
  for (var i = 0; i < data.data.length; i++) {
      const y = document.getElementById("doctors") ;
      y.innerHTML += "<button id = " + data.data[i].id +" "+ "class="+"btn"+ " onclick="+"filterSelection(this.id)"+ ">" + data.data[i].attributes.username + "</button>"
  }
  createNewPrescription()
}

function filterSelection(id) {
  fetch(`${BACKEND_URL}/patients`)
  .then(function (response) {
    return response.json();
  })
  .then(function (data) {
    document.getElementById("patients").innerHTML = "";
    document.getElementById("patients-prescription-form").innerHTML = "";
    console.log(data.data.sort(function(a, b) {
      return a.attributes.username.localeCompare(b.attributes.username);
    }
   )
  );
    for (var i = 0; i < data.data.length; i++){
      const doctor = data.data[i].attributes.doctor.id;
      const patients = document.getElementById("patients");
      if (doctor == id) {
        const p = document.createElement("p");
        const pats = data.data[i];
        p.innerHTML += "<button id =" + pats.id + " class="+"btn"+ " onclick="+"filterPrescription(this.id)"+ ">" + pats.attributes.username + ', Date of Birth: ' + pats.attributes.dob + "</button>"
        patients.appendChild(p);
      }
    }
  })
  .catch(function (err) {
    console.log(err);
  });

}

function filterPrescription(id) {
  fetch(`${BACKEND_URL}/prescriptions`)
  .then(function (response) {
    return response.json();
  })
  .then(function (data) {
    document.getElementById("patients-prescription-form").innerHTML = "";
    document.getElementById("patients").innerHTML = "";
    for (var i = 0; i < data.data.length; i++){
      const patient = data.data[i].attributes.patient.id;
      const prescription = data.data[i];
      const prescriptionList = document.getElementById("patients-prescription-form")
      if (patient == id) {
        const ul = document.createElement("ul");
        ul.innerHTML += "<button id =" + prescription.id + " "+ "class=btn"+ " onclick="+"createTakeDosage(this.id)"+ ">" + " Medication Name: "+ prescription.attributes.medication.name + " Dosages Remaining: " + prescription.attributes.dosagestotal;
        prescriptionList.appendChild(ul);
        console.log(data);
      }
    }
  })
  .catch(function (err) {
    console.log(err);
  });
}


function createTakeDosage(id) {
  const datetaken = new Date().toJSON().slice(0,10);
  fetch(`${BACKEND_URL}/takedosages`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        prescription_id: id,
        datetaken: datetaken
      })
    })
  .then(function(response) {
    return response.json();
  })
  .catch(function(error) {
    alert("MAD MAD");
    console.log(error.message);
  });
}

function createNewPrescription() {
  let doSubmit = function(e) {
    console.log("testing listener");
    e.preventDefault();

    const formData = new FormData(this);

    fetch(`${BACKEND_URL}/prescriptions`,
      {
        method: "POST",
        body: formData
      })
      .then(function(response) {
        return response.json();
      })
      .catch(function(error) {
        alert("MAD MAD");
        console.log(error.message);
      })
    };

  let newPrescription = document.getElementById("new-prescription");
  console.log(newPrescription);
  newPrescription.addEventListener("submit", doSubmit)
}
