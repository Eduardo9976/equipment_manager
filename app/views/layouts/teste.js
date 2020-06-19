const body = document.querySelector('body')
body.addEventListener('click', handleClick)

function handleClick(event) {
  console.log(event.target)
  console.log('clicou')
}