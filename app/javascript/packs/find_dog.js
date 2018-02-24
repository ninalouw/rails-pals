import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'

    Vue.component('find-dog',{
        data: function () {
            return {
                dogs: [],
                sizes: []
            };
        },
        created: function () {
            var vm = this;
            $.ajax({
                url: '/dogs.json',
                success: function (res) {
                    vm.dogs = res;
                    console.log(vm.dogs);
                }
            });
        },
    })

if (document.getElementById('find-dog') !== null) {
    new Vue({ el: '#find-dog' });
}