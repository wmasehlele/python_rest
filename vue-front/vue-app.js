var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vuma!',
      view_all: true,
      create: false, 
      appointment: {
        customer_name: '',
        address: '',
        appointment_date: ''
      }
    },
    methods: {
      createInstallation: function () {
        this.create = true
        //this.view_all = false
      },
      cancel: function () {
        this.appointment.appointment_date = ''
        this.appointment.customer_name = ''
        this.appointment.address = ''
        this.axios.get('https://api.coindesk.com/v1/bpi/currentprice.json').then(response => (
          console.log(response)
        ))
        this.$http.get(api)
        this.create = false
        this.view_all = true
      },      
      saveInstallation: function () {

        this.create = true
        this.view_all = false
      },
      viewInstallations: function () {
        this.view_all = true
        this.create = false
      }  
    }
})

