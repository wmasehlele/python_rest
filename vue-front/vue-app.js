
var app = new Vue({
    el: '#app',
    data: {
      server_name: 'http://127.0.0.1:5000',
      view_all: true,
      create: false, 
      statuses: {},
      installations: {},
      appointment: {
        customer_name: '',
        address: '',
        appointment_date: '',
        status: ''
      }
    }, 
    mounted () {
      axios.get(this.server_name+'/lists/statuses').then(response => (
        this.statuses = response.data.response
      ))    
      axios.get(this.server_name+'/installation/all').then(response => (
        this.installations = response.data.response
      ))  
    },    
    methods: {
      createInstallation: function () {
        this.create = true
        this.view_all = false
      },
      clearTexboxes: function () {
        this.appointment.appointment_date = ''
        this.appointment.customer_name = ''
        this.appointment.address = ''
        this.appointment.status = ''
      },
      cancel: function () {
        //this.clearTexboxes()
        // axios.get('https://api.coindesk.com/v1/bpi/currentprice.json').then(response => (
        //   console.log(response)
        // ))
        // this.create = false  
        // this.view_all = true
      },      
      saveInstallation: function () {
        axios.post(this.server_name+'/create/installation', this.appointment).then(response => (
          this.loadInstallations()
        ))
        this.create = true
        this.view_all = false
        this.clearTexboxes()
      },
      viewInstallations: function () {
        this.view_all = true
        this.create = false  
      }  
    }
})

