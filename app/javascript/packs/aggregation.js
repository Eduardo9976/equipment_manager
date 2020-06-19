/*
const formulario = document.querySelectorAll('form')
formulario.forEach((element) => {
  element.addEventListener('change', handleChange)
})

function handleChange(event) {

  //console.log(event.target)
  //console.log(event.target.value)

  const dados = fetch('http://localhost:3000/products')
  dados.then((response) => response.text())
  .then((body) => {
    console.log(body)
  })

}

*/

const paragrafo = document.querySelector('.paragrafo')
console.log(paragrafo);

paragrafo.addEventListener('click', handleClick);

function handleClick(event) {
  console.log('clicou')
  console.log(event.target)
};