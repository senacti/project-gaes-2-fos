let barraNav = document.querySelector('.barraNav');

document.querySelector('#menu-btn').onclick = () =>{
    barraNav.classList.toggle('active');
    buscarforma.classList.remove('active');
    carrocompra.classList.remove('active');
}

let buscarforma = document.querySelector('.buscarforma');

document.querySelector('#buscar-btn').onclick = () =>{
    buscarforma.classList.toggle('active');
    barraNav.classList.remove('active');
    carrocompra.classList.remove('active');
}

let carrocompra = document.querySelector('.carrocompras-cont');

document.querySelector('#carro-btn').onclick = () =>{
    carrocompra.classList.toggle('active');
    barraNav.classList.remove('active');
    buscarforma.classList.remove('active');
}

window.onscroll = () =>{
    barraNav.classList.remove('active');
    buscarforma.classList.remove('active');
    carrocompra.classList.remove('active');
}