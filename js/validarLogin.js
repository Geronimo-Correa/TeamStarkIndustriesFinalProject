const form = document.querySelector('form');




form.addEventListener('submit',(event) => {


    if (!validarForm()){
        Swal.fire({
            title: 'Error!',
            text: 'Completar los campos',
            icon: 'error',
            confirmButtonText: 'Cerrar',
            color:'white',
        })
        event.preventDefault();

    }else{
        
    }
});


function validarForm(){

    return (validarCampo('password') && validarCampo('email'));

}


const validarCampo = (campo) => {
    //captura elemento por ID
    const field = document.getElementById(campo);

    //Obtengo valor del elemento capturado
    const value = field.value;

    if (value === '') {
        return false; //Retorna False si el campo está vacio
    }else {
      return true; //Retorna True si el campo está completo
    }

};


