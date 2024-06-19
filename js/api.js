let tipo = "sfw"
const categorias = [
    "highfive",
    "dance",
    "shinobu",
    "megumin",
    "bully",
    "cuddle",
    "cry",
    "kiss",
    "lick",
    "hug",
    "awoo",
    "pat",
    "smug",
    "bonk",
    "yeet",
    "blush",
    "smile",
    "wave",
    "handhold",
    "nom",
    "bite",
    "glomp",
    "slap",
    "kill",
    "kick",
    "happy",
    "wink",
    "poke",
    "cringe"
]

const selector = document.getElementById('selectorCategoria');
const containerIMG = document.getElementById('img');
const btnGenerador = document.getElementById('generador');
const descarga = document.getElementById('descarga');
const enunciado = document.getElementById('');


// cargando array a las opciones del Select
    var opt = '';
    opt= `<option value="kill" disable>Seleccione categoria </option>`

    categorias.forEach((categoria)=>{
        opt += `
            <option value = "${categoria}"> ${categoria} </option>
        `;
        
    });
    selector.innerHTML = opt;
//cierre carga de array 

generar();

//sombra de carga
const sombraDeCarga = `
    <div class ="containerSombra"></div>
`;
//cierre sombra de carga


const boton = document.getElementById("generador");
boton.addEventListener('click', ()=>{
    containerIMG.innerHTML=sombraDeCarga;
    generar();
})


function generar(){ //funcion conexión a la api de img o gif
    
    let cate = selector.value;
    fetch(`https://api.waifu.pics/${tipo}/${cate}`).then((response)=>response.json()).then((datos)=>{

        containerIMG.innerHTML=`
            <img src ="${datos.url}">
        `;
        descarga.innerHTML=`
            <a href="${datos.url}" target="_blank" download ="cac-series">⬇️ Descargar ⬇️</a>
        `;
            
    
    }).catch(error=> {
        boton.innerHTML = `error`;
    })
}



