
window.onload = function () {
    document.getElementById('updatebtn').style.display = 'none';
}

function yesnoCheck() {
    if (document.getElementById('update').ariaChecked) {
        document.getElementById('updatebtn').style.display = 'block';
        document.getElementById('addbtn').style.display = 'none';
    }
    else if (document.getElementById('add').ariaChecked) {
        document.getElementById('addbtn').style.display = 'block';
        document.getElementById('updatebtn').style.display = 'none';
    }
}





const projtList = document.querySelector('#cafe-list');
const form = document.querySelector('#add-cafe-form');

function renderProjt(doc) {
    let li = document.createElement('li');
    let Name = document.createElement('span');
    let StartedOn = document.createElement('span');
    let Path = document.createElement('span');
    let Description = document.createElement('span');
    let cross = document.createElement('div');

    li.setAttribute('data-id', doc.id);
    Name.textContent = doc.data().Name;
    StartedOn.textContent = doc.data().StartedOn;  //.toDate();
    Path.textContent = doc.data().Path;
    Description.textContent = doc.data().Description;
    cross.textContent = 'x';


    li.appendChild(Name);
    li.appendChild(StartedOn);
    li.appendChild(cross);

    projtList.appendChild(li);

    cross.addEventListener('click', (e) => {
        e.stopPropagation();
        let id = e.target.parentElement.getAttribute('data-id');
        db.collection('Project').doc(id).delete();
    })

}

db.collection('Project').get().then((snapshot) => {
    snapshot.docs.forEach(doc => {
        renderProjt(doc);
    });
})

form.addEventListener('submit', (e) => {
    // e.preventDefault();
    db.collection('Project').add({
        Name: form.Name.value,
        StartedOn: form.StartedOn.value,
        Description: form.Description.value,
        Path: form.Path.value
    })
})

