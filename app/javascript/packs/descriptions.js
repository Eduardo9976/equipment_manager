document.addEventListener("turbolinks:load", () => {

  const form = document.querySelector('form')
  console.log(form)


  const memory = document.querySelector('#description_memory')
  
  const option = document.createElement('option')
  option.setAttribute('value', '16gb')
  option.innerText ='16GB'
  memory.appendChild(option)
  //   const fieldProduct = document.querySelector('#produto');
    

  //   function addOption(option){
  //     fieldProduct.appendChild(option)
  //     fieldProduct.removeEventListener('mouseenter',handleMouseenter)
  //   }

  //   async function dataProduct(){
  //     const productData = await fetch('/api/v1/products');
  //     const JSONDataProduct = await productData.json();
  //     JSONDataProduct.forEach((element) => {
  //       let option = document.createElement('option')
  //       option.innerText = element.name
  //       option.setAttribute('value',`${element.name}`)
  //       addOption(option)
  //     });
  //   }

  //   function handleMouseenter(event){
  //     event.preventDefault();
  //     dataProduct();
  //   }
  //   fieldProduct.addEventListener('mouseenter', handleMouseenter)



  //   /*form todo */
   
    


  //   function myFunction(event) {
  //     event.preventDefault()
  //     alert("The form was submitted");
  // }
    /*  modelo        */

    // function addOptionMoldel(option){
    //   dataModel.appendChild(option)
    //   dataModel.removeEventListener('mouseenter',handleModel)
    // }


    // async function modelData(){
    //   const dataModel = await fetch('/api/v1/manufacturers');
    //   const JSONdataModel = await dataModel.json();
    //   JSONdataModel.forEach((element) => {
    //     let option = document.createElement('option')
    //     option.innerText = element.name
    //     option.setAttribute('value',`${element.name}`)
    //     addOptionMoldel(option)
    //   });
    // }




    // function handleModel(event){
    //  event.preventDefault()
    //  modelData() 
    // }

    // const dataModel = document.querySelector('#modelo');
    // dataModel.addEventListener('mouseenter', handleModel)
    // const formDescriptions = document.querySelectorAll('#descricoes')
    // function handleClick(event){
    //   console.log(event.target.value)
    // }

    // formDescriptions.forEach((field) => {
    //   field.addEventListener('change', handleClick)
    // })
    
 

  // const todosDados = {}
  // async function handleChange(event){
  //   todosDados[event.target.name] = event.target.value 
  //   console.log(todosDados)


  //   const responseDados = await fetch('http://localhost:3000/api/v1/descriptions')
  //   const JSONDados = await responseDados.json()
  //   JSONDados.forEach((item) => console.log(item.model))
  
  // }



});  
  
  