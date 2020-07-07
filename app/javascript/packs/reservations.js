document.addEventListener("turbolinks:load", () => {
  class Reservation {
    constructor() {
      this.product = document.querySelector('#reservation_product_id')
      this.descricao = document.querySelector('#reservation_description_id')
      this.dataDescriptions;
     
      this.options = [...this.product.children]
      this.optionId;

      this.optionsDescriptions = [...this.descricao.children]
    

      //ref callback
      this.handleChange = this.handleChange.bind(this)
    }

    fetchDataDescripion() {
      this.dataDescriptions = fetch('/api/v1/descriptions')
      this.dataDescriptions.then(resolucao => {
        return resolucao.json()
      }).then(body => {
        body.forEach(element => {
           if (element.product_id === this.optionId) {
            this.optionsDescriptions.forEach((item) => {
              
              if(+ item.getAttribute('value') === + element.id) {
                item.classList.add('ativo')
              }
            })
           }
        });
      })
    }

    handleChange(event) {
      this.optionId = + event.target.value
      this.fetchDataDescripion()
      this.optionsDescriptions.forEach((item) => {
        item.classList.remove('ativo')
      })
    }

    addEvents() {
      this.product.addEventListener('change', this.handleChange)
    }
    
    init() {
      if ( this.product.length && this.descricao.length) {
        this.addEvents();
      }
      return this;
    }
  }



   const url = /[a-z]{4}\u003A\u002F{2}[a-z]{9}\u003A[\d]{4}\u002F[a-z]{1,50}\u002F[\d]{1,500000}\u002F[a-z]{1,50}/gi
   setInterval(() => {
     if(window.location.href.match(url)) {
       const formulario = new Reservation
       formulario.init()
     }
   },1000)
  
});  
  


