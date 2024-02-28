var swiper = new Swiper(".mySwiper-1", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
        el: ".swiper-pagination",
        clickable:true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    }
});

var swiper = new Swiper(".mySwiper-2", {
    slidesPerView: 3,
    spaceBetween: 30,
    loop: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    },
    breakpoints : {
        0: {
            slidesPerView: 1
        },
        520:{
            slidesPerView: 2
        },
        950:{
            slidesPerView: 3
        }
    }
});

//carrito
const carrito = document.getElementById('carrito');
const elementos1 = document.getElementById('lista-1');
const elementos2 = document.getElementById('lista-2');
const elementos3 = document.getElementById('lista-3');
const lista = document.querySelector('#lista-carrito tbody');
const vaciarCarritoBtn = document.getElementById('vaciar-carrito');
let valorTotal = 0; // Variable para almacenar el valor total

cargarEvenListeners();

function cargarEvenListeners(){
    elementos1.addEventListener('click', comprarElemento);
    elementos2.addEventListener('click', comprarElemento);
    elementos3.addEventListener('click', comprarElemento);
    carrito.addEventListener('click', eliminarElemento);

    vaciarCarritoBtn.addEventListener('click', vaciarCarrito);

    // Agregar evento al botón de pagar
    const botonPagar = document.querySelector('.button1');
    botonPagar.addEventListener('click', mostrarResumenCompra);
}

function comprarElemento(e){
    e.preventDefault();
    if(e.target.classList.contains('agregar-carrito')){
        const elemento = e.target.parentElement.parentElement;
        leerDatosElemento(elemento);
    }
}

function leerDatosElemento(elemento){
    const infoElemento = {
        imagen: elemento.querySelector('img').src,
        titulo: elemento.querySelector('h3').textContent,
        precio: parseFloat(elemento.querySelector('.precio').textContent.replace('$', '').replace(',', '')), // Convertir el precio a número flotante y eliminar caracteres no numéricos
        id: elemento.querySelector('a').getAttribute('data-id')
    }

    insertarCarrito(infoElemento);
}


function insertarCarrito(elemento){
    const row = document.createElement('tr');
    row.innerHTML = `
        <td>
            <img src="${elemento.imagen}" width=100 >
        </td>

        <td>
            ${elemento.titulo}
        </td>

        <td>
            ${elemento.precio}
        </td>

        <td>
            <a href="#" class="borrar" data-id="${elemento.id}">X</a>
        </td>
    `;

    lista.appendChild(row);
    valorTotal += elemento.precio; // Sumar el precio del producto al valor total
    document.getElementById('total').textContent = valorTotal.toFixed(3); // Mostrar el valor total en el span con id "total"
}

function eliminarElemento(e){
    e.preventDefault();
    let elemento,
        elementoId;
    
    if(e.target.classList.contains('borrar')) {
        e.target.parentElement.parentElement.remove();
        elemento = e.target.parentElement.parentElement;
        elementoId = elemento.querySelector('a').getAttribute('data-id');
        // Restar el precio del producto eliminado del valor total
        const precioEliminado = parseFloat(elemento.querySelector('td:nth-child(3)').textContent);
        valorTotal -= precioEliminado;
        document.getElementById('total').textContent = valorTotal.toFixed(3); // Actualizar el valor total mostrado
    }
}

function vaciarCarrito(){
    while(lista.firstChild){
        lista.removeChild(lista.firstChild);
    }
    valorTotal = 0; // Restablecer el valor total a 0
    document.getElementById('total').textContent = valorTotal.toFixed(3); // Actualizar el valor total mostrado
    return false;
}

function mostrarResumenCompra() {
    const productosCarrito = lista.querySelectorAll('tr');
    const resumenCompra = document.querySelector('.order-summary');
    
    // Limpiar el resumen de compra antes de agregar los productos
    resumenCompra.innerHTML = '';
    
    // Recorrer los productos del carrito y agregarlos al resumen de compra
    productosCarrito.forEach(producto => {
        const imagen = producto.querySelector('img').src;
        const titulo = producto.querySelector('td:nth-child(2)').textContent;
        const precio = parseFloat(producto.querySelector('td:nth-child(3)').textContent);
        
        const productoHTML = `
            <div class="producto-resumen">
                <img src="${imagen}" width="50">
                <p>${titulo}</p>
                <p>$${precio}</p>
            </div>
        `;
        
        resumenCompra.innerHTML += productoHTML;
    });
}



